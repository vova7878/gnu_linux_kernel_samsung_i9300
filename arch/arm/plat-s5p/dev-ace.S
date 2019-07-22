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
	.file	"dev-ace.c"
	.global	s5p_device_ace
	.section	__ksymtab_strings,"a",%progbits
	.type	__kstrtab_s5p_device_ace, %object
	.size	__kstrtab_s5p_device_ace, 15
__kstrtab_s5p_device_ace:
	.ascii	"s5p_device_ace\000"
	.section	___ksymtab+s5p_device_ace,"a",%progbits
	.align	2
	.type	__ksymtab_s5p_device_ace, %object
	.size	__ksymtab_s5p_device_ace, 8
__ksymtab_s5p_device_ace:
	.word	s5p_device_ace
	.word	__kstrtab_s5p_device_ace
	.data
	.align	3
	.type	s5p_device_ace, %object
	.size	s5p_device_ace, 360
s5p_device_ace:
	.word	.LC0
	.word	0
	.space	336
	.word	2
	.word	s5p_ace_resource
	.space	8
	.type	s5p_ace_resource, %object
	.size	s5p_ace_resource, 56
s5p_ace_resource:
	.word	277020672
	.word	277053439
	.space	4
	.word	512
	.space	12
	.word	176
	.word	176
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"s5p-ace\000"
	.ident	"GCC: (GNU) 4.8"
