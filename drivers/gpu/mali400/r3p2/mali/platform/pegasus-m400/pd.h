/* linux/arch/arm/plat-samsung/include/plat/pd.h
 *
 * Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
 *		http://www.samsung.com
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
*/

#ifndef __ASM_PLAT_SAMSUNG_PD_H
#define __ASM_PLAT_SAMSUNG_PD_H __FILE__

extern unsigned int samsung_rev(void);

#define EXYNOS4212_REV_0       (0x0)
#define EXYNOS4212_REV_1_0     (0x10)

#if defined(CONFIG_CPU_EXYNOS4412)
# define soc_is_exynos4412()    is_samsung_exynos4412()
#else
# define soc_is_exynos4412()    0
#endif

#define EXYNOS4412_REV_0       (0x0)
#define EXYNOS4412_REV_0_1     (0x01)
#define EXYNOS4412_REV_1_0     (0x10)
#define EXYNOS4412_REV_1_1     (0x11)
#define EXYNOS4412_REV_2_0     (0x20)

struct samsung_pd_info {
	int (*enable)(struct device *dev);
	int (*disable)(struct device *dev);
	void __iomem *base;
};

enum exynos4_pd_block {
	PD_MFC,
	PD_G3D,
	PD_LCD0,
	PD_LCD1,
	PD_TV,
	PD_CAM,
	PD_GPS
};

#endif /* __ASM_PLAT_SAMSUNG_PD_H */
