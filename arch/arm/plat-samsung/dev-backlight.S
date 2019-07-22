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
	.file	"dev-backlight.c"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	samsung_bl_exit, %function
samsung_bl_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	movw	r3, #:lower16:s3c_gpio_cfgpin
	ldr	r2, [r0]
	movt	r3, #:upper16:s3c_gpio_cfgpin
	mvn	r1, #14
	ldr	r4, [r2, #84]
	ldr	r0, [r4]
	blx	r3
	movw	r3, #:lower16:gpio_free
	ldr	r0, [r4]
	movt	r3, #:upper16:gpio_free
	pop	{r4, lr}
	bx	r3	@ indirect register sibling call
	.fnend
	.size	samsung_bl_exit, .-samsung_bl_exit
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	samsung_bl_init, %function
samsung_bl_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r1, #:lower16:.LC0
	ldr	r2, [r0]
	movw	r3, #:lower16:gpio_request
	movt	r1, #:upper16:.LC0
	movt	r3, #:upper16:gpio_request
	ldr	r4, [r2, #84]
	ldr	r0, [r4]
	blx	r3
	subs	r5, r0, #0
	bne	.L8
	movw	r3, #:lower16:s3c_gpio_cfgpin
	ldr	r1, [r4, #4]
	movt	r3, #:upper16:s3c_gpio_cfgpin
	ldr	r0, [r4]
	blx	r3
.L4:
	mov	r0, r5
	pop	{r4, r5, r6, pc}
.L8:
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC1
	blx	r3
	b	.L4
	.fnend
	.size	samsung_bl_init, .-samsung_bl_init
	.align	2
	.global	samsung_bl_set
	.syntax unified
	.arm
	.fpu softvfp
	.type	samsung_bl_set, %function
samsung_bl_set:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r3, #:lower16:kmemdup
	mov	r7, r0
	movw	r0, #:lower16:.LANCHOR0
	mov	r4, r1
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:kmemdup
	mov	r2, #208
	mov	r1, #360
	blx	r3
	subs	r6, r0, #0
	beq	.L49
	movw	r3, #:lower16:s3c_set_platdata
	mov	r2, r6
	movt	r3, #:upper16:s3c_set_platdata
	mov	r1, #40
	ldr	r0, .L52
	blx	r3
	subs	r5, r0, #0
	beq	.L50
	ldr	r2, [r4]
	mov	r3, #360
	movw	r8, #:lower16:s3c_device_timer
	mov	r9, #360
	movt	r8, #:upper16:s3c_device_timer
	str	r2, [r5]
	mul	r3, r3, r2
	add	r3, r3, #8
	add	r3, r8, r3
	str	r3, [r6, #8]
	ldr	r3, [r4, #4]
	cmp	r3, #0
	strne	r3, [r5, #4]
	ldr	r3, [r4, #8]
	cmp	r3, #0
	strne	r3, [r5, #8]
	ldr	r3, [r4, #12]
	cmp	r3, #0
	strne	r3, [r5, #12]
	ldr	r3, [r4, #16]
	cmp	r3, #0
	strne	r3, [r5, #16]
	ldr	r3, [r4, #20]
	cmp	r3, #0
	strne	r3, [r5, #20]
	ldr	r3, [r4, #24]
	cmp	r3, #0
	strne	r3, [r5, #24]
	ldr	r3, [r4, #32]
	cmp	r3, #0
	strne	r3, [r5, #32]
	ldr	r3, [r4, #36]
	movw	r4, #:lower16:platform_device_register
	movt	r4, #:upper16:platform_device_register
	cmp	r3, #0
	strne	r3, [r5, #36]
	ldr	r3, [r5]
	mla	r3, r9, r3, r8
	str	r7, [r3, #92]
	ldr	r0, [r5]
	mla	r0, r9, r0, r8
	blx	r4
	subs	r1, r0, #0
	bne	.L51
	mov	r0, r6
	blx	r4
	subs	r1, r0, #0
	popeq	{r4, r5, r6, r7, r8, r9, r10, pc}
	movw	r0, #:lower16:.LC4
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC4
	blx	r3
	ldr	r0, [r5]
	movw	r3, #:lower16:platform_device_unregister
	movt	r3, #:upper16:platform_device_unregister
	mla	r0, r9, r0, r8
	blx	r3
.L22:
	movw	r4, #:lower16:kfree
	mov	r0, r5
	movt	r4, #:upper16:kfree
	blx	r4
.L12:
	mov	r0, r6
	mov	r3, r4
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	r3	@ indirect register sibling call
.L51:
	movw	r0, #:lower16:.LC3
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC3
	blx	r3
	b	.L22
.L50:
	movw	r1, #:lower16:.LANCHOR1
	movw	r0, #:lower16:.LC2
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR1
	movt	r0, #:upper16:.LC2
	movt	r3, #:upper16:printk
	movw	r4, #:lower16:kfree
	blx	r3
	movt	r4, #:upper16:kfree
	b	.L12
.L49:
	movw	r1, #:lower16:.LANCHOR1
	movw	r0, #:lower16:.LC2
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR1
	movt	r0, #:upper16:.LC2
	movt	r3, #:upper16:printk
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	r3
.L53:
	.align	2
.L52:
	.word	.LANCHOR0+360
	.fnend
	.size	samsung_bl_set, .-samsung_bl_set
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.13985, %object
	.size	__func__.13985, 15
__func__.13985:
	.ascii	"samsung_bl_set\000"
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	samsung_dfl_bl_device, %object
	.size	samsung_dfl_bl_device, 360
samsung_dfl_bl_device:
	.word	.LC5
	.space	356
	.type	samsung_dfl_bl_data, %object
	.size	samsung_dfl_bl_data, 40
samsung_dfl_bl_data:
	.space	4
	.word	255
	.word	255
	.space	4
	.word	78770
	.word	samsung_bl_init
	.space	8
	.word	samsung_bl_exit
	.space	4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Backlight\000"
	.space	2
.LC1:
	.ascii	"<3>failed to request GPIO for LCD Backlight\012\000"
	.space	3
.LC2:
	.ascii	"<3>%s: no memory for platform dev\012\000"
	.space	1
.LC3:
	.ascii	"<3>failed to register pwm timer for backlight: %d\012"
	.ascii	"\000"
	.space	1
.LC4:
	.ascii	"<3>failed to register backlight device: %d\012\000"
.LC5:
	.ascii	"pwm-backlight\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
