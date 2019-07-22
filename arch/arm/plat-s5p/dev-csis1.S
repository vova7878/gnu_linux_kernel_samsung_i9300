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
	.file	"dev-csis1.c"
	.global	s5p_mipi_csis1_default_data
	.global	s5p_device_mipi_csis1
	.data
	.align	3
	.type	s5p_mipi_csis1_default_data, %object
	.size	s5p_mipi_csis1_default_data, 12
s5p_mipi_csis1_default_data:
	.word	166000000
	.byte	2
	.byte	32
	.byte	12
	.space	1
	.word	s5p_csis_phy_enable
	.space	4
	.type	s5p_device_mipi_csis1, %object
	.size	s5p_device_mipi_csis1, 360
s5p_device_mipi_csis1:
	.word	.LC0
	.word	1
	.space	336
	.word	2
	.word	s5p_mipi_csis1_resource
	.space	8
	.type	s5p_mipi_csis1_resource, %object
	.size	s5p_mipi_csis1_resource, 56
s5p_mipi_csis1_resource:
	.word	294191104
	.word	294207487
	.space	4
	.word	512
	.space	12
	.word	144
	.word	144
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"s5p-mipi-csis\000"
	.ident	"GCC: (GNU) 4.8"
