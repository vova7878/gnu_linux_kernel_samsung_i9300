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
	.file	"dev-sysmmu-exynos4.c"
	.global	exynos_device_sysmmu_g2d_acp
	.global	exynos_device_sysmmu_pcie
	.global	exynos_device_sysmmu_fimd0
	.global	exynos_device_sysmmu_fimc3
	.global	exynos_device_sysmmu_fimc2
	.global	exynos_device_sysmmu_fimc1
	.global	exynos_device_sysmmu_fimc0
	.global	exynos_device_sysmmu_flite1
	.global	exynos_device_sysmmu_flite0
	.global	exynos_device_sysmmu_is_cpu
	.global	exynos_device_sysmmu_is_fd
	.global	exynos_device_sysmmu_is_drc
	.global	exynos_device_sysmmu_is_isp
	.global	exynos_device_sysmmu_mfc_r
	.global	exynos_device_sysmmu_mfc_l
	.global	exynos_device_sysmmu_tv
	.global	exynos_device_sysmmu_mdma
	.global	exynos_device_sysmmu_rot
	.global	exynos_device_sysmmu_2d
	.global	exynos_device_sysmmu_fimd1
	.global	exynos_device_sysmmu_jpeg
	.global	exynos_device_sysmmu_sss
	.data
	.align	3
	.type	exynos_device_sysmmu_g2d_acp, %object
	.size	exynos_device_sysmmu_g2d_acp, 360
exynos_device_sysmmu_g2d_acp:
	.word	.LC0
	.word	15
	.space	252
	.word	exynos_sysmmu_dma_mask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	sysmmu_resource_g2d_acp
	.space	8
	.type	exynos_device_sysmmu_pcie, %object
	.size	exynos_device_sysmmu_pcie, 360
exynos_device_sysmmu_pcie:
	.word	.LC0
	.word	8
	.space	252
	.word	exynos_sysmmu_dma_mask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	sysmmu_resource_pcie
	.space	8
	.type	exynos_device_sysmmu_fimd0, %object
	.size	exynos_device_sysmmu_fimd0, 360
exynos_device_sysmmu_fimd0:
	.word	.LC0
	.word	6
	.space	252
	.word	exynos_sysmmu_dma_mask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	sysmmu_resource_fimd0
	.space	8
	.type	exynos_device_sysmmu_fimc3, %object
	.size	exynos_device_sysmmu_fimc3, 360
exynos_device_sysmmu_fimc3:
	.word	.LC0
	.word	4
	.space	252
	.word	exynos_sysmmu_dma_mask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	sysmmu_resource_fimc3
	.space	8
	.type	exynos_device_sysmmu_fimc2, %object
	.size	exynos_device_sysmmu_fimc2, 360
exynos_device_sysmmu_fimc2:
	.word	.LC0
	.word	3
	.space	252
	.word	exynos_sysmmu_dma_mask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	sysmmu_resource_fimc2
	.space	8
	.type	exynos_device_sysmmu_fimc1, %object
	.size	exynos_device_sysmmu_fimc1, 360
exynos_device_sysmmu_fimc1:
	.word	.LC0
	.word	2
	.space	252
	.word	exynos_sysmmu_dma_mask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	sysmmu_resource_fimc1
	.space	8
	.type	exynos_device_sysmmu_fimc0, %object
	.size	exynos_device_sysmmu_fimc0, 360
exynos_device_sysmmu_fimc0:
	.word	.LC0
	.word	1
	.space	252
	.word	exynos_sysmmu_dma_mask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	sysmmu_resource_fimc0
	.space	8
	.type	sysmmu_resource_g2d_acp, %object
	.size	sysmmu_resource_g2d_acp, 56
sysmmu_resource_g2d_acp:
	.word	279183360
	.word	279187455
	.space	4
	.word	512
	.space	12
	.word	231
	.word	231
	.space	4
	.word	1024
	.space	12
	.type	sysmmu_resource_pcie, %object
	.size	sysmmu_resource_pcie, 56
sysmmu_resource_pcie:
	.word	308412416
	.word	308416511
	.space	4
	.word	512
	.space	12
	.word	239
	.word	239
	.space	4
	.word	1024
	.space	12
	.type	sysmmu_resource_fimd0, %object
	.size	sysmmu_resource_fimd0, 56
sysmmu_resource_fimd0:
	.word	300023808
	.word	300027903
	.space	4
	.word	512
	.space	12
	.word	234
	.word	234
	.space	4
	.word	1024
	.space	12
	.type	sysmmu_resource_fimc3, %object
	.size	sysmmu_resource_fimc3, 56
sysmmu_resource_fimc3:
	.word	296026112
	.word	296030207
	.space	4
	.word	512
	.space	12
	.word	229
	.word	229
	.space	4
	.word	1024
	.space	12
	.type	sysmmu_resource_fimc2, %object
	.size	sysmmu_resource_fimc2, 56
sysmmu_resource_fimc2:
	.word	295960576
	.word	295964671
	.space	4
	.word	512
	.space	12
	.word	228
	.word	228
	.space	4
	.word	1024
	.space	12
	.type	sysmmu_resource_fimc1, %object
	.size	sysmmu_resource_fimc1, 56
sysmmu_resource_fimc1:
	.word	295895040
	.word	295899135
	.space	4
	.word	512
	.space	12
	.word	227
	.word	227
	.space	4
	.word	1024
	.space	12
	.type	sysmmu_resource_fimc0, %object
	.size	sysmmu_resource_fimc0, 56
sysmmu_resource_fimc0:
	.word	295829504
	.word	295833599
	.space	4
	.word	512
	.space	12
	.word	226
	.word	226
	.space	4
	.word	1024
	.space	12
	.type	exynos_device_sysmmu_flite1, %object
	.size	exynos_device_sysmmu_flite1, 360
exynos_device_sysmmu_flite1:
	.word	.LC0
	.word	31
	.space	252
	.word	exynos_sysmmu_dma_mask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	sysmmu_resource_flite1
	.space	8
	.type	exynos_device_sysmmu_flite0, %object
	.size	exynos_device_sysmmu_flite0, 360
exynos_device_sysmmu_flite0:
	.word	.LC0
	.word	30
	.space	252
	.word	exynos_sysmmu_dma_mask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	sysmmu_resource_flite0
	.space	8
	.type	exynos_device_sysmmu_is_cpu, %object
	.size	exynos_device_sysmmu_is_cpu, 360
exynos_device_sysmmu_is_cpu:
	.word	.LC0
	.word	19
	.space	252
	.word	exynos_sysmmu_dma_mask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	sysmmu_resource_is_cpu
	.space	8
	.type	exynos_device_sysmmu_is_fd, %object
	.size	exynos_device_sysmmu_is_fd, 360
exynos_device_sysmmu_is_fd:
	.word	.LC0
	.word	18
	.space	252
	.word	exynos_sysmmu_dma_mask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	sysmmu_resource_is_fd
	.space	8
	.type	exynos_device_sysmmu_is_drc, %object
	.size	exynos_device_sysmmu_is_drc, 360
exynos_device_sysmmu_is_drc:
	.word	.LC0
	.word	17
	.space	252
	.word	exynos_sysmmu_dma_mask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	sysmmu_resource_is_drc
	.space	8
	.type	exynos_device_sysmmu_is_isp, %object
	.size	exynos_device_sysmmu_is_isp, 360
exynos_device_sysmmu_is_isp:
	.word	.LC0
	.word	16
	.space	252
	.word	exynos_sysmmu_dma_mask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	sysmmu_resource_is_isp
	.space	8
	.type	exynos_device_sysmmu_mfc_r, %object
	.size	exynos_device_sysmmu_mfc_r, 360
exynos_device_sysmmu_mfc_r:
	.word	.LC0
	.word	14
	.space	252
	.word	exynos_sysmmu_dma_mask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	sysmmu_resource_mfc_r
	.space	8
	.type	exynos_device_sysmmu_mfc_l, %object
	.size	exynos_device_sysmmu_mfc_l, 360
exynos_device_sysmmu_mfc_l:
	.word	.LC0
	.word	13
	.space	252
	.word	exynos_sysmmu_dma_mask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	sysmmu_resource_mfc_l
	.space	8
	.type	exynos_device_sysmmu_tv, %object
	.size	exynos_device_sysmmu_tv, 360
exynos_device_sysmmu_tv:
	.word	.LC0
	.word	12
	.space	252
	.word	exynos_sysmmu_dma_mask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	sysmmu_resource_tv
	.space	8
	.type	exynos_device_sysmmu_mdma, %object
	.size	exynos_device_sysmmu_mdma, 360
exynos_device_sysmmu_mdma:
	.word	.LC0
	.word	11
	.space	252
	.word	exynos_sysmmu_dma_mask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	sysmmu_resource_mdma
	.space	8
	.type	exynos_device_sysmmu_rot, %object
	.size	exynos_device_sysmmu_rot, 360
exynos_device_sysmmu_rot:
	.word	.LC0
	.word	10
	.space	252
	.word	exynos_sysmmu_dma_mask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	sysmmu_resource_rot
	.space	8
	.type	exynos_device_sysmmu_2d, %object
	.size	exynos_device_sysmmu_2d, 360
exynos_device_sysmmu_2d:
	.word	.LC0
	.word	9
	.space	252
	.word	exynos_sysmmu_dma_mask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	sysmmu_resource_2d
	.space	8
	.type	exynos_device_sysmmu_fimd1, %object
	.size	exynos_device_sysmmu_fimd1, 360
exynos_device_sysmmu_fimd1:
	.word	.LC0
	.word	7
	.space	252
	.word	exynos_sysmmu_dma_mask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	sysmmu_resource_fimd1
	.space	8
	.type	exynos_device_sysmmu_jpeg, %object
	.size	exynos_device_sysmmu_jpeg, 360
exynos_device_sysmmu_jpeg:
	.word	.LC0
	.word	5
	.space	252
	.word	exynos_sysmmu_dma_mask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	sysmmu_resource_jpeg
	.space	8
	.type	exynos_device_sysmmu_sss, %object
	.size	exynos_device_sysmmu_sss, 360
exynos_device_sysmmu_sss:
	.word	.LC0
	.word	0
	.space	252
	.word	exynos_sysmmu_dma_mask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	sysmmu_resource_sss
	.space	8
	.type	sysmmu_resource_flite1, %object
	.size	sysmmu_resource_flite1, 56
sysmmu_resource_flite1:
	.word	305922048
	.word	305926143
	.space	4
	.word	512
	.space	12
	.word	321
	.word	321
	.space	4
	.word	1024
	.space	12
	.type	sysmmu_resource_flite0, %object
	.size	sysmmu_resource_flite0, 56
sysmmu_resource_flite0:
	.word	305856512
	.word	305860607
	.space	4
	.word	512
	.space	12
	.word	320
	.word	320
	.space	4
	.word	1024
	.space	12
	.type	sysmmu_resource_is_cpu, %object
	.size	sysmmu_resource_is_cpu, 56
sysmmu_resource_is_cpu:
	.word	304807936
	.word	304812031
	.space	4
	.word	512
	.space	12
	.word	325
	.word	325
	.space	4
	.word	1024
	.space	12
	.type	sysmmu_resource_is_fd, %object
	.size	sysmmu_resource_is_fd, 56
sysmmu_resource_is_fd:
	.word	304742400
	.word	304746495
	.space	4
	.word	512
	.space	12
	.word	324
	.word	324
	.space	4
	.word	1024
	.space	12
	.type	sysmmu_resource_is_drc, %object
	.size	sysmmu_resource_is_drc, 56
sysmmu_resource_is_drc:
	.word	304545792
	.word	304549887
	.space	4
	.word	512
	.space	12
	.word	323
	.word	323
	.space	4
	.word	1024
	.space	12
	.type	sysmmu_resource_is_isp, %object
	.size	sysmmu_resource_is_isp, 56
sysmmu_resource_is_isp:
	.word	304480256
	.word	304484351
	.space	4
	.word	512
	.space	12
	.word	322
	.word	322
	.space	4
	.word	1024
	.space	12
	.type	sysmmu_resource_mfc_r, %object
	.size	sysmmu_resource_mfc_r, 56
sysmmu_resource_mfc_r:
	.word	325255168
	.word	325259263
	.space	4
	.word	512
	.space	12
	.word	237
	.word	237
	.space	4
	.word	1024
	.space	12
	.type	sysmmu_resource_mfc_l, %object
	.size	sysmmu_resource_mfc_l, 56
sysmmu_resource_mfc_l:
	.word	325189632
	.word	325193727
	.space	4
	.word	512
	.space	12
	.word	238
	.word	238
	.space	4
	.word	1024
	.space	12
	.type	sysmmu_resource_tv, %object
	.size	sysmmu_resource_tv, 56
sysmmu_resource_tv:
	.word	316801024
	.word	316805119
	.space	4
	.word	512
	.space	12
	.word	236
	.word	236
	.space	4
	.word	1024
	.space	12
	.type	sysmmu_resource_mdma, %object
	.size	sysmmu_resource_mdma, 56
sysmmu_resource_mdma:
	.word	312737792
	.word	312741887
	.space	4
	.word	512
	.space	12
	.word	233
	.word	233
	.space	4
	.word	1024
	.space	12
	.type	sysmmu_resource_rot, %object
	.size	sysmmu_resource_rot, 56
sysmmu_resource_rot:
	.word	312672256
	.word	312676351
	.space	4
	.word	512
	.space	12
	.word	232
	.word	232
	.space	4
	.word	1024
	.space	12
	.type	sysmmu_resource_2d, %object
	.size	sysmmu_resource_2d, 56
sysmmu_resource_2d:
	.word	312606720
	.word	312610815
	.space	4
	.word	512
	.space	12
	.word	231
	.word	231
	.space	4
	.word	1024
	.space	12
	.type	sysmmu_resource_fimd1, %object
	.size	sysmmu_resource_fimd1, 56
sysmmu_resource_fimd1:
	.word	304218112
	.word	304222207
	.space	4
	.word	512
	.space	12
	.word	235
	.word	235
	.space	4
	.word	1024
	.space	12
	.type	sysmmu_resource_jpeg, %object
	.size	sysmmu_resource_jpeg, 56
sysmmu_resource_jpeg:
	.word	296091648
	.word	296095743
	.space	4
	.word	512
	.space	12
	.word	230
	.word	230
	.space	4
	.word	1024
	.space	12
	.type	sysmmu_resource_sss, %object
	.size	sysmmu_resource_sss, 56
sysmmu_resource_sss:
	.word	279248896
	.word	279252991
	.space	4
	.word	512
	.space	12
	.word	225
	.word	225
	.space	4
	.word	1024
	.space	12
	.type	exynos_sysmmu_dma_mask, %object
	.size	exynos_sysmmu_dma_mask, 8
exynos_sysmmu_dma_mask:
	.word	-1
	.word	0
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"s5p-sysmmu\000"
	.ident	"GCC: (GNU) 4.8"
