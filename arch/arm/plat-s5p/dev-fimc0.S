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
	.file	"dev-fimc0.c"
	.global	s3c_fimc0_default_data
	.global	s5p_device_fimc0
	.data
	.align	3
	.type	s5p_device_fimc0, %object
	.size	s5p_device_fimc0, 360
s5p_device_fimc0:
	.word	.LC0
	.word	0
	.space	252
	.word	s5p_fimc0_dma_mask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	s5p_fimc0_resource
	.space	8
	.type	s5p_fimc0_dma_mask, %object
	.size	s5p_fimc0_dma_mask, 8
s5p_fimc0_dma_mask:
	.word	-1
	.word	0
	.type	s5p_fimc0_resource, %object
	.size	s5p_fimc0_resource, 56
s5p_fimc0_resource:
	.word	293601280
	.word	293605375
	.space	4
	.word	512
	.space	12
	.word	148
	.word	148
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"s5p-fimc\000"
	.bss
	.align	2
	.type	s3c_fimc0_default_data, %object
	.size	s3c_fimc0_default_data, 8
s3c_fimc0_default_data:
	.space	8
	.ident	"GCC: (GNU) 4.8"
