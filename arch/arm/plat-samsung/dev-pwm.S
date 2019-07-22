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
	.file	"dev-pwm.c"
	.text
	.global	s3c_device_timer
	.global	pwm_data
	.data
	.align	3
	.type	s3c_device_timer, %object
	.size	s3c_device_timer, 1800
s3c_device_timer:
	.word	.LC0
	.word	0
	.space	84
	.word	pwm_data
	.space	248
	.word	1
	.word	__compound_literal.0
	.space	8
	.word	.LC0
	.word	1
	.space	84
	.word	pwm_data+12
	.space	248
	.word	1
	.word	__compound_literal.1
	.space	8
	.word	.LC0
	.word	2
	.space	84
	.word	pwm_data+24
	.space	248
	.word	1
	.word	__compound_literal.2
	.space	8
	.word	.LC0
	.word	3
	.space	84
	.word	pwm_data+36
	.space	248
	.word	1
	.word	__compound_literal.3
	.space	8
	.word	.LC0
	.word	4
	.space	84
	.word	pwm_data+48
	.space	248
	.word	1
	.word	__compound_literal.4
	.space	8
	.type	__compound_literal.4, %object
	.size	__compound_literal.4, 28
__compound_literal.4:
	.word	15
	.word	15
	.space	4
	.word	1024
	.space	12
	.type	__compound_literal.3, %object
	.size	__compound_literal.3, 28
__compound_literal.3:
	.word	14
	.word	14
	.space	4
	.word	1024
	.space	12
	.type	__compound_literal.2, %object
	.size	__compound_literal.2, 28
__compound_literal.2:
	.word	13
	.word	13
	.space	4
	.word	1024
	.space	12
	.type	__compound_literal.1, %object
	.size	__compound_literal.1, 28
__compound_literal.1:
	.word	12
	.word	12
	.space	4
	.word	1024
	.space	12
	.type	__compound_literal.0, %object
	.size	__compound_literal.0, 28
__compound_literal.0:
	.word	11
	.word	11
	.space	4
	.word	1024
	.space	12
	.type	pwm_data, %object
	.size	pwm_data, 60
pwm_data:
	.word	37
	.word	.LC1
	.word	2
	.word	38
	.word	.LC1
	.word	32
	.word	39
	.word	.LC1
	.word	512
	.word	40
	.word	.LC1
	.word	8192
	.word	0
	.word	0
	.word	0
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"s3c24xx-pwm\000"
.LC1:
	.ascii	"GPD\000"
	.section	___ksymtab+s3c_device_timer,"a",%progbits
	.align	2
	.type	__ksymtab_s3c_device_timer, %object
	.size	__ksymtab_s3c_device_timer, 8
__ksymtab_s3c_device_timer:
	.word	s3c_device_timer
	.word	__kstrtab_s3c_device_timer
	.section	__ksymtab_strings,"a",%progbits
	.type	__kstrtab_s3c_device_timer, %object
	.size	__kstrtab_s3c_device_timer, 17
__kstrtab_s3c_device_timer:
	.ascii	"s3c_device_timer\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
