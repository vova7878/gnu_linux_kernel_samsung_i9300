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
	.file	"dev-dsim.c"
	.global	s5p_device_dsim
	.data
	.align	3
	.type	s5p_device_dsim, %object
	.size	s5p_device_dsim, 360
s5p_device_dsim:
	.word	.LC0
	.word	0
	.space	84
	.word	dsim_platform_data
	.space	248
	.word	2
	.word	s5p_dsim_resource
	.space	8
	.type	dsim_platform_data, %object
	.size	dsim_platform_data, 108
dsim_platform_data:
	.word	.LC1
	.space	68
	.word	0
	.word	dsim_info
	.word	dsim_lcd_info
	.word	0
	.word	s5p_dsim_enable_clk
	.word	s5p_dsim_part_reset
	.word	s5p_dsim_init_d_phy
	.word	s5p_dsim_exit_d_phy
	.space	4
	.type	s5p_dsim_resource, %object
	.size	s5p_dsim_resource, 56
s5p_dsim_resource:
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
	.type	dsim_lcd_info, %object
	.size	dsim_lcd_info, 28
dsim_lcd_info:
	.word	1
	.word	0
	.word	7
	.word	1
	.space	4
	.word	mipi_ddi_pd
	.space	4
	.type	dsim_info, %object
	.size	dsim_info, 48
dsim_info:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.space	1
	.word	3
	.word	0
	.space	8
	.word	500
	.word	20000000
	.short	0
	.byte	-1
	.space	1
	.short	-1
	.space	2
	.word	0
	.space	4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"s5p-dsim\000"
	.space	3
.LC1:
	.ascii	"dsim0\000"
	.bss
	.align	2
	.type	mipi_ddi_pd, %object
	.size	mipi_ddi_pd, 44
mipi_ddi_pd:
	.space	44
	.ident	"GCC: (GNU) 4.8"
