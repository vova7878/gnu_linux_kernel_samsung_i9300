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
	.file	"dev-onenand.c"
	.global	s5p_device_onenand
	.data
	.align	3
	.type	s5p_device_onenand, %object
	.size	s5p_device_onenand, 360
s5p_device_onenand:
	.word	.LC0
	.word	-1
	.space	336
	.word	3
	.word	s5p_onenand_resources
	.space	8
	.type	s5p_onenand_resources, %object
	.size	s5p_onenand_resources, 84
s5p_onenand_resources:
	.word	201326592
	.word	201457663
	.space	4
	.word	512
	.space	12
	.word	207618048
	.word	207626239
	.space	4
	.word	512
	.space	12
	.word	146
	.word	146
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"s5pc110-onenand\000"
	.ident	"GCC: (GNU) 4.8"
