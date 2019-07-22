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
	.file	"dev-i2c7.c"
	.text
	.align	2
	.global	s3c_i2c7_set_platdata
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_i2c7_set_platdata, %function
s3c_i2c7_set_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #0
	push	{r4, lr}
	.save {r4, lr}
	movweq	r3, #:lower16:default_i2c_data
	moveq	r2, #7
	movteq	r3, #:upper16:default_i2c_data
	mov	r1, #24
	streq	r2, [r3]
	moveq	r0, r3
	movw	r2, #:lower16:.LANCHOR0
	movw	r3, #:lower16:s3c_set_platdata
	movt	r3, #:upper16:s3c_set_platdata
	movt	r2, #:upper16:.LANCHOR0
	blx	r3
	ldr	r3, [r0, #20]
	cmp	r3, #0
	movweq	r3, #:lower16:s3c_i2c7_cfg_gpio
	movteq	r3, #:upper16:s3c_i2c7_cfg_gpio
	streq	r3, [r0, #20]
	pop	{r4, pc}
	.fnend
	.size	s3c_i2c7_set_platdata, .-s3c_i2c7_set_platdata
	.global	s3c_device_i2c7
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	s3c_device_i2c7, %object
	.size	s3c_device_i2c7, 360
s3c_device_i2c7:
	.word	.LC0
	.word	7
	.space	336
	.word	2
	.word	s3c_i2c_resource
	.space	8
	.type	s3c_i2c_resource, %object
	.size	s3c_i2c_resource, 56
s3c_i2c_resource:
	.word	328007680
	.word	328011775
	.space	4
	.word	512
	.space	12
	.word	129
	.word	129
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"s3c2440-i2c\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
