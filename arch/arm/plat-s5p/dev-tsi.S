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
	.file	"dev-tsi.c"
	.global	s3c_device_tsi
	.section	__ksymtab_strings,"a",%progbits
	.type	__kstrtab_s3c_device_tsi, %object
	.size	__kstrtab_s3c_device_tsi, 15
__kstrtab_s3c_device_tsi:
	.ascii	"s3c_device_tsi\000"
	.section	___ksymtab+s3c_device_tsi,"a",%progbits
	.align	2
	.type	__ksymtab_s3c_device_tsi, %object
	.size	__ksymtab_s3c_device_tsi, 8
__ksymtab_s3c_device_tsi:
	.word	s3c_device_tsi
	.word	__kstrtab_s3c_device_tsi
	.data
	.align	3
	.type	s3c_device_tsi, %object
	.size	s3c_device_tsi, 360
s3c_device_tsi:
	.word	.LC0
	.word	-1
	.space	252
	.word	tsi_dma_mask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	s3c_tsi_resource
	.space	8
	.type	s3c_tsi_resource, %object
	.size	s3c_tsi_resource, 56
s3c_tsi_resource:
	.word	307232768
	.word	307233023
	.space	4
	.word	512
	.space	12
	.word	179
	.word	179
	.space	4
	.word	1024
	.space	12
	.type	tsi_dma_mask, %object
	.size	tsi_dma_mask, 8
tsi_dma_mask:
	.word	-1
	.word	0
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"s3c-tsi\000"
	.ident	"GCC: (GNU) 4.8"
