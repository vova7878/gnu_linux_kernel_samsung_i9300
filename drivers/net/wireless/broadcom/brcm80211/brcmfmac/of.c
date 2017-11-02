/*
 * Copyright (c) 2014 Broadcom Corporation
 *
 * Permission to use, copy, modify, and/or distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
 * SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION
 * OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
 * CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */
#include <linux/clk.h>
#include <linux/init.h>
#include <linux/of.h>
#include <linux/of_irq.h>
#include <linux/regulator/consumer.h>

#include <defs.h>
#include "debug.h"
#include "core.h"
#include "common.h"
#include "of.h"

void brcmf_of_probe(struct device *dev, enum brcmf_bus_type bus_type,
		    struct brcmf_mp_device *settings)
{
	struct brcmfmac_sdio_pd *sdio = &settings->bus.sdio;
	struct device_node *np = dev->of_node;
	int irq;
	u32 irqf;
	u32 val;

	if (!np || bus_type != BRCMF_BUSTYPE_SDIO ||
	    !of_device_is_compatible(np, "brcm,bcm4329-fmac"))
		return;

	if (of_property_read_u32(np, "brcm,drive-strength", &val) == 0)
		sdio->drive_strength = val;


	/* make sure there are interrupts defined in the node */
	if (!of_find_property(np, "interrupts", NULL))
		return;

	irq = irq_of_parse_and_map(np, 0);
	if (!irq) {
		brcmf_err("interrupt could not be mapped\n");
		return;
	}
	irqf = irqd_get_trigger_type(irq_get_irq_data(irq));

	sdio->oob_irq_supported = true;
	sdio->oob_irq_nr = irq;
	sdio->oob_irq_flags = irqf;
}

static struct regulator *brcmf_reg;
static struct clk *brcmf_clk;

static void brcmf_of_power_on(void)
{
	int err;

	pr_err("%s: power_on!\n", __func__);
	if (brcmf_reg) {
		err = regulator_enable(brcmf_reg);
		if (err < 0)
			pr_err("%s: Failed to enable regulator: %d\n", __func__, err);
	}

	if (brcmf_clk)
		clk_prepare_enable(brcmf_clk);

}

static void brcmf_of_power_off(void)
{
	pr_err("%s: power_off!\n", __func__);
	if (brcmf_clk)
		clk_disable_unprepare(brcmf_clk);

	if (brcmf_reg)
		regulator_disable(brcmf_reg);
}

static __maybe_unused void brcmf_of_reset(void)
{
	brcmf_of_power_off();
	msleep(10);
	brcmf_of_power_on();
}

struct brcmfmac_platform_data *brcmf_of_probe_powerup(struct platform_device *pdev)
{

	struct brcmfmac_platform_data *pdata;

	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
	if (!pdata)
		return NULL;

	brcmf_reg = devm_regulator_get(&pdev->dev, "wlan");
	if (IS_ERR(brcmf_reg)) {
		pr_err("%s: Failed to get regulator 'wlan': %ld\n", __func__, PTR_ERR(brcmf_reg));
		brcmf_reg = NULL;
	}

	brcmf_clk = devm_clk_get(&pdev->dev, "32khz");
	if (IS_ERR(brcmf_clk)) {
		pr_err("%s: Assuming 32khz is always on (error %ld)\n", __func__, PTR_ERR(brcmf_clk));
		brcmf_clk = NULL;
	}

	pdata->power_on = brcmf_of_power_on;
	pdata->power_off = brcmf_of_power_off;
	// TODO, we need a way to use this
	//pdata->reset = brcmf_of_reset;

	return pdata;
}

