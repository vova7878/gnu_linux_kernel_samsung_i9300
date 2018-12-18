/*
 * Copyright (C) 2010-2011 Samsung Electronics Co., Ltd.
 *
 * S5P series device definition for JPEG
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
*/

#include <linux/kernel.h>
#include <linux/interrupt.h>
#include <linux/platform_device.h>
#include <mach/map.h>

#include <linux/dma-mapping.h>

static u64 s5p_jpeg_dmamask = DMA_BIT_MASK(32);

static struct resource s5p_jpeg_resource[] = {
	[0] = {
		.start = S5P_PA_JPEG,
		.end   = S5P_PA_JPEG + SZ_64K - 1,
		.flags = IORESOURCE_MEM,
	},
	[1] = {
		.start = IRQ_JPEG,
		.end   = IRQ_JPEG,
		.flags = IORESOURCE_IRQ,
	}
};

struct platform_device s5p_device_jpeg = {
	.name             = "s5p-jpeg",
	.id               = -1,
	.dev              = {
		.dma_mask               = &s5p_jpeg_dmamask,
		.coherent_dma_mask      = DMA_BIT_MASK(32),
	},
	.num_resources    = ARRAY_SIZE(s5p_jpeg_resource),
	.resource         = s5p_jpeg_resource,
};
EXPORT_SYMBOL(s5p_device_jpeg);
