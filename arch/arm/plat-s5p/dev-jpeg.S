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
	.file	"dev-jpeg.c"
	.global	s5p_device_jpeg
	.section	__ksymtab_strings,"a",%progbits
	.type	__kstrtab_s5p_device_jpeg, %object
	.size	__kstrtab_s5p_device_jpeg, 16
__kstrtab_s5p_device_jpeg:
	.ascii	"s5p_device_jpeg\000"
	.section	___ksymtab+s5p_device_jpeg,"a",%progbits
	.align	2
	.type	__ksymtab_s5p_device_jpeg, %object
	.size	__ksymtab_s5p_device_jpeg, 8
__ksymtab_s5p_device_jpeg:
	.word	s5p_device_jpeg
	.word	__kstrtab_s5p_device_jpeg
	.data
	.align	3
	.type	s5p_device_jpeg, %object
	.size	s5p_device_jpeg, 360
s5p_device_jpeg:
	.word	.LC0
	.word	-1
	.space	336
	.word	2
	.word	s5p_jpeg_resource
	.space	8
	.type	s5p_jpeg_resource, %object
	.size	s5p_jpeg_resource, 56
s5p_jpeg_resource:
	.word	293863424
	.word	293928959
	.space	4
	.word	512
	.space	12
	.word	152
	.word	152
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"s5p-jpeg\000"
	.ident	"GCC: (GNU) 4.8"
