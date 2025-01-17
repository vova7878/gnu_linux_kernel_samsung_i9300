/*
 * Copyright (C) 2011-2012 ARM Limited. All rights reserved.
 * 
 * This program is free software and is provided to you under the terms of the GNU General Public License version 2
 * as published by the Free Software Foundation, and any use by you of this program is subject to the terms of such GNU licence.
 * 
 * A copy of the licence is included with the program, and can also be obtained from Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

#include "mali_mem_validation.h"
#include "mali_osk.h"
#include "mali_kernel_common.h"
/* MALI_SEC */
#if defined(CONFIG_CPU_EXYNOS4212) || defined(CONFIG_CPU_EXYNOS4412)
#ifndef CONFIG_MACH_KONA
#define MALI_SEC_MEM_VALIDATION
#endif
#include <linux/cma.h>
#include <plat/pd.h>
#include <linux/platform_device.h>
#endif

#define MALI_INVALID_MEM_ADDR 0xFFFFFFFF

typedef struct
{
	u32 phys_base;        /**< Mali physical base of the memory, page aligned */
	u32 size;             /**< size in bytes of the memory, multiple of page size */
} _mali_mem_validation_t;

/* MALI_SEC */
#if defined(MALI_SEC_MEM_VALIDATION)
extern struct platform_device exynos4_device_pd[];
#endif

static _mali_mem_validation_t mali_mem_validator = { MALI_INVALID_MEM_ADDR, MALI_INVALID_MEM_ADDR };

_mali_osk_errcode_t mali_mem_validation_add_range(u32 start, u32 size)
{
	/* MALI_SEC */
#if defined(MALI_SEC_MEM_VALIDATION)
	struct cma_info mem_info;
#endif

	/* Check that no other MEM_VALIDATION resources exist */
	if (MALI_INVALID_MEM_ADDR != mali_mem_validator.phys_base)
	{
		MALI_PRINT_ERROR(("Failed to add frame buffer memory; another range is already specified\n"));
		return _MALI_OSK_ERR_FAULT;
	}

	/* MALI_SEC */
#ifdef CONFIG_EXYNOS_DEV_PD
#if defined(MALI_SEC_MEM_VALIDATION)
	if (cma_info(&mem_info, &exynos4_device_pd[PD_G3D].dev, "fimd")) {
		MALI_PRINT_ERROR(("Failed to get framebuffer information from CMA\n"));
		return _MALI_OSK_ERR_FAULT;
	} else {
#endif
		start = mem_info.lower_bound;
		size = mem_info.total_size - mem_info.free_size;
#ifdef CONFIG_EXYNOS_DEV_PD
	}
#endif
#endif

	/* Check restrictions on page alignment */
	if ((0 != (start & (~_MALI_OSK_CPU_PAGE_MASK))) ||
	    (0 != (size & (~_MALI_OSK_CPU_PAGE_MASK))))
	{
		MALI_PRINT_ERROR(("Failed to add frame buffer memory; incorrect alignment\n"));
		return _MALI_OSK_ERR_FAULT;
	}

	mali_mem_validator.phys_base = start;
	mali_mem_validator.size = size;
	MALI_DEBUG_PRINT(2, ("Memory Validator installed for Mali physical address base=0x%08X, size=0x%08X\n",
	                 mali_mem_validator.phys_base, mali_mem_validator.size));

	return _MALI_OSK_ERR_OK;
}

_mali_osk_errcode_t mali_mem_validation_check(u32 phys_addr, u32 size)
{
	if (phys_addr < (phys_addr + size)) /* Don't allow overflow (or zero size) */
	{
		if ((0 == ( phys_addr & (~_MALI_OSK_CPU_PAGE_MASK))) &&
			(0 == ( size & (~_MALI_OSK_CPU_PAGE_MASK))))
		{
			if ((phys_addr          >= mali_mem_validator.phys_base) &&
				((phys_addr + (size - 1)) >= mali_mem_validator.phys_base) &&
				(phys_addr          <= (mali_mem_validator.phys_base + (mali_mem_validator.size - 1))) &&
				((phys_addr + (size - 1)) <= (mali_mem_validator.phys_base + (mali_mem_validator.size - 1))) )
			{
				MALI_DEBUG_PRINT(3, ("Accepted range 0x%08X + size 0x%08X (= 0x%08X)\n", phys_addr, size, (phys_addr + size - 1)));
				return _MALI_OSK_ERR_OK;
			}
		}
	}

	MALI_PRINT_ERROR(("MALI PHYSICAL RANGE VALIDATION ERROR: The range supplied was: phys_base=0x%08X, size=0x%08X\n", phys_addr, size));

	return _MALI_OSK_ERR_FAULT;
}
