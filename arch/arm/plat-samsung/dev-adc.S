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
	.file	"dev-adc.c"
	.text
	.global	s3c_device_adc
	.data
	.align	3
	.type	s3c_device_adc, %object
	.size	s3c_device_adc, 360
s3c_device_adc:
	.word	.LC0
	.word	-1
	.space	336
	.word	3
	.word	s3c_adc_resource
	.space	8
	.type	s3c_adc_resource, %object
	.size	s3c_adc_resource, 84
s3c_adc_resource:
	.word	309067776
	.word	309075967
	.space	4
	.word	512
	.space	12
	.space	12
	.word	1024
	.space	12
	.word	275
	.word	275
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"samsung-adc\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
