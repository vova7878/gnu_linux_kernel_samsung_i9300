	.cpu cortex-a9
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"dev-fimc-lite.c"
	.global	exynos_flite1_default_data
	.global	exynos_flite0_default_data
	.global	exynos_device_flite1
	.global	exynos_device_flite0
	.data
	.align	3
	.type	exynos_device_flite1, %object
	.size	exynos_device_flite1, 360
exynos_device_flite1:
	.word	.LC0
	.word	1
	.space	336
	.word	2
	.word	exynos_flite1_resource
	.space	8
	.type	exynos_flite1_resource, %object
	.size	exynos_flite1_resource, 56
exynos_flite1_resource:
	.word	305790976
	.word	305795071
	.space	4
	.word	512
	.space	12
	.word	170
	.word	170
	.space	4
	.word	1024
	.space	12
	.type	exynos_device_flite0, %object
	.size	exynos_device_flite0, 360
exynos_device_flite0:
	.word	.LC0
	.word	0
	.space	336
	.word	2
	.word	exynos_flite0_resource
	.space	8
	.type	exynos_flite0_resource, %object
	.size	exynos_flite0_resource, 56
exynos_flite0_resource:
	.word	305725440
	.word	305729535
	.space	4
	.word	512
	.space	12
	.word	169
	.word	169
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"exynos-fimc-lite\000"
	.bss
	.align	2
	.type	exynos_flite1_default_data, %object
	.size	exynos_flite1_default_data, 32
exynos_flite1_default_data:
	.space	32
	.type	exynos_flite0_default_data, %object
	.size	exynos_flite0_default_data, 32
exynos_flite0_default_data:
	.space	32
	.ident	"GCC: (GNU) 4.8"
