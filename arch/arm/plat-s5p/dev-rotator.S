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
	.file	"dev-rotator.c"
	.global	exynos_device_rotator
	.data
	.align	3
	.type	exynos_device_rotator, %object
	.size	exynos_device_rotator, 360
exynos_device_rotator:
	.word	.LC0
	.word	-1
	.space	252
	.word	exynos_rot_dma_mask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	exynos_rot_resource
	.space	8
	.type	exynos_rot_dma_mask, %object
	.size	exynos_rot_dma_mask, 8
exynos_rot_dma_mask:
	.word	-1
	.word	0
	.type	exynos_rot_resource, %object
	.size	exynos_rot_resource, 56
exynos_rot_resource:
	.word	310444032
	.word	310448127
	.space	4
	.word	512
	.space	12
	.word	147
	.word	147
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"exynos-rot\000"
	.ident	"GCC: (GNU) 4.8"
