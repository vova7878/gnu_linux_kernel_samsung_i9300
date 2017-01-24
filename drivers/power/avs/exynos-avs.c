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

#define EXYNOS_AVS_5433_BASE_ADDR_OFFSET_AVS_INFO		0x4000
#define EXYNOS_AVS_5433_TBL_VER_OFFSET_FROM_AVS_INFO		0xc
#define EXYNOS_AVS_5433_FUSED_FLAG_OFFSET_FROM_AVS_INFO		0xc
#define EXYNOS_AVS_5433_REGMAP_INDEX_CHIPID			0
#define EXYNOS_AVS_5433_SUBGRP0_MIN_FREQ_CPU_LITTLE		1200000000
#define EXYNOS_AVS_5433_SUBGRP1_MIN_FREQ_CPU_LITTLE		700000000
#define EXYNOS_AVS_5433_SUBGRP0_MIN_FREQ_CPU_BIG		1700000000
#define EXYNOS_AVS_5433_SUBGRP1_MIN_FREQ_CPU_BIG		1200000000
#define EXYNOS_AVS_5433_SUPPORT_AVS_GROUP			8
#define EXYNOS_AVS_5433_SUPPORT_TABLE_VER_MAX			8
#define EXYNOS_AVS_5433_SUPPORT_TABLE_VER_MIN			6

enum exynos_avs_type {
	TYPE_CPU_LITTLE = 0,
	TYPE_CPU_BIG,
};

struct exynos_avs_desc {
	int (*init_avs)(struct device *dev);
	int (*cpu_notifier)(struct notifier_block *nb,
			unsigned long val, void *data);
};

struct exynos_avs_group {
	unsigned long freq;
	int group_num;
	int is_support;
};

struct exynos_avs_drv {
	enum exynos_avs_type type;
	struct device_node *resource_np;
	struct device *dev;
	int table_ver;
	int is_fused_avs_group;
	struct regulator *regulator;
	unsigned long u_volt_max;
	unsigned long u_volt_min;
	const struct exynos_avs_desc *desc;
	struct regmap *chipid_regmap;
	struct notifier_block cpu_nb;
	struct exynos_avs_group *avs_group_table;
};

static inline struct device *get_first_cpu_device_of_cluster(unsigned int cpu)
{
	return get_cpu_device(cpumask_first(topology_core_cpumask(cpu)));
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
 * exynos_avs_update_opp_table() - update OPP table of the target device to that
 * of the AVS device
 * @dev:	a pointer of the corresponding AVS device
 * @to:		a pointer of the target device
 *
 * Helper function to update OPP table of the target device to that of the AVS
 * device. In the OPP table of the target device, only OPP which has the
 * frequency value matching to the frequency value of a OPP in the OPP table of
 * the AVS device is updated.
 *
 * Note: this function only works for operating-points v1.
 */
static int exynos_avs_update_opp_table(struct device *dev, struct device *to)
{
	struct exynos_avs_drv *drv = dev_get_drvdata(dev);
	struct dev_pm_opp *opp;
	struct exynos_avs_group *avs_group;
	unsigned long freq, u_volt;
	int nr_opp, i, ret;

	nr_opp = dev_pm_opp_get_opp_count(dev);

	for (i = 0; i < nr_opp; i++) {
		avs_group = &drv->avs_group_table[i];
		if (!avs_group->is_support)
			continue;

		freq = avs_group->freq;

		rcu_read_lock();
		opp = dev_pm_opp_find_freq_exact(to, freq, true);
		rcu_read_unlock();
		if (IS_ERR(opp))
			continue;
		dev_pm_opp_remove(to, freq);

		rcu_read_lock();
		opp = dev_pm_opp_find_freq_exact(dev, freq, true);
		rcu_read_unlock();
		if (IS_ERR(opp)) {
			ret = IS_ERR(opp);
			goto out_err;
		}

		u_volt = dev_pm_opp_get_voltage(opp);
		if (!u_volt) {
			ret = -EINVAL;
			goto out_err;
		}
		ret = dev_pm_opp_add(to, freq, u_volt);
		if (ret)
			goto out_err;
	}

	nr_opp = dev_pm_opp_get_opp_count(to);
	drv->u_volt_max = 0;
	drv->u_volt_min = ULONG_MAX;

	for (i = 0, freq = 0; i < nr_opp; i++, freq++) {
		rcu_read_lock();
		opp = dev_pm_opp_find_freq_ceil(to, &freq);
		if (IS_ERR(opp)) {
			ret = PTR_ERR(opp);
			rcu_read_unlock();
			goto out_err;
		}

		u_volt = dev_pm_opp_get_voltage(opp);
		rcu_read_unlock();
		if (u_volt > drv->u_volt_max)
			drv->u_volt_max = u_volt;
		if (u_volt < drv->u_volt_min)
			drv->u_volt_min = u_volt;
	}

	return 0;

out_err:
	exynos_avs_free_opp_table(to);
	of_init_opp_table(to);

	return ret;
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

	/*
	 * Note that, for Exynos 5433, there are four versions (that is, 0, 1,
	 * 2, and 3) of the AVS table, and it is determined by the value read
	 * from the specific register. The relations between the value and the
	 * version of AVS table are as follows:
	 * 	when the value is 0, version 0 of the tableis used,
	 * 	when the value is ranged from 1 to 3, version 1 is used,
	 * 	when the value is 5, version 2 is used,
	 * 	and when the value is ranged from 6 to 8, version 3 is used.
	 *
	 * Instead of supporting all the versions of the AVS table, this driver
	 * only supports the the case of version 3.
	 */
	if ((val < EXYNOS_AVS_5433_SUPPORT_TABLE_VER_MIN) ||
		(val > EXYNOS_AVS_5433_SUPPORT_TABLE_VER_MAX))
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

/*
 * exynos_avs_5433_verify_opp_cpu() - verify OPP table of the CPU device
 *
 * @dev:	a pointer of the corresponding AVS device
 * @cpu:	a pointer of the target CPU device
 *
 * Helper function to verify OPP table of the target CPU device. This function
 * checks that the regulator of the target CPU device can support all the
 * voltage values of the OPP table of the device and, for the CPU frequency
 * driver, updates the transition_latency value using the maximum and minimum
 * supply voltage values of the target CPU's OPP table.
 *
 * Note: this function only works for operating-points v1.
 */
static int exynos_avs_5433_verify_opp_cpu(struct device *dev,
		struct device *cpu)
{
	struct exynos_avs_drv *drv;
	struct device *first_cpu;
	struct device_node *np;
	struct cpufreq_policy *policy;
	struct dev_pm_opp *opp;
	unsigned int transition_latency;
	unsigned long freq, u_volt;
	int i, nr_opp, ret;

	drv = dev_get_drvdata(dev);
	first_cpu = get_first_cpu_device_of_cluster(cpu->id);

	policy = cpufreq_cpu_get(cpu->id);
	if (!policy)
		return -ENODEV;

	np = of_node_get(first_cpu->of_node);
	if (!np) {
		ret = -ENODEV;
		goto out_put_cpu;
	}

	if (of_property_read_u32(np, "clock-latency", &transition_latency))
		transition_latency = CPUFREQ_ETERNAL;

	nr_opp = dev_pm_opp_get_opp_count(first_cpu);
	for (i = 0, freq = 0; i < nr_opp; i++, freq++) {
		opp = dev_pm_opp_find_freq_ceil(first_cpu, &freq);
		if (IS_ERR(opp)) {
			ret = PTR_ERR(opp);
			goto out_put;
		}

		u_volt = dev_pm_opp_get_voltage(opp);
		if (!regulator_is_supported_voltage(drv->regulator,
					u_volt, u_volt)) {
			ret = -EINVAL;
			goto out_put;
		}
	}

	/*
	 * The value of transition_latency is basically determined by the value
	 * specified in the 'clock-latency' device tree property of the resource
	 * phandle. If ret is not 0, the transition_latency is increased by the
	 * value of ret. Otherwise, it is not required to do anything.
	 */
	ret = regulator_set_voltage_time(drv->regulator,
			drv->u_volt_min, drv->u_volt_max);
	if ((ret > 0) && (transition_latency != CPUFREQ_ETERNAL))
		transition_latency += ret * 1000;

	policy->cpuinfo.transition_latency = transition_latency;
	ret = 0;

out_put:
	of_node_put(first_cpu->of_node);
out_put_cpu:
	cpufreq_cpu_put(policy);
	return ret;

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
		ret = exynos_avs_5433_verify_opp_cpu(drv->dev, cpu_dev);
		if (ret)
			goto out_err;
		break;
	case CPU_DOWN_PREPARE:
		exynos_avs_free_opp_table(first_cpu_dev);
		break;
	}

	return NOTIFY_OK;

out_err:
	exynos_avs_free_opp_table(first_cpu_dev);
	of_init_opp_table(first_cpu_dev);
	return NOTIFY_DONE;
}

static int exynos_avs_5433_init_avs(struct device *dev)
{
	struct exynos_avs_drv *drv = dev_get_drvdata(dev);
	struct dev_pm_opp *opp;
	struct device *cpu_dev;
	unsigned long freq;
	int nr_opp, i, ret;

	drv->chipid_regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
			"samsung,chipid-syscon");
	if (IS_ERR(drv->chipid_regmap))
		return PTR_ERR(drv->chipid_regmap);

	drv->table_ver = exynos_avs_5433_get_table_ver(dev);
	if (drv->table_ver < 0)
		return drv->table_ver;

	drv->is_fused_avs_group = exynos_avs_5433_is_fused_avs_group(dev);
	if (drv->is_fused_avs_group < 0)
		return drv->is_fused_avs_group;

	drv->regulator = devm_regulator_get(dev, "vdd");
	if (IS_ERR(drv->regulator))
		return PTR_ERR(drv->regulator);

	nr_opp = dev_pm_opp_get_opp_count(dev);
	drv->avs_group_table = devm_kzalloc(dev,
			sizeof(*drv->avs_group_table) * nr_opp, GFP_KERNEL);
	if (!drv->avs_group_table)
		return -ENOMEM;

	for (i = 0, freq = 0; i < nr_opp; i++, freq++) {
		struct exynos_avs_group *avs_group;

		opp = dev_pm_opp_find_freq_ceil(dev, &freq);
		if (IS_ERR(opp))
			return PTR_ERR(opp);

		avs_group = &drv->avs_group_table[i];
		avs_group->is_support = false;
		avs_group->freq = freq;
		avs_group->group_num = exynos_avs_5433_get_avs_group(dev, freq);
		if (avs_group->group_num == EXYNOS_AVS_5433_SUPPORT_AVS_GROUP)
			avs_group->is_support = true;
	}

	if ((drv->type != TYPE_CPU_LITTLE) && (drv->type != TYPE_CPU_BIG))
		return -ENODEV;

	for_each_online_cpu(i) {
		cpu_dev = get_cpu_device(i);
		if (cpu_dev->of_node == drv->resource_np) {
			ret = exynos_avs_update_opp_table(drv->dev, cpu_dev);
			if (ret)
				goto out_err;
			ret = exynos_avs_5433_verify_opp_cpu(drv->dev, cpu_dev);
			if (ret)
				goto out_err;
		}
	}

	return 0;

out_err:
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

	ret = of_init_opp_table(dev);
	if (ret)
		return ret;

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
