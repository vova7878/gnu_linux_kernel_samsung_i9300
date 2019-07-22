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
	.file	"dev-dsim02.c"
	.global	s5p_device_mipi_dsim0
	.data
	.align	3
	.type	s5p_device_mipi_dsim0, %object
	.size	s5p_device_mipi_dsim0, 360
s5p_device_mipi_dsim0:
	.word	.LC0
	.word	0
	.space	336
	.word	2
	.word	s5p_mipi_dsim_resource
	.space	8
	.type	s5p_mipi_dsim_resource, %object
	.size	s5p_mipi_dsim_resource, 56
s5p_mipi_dsim_resource:
	.word	298319872
	.word	298385407
	.space	4
	.word	512
	.space	12
	.word	143
	.word	143
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"s5p-mipi-dsim\000"
	.ident	"GCC: (GNU) 4.8"
