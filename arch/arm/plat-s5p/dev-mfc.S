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
	.file	"dev-mfc.c"
	.global	s5p_device_mfc
	.data
	.align	3
	.type	s5p_device_mfc, %object
	.size	s5p_device_mfc, 360
s5p_device_mfc:
	.word	.LC0
	.word	-1
	.space	336
	.word	2
	.word	s5p_mfc_resource
	.space	8
	.type	s5p_mfc_resource, %object
	.size	s5p_mfc_resource, 56
s5p_mfc_resource:
	.word	322961408
	.word	323026943
	.space	4
	.word	512
	.space	12
	.word	158
	.word	158
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"s3c-mfc\000"
	.ident	"GCC: (GNU) 4.8"
