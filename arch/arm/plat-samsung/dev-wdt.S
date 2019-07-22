	.cpu cortex-a9
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"dev-wdt.c"
	.text
	.global	s3c_device_wdt
	.data
	.align	3
	.type	s3c_device_wdt, %object
	.size	s3c_device_wdt, 360
s3c_device_wdt:
	.word	.LC0
	.word	-1
	.space	336
	.word	2
	.word	s3c_wdt_resource
	.space	8
	.type	s3c_wdt_resource, %object
	.size	s3c_wdt_resource, 56
s3c_wdt_resource:
	.word	268828672
	.word	268832767
	.space	4
	.word	512
	.space	12
	.word	107
	.word	107
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"s3c2410-wdt\000"
	.section	___ksymtab+s3c_device_wdt,"a",%progbits
	.align	2
	.type	__ksymtab_s3c_device_wdt, %object
	.size	__ksymtab_s3c_device_wdt, 8
__ksymtab_s3c_device_wdt:
	.word	s3c_device_wdt
	.word	__kstrtab_s3c_device_wdt
	.section	__ksymtab_strings,"a",%progbits
	.type	__kstrtab_s3c_device_wdt, %object
	.size	__kstrtab_s3c_device_wdt, 15
__kstrtab_s3c_device_wdt:
	.ascii	"s3c_device_wdt\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
