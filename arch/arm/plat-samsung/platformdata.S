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
	.file	"platformdata.c"
	.text
	.align	2
	.global	s3c_set_platdata
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_set_platdata, %function
s3c_set_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	subs	r4, r0, #0
	mov	r5, r2
	beq	.L7
	movw	r3, #:lower16:kmemdup
	mov	r2, #208
	movt	r3, #:upper16:kmemdup
	blx	r3
	subs	r4, r0, #0
	strne	r4, [r5, #92]
	beq	.L8
.L1:
	mov	r0, r4
	pop	{r4, r5, r6, pc}
.L7:
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	ldr	r1, [r2]
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	b	.L1
.L8:
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:printk
	ldr	r1, [r5]
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC1
	blx	r3
	b	.L1
	.fnend
	.size	s3c_set_platdata, .-s3c_set_platdata
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>%s: no platform data supplied\012\000"
	.space	2
.LC1:
	.ascii	"<3>%s: cannot clone platform data\012\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
