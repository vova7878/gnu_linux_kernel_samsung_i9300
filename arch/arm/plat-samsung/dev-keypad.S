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
	.file	"dev-keypad.c"
	.text
	.align	2
	.global	samsung_keypad_set_platdata
	.syntax unified
	.arm
	.fpu softvfp
	.type	samsung_keypad_set_platdata, %function
samsung_keypad_set_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r2, #:lower16:.LANCHOR0
	movw	r3, #:lower16:s3c_set_platdata
	movt	r3, #:upper16:s3c_set_platdata
	push	{r4, lr}
	.save {r4, lr}
	movt	r2, #:upper16:.LANCHOR0
	mov	r1, #20
	blx	r3
	ldr	r3, [r0, #16]
	cmp	r3, #0
	movweq	r3, #:lower16:samsung_keypad_cfg_gpio
	movteq	r3, #:upper16:samsung_keypad_cfg_gpio
	streq	r3, [r0, #16]
	pop	{r4, pc}
	.fnend
	.size	samsung_keypad_set_platdata, .-samsung_keypad_set_platdata
	.global	samsung_device_keypad
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	samsung_device_keypad, %object
	.size	samsung_device_keypad, 360
samsung_device_keypad:
	.word	.LC0
	.word	-1
	.space	336
	.word	2
	.word	samsung_keypad_resources
	.space	8
	.type	samsung_keypad_resources, %object
	.size	samsung_keypad_resources, 56
samsung_keypad_resources:
	.word	269090816
	.word	269090847
	.space	4
	.word	512
	.space	12
	.word	173
	.word	173
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"samsung-keypad\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
