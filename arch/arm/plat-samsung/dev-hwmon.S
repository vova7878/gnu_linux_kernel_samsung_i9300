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
	.file	"dev-hwmon.c"
	.text
	.align	2
	.global	s3c_hwmon_set_platdata
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_hwmon_set_platdata, %function
s3c_hwmon_set_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r2, #:lower16:.LANCHOR0
	movw	r3, #:lower16:s3c_set_platdata
	movt	r2, #:upper16:.LANCHOR0
	movt	r3, #:upper16:s3c_set_platdata
	mov	r1, #32
	bx	r3
	.fnend
	.size	s3c_hwmon_set_platdata, .-s3c_hwmon_set_platdata
	.global	s3c_device_hwmon
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	s3c_device_hwmon, %object
	.size	s3c_device_hwmon, 360
s3c_device_hwmon:
	.word	.LC0
	.word	-1
	.word	s3c_device_adc+8
	.space	332
	.space	16
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"s3c-hwmon\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
