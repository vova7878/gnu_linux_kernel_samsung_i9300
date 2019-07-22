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
	.file	"dev-fimc3.c"
	.global	s3c_fimc3_default_data
	.global	s5p_device_fimc3
	.data
	.align	3
	.type	s5p_device_fimc3, %object
	.size	s5p_device_fimc3, 360
s5p_device_fimc3:
	.word	.LC0
	.word	3
	.space	252
	.word	s5p_fimc3_dma_mask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	s5p_fimc3_resource
	.space	8
	.type	s5p_fimc3_dma_mask, %object
	.size	s5p_fimc3_dma_mask, 8
s5p_fimc3_dma_mask:
	.word	-1
	.word	0
	.type	s5p_fimc3_resource, %object
	.size	s5p_fimc3_resource, 56
s5p_fimc3_resource:
	.word	293797888
	.word	293801983
	.space	4
	.word	512
	.space	12
	.word	151
	.word	151
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"s5p-fimc\000"
	.bss
	.align	2
	.type	s3c_fimc3_default_data, %object
	.size	s3c_fimc3_default_data, 8
s3c_fimc3_default_data:
	.space	8
	.ident	"GCC: (GNU) 4.8"
