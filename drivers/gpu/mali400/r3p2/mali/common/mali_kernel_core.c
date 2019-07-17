/*
 * Copyright (C) 2010-2012 ARM Limited. All rights reserved.
 * 
 * This program is free software and is provided to you under the terms of the GNU General Public License version 2
 * as published by the Free Software Foundation, and any use by you of this program is subject to the terms of such GNU licence.
 * 
 * A copy of the licence is included with the program, and can also be obtained from Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

#include "mali_kernel_common.h"
#include "mali_session.h"
#include "mali_osk.h"
#include "mali_osk_mali.h"
#include "mali_ukk.h"
#include "mali_kernel_core.h"
#include "mali_memory.h"
#include "mali_mem_validation.h"
#include "mali_mmu.h"
#include "mali_mmu_page_directory.h"
#include "mali_dlbu.h"
#include "mali_broadcast.h"
#include "mali_gp.h"
#include "mali_pp.h"
#include "mali_gp_scheduler.h"
#include "mali_pp_scheduler.h"
#include "mali_group.h"
#include "mali_pm.h"
#include "mali_pmu.h"
#include "mali_scheduler.h"
#include "mali_kernel_utilization.h"
#include "mali_l2_cache.h"
#include "mali_pm_domain.h"
#if defined(CONFIG_MALI400_PROFILING)
#include "mali_osk_profiling.h"
#endif
#if defined(CONFIG_MALI400_INTERNAL_PROFILING)
#include "mali_profiling_internal.h"
#endif


/* Mali GPU memory. Real values come from module parameter or from device specific data */
unsigned int mali_dedicated_mem_start = 0;
unsigned int mali_dedicated_mem_size = 0;
unsigned int mali_shared_mem_size = 0;

/* Frame buffer memory to be accessible by Mali GPU */
int mali_fb_start = 0;
int mali_fb_size = 0;

/** Start profiling from module load? */
int mali_boot_profiling = 0;

/** Limits for the number of PP cores behind each L2 cache. */
int mali_max_pp_cores_group_1 = 0xFF;
int mali_max_pp_cores_group_2 = 0xFF;

int mali_inited_pp_cores_group_1 = 0;
int mali_inited_pp_cores_group_2 = 0;

static _mali_product_id_t global_product_id = _MALI_PRODUCT_ID_UNKNOWN;
static u32 global_gpu_base_address = 0;
static u32 global_gpu_major_version = 0;
static u32 global_gpu_minor_version = 0;

#define WATCHDOG_MSECS_DEFAULT 4000 /* 4 s */

/* timer related */
int mali_max_job_runtime = WATCHDOG_MSECS_DEFAULT;

static _mali_osk_errcode_t mali_set_global_gpu_base_address(void)
{
	global_gpu_base_address = _mali_osk_resource_base_address();
	if (0 == global_gpu_base_address)
	{
		return _MALI_OSK_ERR_ITEM_NOT_FOUND;
	}

	return _MALI_OSK_ERR_OK;
}

static u32 mali_get_bcast_id(_mali_osk_resource_t *resource_pp)
{
	switch (resource_pp->base - global_gpu_base_address)
	{
	case 0x08000:
	case 0x20000: /* fall-through for aliased mapping */
		return 0x01;
	case 0x0A000:
	case 0x22000: /* fall-through for aliased mapping */
		return 0x02;
	case 0x0C000:
	case 0x24000: /* fall-through for aliased mapping */
		return 0x04;
	case 0x0E000:
	case 0x26000: /* fall-through for aliased mapping */
		return 0x08;
	case 0x28000:
		return 0x10;
	case 0x2A000:
		return 0x20;
	case 0x2C000:
		return 0x40;
	case 0x2E000:
		return 0x80;
	default:
		return 0;
	}
}

static _mali_osk_errcode_t mali_parse_product_info(void)
{
	/* Mali-400 */
	global_product_id = _MALI_PRODUCT_ID_MALI400;

	return _MALI_OSK_ERR_OK;
}


void mali_resource_count(u32 *pp_count, u32 *l2_count)
{
	*pp_count = 0;
	*l2_count = 0;

	if (_MALI_OSK_ERR_OK == _mali_osk_resource_find(global_gpu_base_address + 0x08000, NULL))
	{
		++(*pp_count);
	}
	if (_MALI_OSK_ERR_OK == _mali_osk_resource_find(global_gpu_base_address + 0x0A000, NULL))
	{
		++(*pp_count);
	}
	if (_MALI_OSK_ERR_OK == _mali_osk_resource_find(global_gpu_base_address + 0x0C000, NULL))
	{
		++(*pp_count);
	}
	if (_MALI_OSK_ERR_OK == _mali_osk_resource_find(global_gpu_base_address + 0x0E000, NULL))
	{
		++(*pp_count);
	}
	if (_MALI_OSK_ERR_OK == _mali_osk_resource_find(global_gpu_base_address + 0x28000, NULL))
	{
		++(*pp_count);
	}
	if (_MALI_OSK_ERR_OK == _mali_osk_resource_find(global_gpu_base_address + 0x2A000, NULL))
	{
		++(*pp_count);
	}
	if (_MALI_OSK_ERR_OK == _mali_osk_resource_find(global_gpu_base_address + 0x2C000, NULL))
	{
		++(*pp_count);
	}
	if (_MALI_OSK_ERR_OK == _mali_osk_resource_find(global_gpu_base_address + 0x2E000, NULL))
	{
		++(*pp_count);
	}

	if (_MALI_OSK_ERR_OK == _mali_osk_resource_find(global_gpu_base_address + 0x1000, NULL))
	{
		++(*l2_count);
	}
	if (_MALI_OSK_ERR_OK == _mali_osk_resource_find(global_gpu_base_address + 0x10000, NULL))
	{
		++(*l2_count);
	}
	if (_MALI_OSK_ERR_OK == _mali_osk_resource_find(global_gpu_base_address + 0x11000, NULL))
	{
		++(*l2_count);
	}
}

static void mali_delete_groups(void)
{
	while (0 < mali_group_get_glob_num_groups())
	{
		mali_group_delete(mali_group_get_glob_group(0));
	}
}

static void mali_delete_l2_cache_cores(void)
{
	while (0 < mali_l2_cache_core_get_glob_num_l2_cores())
	{
		mali_l2_cache_delete(mali_l2_cache_core_get_glob_l2_core(0));
	}
}

static struct mali_l2_cache_core *mali_create_l2_cache_core(_mali_osk_resource_t *resource)
{
	struct mali_l2_cache_core *l2_cache = NULL;

	if (NULL != resource)
	{

		MALI_PRINT(("Found L2 cache %s\n", resource->description));

		l2_cache = mali_l2_cache_create(resource);
		if (NULL == l2_cache)
		{
			MALI_PRINT_ERROR(("Failed to create L2 cache object\n"));
			return NULL;
		}
	}
	MALI_PRINT(("Created L2 cache core object\n"));

	return l2_cache;
}

static _mali_osk_errcode_t mali_parse_config_l2_cache(void)
{
	struct mali_l2_cache_core *l2_cache = NULL;

	if (mali_is_mali400())
	{
		_mali_osk_resource_t l2_resource;
		if (_MALI_OSK_ERR_OK != _mali_osk_resource_find(global_gpu_base_address + 0x1000, &l2_resource))
		{
			MALI_PRINT(("Did not find required Mali L2 cache in config file\n"));
			l2_resource.base = 0x13001000;
			l2_resource.irq = -1;
			l2_resource.description = "Mali_L2";
		}


		l2_cache = mali_create_l2_cache_core(&l2_resource);
		if (NULL == l2_cache)
		{
			return _MALI_OSK_ERR_FAULT;
		}
	}
	else if (mali_is_mali450())
	{
		/*
		 * L2 for GP    at 0x10000
		 * L2 for PP0-3 at 0x01000
		 * L2 for PP4-7 at 0x11000 (optional)
		 */

		_mali_osk_resource_t l2_gp_resource;
		_mali_osk_resource_t l2_pp_grp0_resource;
		_mali_osk_resource_t l2_pp_grp1_resource;

		/* Make cluster for GP's L2 */
		if (_MALI_OSK_ERR_OK == _mali_osk_resource_find(global_gpu_base_address + 0x10000, &l2_gp_resource))
		{
			MALI_PRINT(("Creating Mali-450 L2 cache core for GP\n"));
			l2_cache = mali_create_l2_cache_core(&l2_gp_resource);
			if (NULL == l2_cache)
			{
				return _MALI_OSK_ERR_FAULT;
			}
		}
		else
		{
			MALI_PRINT(("Did not find required Mali L2 cache for GP in config file\n"));
			return _MALI_OSK_ERR_FAULT;
		}

		/* Make cluster for first PP core group */
		if (_MALI_OSK_ERR_OK == _mali_osk_resource_find(global_gpu_base_address + 0x1000, &l2_pp_grp0_resource))
		{
			MALI_PRINT(("Creating Mali-450 L2 cache core for PP group 0\n"));
			l2_cache = mali_create_l2_cache_core(&l2_pp_grp0_resource);
			if (NULL == l2_cache)
			{
				return _MALI_OSK_ERR_FAULT;
			}
			mali_pm_domain_add_l2(MALI_PMU_M450_DOM1, l2_cache);
		}
		else
		{
			MALI_PRINT(("Did not find required Mali L2 cache for PP group 0 in config file\n"));
			return _MALI_OSK_ERR_FAULT;
		}

		/* Second PP core group is optional, don't fail if we don't find it */
		if (_MALI_OSK_ERR_OK == _mali_osk_resource_find(global_gpu_base_address + 0x11000, &l2_pp_grp1_resource))
		{
			MALI_PRINT(("Creating Mali-450 L2 cache core for PP group 1\n"));
			l2_cache = mali_create_l2_cache_core(&l2_pp_grp1_resource);
			if (NULL == l2_cache)
			{
				return _MALI_OSK_ERR_FAULT;
			}
			mali_pm_domain_add_l2(MALI_PMU_M450_DOM3, l2_cache);
		}
	}

	return _MALI_OSK_ERR_OK;
}

static struct mali_group *mali_create_group(struct mali_l2_cache_core *cache,
                                             _mali_osk_resource_t *resource_mmu,
                                             _mali_osk_resource_t *resource_gp,
                                             _mali_osk_resource_t *resource_pp)
{
	struct mali_mmu_core *mmu;
	struct mali_group *group;

	MALI_PRINT(("Starting new group for MMU %s\n", resource_mmu->description));

	/* Create the group object */
	group = mali_group_create(cache, NULL, NULL);

	pr_err("%s: %d\n", __func__, __LINE__);

	if (NULL == group)
	{
		MALI_PRINT_ERROR(("Failed to create group object for MMU %s\n", resource_mmu->description));
		return NULL;
	}
	pr_err("%s: %d\n", __func__, __LINE__);

	return NULL;

	/* Create the MMU object inside group */
	mmu = mali_mmu_create(resource_mmu, group, MALI_FALSE);
	if (NULL == mmu)
	{
		MALI_PRINT_ERROR(("Failed to create MMU object\n"));
		mali_group_delete(group);
		return NULL;
	}

	if (NULL != resource_gp)
	{
		/* Create the GP core object inside this group */
		struct mali_gp_core *gp_core = mali_gp_create(resource_gp, group);
		if (NULL == gp_core)
		{
			/* No need to clean up now, as we will clean up everything linked in from the cluster when we fail this function */
			MALI_PRINT_ERROR(("Failed to create GP object\n"));
			mali_group_delete(group);
			return NULL;
		}
	}

	if (NULL != resource_pp)
	{
		struct mali_pp_core *pp_core;

		/* Create the PP core object inside this group */
		pp_core = mali_pp_create(resource_pp, group, MALI_FALSE, mali_get_bcast_id(resource_pp));
		if (NULL == pp_core)
		{
			/* No need to clean up now, as we will clean up everything linked in from the cluster when we fail this function */
			MALI_PRINT_ERROR(("Failed to create PP object\n"));
			mali_group_delete(group);
			return NULL;
		}
	}

	/* Reset group */
	mali_group_lock(group);
	mali_group_reset(group);
	mali_group_unlock(group);

	return group;
}

static _mali_osk_errcode_t mali_create_virtual_group(_mali_osk_resource_t *resource_mmu_pp_bcast,
                                                    _mali_osk_resource_t *resource_pp_bcast,
                                                    _mali_osk_resource_t *resource_dlbu,
                                                    _mali_osk_resource_t *resource_bcast)
{
	struct mali_mmu_core *mmu_pp_bcast_core;
	struct mali_pp_core *pp_bcast_core;
	struct mali_dlbu_core *dlbu_core;
	struct mali_bcast_unit *bcast_core;
	struct mali_group *group;

	MALI_PRINT(("Starting new virtual group for MMU PP broadcast core %s\n", resource_mmu_pp_bcast->description));

	/* Create the DLBU core object */
	dlbu_core = mali_dlbu_create(resource_dlbu);
	if (NULL == dlbu_core)
	{
		MALI_PRINT_ERROR(("Failed to create DLBU object \n"));
		return _MALI_OSK_ERR_FAULT;
	}

	/* Create the Broadcast unit core */
	bcast_core = mali_bcast_unit_create(resource_bcast);
	if (NULL == bcast_core)
	{
		MALI_PRINT_ERROR(("Failed to create Broadcast unit object!\n"));
		mali_dlbu_delete(dlbu_core);
		return _MALI_OSK_ERR_FAULT;
	}

	/* Create the group object */
	group = mali_group_create(NULL, dlbu_core, bcast_core);
	if (NULL == group)
	{
		MALI_PRINT_ERROR(("Failed to create group object for MMU PP broadcast core %s\n", resource_mmu_pp_bcast->description));
		mali_bcast_unit_delete(bcast_core);
		mali_dlbu_delete(dlbu_core);
		return _MALI_OSK_ERR_FAULT;
	}

	/* Create the MMU object inside group */
	mmu_pp_bcast_core = mali_mmu_create(resource_mmu_pp_bcast, group, MALI_TRUE);
	if (NULL == mmu_pp_bcast_core)
	{
		MALI_PRINT_ERROR(("Failed to create MMU PP broadcast object\n"));
		mali_group_delete(group);
		return _MALI_OSK_ERR_FAULT;
	}

	/* Create the PP core object inside this group */
	pp_bcast_core = mali_pp_create(resource_pp_bcast, group, MALI_TRUE, 0);
	if (NULL == pp_bcast_core)
	{
		/* No need to clean up now, as we will clean up everything linked in from the cluster when we fail this function */
		MALI_PRINT_ERROR(("Failed to create PP object\n"));
		mali_group_delete(group);
		return _MALI_OSK_ERR_FAULT;
	}

	return _MALI_OSK_ERR_OK;
}

#define MALI_SET_RESOURCE(_res, _base, _irq, _description)	\
	do {							\
		_res.base = _base;				\
		_res.irq = _irq;				\
		_res.description = _description;		\
	} while(0)

static _mali_osk_errcode_t mali_parse_config_groups(void)
{
	struct mali_group *group;
	int cluster_id_gp = 0;
	int cluster_id_pp_grp0 = 0;
	int cluster_id_pp_grp1 = 0;
	int i;

	_mali_osk_resource_t resource_gp;
	_mali_osk_resource_t resource_gp_mmu;
	_mali_osk_resource_t resource_pp[8];
	_mali_osk_resource_t resource_pp_mmu[8];
	_mali_osk_resource_t resource_pp_mmu_bcast;
	_mali_osk_resource_t resource_pp_bcast;
	_mali_osk_resource_t resource_dlbu;
	_mali_osk_resource_t resource_bcast;
	_mali_osk_errcode_t resource_gp_found;
	_mali_osk_errcode_t resource_gp_mmu_found;
	_mali_osk_errcode_t resource_pp_found[8];
	_mali_osk_errcode_t resource_pp_mmu_found[8];
	_mali_osk_errcode_t resource_pp_mmu_bcast_found;
	_mali_osk_errcode_t resource_pp_bcast_found;
	_mali_osk_errcode_t resource_dlbu_found;
	_mali_osk_errcode_t resource_bcast_found;

	pr_err("%s: %d\n", __func__, __LINE__);

	if (!(mali_is_mali400() || mali_is_mali450()))
	{
		/* No known HW core */
		MALI_PRINT(("Mali product detection error"));
		return -99999999;
	}

	pr_err("%s: %d\n", __func__, __LINE__);

	if (mali_is_mali450())
	{
		/* Mali-450 have separate L2s for GP, and PP core group(s) */
		cluster_id_pp_grp0 = 1;
		cluster_id_pp_grp1 = 2;
	}

	pr_err("%s: %d\n", __func__, __LINE__);

	resource_gp_found = _mali_osk_resource_find(global_gpu_base_address + 0x00000, &resource_gp);
	resource_gp_mmu_found = _mali_osk_resource_find(global_gpu_base_address + 0x03000, &resource_gp_mmu);
	resource_pp_found[0] = _mali_osk_resource_find(global_gpu_base_address + 0x08000, &(resource_pp[0]));
	resource_pp_found[1] = _mali_osk_resource_find(global_gpu_base_address + 0x0A000, &(resource_pp[1]));
	resource_pp_found[2] = _mali_osk_resource_find(global_gpu_base_address + 0x0C000, &(resource_pp[2]));
	resource_pp_found[3] = _mali_osk_resource_find(global_gpu_base_address + 0x0E000, &(resource_pp[3]));
	resource_pp_found[4] = _mali_osk_resource_find(global_gpu_base_address + 0x28000, &(resource_pp[4]));
	resource_pp_found[5] = _mali_osk_resource_find(global_gpu_base_address + 0x2A000, &(resource_pp[5]));
	resource_pp_found[6] = _mali_osk_resource_find(global_gpu_base_address + 0x2C000, &(resource_pp[6]));
	resource_pp_found[7] = _mali_osk_resource_find(global_gpu_base_address + 0x2E000, &(resource_pp[7]));
	resource_pp_mmu_found[0] = _mali_osk_resource_find(global_gpu_base_address + 0x04000, &(resource_pp_mmu[0]));
	resource_pp_mmu_found[1] = _mali_osk_resource_find(global_gpu_base_address + 0x05000, &(resource_pp_mmu[1]));
	resource_pp_mmu_found[2] = _mali_osk_resource_find(global_gpu_base_address + 0x06000, &(resource_pp_mmu[2]));
	resource_pp_mmu_found[3] = _mali_osk_resource_find(global_gpu_base_address + 0x07000, &(resource_pp_mmu[3]));
	resource_pp_mmu_found[4] = _mali_osk_resource_find(global_gpu_base_address + 0x1C000, &(resource_pp_mmu[4]));
	resource_pp_mmu_found[5] = _mali_osk_resource_find(global_gpu_base_address + 0x1D000, &(resource_pp_mmu[5]));
	resource_pp_mmu_found[6] = _mali_osk_resource_find(global_gpu_base_address + 0x1E000, &(resource_pp_mmu[6]));
	resource_pp_mmu_found[7] = _mali_osk_resource_find(global_gpu_base_address + 0x1F000, &(resource_pp_mmu[7]));

	pr_err("%s: %d\n", __func__, __LINE__);

	pr_err("%s: %d\n", __func__, __LINE__);

	resource_gp_found = _MALI_OSK_ERR_OK;
	resource_gp_mmu_found = _MALI_OSK_ERR_OK;
	resource_pp_found[0] = _MALI_OSK_ERR_OK;
	resource_pp_found[1] = _MALI_OSK_ERR_OK;
	resource_pp_found[2] = _MALI_OSK_ERR_OK;
	resource_pp_found[3] = _MALI_OSK_ERR_OK;
	resource_pp_mmu_found[0] = _MALI_OSK_ERR_OK;
	resource_pp_mmu_found[1] = _MALI_OSK_ERR_OK;
	resource_pp_mmu_found[2] = _MALI_OSK_ERR_OK;
	resource_pp_mmu_found[3] = _MALI_OSK_ERR_OK;

	pr_err("%s: %d\n", __func__, __LINE__);

	MALI_SET_RESOURCE(resource_gp, 0x13000000, 191, "Mali_GP");
	MALI_SET_RESOURCE(resource_gp_mmu, 0x13003000, 186, "Mali_GP_MMU");
	MALI_SET_RESOURCE(resource_pp[0], 0x13008000, 187, "Mali_PP0");
	MALI_SET_RESOURCE(resource_pp[1], 0x1300a000, 188, "Mali_PP1");
	MALI_SET_RESOURCE(resource_pp[2], 0x1300c000, 189, "Mali_PP2");
	MALI_SET_RESOURCE(resource_pp[3], 0x1300e000, 190, "Mali_PP3");
	MALI_SET_RESOURCE(resource_pp_mmu[0], 0x13004000, 182, "Mali_PP0_MMU");
	MALI_SET_RESOURCE(resource_pp_mmu[1], 0x13005000, 183, "Mali_PP1_MMU");
	MALI_SET_RESOURCE(resource_pp_mmu[2], 0x13006000, 184, "Mali_PP2_MMU");
	MALI_SET_RESOURCE(resource_pp_mmu[3], 0x13007000, 185, "Mali_PP3_MMU");

	pr_err("%s: %d\n", __func__, __LINE__);
/*
[    1.404107] c0      1 mali_parse_config_groups: 537: res resource_gp: .description = Mali_GP, .irq = 191, .base = 13000000
[    1.415096] c0      1 mali_parse_config_groups: 539: res resource_gp_mmu: .description = Mali_GP_MMU, .irq = 186, .base = 13003000
[    1.426812] c0      1 mali_parse_config_groups: 541: res resource_pp[0]: .description = Mali_PP0, .irq = 187, .base = 13008000
[    1.438182] c0      1 mali_parse_config_groups: 543: res resource_pp[1]: .description = Mali_PP1, .irq = 188, .base = 1300a000
[    1.449553] c0      1 mali_parse_config_groups: 545: res resource_pp[2]: .description = Mali_PP2, .irq = 189, .base = 1300c000
[    1.460923] c0      1 mali_parse_config_groups: 547: res resource_pp[3]: .description = Mali_PP3, .irq = 190, .base = 1300e000
[    1.472294] c0      1 mali_parse_config_groups: 549: res resource_pp[4]: .description = , .irq = -1070414108, .base = 1c
[    1.483206] c0      1 mali_parse_config_groups: 551: res resource_pp[5]: .description = (null), .irq = -1070343568, .base = c033f7cc
[    1.525963] c0      1 mali_parse_config_groups: 557: res resource_pp_mmu[0]: .description = Mali_PP0_MMU, .irq = 182, .base = 13004000
[    1.538006] c0      1 mali_parse_config_groups: 559: res resource_pp_mmu[1]: .description = Mali_PP1_MMU, .irq = 183, .base = 13005000
[    1.550070] c0      1 mali_parse_config_groups: 561: res resource_pp_mmu[2]: .description = Mali_PP2_MMU, .irq = 184, .base = 13006000
[    1.562135] c0      1 mali_parse_config_groups: 563: res resource_pp_mmu[3]: .description = Mali_PP3_MMU, .irq = 185, .base = 13007000
[    1.586612] c0      1 mali_parse_config_groups: 567: res resource_pp_mmu[5]: .description = , .irq = -1061402520, .base = f1edfc80
*/

	if (_MALI_OSK_ERR_OK != resource_gp_found ||
	    _MALI_OSK_ERR_OK != resource_gp_mmu_found ||
	    _MALI_OSK_ERR_OK != resource_pp_found[0] ||
	    _MALI_OSK_ERR_OK != resource_pp_mmu_found[0])
	{
		/* Missing mandatory core(s) */
		MALI_PRINT(("Missing mandatory resource, need at least one GP and one PP, both with a separate MMU\n"));
		return -161;
	}

	pr_err("%s: %d\n", __func__, __LINE__);

	int num_l2_cores = mali_l2_cache_core_get_glob_num_l2_cores();

	if (num_l2_cores <= 1) {
		MALI_PRINT(("%s: %d: num_l2_cores == %d\n", __func__, __LINE__, num_l2_cores));
	}

	pr_err("%s: %d\n", __func__, __LINE__);

	MALI_DEBUG_ASSERT(1 <= num_l2_cores);

	pr_err("%s: %d\n", __func__, __LINE__);
	group = mali_create_group(mali_l2_cache_core_get_glob_l2_core(cluster_id_gp), &resource_gp_mmu, &resource_gp, NULL);

	pr_err("%s: %d\n", __func__, __LINE__);
	return -1;
	if (NULL == group)
	{
		MALI_PRINT(("%s: %d: mali_create_group() == NULL\n", __func__, __LINE__));

		return -27323;
	}

	pr_err("%s: %d\n", __func__, __LINE__);

	/* Create group for first (and mandatory) PP core */
	MALI_DEBUG_ASSERT(mali_l2_cache_core_get_glob_num_l2_cores() >= (cluster_id_pp_grp0 + 1)); /* >= 1 on Mali-300 and Mali-400, >= 2 on Mali-450 */

	pr_err("%s: %d\n", __func__, __LINE__);
	group = mali_create_group(mali_l2_cache_core_get_glob_l2_core(cluster_id_pp_grp0), &resource_pp_mmu[0], NULL, &resource_pp[0]);

	pr_err("%s: %d\n", __func__, __LINE__);
	if (NULL == group)
	{
		MALI_PRINT(("%s: %d: mali_create_group() == NULL\n", __func__, __LINE__));
		return -44343;
	}

	pr_err("%s: %d\n", __func__, __LINE__);
	mali_pm_domain_add_group(MALI_PMU_M400_PP0, group);

	mali_inited_pp_cores_group_1++;

	pr_err("%s: %d\n", __func__, __LINE__);
	/* Create groups for rest of the cores in the first PP core group */
	for (i = 1; i < 4; i++) /* First half of the PP cores belong to first core group */
	{
		pr_err("%s: %d: %d\n", __func__, __LINE__, i);
		if (mali_inited_pp_cores_group_1 < mali_max_pp_cores_group_1)
		{
			pr_err("%s: %d: %d\n", __func__, __LINE__, i);

			if (_MALI_OSK_ERR_OK == resource_pp_found[i] && _MALI_OSK_ERR_OK == resource_pp_mmu_found[i])
			{
				pr_err("%s: %d: %d\n", __func__, __LINE__, i);

				group = mali_create_group(mali_l2_cache_core_get_glob_l2_core(cluster_id_pp_grp0), &resource_pp_mmu[i], NULL, &resource_pp[i]);
				if (NULL == group)
				{
					MALI_PRINT(("%s: %d: mali_create_group() == NULL\n", __func__, __LINE__));
					return -273812;
				}
				pr_err("%s: %d: %d\n", __func__, __LINE__, i);
				mali_pm_domain_add_group(MALI_PMU_M400_PP0 + i, group);
				pr_err("%s: %d: %d\n", __func__, __LINE__, i);
				mali_inited_pp_cores_group_1++;
			}
		}
	}

	pr_err("%s: %d: %d\n", __func__, __LINE__);

	/* Create groups for cores in the second PP core group */
	for (i = 4; i < 8; i++) /* Second half of the PP cores belong to second core group */
	{
		pr_err("%s: %d: %d\n", __func__, __LINE__, i);
		if (mali_inited_pp_cores_group_2 < mali_max_pp_cores_group_2)
		{
			pr_err("%s: %d: %d\n", __func__, __LINE__, i);
			if (_MALI_OSK_ERR_OK == resource_pp_found[i] && _MALI_OSK_ERR_OK == resource_pp_mmu_found[i])
			{
				pr_err("%s: %d: %d\n", __func__, __LINE__, i);
				MALI_DEBUG_ASSERT(mali_l2_cache_core_get_glob_num_l2_cores() >= 2); /* Only Mali-450 have a second core group */
				pr_err("%s: %d: %d\n", __func__, __LINE__, i);

				group = mali_create_group(mali_l2_cache_core_get_glob_l2_core(cluster_id_pp_grp1), &resource_pp_mmu[i], NULL, &resource_pp[i]);
				pr_err("%s: %d: %d\n", __func__, __LINE__, i);

				if (NULL == group)
				{
					pr_err("%s: %d: %d\n", __func__, __LINE__, i);
					MALI_PRINT(("%s: %d: mali_create_group() == NULL\n", __func__, __LINE__));
					return -2432423;
				}
				pr_err("%s: %d: %d\n", __func__, __LINE__, i);

				mali_pm_domain_add_group(MALI_PMU_M450_DOM3, group);
				mali_inited_pp_cores_group_2++;
			}
		}
	}

	pr_err("%s: %d: %d\n", __func__, __LINE__, i);
	mali_max_pp_cores_group_1 = mali_inited_pp_cores_group_1;
	mali_max_pp_cores_group_2 = mali_inited_pp_cores_group_2;
	MALI_PRINT(("%d+%d PP cores initialized\n", mali_inited_pp_cores_group_1, mali_inited_pp_cores_group_2));

	return _MALI_OSK_ERR_OK;
}

static _mali_osk_errcode_t mali_check_shared_interrupts(void)
{
#if !defined(CONFIG_MALI_SHARED_INTERRUPTS)
	if (MALI_TRUE == _mali_osk_shared_interrupts())
	{
		MALI_PRINT_ERROR(("Shared interrupts detected, but driver support is not enabled\n"));
		return _MALI_OSK_ERR_FAULT;
	}
#endif /* !defined(CONFIG_MALI_SHARED_INTERRUPTS) */

	/* It is OK to compile support for shared interrupts even if Mali is not using it. */
	return _MALI_OSK_ERR_OK;
}

static _mali_osk_errcode_t mali_create_pm_domains(void)
{
	struct mali_pm_domain *domain;
	u32 number_of_pp_cores = 0;
	u32 number_of_l2_caches = 0;

	mali_resource_count(&number_of_pp_cores, &number_of_l2_caches);

	if (mali_is_mali450())
	{
		MALI_PRINT(("Creating PM domains for Mali-450 MP%d\n", number_of_pp_cores));
		switch (number_of_pp_cores)
		{
			case 8: /* Fall through */
			case 6: /* Fall through */
				domain = mali_pm_domain_create(MALI_PMU_M450_DOM3, MALI_PMU_M450_DOM3_MASK);
				MALI_CHECK(NULL != domain, _MALI_OSK_ERR_NOMEM);
			case 4: /* Fall through */
			case 3: /* Fall through */
			case 2: /* Fall through */
				domain = mali_pm_domain_create(MALI_PMU_M450_DOM2, MALI_PMU_M450_DOM2_MASK);
				MALI_CHECK(NULL != domain, _MALI_OSK_ERR_NOMEM);
				domain = mali_pm_domain_create(MALI_PMU_M450_DOM1, MALI_PMU_M450_DOM1_MASK);
				MALI_CHECK(NULL != domain, _MALI_OSK_ERR_NOMEM);

				break;
			default:
				MALI_PRINT_ERROR(("Unsupported core configuration\n"));
				MALI_DEBUG_ASSERT(0);
		}
	}
	else
	{
		int i;
		u32 mask = MALI_PMU_M400_PP0_MASK;

		MALI_PRINT(("Creating PM domains for Mali-400 MP%d\n", number_of_pp_cores));

		MALI_DEBUG_ASSERT(mali_is_mali400());

		for (i = 0; i < number_of_pp_cores; i++)
		{
			MALI_CHECK(NULL != mali_pm_domain_create(i, mask), _MALI_OSK_ERR_NOMEM);

			/* Shift mask up, for next core */
			mask = mask << 1;
		}
	}
	return _MALI_OSK_ERR_OK;
}

static _mali_osk_errcode_t mali_parse_config_pmu(void)
{
	_mali_osk_resource_t resource_pmu;

	MALI_DEBUG_ASSERT(0 != global_gpu_base_address);

	if (_MALI_OSK_ERR_OK == _mali_osk_resource_find(global_gpu_base_address + 0x02000, &resource_pmu))
	{
		struct mali_pmu_core *pmu;
		u32 number_of_pp_cores = 0;
		u32 number_of_l2_caches = 0;

		mali_resource_count(&number_of_pp_cores, &number_of_l2_caches);

		pmu = mali_pmu_create(&resource_pmu, number_of_pp_cores, number_of_l2_caches);
		if (NULL == pmu)
		{
			MALI_PRINT_ERROR(("Failed to create PMU\n"));
			return _MALI_OSK_ERR_FAULT;
		}
	}

	/* It's ok if the PMU doesn't exist */
	return _MALI_OSK_ERR_OK;
}

static _mali_osk_errcode_t mali_parse_config_memory(void)
{
	_mali_osk_errcode_t ret;

	if (0 == mali_dedicated_mem_start && 0 == mali_dedicated_mem_size && 0 == mali_shared_mem_size)
	{
		/* Memory settings are not overridden by module parameters, so use device settings */
		struct _mali_osk_device_data data = { 0, };

		if (_MALI_OSK_ERR_OK == _mali_osk_device_data_get(&data))
		{
			/* Use device specific settings (if defined) */
			mali_dedicated_mem_start = data.dedicated_mem_start;
			mali_dedicated_mem_size = data.dedicated_mem_size;
			mali_shared_mem_size = data.shared_mem_size;
		}

		if (0 == mali_dedicated_mem_start && 0 == mali_dedicated_mem_size && 0 == mali_shared_mem_size)
		{
			mali_shared_mem_size = 0x10000000;
		}

		MALI_PRINT(("Using device defined memory settings (dedicated: 0x%08X@0x%08X, shared: 0x%08X)\n",
		                     mali_dedicated_mem_size, mali_dedicated_mem_start, mali_shared_mem_size));
	}
	else
	{
		MALI_PRINT(("Using module defined memory settings (dedicated: 0x%08X@0x%08X, shared: 0x%08X)\n",
		                     mali_dedicated_mem_size, mali_dedicated_mem_start, mali_shared_mem_size));
	}

	if (0 < mali_dedicated_mem_size && 0 != mali_dedicated_mem_start)
	{
		/* Dedicated memory */
		ret = mali_memory_core_resource_dedicated_memory(mali_dedicated_mem_start, mali_dedicated_mem_size);
		if (_MALI_OSK_ERR_OK != ret)
		{
			MALI_PRINT_ERROR(("Failed to register dedicated memory\n"));
			mali_memory_terminate();
			return ret;
		}
	}

	if (0 < mali_shared_mem_size)
	{
		/* Shared OS memory */
		ret = mali_memory_core_resource_os_memory(mali_shared_mem_size);
		if (_MALI_OSK_ERR_OK != ret)
		{
			MALI_PRINT_ERROR(("Failed to register shared OS memory\n"));
			mali_memory_terminate();
			return ret;
		}
	}

	if (0 == mali_fb_start && 0 == mali_fb_size)
	{
		/* Frame buffer settings are not overridden by module parameters, so use device settings */
		struct _mali_osk_device_data data = { 0, };

		if (_MALI_OSK_ERR_OK == _mali_osk_device_data_get(&data))
		{
			/* Use device specific settings (if defined) */
			mali_fb_start = data.fb_start;
			mali_fb_size = data.fb_size;
		}

		MALI_PRINT(("Using device defined frame buffer settings (0x%08X@0x%08X)\n",
		                     mali_fb_size, mali_fb_start));
	}
	else
	{
		MALI_PRINT(("Using module defined frame buffer settings (0x%08X@0x%08X)\n",
		                     mali_fb_size, mali_fb_start));
	}

	if (0 != mali_fb_size)
	{
		/* Register frame buffer */
		ret = mali_mem_validation_add_range(mali_fb_start, mali_fb_size);
		if (_MALI_OSK_ERR_OK != ret)
		{
			MALI_PRINT_ERROR(("Failed to register frame buffer memory region\n"));
			mali_memory_terminate();
			return ret;
		}
	}

	return _MALI_OSK_ERR_OK;
}

_mali_osk_errcode_t mali_initialize_subsystems(void)
{
	_mali_osk_errcode_t err;
	struct mali_pmu_core *pmu;

	err = mali_session_initialize();
	if (_MALI_OSK_ERR_OK != err) {
		MALI_PRINT_ERROR(("%s: mali_session_initialize returned %d\n", __func__, err));
		goto session_init_failed;
	}

#if defined(CONFIG_MALI400_PROFILING)
	err = _mali_osk_profiling_init(mali_boot_profiling ? MALI_TRUE : MALI_FALSE);
	if (_MALI_OSK_ERR_OK != err)
	{
		MALI_PRINT_ERROR(("%s: _mali_osk_profiling_init returned %d\n", __func__, err));
		/* No biggie if we weren't able to initialize the profiling */
		MALI_PRINT_ERROR(("Failed to initialize profiling, feature will be unavailable\n"));
	}
#endif

	err = mali_memory_initialize();
	if (_MALI_OSK_ERR_OK != err) {
		MALI_PRINT_ERROR(("%s: mali_memory_initialize returned %d\n", __func__, err));

		goto memory_init_failed;
	}

	/* Configure memory early. Memory allocation needed for mali_mmu_initialize. */
	err = mali_parse_config_memory();
	if (_MALI_OSK_ERR_OK != err) {
		MALI_PRINT_ERROR(("%s: mali_parse_config_memory returned %d\n", __func__, err));

		goto parse_memory_config_failed;
	}

	err = mali_set_global_gpu_base_address();
	if (_MALI_OSK_ERR_OK != err) {
		MALI_PRINT_ERROR(("%s: mali_set_global_gpu_base_address returned %d\n", __func__, err));

		goto set_global_gpu_base_address_failed;
	}

	err = mali_check_shared_interrupts();
	if (_MALI_OSK_ERR_OK != err) {
		MALI_PRINT_ERROR(("%s: mali_check_shared_interrupts returned %d\n", __func__, err));

		goto check_shared_interrupts_failed;
	}

	err = mali_pp_scheduler_initialize();
	if (_MALI_OSK_ERR_OK != err) {
		MALI_PRINT_ERROR(("%s: mali_pp_scheduler_initialize returned %d\n", __func__, err));

		goto pp_scheduler_init_failed;
	}

	/* Initialize the power management module */
	err = mali_pm_initialize();
	if (_MALI_OSK_ERR_OK != err) {
		MALI_PRINT_ERROR(("%s: mali_pm_initialize returned %d\n", __func__, err));

		goto pm_init_failed;
	}

	/* Initialize the MALI PMU */
	err = mali_parse_config_pmu();
	if (_MALI_OSK_ERR_OK != err) {
		MALI_PRINT_ERROR(("%s: mali_parse_config_pmu returned %d\n", __func__, err));

		goto parse_pmu_config_failed;
	}

	/* Make sure the power stays on for the rest of this function */
	err = _mali_osk_pm_dev_ref_add();
	if (_MALI_OSK_ERR_OK != err) {
		MALI_PRINT_ERROR(("%s: _mali_osk_pm_dev_ref_add returned %d\n", __func__, err));

		goto pm_always_on_failed;
	}

	/*
	 * If run-time PM is used, then the mali_pm module has now already been
	 * notified that the power now is on (through the resume callback functions).
	 * However, if run-time PM is not used, then there will probably not be any
	 * calls to the resume callback functions, so we need to explicitly tell it
	 * that the power is on.
	 */
	mali_pm_set_power_is_on();

	/* Reset PMU HW and ensure all Mali power domains are on */
	pmu = mali_pmu_get_global_pmu_core();
	if (NULL != pmu)
	{
		MALI_PRINT_ERROR(("%s: pmu == NULL\n", __func__));

		err = mali_pmu_reset(pmu);
		if (_MALI_OSK_ERR_OK != err) {
			MALI_PRINT_ERROR(("%s: mali_pmu_get_global_pmu_core() == NULL, err = %d\n", __func__, err));
			goto pmu_reset_failed;
		}
	}

	/* Detect which Mali GPU we are dealing with */
	err = mali_parse_product_info();

	/* The global_product_id is now populated with the correct Mali GPU */

	/* Create PM domains only if PMU exists */
	if (NULL != pmu)
	{
		err = mali_create_pm_domains();
		if (_MALI_OSK_ERR_OK != err) {
			MALI_PRINT_ERROR(("%s: mali_create_pm_domains returned %d\n", __func__, err));

			goto pm_domain_failed;
		}
	}

	/* Initialize MMU module */
	err = mali_mmu_initialize();
	if (_MALI_OSK_ERR_OK != err) {
		MALI_PRINT_ERROR(("%s: mali_mmu_initialize returned %d\n", __func__, err));

		goto mmu_init_failed;
	}

	if (mali_is_mali450())
	{
		err = mali_dlbu_initialize();
		if (_MALI_OSK_ERR_OK != err) {
			MALI_PRINT_ERROR(("%s: mali_dlbu_initialize returned %d\n", __func__, err));

			goto dlbu_init_failed;
		}
	}

	/* Start configuring the actual Mali hardware. */
	err = mali_parse_config_l2_cache();
	if (_MALI_OSK_ERR_OK != err) {
		MALI_PRINT_ERROR(("%s: mali_parse_config_l2_cache returned %d\n", __func__, err));

		goto config_parsing_failed;
	}
	//pr_err("%s: mali_parse_config_groups", __func__);
	//goto config_parsing_failed;

	err = mali_parse_config_groups();

	if (_MALI_OSK_ERR_OK != err) {
		MALI_PRINT_ERROR(("%s: mali_parse_config_groups returned %d\n", __func__, err));

		goto config_parsing_failed;
	}

	/* Initialize the schedulers */
	err = mali_scheduler_initialize();
	if (_MALI_OSK_ERR_OK != err) {
		MALI_PRINT_ERROR(("%s: mali_scheduler_initialize returned %d\n", __func__, err));

		goto scheduler_init_failed;
	}

	err = mali_gp_scheduler_initialize();
	if (_MALI_OSK_ERR_OK != err) {
		MALI_PRINT_ERROR(("%s: mali_gp_scheduler_initialize returned %d\n", __func__, err));

		goto gp_scheduler_init_failed;
	}

	/* PP scheduler population can't fail */
	mali_pp_scheduler_populate();

	/* Initialize the GPU utilization tracking */
	err = mali_utilization_init();
	if (_MALI_OSK_ERR_OK != err) {
		MALI_PRINT_ERROR(("%s: mali_utilization_init returned %d\n", __func__, err));

		goto utilization_init_failed;
	}

	/* Allowing the system to be turned off */
	_mali_osk_pm_dev_ref_dec();

	MALI_SUCCESS; /* all ok */

	/* Error handling */

utilization_init_failed:
	mali_pp_scheduler_depopulate();
	mali_gp_scheduler_terminate();
gp_scheduler_init_failed:
	mali_scheduler_terminate();
scheduler_init_failed:
config_parsing_failed:
	mali_delete_groups(); /* Delete any groups not (yet) owned by a scheduler */
	mali_delete_l2_cache_cores(); /* Delete L2 cache cores even if config parsing failed. */
dlbu_init_failed:
	mali_dlbu_terminate();
mmu_init_failed:
	mali_pm_domain_terminate();
pm_domain_failed:
	/* Nothing to roll back */
product_info_parsing_failed:
	/* Nothing to roll back */
pmu_reset_failed:
	/* Allowing the system to be turned off */
	_mali_osk_pm_dev_ref_dec();
pm_always_on_failed:
	pmu = mali_pmu_get_global_pmu_core();
	if (NULL != pmu)
	{
		mali_pmu_delete(pmu);
	}
parse_pmu_config_failed:
	mali_pm_terminate();
pm_init_failed:
	mali_pp_scheduler_terminate();
pp_scheduler_init_failed:
check_shared_interrupts_failed:
	global_gpu_base_address = 0;
set_global_gpu_base_address_failed:
	global_gpu_base_address = 0;
parse_memory_config_failed:
	mali_memory_terminate();
memory_init_failed:
#if defined(CONFIG_MALI400_PROFILING)
	_mali_osk_profiling_term();
#endif
	mali_session_terminate();
session_init_failed:
	return err;
}

void mali_terminate_subsystems(void)
{
	struct mali_pmu_core *pmu = mali_pmu_get_global_pmu_core();

	MALI_PRINT(("terminate_subsystems() called\n"));

	/* shut down subsystems in reverse order from startup */

	/* We need the GPU to be powered up for the terminate sequence */
	_mali_osk_pm_dev_ref_add();

	mali_utilization_term();
	mali_pp_scheduler_depopulate();
	mali_gp_scheduler_terminate();
	mali_scheduler_terminate();
	mali_delete_l2_cache_cores();
	if (mali_is_mali450())
	{
		mali_dlbu_terminate();
	}
	mali_mmu_terminate();
	if (NULL != pmu)
	{
		mali_pmu_delete(pmu);
	}
	mali_pm_terminate();
	mali_memory_terminate();
#if defined(CONFIG_MALI400_PROFILING)
	_mali_osk_profiling_term();
#endif

	/* Allowing the system to be turned off */
	_mali_osk_pm_dev_ref_dec();

	mali_pp_scheduler_terminate();
	mali_session_terminate();
}

_mali_product_id_t mali_kernel_core_get_product_id(void)
{
	return global_product_id;
}

u32 mali_kernel_core_get_gpu_major_version(void)
{
    return global_gpu_major_version;
}

u32 mali_kernel_core_get_gpu_minor_version(void)
{
    return global_gpu_minor_version;
}

_mali_osk_errcode_t _mali_ukk_get_api_version( _mali_uk_get_api_version_s *args )
{
	MALI_DEBUG_ASSERT_POINTER(args);
	MALI_CHECK_NON_NULL(args->ctx, _MALI_OSK_ERR_INVALID_ARGS);

	/* check compatability */
	if ( args->version == _MALI_UK_API_VERSION )
	{
		args->compatible = 1;
	}
	else
	{
		args->compatible = 0;
	}

	args->version = _MALI_UK_API_VERSION; /* report our version */

	/* success regardless of being compatible or not */
	MALI_SUCCESS;
}

_mali_osk_errcode_t _mali_ukk_wait_for_notification( _mali_uk_wait_for_notification_s *args )
{
	_mali_osk_errcode_t err;
	_mali_osk_notification_t * notification;
	_mali_osk_notification_queue_t *queue;

	/* check input */
	MALI_DEBUG_ASSERT_POINTER(args);
	MALI_CHECK_NON_NULL(args->ctx, _MALI_OSK_ERR_INVALID_ARGS);

	queue = ((struct mali_session_data *)args->ctx)->ioctl_queue;

	/* if the queue does not exist we're currently shutting down */
	if (NULL == queue)
	{
		MALI_PRINT(("No notification queue registered with the session. Asking userspace to stop querying\n"));
		args->type = _MALI_NOTIFICATION_CORE_SHUTDOWN_IN_PROGRESS;
		MALI_SUCCESS;
	}

	/* receive a notification, might sleep */
	err = _mali_osk_notification_queue_receive(queue, &notification);
	if (_MALI_OSK_ERR_OK != err)
	{
		MALI_ERROR(err); /* errcode returned, pass on to caller */
	}

	/* copy the buffer to the user */
	args->type = (_mali_uk_notification_type)notification->notification_type;
	_mali_osk_memcpy(&args->data, notification->result_buffer, notification->result_buffer_size);

	/* finished with the notification */
	_mali_osk_notification_delete( notification );

	MALI_SUCCESS; /* all ok */
}

_mali_osk_errcode_t _mali_ukk_post_notification( _mali_uk_post_notification_s *args )
{
	_mali_osk_notification_t * notification;
	_mali_osk_notification_queue_t *queue;

	/* check input */
	MALI_DEBUG_ASSERT_POINTER(args);
	MALI_CHECK_NON_NULL(args->ctx, _MALI_OSK_ERR_INVALID_ARGS);

	queue = ((struct mali_session_data *)args->ctx)->ioctl_queue;

	/* if the queue does not exist we're currently shutting down */
	if (NULL == queue)
	{
		MALI_PRINT(("No notification queue registered with the session. Asking userspace to stop querying\n"));
		MALI_SUCCESS;
	}

	notification = _mali_osk_notification_create(args->type, 0);
	if (NULL == notification)
	{
		MALI_PRINT_ERROR( ("Failed to create notification object\n"));
		return _MALI_OSK_ERR_NOMEM;
	}

	_mali_osk_notification_queue_send(queue, notification);

	MALI_SUCCESS; /* all ok */
}

_mali_osk_errcode_t _mali_ukk_open(void **context)
{
	struct mali_session_data *session;

	/* allocated struct to track this session */
	session = (struct mali_session_data *)_mali_osk_calloc(1, sizeof(struct mali_session_data));
	MALI_CHECK_NON_NULL(session, _MALI_OSK_ERR_NOMEM);

	MALI_PRINT(("Session starting\n"));

	/* create a response queue for this session */
	session->ioctl_queue = _mali_osk_notification_queue_init();
	if (NULL == session->ioctl_queue)
	{
		_mali_osk_free(session);
		MALI_ERROR(_MALI_OSK_ERR_NOMEM);
	}

	session->page_directory = mali_mmu_pagedir_alloc();
	if (NULL == session->page_directory)
	{
		_mali_osk_notification_queue_term(session->ioctl_queue);
		_mali_osk_free(session);
		MALI_ERROR(_MALI_OSK_ERR_NOMEM);
	}

	if (_MALI_OSK_ERR_OK != mali_mmu_pagedir_map(session->page_directory, MALI_DLBU_VIRT_ADDR, _MALI_OSK_MALI_PAGE_SIZE))
	{
		MALI_PRINT_ERROR(("Failed to map DLBU page into session\n"));
		_mali_osk_notification_queue_term(session->ioctl_queue);
		_mali_osk_free(session);
		MALI_ERROR(_MALI_OSK_ERR_NOMEM);
	}

	if (0 != mali_dlbu_phys_addr)
	{
		mali_mmu_pagedir_update(session->page_directory, MALI_DLBU_VIRT_ADDR, mali_dlbu_phys_addr,
		                        _MALI_OSK_MALI_PAGE_SIZE, MALI_CACHE_STANDARD);
	}

	if (_MALI_OSK_ERR_OK != mali_memory_session_begin(session))
	{
		mali_mmu_pagedir_free(session->page_directory);
		_mali_osk_notification_queue_term(session->ioctl_queue);
		_mali_osk_free(session);
		MALI_ERROR(_MALI_OSK_ERR_NOMEM);
	}

#ifdef CONFIG_SYNC
	_mali_osk_list_init(&session->pending_jobs);
	session->pending_jobs_lock = _mali_osk_lock_init(_MALI_OSK_LOCKFLAG_NONINTERRUPTABLE | _MALI_OSK_LOCKFLAG_ORDERED | _MALI_OSK_LOCKFLAG_SPINLOCK,
	                                                 0, _MALI_OSK_LOCK_ORDER_SESSION_PENDING_JOBS);
	if (NULL == session->pending_jobs_lock)
	{
		MALI_PRINT_ERROR(("Failed to create pending jobs lock\n"));
		mali_memory_session_end(session);
		mali_mmu_pagedir_free(session->page_directory);
		_mali_osk_notification_queue_term(session->ioctl_queue);
		_mali_osk_free(session);
		MALI_ERROR(_MALI_OSK_ERR_NOMEM);
	}
#endif

	*context = (void*)session;

	/* Add session to the list of all sessions. */
	mali_session_add(session);

	/* Initialize list of jobs on this session */
	_MALI_OSK_INIT_LIST_HEAD(&session->job_list);

	MALI_PRINT(("Session started\n"));
	MALI_SUCCESS;
}

_mali_osk_errcode_t _mali_ukk_close(void **context)
{
	struct mali_session_data *session;
	MALI_CHECK_NON_NULL(context, _MALI_OSK_ERR_INVALID_ARGS);
	session = (struct mali_session_data *)*context;

	MALI_PRINT(("Session ending\n"));

	/* Remove session from list of all sessions. */
	mali_session_remove(session);

	/* Abort pending jobs */
#ifdef CONFIG_SYNC
	{
		_mali_osk_list_t tmp_job_list;
		struct mali_pp_job *job, *tmp;
		_MALI_OSK_INIT_LIST_HEAD(&tmp_job_list);

		_mali_osk_lock_wait(session->pending_jobs_lock, _MALI_OSK_LOCKMODE_RW);
		/* Abort asynchronous wait on fence. */
		_MALI_OSK_LIST_FOREACHENTRY(job, tmp, &session->pending_jobs, struct mali_pp_job, list)
		{
			MALI_PRINT(("Sync: Aborting wait for session %x job %x\n", session, job));
			if (sync_fence_cancel_async(job->pre_fence, &job->sync_waiter))
			{
				MALI_PRINT(("Sync: Failed to abort job %x\n", job));
			}
			_mali_osk_list_add(&job->list, &tmp_job_list);
		}
		_mali_osk_lock_signal(session->pending_jobs_lock, _MALI_OSK_LOCKMODE_RW);

		_mali_osk_wq_flush();

		_mali_osk_lock_term(session->pending_jobs_lock);

		/* Delete jobs */
		_MALI_OSK_LIST_FOREACHENTRY(job, tmp, &tmp_job_list, struct mali_pp_job, list)
		{
			mali_pp_job_delete(job);
		}
	}
#endif

	/* Abort queued and running jobs */
	mali_gp_scheduler_abort_session(session);
	mali_pp_scheduler_abort_session(session);

	/* Flush pending work.
	 * Needed to make sure all bottom half processing related to this
	 * session has been completed, before we free internal data structures.
	 */
	_mali_osk_wq_flush();

	/* Free remaining memory allocated to this session */
	mali_memory_session_end(session);

	/* Free session data structures */
	mali_mmu_pagedir_free(session->page_directory);
	_mali_osk_notification_queue_term(session->ioctl_queue);
	_mali_osk_free(session);

	*context = NULL;

	MALI_PRINT(("Session has ended\n"));

	MALI_SUCCESS;
}

#if MALI_STATE_TRACKING
u32 _mali_kernel_core_dump_state(char* buf, u32 size)
{
	int n = 0; /* Number of bytes written to buf */

	n += mali_gp_scheduler_dump_state(buf + n, size - n);
	n += mali_pp_scheduler_dump_state(buf + n, size - n);

	return n;
}
#endif
