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
	.file	"wakeup_assist.c"
	.text
	.align	2
	.type	wakeup_assist_init, %function
wakeup_assist_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:platform_driver_register
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:platform_driver_register
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	wakeup_assist_init, .-wakeup_assist_init
	.align	2
	.type	wakeup_assist_resume, %function
wakeup_assist_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:dev_get_drvdata
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r3, #:upper16:dev_get_drvdata
	blx	r3
	mov	r3, #0
	mov	r5, r0
	movt	r3, 65048
	ldr	r3, [r3, #1536]
@ 72 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/wakeup_assist.c" 1
	dsb
@ 0 "" 2
	tst	r3, #1
	beq	.L3
	movw	r6, #:lower16:.LANCHOR0
	mov	r1, #1
	movt	r6, #:upper16:.LANCHOR0
	movw	r4, #:lower16:input_event
	mov	r3, r1
	movt	r4, #:upper16:input_event
	ldr	r2, [r6, #80]
	blx	r4
	mov	r1, #0
	mov	r0, r5
	mov	r2, r1
	mov	r3, r1
	blx	r4
	mov	r0, r5
	ldr	r2, [r6, #80]
	mov	r1, #1
	mov	r3, #0
	blx	r4
	mov	r1, #0
	mov	r0, r5
	mov	r2, r1
	mov	r3, r1
	blx	r4
.L3:
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	wakeup_assist_resume, .-wakeup_assist_resume
	.align	2
	.type	wakeup_assist_remove, %function
wakeup_assist_remove:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	add	r5, r0, #8
	movw	r3, #:lower16:dev_get_drvdata
	mov	r0, r5
	movt	r3, #:upper16:dev_get_drvdata
	blx	r3
	movw	r3, #:lower16:dev_set_drvdata
	mov	r4, r0
	mov	r1, #0
	mov	r0, r5
	movt	r3, #:upper16:dev_set_drvdata
	blx	r3
	movw	r3, #:lower16:input_unregister_device
	mov	r0, r4
	movt	r3, #:upper16:input_unregister_device
	blx	r3
	movw	r3, #:lower16:input_free_device
	mov	r0, r4
	movt	r3, #:upper16:input_free_device
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	wakeup_assist_remove, .-wakeup_assist_remove
	.align	2
	.type	wakeup_assist_probe, %function
wakeup_assist_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r3, #:lower16:input_allocate_device
	movt	r3, #:upper16:input_allocate_device
	mov	r5, r0
	blx	r3
	subs	r4, r0, #0
	beq	.L12
	movw	r2, #:lower16:.LC0
	mov	lr, #25
	mov	ip, #2
	mov	r1, #4
	movt	r2, #:upper16:.LC0
	add	r5, r5, #8
	movw	r3, #:lower16:input_set_capability
	str	r2, [r4]
	strh	lr, [r4, #12]	@ movhi
	mov	r2, r1
	movt	r3, #:upper16:input_set_capability
	str	ip, [r4, #24]
	str	r5, [r4, #424]
	blx	r3
	movw	r2, #:lower16:.LANCHOR0
	add	r1, r4, #28
	movt	r2, #:upper16:.LANCHOR0
	mov	r0, #4
	ldr	r3, [r2, #80]
	mov	lr, #1
	add	r2, r2, #80
	str	r0, [r4, #176]
	str	r2, [r4, #180]
	movw	r2, #:lower16:input_register_device
	cmp	r3, #0
	add	ip, r3, #31
	mov	r6, r3, asr #31
	movge	ip, r3
	mov	ip, ip, asr #5
	str	lr, [r4, #172]
	mov	r6, r6, lsr #27
	movt	r2, #:upper16:input_register_device
	ldr	r7, [r1, ip, asl #2]
	mov	r0, r4
	add	r3, r3, r6
	and	r3, r3, #31
	rsb	r6, r6, r3
	orr	lr, r7, lr, asl r6
	str	lr, [r1, ip, asl #2]
	ldr	r3, [r4, #28]
	bic	r3, r3, #1
	str	r3, [r4, #28]
	blx	r2
	subs	r6, r0, #0
	bne	.L13
	movw	r3, #:lower16:dev_set_drvdata
	mov	r0, r5
	mov	r1, r4
	movt	r3, #:upper16:dev_set_drvdata
	blx	r3
	mov	r0, r6
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L13:
	movw	r3, #:lower16:input_free_device
	mov	r0, r4
	movt	r3, #:upper16:input_free_device
	blx	r3
	mov	r0, r6
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L12:
	mvn	r0, #11
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
	.fnend
	.size	wakeup_assist_probe, .-wakeup_assist_probe
	.section	.rodata
	.align	2
	.type	wakeup_assist_pm_ops, %object
	.size	wakeup_assist_pm_ops, 68
wakeup_assist_pm_ops:
	.space	12
	.word	wakeup_assist_resume
	.space	52
	.section	.initcall6.init,"aw",%progbits
	.align	2
	.type	__initcall_wakeup_assist_init6, %object
	.size	__initcall_wakeup_assist_init6, 4
__initcall_wakeup_assist_init6:
	.word	wakeup_assist_init
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	wakeup_assist_driver, %object
	.size	wakeup_assist_driver, 80
wakeup_assist_driver:
	.word	wakeup_assist_probe
	.word	wakeup_assist_remove
	.space	12
	.word	.LC0
	.space	4
	.word	0
	.space	36
	.word	wakeup_assist_pm_ops
	.space	4
	.space	4
	.type	wakeup_assist_keycode, %object
	.size	wakeup_assist_keycode, 4
wakeup_assist_keycode:
	.word	116
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"wakeup_assist\000"
	.ident	"GCC: (GNU) 4.8"
