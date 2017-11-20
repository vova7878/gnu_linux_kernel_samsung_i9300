/*
 * Samsung Exynos Adaptive Voltage Scaling
 *
 * Copyright (c) 2017 Samsung Electronics Co., Ltd.
 * Wook Song <wook16.song@samsung.com>
 * Chanwoo Choi <cw00.choi@samsung.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 */

#include <linux/cpufreq.h>
#include <linux/module.h>
#include <linux/mfd/syscon.h>
#include <linux/of_device.h>
#include <linux/pm_opp.h>
#include <linux/regmap.h>
#include <linux/regulator/consumer.h>
#include <linux/slab.h>

#include "exynos-avs.h"

#define EXYNOS_AVS_5433_BASE_ADDR_OFFSET_AVS_INFO		0x4000
#define EXYNOS_AVS_5433_TBL_VER_OFFSET_FROM_AVS_INFO		0xc
#define EXYNOS_AVS_5433_FUSED_FLAG_OFFSET_FROM_AVS_INFO		0xc
#define EXYNOS_AVS_5433_SUBGRP0_MIN_FREQ_CPU_LITTLE		1200000000
#define EXYNOS_AVS_5433_SUBGRP1_MIN_FREQ_CPU_LITTLE		700000000
#define EXYNOS_AVS_5433_SUBGRP0_MIN_FREQ_CPU_BIG		1700000000
#define EXYNOS_AVS_5433_SUBGRP1_MIN_FREQ_CPU_BIG		1200000000
#define EXYNOS_AVS_5433_TABLE_1_VER_MIN				1
#define EXYNOS_AVS_5433_TABLE_2_VER_MIN				5
#define EXYNOS_AVS_5433_TABLE_3_VER_MIN				6
#define EXYNOS_AVS_5433_TABLES_VER_MAX				8
#define EXYNOS_AVS_5433_TABLES_VER_MIN				0

enum exynos_avs_type {
	TYPE_CPU_LITTLE = 0,
	TYPE_CPU_BIG,
};

struct exynos_avs_desc {
	int (*init_avs)(struct device *dev);
	int (*cpu_notifier)(struct notifier_block *nb,
			unsigned long val, void *data);
};

struct exynos_avs_drv {
	enum exynos_avs_type type;
	struct device_node *resource_np;
	struct device *dev;
	int is_fused_avs_group;
	struct regulator *regulator;
	const struct exynos_avs_desc *desc;
	struct regmap *chipid_regmap;
	struct notifier_block cpu_nb;
	struct exynos_avs_volt_table *volt_table;
};

static inline struct device *get_first_cpu_device_of_cluster(unsigned int cpu)
{
	return get_cpu_device(cpumask_first(topology_core_cpumask(cpu)));
}

static unsigned long exynos_avs_get_volt_from_volt_table(
		const struct exynos_avs_volt_table *table, unsigned long freq)
{
	int i;

	if (table == NULL)
		return 0;

	for (i = 0; table[i].freq != 0; i++) {
		if (table[i].freq == freq) {
			int avs_group = table[i].avs_group;

			if ((avs_group < 0) ||
				(avs_group >= EXYNOS_AVS_GROUP_NUM_MAX))
				return 0;

			return table[i].u_volts[avs_group];
		}
	}

	return 0;
}

/*
 * exynos_avs_free_opp_table() - free OPP table of the target device
 * @to:		a pointer of the target device
 *
 * Helper function to free the OPP table of the target device. If any errors do
 * not ocuur, the number of OPPs of the target device should be zero.
 *
 * Note: this function is only for operating-points v1.
 */
static void exynos_avs_free_opp_table(struct device *to)
{
	struct dev_pm_opp *opp;
	unsigned long freq;
	int i, nr_opp;

	nr_opp = dev_pm_opp_get_opp_count(to);

	for (i = 0, freq = 0; i < nr_opp; i++, freq++) {
		rcu_read_lock();
		opp = dev_pm_opp_find_freq_ceil(to, &freq);
		rcu_read_unlock();
		if (IS_ERR(opp)) {
			dev_err(to, "%s: Failed to find OPP for %lu khz\n",
					__func__, freq);
			continue;
		}

		dev_pm_opp_remove(to, freq);
	}
}

/*
 * exynos_avs_update_opp_table() - update voltage values in the OPP table of
 * the target device according to the values in the static table of the AVS
 * device
 * @dev:	a pointer of the corresponding AVS device
 * @to:		a pointer of the target device
 *
 * Helper function to update voltage values in the OPP table of the target
 * device to the values in the static (hard-coded) voltage table of the AVS
 * device. In the OPP table of the target device, only OPP which has the
 * frequency value matching to the frequency value of the static table of the
 * AVS device is updated.
 *
 * Note: this function only works for operating-points v1.
 */
static int exynos_avs_update_opp_table(struct device *dev, struct device *to)
{
	struct exynos_avs_drv *drv = dev_get_drvdata(dev);
	unsigned long freq, u_volt;
	int i, nr_opp, ret;

	nr_opp = dev_pm_opp_get_opp_count(to);
	for (i = 0, freq = 0; i < nr_opp; i++, freq++) {
		struct dev_pm_opp *opp;

		rcu_read_lock();

		opp = dev_pm_opp_find_freq_ceil(to, &freq);
		if (IS_ERR(opp)) {
			rcu_read_unlock();
			continue;
		}

		u_volt = exynos_avs_get_volt_from_volt_table(drv->volt_table,
				freq);
		if (!u_volt) {
			rcu_read_unlock();
			continue;
		}

		if (!regulator_is_supported_voltage(drv->regulator,
					u_volt, u_volt)) {
			rcu_read_unlock();
			continue;
		}

		rcu_read_unlock();

		dev_pm_opp_remove(to, freq);
		ret = dev_pm_opp_add(to, freq, u_volt);
		/* Failed to update opp table */
		if (ret)
			return ret;

	}

	return 0;
}

static int exynos_avs_5433_get_table_ver(struct device *dev)
{
	struct exynos_avs_drv *drv = dev_get_drvdata(dev);
	unsigned int val, offset;
	int ret;

	offset = EXYNOS_AVS_5433_BASE_ADDR_OFFSET_AVS_INFO +
		EXYNOS_AVS_5433_TBL_VER_OFFSET_FROM_AVS_INFO;
	ret = regmap_read(drv->chipid_regmap, offset, &val);
	if (ret < 0)
		return ret;

	val &= 0xF;

	if ((val < EXYNOS_AVS_5433_TABLES_VER_MIN) ||
		(val > EXYNOS_AVS_5433_TABLES_VER_MAX))
		return -ENODEV;

	return val;
}

static int exynos_avs_5433_is_fused_avs_group(struct device *dev)
{
	struct exynos_avs_drv *drv = dev_get_drvdata(dev);
	unsigned int offset, val;
	int ret;

	offset = EXYNOS_AVS_5433_BASE_ADDR_OFFSET_AVS_INFO +
		EXYNOS_AVS_5433_FUSED_FLAG_OFFSET_FROM_AVS_INFO;
	ret = regmap_read(drv->chipid_regmap, offset, &val);
	if (ret < 0)
		return ret;

	val = (val >> (BITS_PER_BYTE << 1)) & 0x1;

	return val;
}

static int exynos_avs_5433_get_avs_group(struct device *dev, unsigned long freq)
{
	struct exynos_avs_drv *drv = dev_get_drvdata(dev);
	unsigned int offset, val, val_pos;
	int subgroup, ret;

	/*
	 * Note that this driver does not support the case that it is required
	 * to read HPM and IDS values for getting AVS group values.
	 */
	if (!drv->is_fused_avs_group)
		return -ENODEV;

	offset = EXYNOS_AVS_5433_BASE_ADDR_OFFSET_AVS_INFO;
	ret = regmap_read(drv->chipid_regmap, offset, &val);
	if (ret < 0)
		return ret;

	/*
	 * The AVS subgroup value can normally range from 0 to 2 and it
	 * is determined by the frequency value.
	 */
	switch (drv->type) {
	case TYPE_CPU_LITTLE:
		if (freq >= EXYNOS_AVS_5433_SUBGRP0_MIN_FREQ_CPU_LITTLE)
			subgroup = 0;
		else if (freq >= EXYNOS_AVS_5433_SUBGRP1_MIN_FREQ_CPU_LITTLE)
			subgroup = 1;
		else
			subgroup = 2;

		val_pos = 0;
		break;
	case TYPE_CPU_BIG:
		if (freq >= EXYNOS_AVS_5433_SUBGRP0_MIN_FREQ_CPU_BIG)
			subgroup = 0;
		else if (freq >= EXYNOS_AVS_5433_SUBGRP1_MIN_FREQ_CPU_BIG)
			subgroup = 1;
		else
			subgroup = 2;

		val_pos = (BITS_PER_BYTE << 1);
		break;
	default:
		return -ENODEV;
	}

	val >>= (val_pos + (subgroup * (BITS_PER_BYTE >> 1)));

	return val & 0xF;
}


static int exynos_avs_5433_cpu_notifier(struct notifier_block *nb,
		unsigned long val, void *data)
{
	struct exynos_avs_drv *drv;
	struct device *cpu_dev;
	struct device *first_cpu_dev;
	unsigned int hcpu;
	int each_cpu, num_hcpus, ret;

	hcpu = (unsigned long) data;
	drv = container_of(nb, struct exynos_avs_drv, cpu_nb);
	first_cpu_dev = get_first_cpu_device_of_cluster(hcpu);
	cpu_dev = get_cpu_device(hcpu);

	if (drv->resource_np != first_cpu_dev->of_node)
		return NOTIFY_DONE;

	num_hcpus = 0;
	for_each_cpu(each_cpu, topology_core_cpumask(hcpu)) {
		if (cpu_online(each_cpu))
			num_hcpus++;
	}

	if (num_hcpus != 1)
		return NOTIFY_DONE;

	switch (val & ~CPU_TASKS_FROZEN) {
	case CPU_ONLINE:
		ret = exynos_avs_update_opp_table(drv->dev, first_cpu_dev);
		if (ret)
			goto out_err;
		break;
	case CPU_DOWN_PREPARE:
		exynos_avs_free_opp_table(first_cpu_dev);
		break;
	}

	return NOTIFY_OK;

out_err:
	/*
	 * Free the OPP table of the target device and re-init the table using
	 * DT.
	 */
	exynos_avs_free_opp_table(first_cpu_dev);
	of_init_opp_table(first_cpu_dev);

	return NOTIFY_DONE;
}
static int exynos_avs_5433_init_avs(struct device *dev)
{
	struct exynos_avs_drv *drv = dev_get_drvdata(dev);
	struct device *cpu_dev;
	int table_ver, i, ret;

	drv->chipid_regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
			"samsung,chipid-syscon");
	if (IS_ERR(drv->chipid_regmap))
		return PTR_ERR(drv->chipid_regmap);

	drv->is_fused_avs_group = exynos_avs_5433_is_fused_avs_group(dev);
	if (drv->is_fused_avs_group < 0)
		return drv->is_fused_avs_group;

	drv->regulator = devm_regulator_get(dev, "vdd");
	if (IS_ERR(drv->regulator))
		return PTR_ERR(drv->regulator);

	if ((drv->type != TYPE_CPU_LITTLE) && (drv->type != TYPE_CPU_BIG))
		return -ENODEV;

	/*
	 * Note that, for Exynos 5433, there are four versions (that is, 0, 1,
	 * 2, and 3) of the AVS table, and it is determined by the value
	 * (in this case, table_ver) from the specific register. The relations
	 * between the value and the version of AVS table are as follows:
	 * 	when the value is 0, version 0 of the table is used,
	 * 	when the value is ranged from 1 to 4, version 1 is used,
	 * 	when the value is 5, version 2 is used,
	 * 	and when the value is ranged from 6 to 8, version 3 is used.
	 */
	table_ver = exynos_avs_5433_get_table_ver(dev);
	if (table_ver < 0) {
		return table_ver;
	} else if (table_ver >= EXYNOS_AVS_5433_TABLE_3_VER_MIN) {
		if (drv->type == TYPE_CPU_BIG)
			drv->volt_table = exynos_avs_big_5433_volt_table_v3;
		else
			drv->volt_table = exynos_avs_little_5433_volt_table_v3;
	} else if (table_ver >= EXYNOS_AVS_5433_TABLE_2_VER_MIN) {
		if (drv->type == TYPE_CPU_BIG)
			drv->volt_table = exynos_avs_big_5433_volt_table_v2;
		else
			drv->volt_table = exynos_avs_little_5433_volt_table_v2;
	} else if (table_ver >= EXYNOS_AVS_5433_TABLE_1_VER_MIN) {
		if (drv->type == TYPE_CPU_BIG)
			drv->volt_table = exynos_avs_big_5433_volt_table_v1;
		else
			drv->volt_table = exynos_avs_little_5433_volt_table_v1;
	} else {
		if (drv->type == TYPE_CPU_BIG)
			drv->volt_table = exynos_avs_big_5433_volt_table_v0;
		else
			drv->volt_table = exynos_avs_little_5433_volt_table_v0;
	}

	for (i = 0; drv->volt_table[i].freq != 0; i++) {
		int avs_group = exynos_avs_5433_get_avs_group(dev,
				drv->volt_table[i].freq);

		if (avs_group < 0)
			continue;

		drv->volt_table[i].avs_group = avs_group;
	}

	for_each_online_cpu(i) {
		cpu_dev = get_cpu_device(i);
		if (cpu_dev->of_node == drv->resource_np) {
			ret = exynos_avs_update_opp_table(drv->dev, cpu_dev);
			if (ret)
				goto out_err;
		}
	}

	return 0;

out_err:
	/*
	 * Free the OPP table of the target device and re-init the table using
	 * DT.
	 */
	exynos_avs_free_opp_table(cpu_dev);
	of_init_opp_table(cpu_dev);

	return ret;
}

static const struct exynos_avs_desc exynos_avs_5433_desc = {
	.init_avs = exynos_avs_5433_init_avs,
	.cpu_notifier = exynos_avs_5433_cpu_notifier,
};

static const struct of_device_id exynos_avs_of_match[] = {
	{
		.compatible = "samsung,exynos5433-avs",
		.data = &exynos_avs_5433_desc,
	},
	{ /* sentinel */ },
};
MODULE_DEVICE_TABLE(of, exynos_avs_of_match);

static int exynos_avs_probe(struct platform_device *pdev)
{
	struct device *dev;
	struct device_node *np;
	struct exynos_avs_drv *drv;
	const struct of_device_id *match_id;
	int ret;

	dev = &pdev->dev;
	np = dev->of_node;

	drv = devm_kzalloc(dev, sizeof(*drv), GFP_KERNEL);
	if (!drv)
		return -ENOMEM;

	match_id = of_match_device(exynos_avs_of_match, dev);
	drv->desc = match_id->data;
	if (!drv->desc)
		return -ENODEV;

	drv->resource_np = of_parse_phandle(np, "resource", 0);
	if (!drv->resource_np)
		return -ENODEV;

	drv->dev = dev;

	if (of_property_read_bool(np, "samsung,avs-type-cpu-little"))
		drv->type = TYPE_CPU_LITTLE;
	else if (of_property_read_bool(np, "samsung,avs-type-cpu-big"))
		drv->type = TYPE_CPU_BIG;
	else
		return -ENODEV;

	dev_set_drvdata(dev, drv);

	ret = drv->desc->init_avs(dev);
	if (ret)
		return ret;

	drv->cpu_nb.notifier_call = drv->desc->cpu_notifier;
	drv->cpu_nb.next = NULL;
	drv->cpu_nb.priority = INT_MIN;
	ret = register_hotcpu_notifier(&drv->cpu_nb);
	if (ret)
		return ret;

	dev_info(dev, "registered Exynos AVS driver\n");

	return ret;
}

static struct platform_driver exynos_avs_platdrv = {
	.probe = exynos_avs_probe,
	.driver = {
		.of_match_table = exynos_avs_of_match,
		.name = "exynos-avs",
	},
};

static int __init exynos_avs_init(void)
{
	return platform_driver_register(&exynos_avs_platdrv);
}
late_initcall(exynos_avs_init);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Wook Song <wook16.song@samsung.com>");
MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
MODULE_DESCRIPTION("Samsung Exynos AVS driver");
