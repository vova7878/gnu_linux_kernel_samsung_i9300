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
	.file	"dev-fimc1.c"
	.global	s3c_fimc1_default_data
	.global	s5p_device_fimc1
	.data
	.align	3
	.type	s5p_device_fimc1, %object
	.size	s5p_device_fimc1, 360
s5p_device_fimc1:
	.word	.LC0
	.word	1
	.space	252
	.word	s5p_fimc1_dma_mask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	s5p_fimc1_resource
	.space	8
	.type	s5p_fimc1_dma_mask, %object
	.size	s5p_fimc1_dma_mask, 8
s5p_fimc1_dma_mask:
	.word	-1
	.word	0
	.type	s5p_fimc1_resource, %object
	.size	s5p_fimc1_resource, 56
s5p_fimc1_resource:
	.word	293666816
	.word	293670911
	.space	4
	.word	512
	.space	12
	.word	149
	.word	149
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"s5p-fimc\000"
	.bss
	.align	2
	.type	s3c_fimc1_default_data, %object
	.size	s3c_fimc1_default_data, 8
s3c_fimc1_default_data:
	.space	8
	.ident	"GCC: (GNU) 4.8"
