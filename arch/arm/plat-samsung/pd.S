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
	.file	"pd.c"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	samsung_pd_suspend, %function
samsung_pd_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #84]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L2
	bx	r3
.L2:
	mov	r0, r3
	bx	lr
	.fnend
	.size	samsung_pd_suspend, .-samsung_pd_suspend
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	samsung_pd_resume, %function
samsung_pd_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #84]
	ldr	r3, [r3, #16]
	cmp	r3, #0
	beq	.L5
	bx	r3
.L5:
	mov	r0, r3
	bx	lr
	.fnend
	.size	samsung_pd_resume, .-samsung_pd_resume
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	samsung_pd_runtime_suspend, %function
samsung_pd_runtime_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #84]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L7
	bx	r3
.L7:
	mov	r0, r3
	bx	lr
	.fnend
	.size	samsung_pd_runtime_suspend, .-samsung_pd_runtime_suspend
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	samsung_pd_runtime_resume, %function
samsung_pd_runtime_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #84]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L9
	bx	r3
.L9:
	mov	r0, r3
	bx	lr
	.fnend
	.size	samsung_pd_runtime_resume, .-samsung_pd_runtime_resume
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	samsung_pd_remove, %function
samsung_pd_remove:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:__pm_runtime_disable
	push	{r4, lr}
	.save {r4, lr}
	add	r0, r0, #8
	movt	r3, #:upper16:__pm_runtime_disable
	mov	r1, #1
	blx	r3
	mov	r0, #0
	pop	{r4, pc}
	.fnend
	.size	samsung_pd_remove, .-samsung_pd_remove
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	samsung_pd_probe, %function
samsung_pd_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	add	r4, r0, #8
	ldr	r3, [r0, #92]
	cmp	r3, #0
	beq	.L23
	ldr	r2, [r3]
	ldr	r1, [r0, #4]
	cmp	r2, #0
	str	r1, [r3, #28]
	beq	.L15
	mov	r0, r4
	blx	r2
	subs	r5, r0, #0
	bne	.L24
.L15:
	movw	r3, #:lower16:__pm_runtime_set_status
	mov	r1, #0
	movt	r3, #:upper16:__pm_runtime_set_status
	mov	r0, r4
	blx	r3
	movw	r3, #:lower16:pm_runtime_enable
	mov	r0, r4
	movt	r3, #:upper16:pm_runtime_enable
	mov	r5, #0
	blx	r3
	movw	r1, #:lower16:.LC2
	movw	r3, #:lower16:_dev_info
	mov	r0, r4
	movt	r1, #:upper16:.LC2
	movt	r3, #:upper16:_dev_info
	blx	r3
.L12:
	mov	r0, r5
	pop	{r4, r5, r6, pc}
.L24:
	movw	r1, #:lower16:.LC1
	movw	r3, #:lower16:dev_err
	mov	r0, r4
	movt	r1, #:upper16:.LC1
	movt	r3, #:upper16:dev_err
	blx	r3
	mov	r0, r5
	pop	{r4, r5, r6, pc}
.L23:
	movw	r1, #:lower16:.LC0
	movw	r3, #:lower16:dev_err
	mov	r0, r4
	movt	r1, #:upper16:.LC0
	movt	r3, #:upper16:dev_err
	mvn	r5, #1
	blx	r3
	b	.L12
	.fnend
	.size	samsung_pd_probe, .-samsung_pd_probe
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	samsung_pd_init, %function
samsung_pd_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:platform_driver_register
	push	{r4, lr}
	.save {r4, lr}
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:platform_driver_register
	blx	r3
	subs	r4, r0, #0
	bne	.L31
.L25:
	mov	r0, r4
	pop	{r4, pc}
.L31:
	movw	r1, #:lower16:.LANCHOR1
	movw	r0, #:lower16:.LC3
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR1
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC3
	blx	r3
	b	.L25
	.fnend
	.size	samsung_pd_init, .-samsung_pd_init
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.13168, %object
	.size	__func__.13168, 16
__func__.13168:
	.ascii	"samsung_pd_init\000"
	.type	samsung_pd_pm_ops, %object
	.size	samsung_pd_pm_ops, 68
samsung_pd_pm_ops:
	.space	8
	.word	samsung_pd_suspend
	.word	samsung_pd_resume
	.space	40
	.word	samsung_pd_runtime_suspend
	.word	samsung_pd_runtime_resume
	.space	4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	samsung_pd_driver, %object
	.size	samsung_pd_driver, 80
samsung_pd_driver:
	.word	samsung_pd_probe
	.word	samsung_pd_remove
	.space	12
	.word	.LC4
	.space	4
	.word	0
	.space	36
	.word	samsung_pd_pm_ops
	.space	4
	.space	4
	.section	.initcall3.init,"aw",%progbits
	.align	2
	.type	__initcall_samsung_pd_init3, %object
	.size	__initcall_samsung_pd_init3, 4
__initcall_samsung_pd_init3:
	.word	samsung_pd_init
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"no device data specified\012\000"
	.space	2
.LC1:
	.ascii	"init fails\000"
	.space	1
.LC2:
	.ascii	"power domain registered\012\000"
	.space	3
.LC3:
	.ascii	"<3>%s: failed to add PD driver\012\000"
.LC4:
	.ascii	"samsung-pd\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
