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
	.file	"cpufreq.c"
	.text
	.align	2
	.type	exynos_get_safe_armvolt, %function
exynos_get_safe_armvolt:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	mov	r7, r0
	mov	r6, r1
	ldr	r3, [r4]
	ldr	r2, [r3, #40]
	ldr	r5, [r3, #32]
	ldr	r8, [r3, #28]
	cmp	r2, #0
	beq	.L4
	blx	r2
	cmp	r0, #0
	beq	.L4
	ldr	r2, [r4]
	add	r6, r5, r6, asl #3
	ldr	r1, [r6, #4]
	ldr	r3, [r2]
	cmp	r1, r3
	bcs	.L4
	add	r5, r5, r7, asl #3
	ldr	r1, [r5, #4]
	cmp	r3, r1
	bls	.L4
	ldr	r3, [r2, #4]
	ldr	r0, [r8, r3, asl #2]
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L4:
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
	.fnend
	.size	exynos_get_safe_armvolt, .-exynos_get_safe_armvolt
	.align	2
	.global	exynos_cpufreq_level_unfix
	.type	exynos_cpufreq_level_unfix, %function
exynos_cpufreq_level_unfix:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	ldrb	r2, [r3, #4]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r2, #0
	strneb	r2, [r3, #5]
	bx	lr
	.fnend
	.size	exynos_cpufreq_level_unfix, .-exynos_cpufreq_level_unfix
	.align	2
	.global	exynos_cpufreq_is_fixed
	.type	exynos_cpufreq_is_fixed, %function
exynos_cpufreq_is_fixed:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	ldrb	r0, [r3, #5]	@ zero_extendqisi2
	bx	lr
	.fnend
	.size	exynos_cpufreq_is_fixed, .-exynos_cpufreq_is_fixed
	.align	2
	.type	exynos_cpufreq_suspend, %function
exynos_cpufreq_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	exynos_cpufreq_suspend, .-exynos_cpufreq_suspend
	.align	2
	.type	exynos_cpufreq_resume, %function
exynos_cpufreq_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	exynos_cpufreq_resume, .-exynos_cpufreq_resume
	.align	2
	.global	exynos_verify_speed
	.type	exynos_verify_speed, %function
exynos_verify_speed:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r2, #:lower16:.LANCHOR0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movt	r2, #:upper16:.LANCHOR0
	movw	r3, #:lower16:cpufreq_frequency_table_verify
	movt	r3, #:upper16:cpufreq_frequency_table_verify
	ldr	r2, [r2]
	ldr	r1, [r2, #32]
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos_verify_speed, .-exynos_verify_speed
	.align	2
	.global	exynos_getspeed
	.type	exynos_getspeed, %function
exynos_getspeed:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r2, #:lower16:.LANCHOR0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movt	r2, #:upper16:.LANCHOR0
	movw	r3, #:lower16:clk_get_rate
	movt	r3, #:upper16:clk_get_rate
	ldr	r2, [r2]
	ldr	r0, [r2, #24]
	blx	r3
	movw	r3, #19923
	movt	r3, 4194
	umull	r2, r0, r3, r0
	mov	r0, r0, lsr #6
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos_getspeed, .-exynos_getspeed
	.align	2
	.global	exynos_cpufreq_lock
	.type	exynos_cpufreq_lock, %function
exynos_cpufreq_lock:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	mov	r7, r0
	mov	r5, r1
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L64
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L64
	ldrb	r2, [r4, #5]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L65
.L23:
	ldr	r2, [r3, #12]
	cmp	r2, r5
	bhi	.L24
	ldr	r3, [r3, #16]
	cmp	r5, r3
	bhi	.L24
	movw	r3, #:lower16:cpufreq_cpu_get
	mov	r0, #0
	movt	r3, #:upper16:cpufreq_cpu_get
	blx	r3
	subs	fp, r0, #0
	beq	.L64
	ldr	r3, [r4]
	movw	r0, #:lower16:.LANCHOR2
	movw	r8, #:lower16:mutex_lock
	movt	r0, #:upper16:.LANCHOR2
	movt	r8, #:upper16:mutex_lock
	movw	r6, #:lower16:.LANCHOR0
	ldr	r9, [r3, #28]
	movt	r6, #:upper16:.LANCHOR0
	ldr	r10, [r3, #32]
	blx	r8
	mov	r2, #1
	ldr	r3, [r4, #8]
	mov	r2, r2, asl r7
	tst	r2, r3
	bne	.L66
	ldr	r0, [r6, #84]
	orr	r3, r2, r3
	add	r1, r6, r7, asl #2
	str	r3, [r6, #8]
	cmp	r5, r0
	movw	r0, #:lower16:.LANCHOR2
	strcc	r5, [r6, #84]
	movw	r6, #:lower16:mutex_unlock
	movt	r0, #:upper16:.LANCHOR2
	movt	r6, #:upper16:mutex_unlock
	str	r5, [r1, #12]
	blx	r6
	ldr	r1, [r4, #84]
	movw	r3, #:lower16:.LANCHOR0
	ldr	r2, [r4, #88]
	movt	r3, #:upper16:.LANCHOR0
	cmp	r1, r2
	bcs	.L28
.L30:
	cmp	r7, #6
	beq	.L29
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L28:
	ldrb	r3, [r3, #92]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L30
.L29:
	ldr	r0, .L68
	blx	r8
	add	r2, r10, r5, asl #3
	ldr	r3, [fp, #36]
	ldr	ip, [r2, #4]
	cmp	r3, ip
	bcs	.L31
	ldr	r2, [r10, #4]
	cmn	r2, #2
	beq	.L32
	cmp	r3, r2
	addne	r2, r10, #8
	bne	.L35
	b	.L33
.L37:
	cmp	r3, r0
	beq	.L33
.L35:
	ldr	r0, [r2, #4]
	mov	r10, r2
	add	r2, r2, #8
	cmn	r0, #2
	bne	.L37
.L32:
	movw	r0, #:lower16:.LC3
	movw	r1, #:lower16:.LANCHOR1
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR1
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC3
	blx	r3
	ldr	r0, .L68
	blx	r6
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L65:
	cmp	r0, #8
	beq	.L23
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC0
	movt	r3, #:upper16:printk
	blx	r3
.L64:
	mvn	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L33:
	ldr	r10, [r10]
	cmn	r10, #22
	beq	.L32
	movw	fp, #:lower16:.LANCHOR0
	movw	r7, #:lower16:cpufreq_notify_transition
	movt	fp, #:upper16:.LANCHOR0
	mov	r1, #0
	add	r0, fp, #96
	movt	r7, #:upper16:cpufreq_notify_transition
	str	r3, [r4, #100]
	movw	r8, #:lower16:regulator_set_voltage
	str	ip, [r4, #104]
	blx	r7
	mov	r1, r5
	mov	r0, r10
	bl	exynos_get_safe_armvolt
	subs	r1, r0, #0
	movteq	r8, #:upper16:regulator_set_voltage
	bne	.L67
.L38:
	ldr	r1, [r9, r5, asl #2]
	ldr	r0, [r4, #112]
	add	r2, r1, #24832
	add	r2, r2, #168
	blx	r8
	ldr	r3, [r4]
	mov	r0, r10
	mov	r1, r5
	ldr	r3, [r3, #36]
	blx	r3
	ldr	r0, .L68+4
	mov	r1, #1
	blx	r7
.L31:
	ldr	r0, .L68
	blx	r6
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L67:
	add	r2, r1, #24832
	ldr	r0, [fp, #112]
	add	r2, r2, #168
	movt	r8, #:upper16:regulator_set_voltage
	blx	r8
	b	.L38
.L24:
	movw	r0, #:lower16:.LC1
	movw	r1, #:lower16:.LANCHOR1
	movw	ip, #:lower16:printk
	mov	r2, r7
	mov	r3, r5
	movt	r1, #:upper16:.LANCHOR1
	movt	ip, #:upper16:printk
	movt	r0, #:upper16:.LC1
	blx	ip
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L66:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LANCHOR1
	movw	r3, #:lower16:printk
	mov	r2, r7
	movt	r1, #:upper16:.LANCHOR1
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC2
	blx	r3
	movw	r0, #:lower16:.LANCHOR2
	movw	r3, #:lower16:mutex_unlock
	movt	r0, #:upper16:.LANCHOR2
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L69:
	.align	2
.L68:
	.word	.LANCHOR2+24
	.word	.LANCHOR0+96
	.fnend
	.size	exynos_cpufreq_lock, .-exynos_cpufreq_lock
	.align	2
	.type	exynos_cpufreq_reboot_notifier_call, %function
exynos_cpufreq_reboot_notifier_call:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	mov	r0, #6
	ldr	r3, [r3]
	ldr	r1, [r3, #8]
	bl	exynos_cpufreq_lock
	cmp	r0, #0
	bge	.L73
	movw	r0, #32770
	ldmfd	sp!, {r3, pc}
.L73:
	movw	r0, #:lower16:.LC4
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC4
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos_cpufreq_reboot_notifier_call, .-exynos_cpufreq_reboot_notifier_call
	.align	2
	.type	exynos_target, %function
exynos_target:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	movw	r3, #:lower16:mutex_lock
	movt	r3, #:upper16:mutex_lock
	.pad #16
	sub	sp, sp, #16
	ldr	ip, [r4]
	mov	r10, r0
	ldr	r0, .L104
	mov	r8, r1
	mov	r7, r2
	ldr	r5, [ip, #32]
	ldr	r9, [ip, #28]
	blx	r3
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L90
	ldr	r2, [r10, #36]
	str	r2, [r4, #100]
	ldr	lr, [r5, #4]
	cmn	lr, #2
	addne	ip, r5, #8
	movne	r3, r5
	mvnne	r6, #0
	beq	.L81
.L80:
	cmp	r2, lr
	ldreq	r6, [r3]
	mov	r3, ip
	add	ip, ip, #8
	ldr	lr, [ip, #-4]
	cmn	lr, #2
	bne	.L80
	cmn	r6, #1
	beq	.L81
	add	r1, sp, #12
	movw	ip, #:lower16:cpufreq_frequency_table_target
	str	r1, [sp]
	mov	r2, r8
	mov	r3, r7
	movt	ip, #:upper16:cpufreq_frequency_table_target
	mov	r0, r10
	mov	r1, r5
	blx	ip
	cmp	r0, #0
	bne	.L81
	ldrb	r2, [r4, #92]	@ zero_extendqisi2
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	cmp	r2, #0
	beq	.L82
	ldr	r1, [sp, #12]
.L83:
	add	r5, r5, r1, asl #3
	ldr	r2, [r10, #12]
	mov	r0, r6
	ldr	r3, [r5, #4]
	movw	r7, #:lower16:.LANCHOR0
	str	r2, [r4, #96]
	movt	r7, #:upper16:.LANCHOR0
	movw	r5, #:lower16:cpufreq_notify_transition
	str	r3, [r4, #104]
	movt	r5, #:upper16:cpufreq_notify_transition
	bl	exynos_get_safe_armvolt
	ldr	r3, [sp, #12]
	mov	r8, r0
	mov	r1, #0
	add	r0, r7, #96
	ldr	r9, [r9, r3, asl #2]
	blx	r5
	ldr	r2, [r4, #104]
	ldr	r3, [r4, #100]
	cmp	r2, r3
	bls	.L85
	cmp	r8, #0
	beq	.L103
.L86:
	add	r2, r8, #24832
	movw	r3, #:lower16:regulator_set_voltage
	add	r2, r2, #168
	movt	r3, #:upper16:regulator_set_voltage
	ldr	r0, [r4, #112]
	mov	r1, r8
	blx	r3
	ldr	r2, [r4, #104]
	ldr	r3, [r4, #100]
.L87:
	cmp	r2, r3
	beq	.L88
	ldr	r3, [r4]
	mov	r0, r6
	ldr	r1, [sp, #12]
	ldr	r3, [r3, #36]
	blx	r3
.L88:
	ldr	r0, .L104+4
	mov	r1, #1
	blx	r5
	ldr	r2, [r4, #104]
	ldr	r3, [r4, #100]
	cmp	r2, r3
	bcc	.L89
	bls	.L90
	cmp	r8, #0
	beq	.L90
.L89:
	add	r2, r9, #24832
	movw	r3, #:lower16:regulator_set_voltage
	mov	r1, r9
	ldr	r0, [r4, #112]
	add	r2, r2, #168
	movt	r3, #:upper16:regulator_set_voltage
	mov	r5, #0
	blx	r3
	b	.L76
.L90:
	mov	r5, #0
.L76:
	movw	r3, #:lower16:mutex_unlock
	ldr	r0, .L104
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	mov	r0, r5
	add	sp, sp, #16
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L82:
	ldr	r1, [sp, #12]
	ldr	r3, [r3, #84]
	cmp	r1, r3
	strhi	r3, [sp, #12]
	movhi	r1, r3
	ldr	r3, [r4, #88]
	cmp	r3, r1
	movhi	r1, r3
	strhi	r3, [sp, #12]
	b	.L83
.L85:
	cmp	r8, #0
	beq	.L87
	b	.L86
.L103:
	add	r2, r9, #24832
	movw	r3, #:lower16:regulator_set_voltage
	add	r2, r2, #168
	movt	r3, #:upper16:regulator_set_voltage
	ldr	r0, [r7, #112]
	mov	r1, r9
	blx	r3
	ldr	r2, [r7, #104]
	ldr	r3, [r7, #100]
	b	.L87
.L81:
	mvn	r5, #21
	b	.L76
.L105:
	.align	2
.L104:
	.word	.LANCHOR2+24
	.word	.LANCHOR0+96
	.fnend
	.size	exynos_target, .-exynos_target
	.align	2
	.global	exynos_cpufreq_level_fix
	.type	exynos_cpufreq_level_fix, %function
exynos_cpufreq_level_fix:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	mov	r5, r0
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L114
	movw	r3, #:lower16:cpufreq_cpu_get
	mov	r0, #0
	movt	r3, #:upper16:cpufreq_cpu_get
	blx	r3
	cmp	r0, #0
	beq	.L114
	ldrb	r2, [r4, #5]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L115
	mov	r1, r5
	bl	exynos_target
	mov	r3, #1
	strb	r3, [r4, #5]
	ldmfd	sp!, {r3, r4, r5, pc}
.L115:
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC0
	movt	r3, #:upper16:printk
	blx	r3
.L114:
	mvn	r0, #0
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	exynos_cpufreq_level_fix, .-exynos_cpufreq_level_fix
	.align	2
	.type	exynos_cpufreq_cpu_exit, %function
exynos_cpufreq_cpu_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:cpufreq_frequency_table_put_attr
	ldr	r0, [r0, #12]
	movt	r3, #:upper16:cpufreq_frequency_table_put_attr
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos_cpufreq_cpu_exit, .-exynos_cpufreq_cpu_exit
	.align	2
	.type	exynos_cpufreq_cpu_init, %function
exynos_cpufreq_cpu_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r5, #:lower16:.LANCHOR0
	movt	r5, #:upper16:.LANCHOR0
	movw	r3, #:lower16:clk_get_rate
	mov	r4, r0
	movt	r3, #:upper16:clk_get_rate
	ldr	r2, [r5]
	movw	r6, #:lower16:cpufreq_frequency_table_get_attr
	movt	r6, #:upper16:cpufreq_frequency_table_get_attr
	ldr	r0, [r2, #24]
	blx	r3
	movw	r3, #19923
	ldr	r2, [r5]
	movt	r3, 4194
	ldr	r1, [r4, #12]
	umull	ip, r0, r3, r0
	mov	r0, r0, lsr #6
	str	r0, [r4, #32]
	str	r0, [r4, #28]
	str	r0, [r4, #36]
	ldr	r0, [r2, #32]
	blx	r6
	movw	r3, #:lower16:cpu_online_mask
	movw	r2, #34464
	movt	r3, #:upper16:cpu_online_mask
	movt	r2, 1
	ldr	r7, [r3]
	movw	r3, #:lower16:__sw_hweight32
	str	r2, [r4, #24]
	movt	r3, #:upper16:__sw_hweight32
	ldr	r0, [r7]
	and	r0, r0, #15
	blx	r3
	cmp	r0, #1
	mov	r0, r4
	movweq	r3, #:lower16:cpu_possible_mask
	movne	r3, #15
	movteq	r3, #:upper16:cpu_possible_mask
	ldreq	r3, [r3]
	ldreq	r3, [r3]
	streq	r3, [r4, #4]
	ldreq	r3, [r7]
	str	r3, [r4]
	movw	r3, #:lower16:cpufreq_frequency_table_cpuinfo
	ldr	r2, [r5]
	movt	r3, #:upper16:cpufreq_frequency_table_cpuinfo
	movw	r5, #:lower16:.LANCHOR0
	movt	r5, #:upper16:.LANCHOR0
	ldr	r1, [r2, #32]
	blx	r3
	movw	r3, #23744
	mov	r2, #3392
	subs	r7, r0, #0
	movt	r3, 21
	movt	r2, 3
	str	r3, [r4, #32]
	str	r2, [r4, #28]
	bne	.L120
	ldr	r3, [r5]
	ldr	r1, [r4, #12]
	ldr	r0, [r3, #32]
	blx	r6
.L120:
	mov	r0, r7
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
	.fnend
	.size	exynos_cpufreq_cpu_init, .-exynos_cpufreq_cpu_init
	.align	2
	.type	exynos_cpufreq_init, %function
exynos_cpufreq_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:kmalloc_caches
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r3, #:upper16:kmalloc_caches
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L122
	movw	r3, #:lower16:kmem_cache_alloc_trace
	movw	r1, #32976
	movt	r3, #:upper16:kmem_cache_alloc_trace
	mov	r2, #44
	blx	r3
	movw	r5, #:lower16:.LANCHOR0
	cmp	r0, #0
	movt	r5, #:upper16:.LANCHOR0
	str	r0, [r5]
	beq	.L134
.L133:
	movw	r3, #:lower16:samsung_cpu_id
	mov	r2, #0
	movt	r3, #:upper16:samsung_cpu_id
	movt	r2, 17186
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmp	r3, r2
	beq	.L124
	cmn	r3, #465567744
	bne	.L125
.L124:
	movw	r3, #:lower16:exynos4x12_cpufreq_init
	movt	r3, #:upper16:exynos4x12_cpufreq_init
	blx	r3
	subs	r6, r0, #0
	bne	.L127
	ldr	r3, [r5]
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	ldr	r3, [r3, #36]
	cmp	r3, #0
	beq	.L140
	movw	r1, #:lower16:.LC7
	movw	r2, #:lower16:regulator_get
	movt	r1, #:upper16:.LC7
	movt	r2, #:upper16:regulator_get
	blx	r2
	cmn	r0, #4096
	str	r0, [r4, #112]
	bhi	.L141
	movw	r2, #:lower16:register_pm_notifier
	ldr	r0, .L142
	movt	r2, #:upper16:register_pm_notifier
	strb	r6, [r4, #5]
	blx	r2
	movw	r2, #:lower16:register_reboot_notifier
	ldr	r0, .L142+4
	movt	r2, #:upper16:register_reboot_notifier
	blx	r2
	movw	r2, #:lower16:cpufreq_register_notifier
	mov	r1, #1
	movt	r2, #:upper16:cpufreq_register_notifier
	ldr	r0, .L142+8
	blx	r2
	mov	r0, r4
	mov	r3, r6
	ldr	r2, [r0], #12
	add	ip, r4, #116
	mov	r1, #1
	strb	r1, [r4, #4]
.L131:
	ldr	r1, [r2, #16]
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	str	r1, [r0, r3]
	ldr	r1, [r2, #12]
	str	r1, [ip, r3]
	add	r3, r3, #4
	cmp	r3, #72
	bne	.L131
	ldr	r1, [r2, #16]
	movw	r3, #:lower16:cpufreq_register_driver
	ldr	r2, [r2, #12]
	movt	r3, #:upper16:cpufreq_register_driver
	ldr	r0, .L142+12
	str	r1, [r4, #84]
	str	r2, [r4, #88]
	blx	r3
	cmp	r0, #0
	ldmeqfd	sp!, {r4, r5, r6, pc}
	movw	r0, #:lower16:.LC9
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC9
	blx	r3
	movw	r3, #:lower16:unregister_reboot_notifier
	ldr	r0, .L142+4
	movt	r3, #:upper16:unregister_reboot_notifier
	blx	r3
	movw	r3, #:lower16:unregister_pm_notifier
	ldr	r0, .L142
	movt	r3, #:upper16:unregister_pm_notifier
	blx	r3
	ldr	r0, [r4, #112]
	cmn	r0, #4096
	bhi	.L127
	movw	r3, #:lower16:regulator_put
	movt	r3, #:upper16:regulator_put
	blx	r3
.L127:
	movw	r3, #:lower16:kfree
	ldr	r0, [r5]
	movt	r3, #:upper16:kfree
	blx	r3
	mvn	r0, #21
	ldmfd	sp!, {r4, r5, r6, pc}
.L122:
	movw	r5, #:lower16:.LANCHOR0
	mov	r3, #16
	movt	r5, #:upper16:.LANCHOR0
	mov	r0, r3
	str	r3, [r5]
	b	.L133
.L134:
	mvn	r0, #11
	ldmfd	sp!, {r4, r5, r6, pc}
.L125:
	movw	r0, #:lower16:.LC5
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L142+16
	movt	r0, #:upper16:.LC5
	blx	r3
	b	.L127
.L141:
	movw	r0, #:lower16:.LC8
	movw	r1, #:lower16:.LC7
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LC7
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC8
	blx	r3
	b	.L127
.L140:
	movw	r0, #:lower16:.LC6
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L142+16
	movt	r0, #:upper16:.LC6
	blx	r3
	b	.L127
.L143:
	.align	2
.L142:
	.word	.LANCHOR2+48
	.word	.LANCHOR2+60
	.word	.LANCHOR2+72
	.word	.LANCHOR2+84
	.word	.LANCHOR1+20
	.fnend
	.size	exynos_cpufreq_init, .-exynos_cpufreq_init
	.align	2
	.global	exynos_find_cpufreq_level_by_volt
	.type	exynos_find_cpufreq_level_by_volt, %function
exynos_find_cpufreq_level_by_volt:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	mov	r5, r0
	mov	r7, r1
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	ldr	r3, [r4]
	cmp	r2, #0
	ldr	r6, [r3, #28]
	beq	.L153
	movw	r3, #:lower16:cpufreq_frequency_get_table
	mov	r0, #0
	movt	r3, #:upper16:cpufreq_frequency_get_table
	blx	r3
	cmp	r0, #0
	beq	.L156
	cmp	r5, #0
	beq	.L157
	ldr	r2, [r4]
	ldr	r3, [r2, #16]
	ldr	r2, [r2, #12]
	cmp	r3, r2
	bcc	.L148
	ldr	r1, [r6, r3, asl #2]
	add	ip, r6, r3, asl #2
	cmp	r5, r1
	bls	.L149
.L151:
	sub	r3, r3, #1
	cmp	r3, r2
	bcc	.L148
	ldr	r4, [ip, #-4]!
	cmp	r5, r4
	bhi	.L151
.L149:
	str	r3, [r7]
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L153:
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L148:
	movw	r0, #:lower16:.LC12
	movw	r3, #:lower16:printk
	mov	r2, r5
	movt	r3, #:upper16:printk
	ldr	r1, .L158
	movt	r0, #:upper16:.LC12
	blx	r3
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L157:
	movw	r0, #:lower16:.LC11
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L158
	movt	r0, #:upper16:.LC11
	blx	r3
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L156:
	movw	r0, #:lower16:.LC10
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L158
	movt	r0, #:upper16:.LC10
	blx	r3
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L159:
	.align	2
.L158:
	.word	.LANCHOR1+40
	.fnend
	.size	exynos_find_cpufreq_level_by_volt, .-exynos_find_cpufreq_level_by_volt
	.align	2
	.global	exynos_cpufreq_get_level
	.type	exynos_cpufreq_get_level, %function
exynos_cpufreq_get_level:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	mov	r5, r0
	mov	r6, r1
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L168
	movw	r3, #:lower16:cpufreq_frequency_get_table
	mov	r0, #0
	movt	r3, #:upper16:cpufreq_frequency_get_table
	blx	r3
	cmp	r0, #0
	beq	.L173
	ldr	r2, [r4]
	ldr	r4, [r2, #12]
	add	r3, r0, r4, asl #3
	ldr	r2, [r3, #4]
	cmn	r2, #2
	beq	.L163
	cmp	r2, r5
	beq	.L164
.L166:
	ldr	ip, [r3, #12]
	add	r4, r4, #1
	add	r3, r3, #8
	cmn	ip, #2
	beq	.L163
	cmp	ip, r5
	bne	.L166
.L164:
	str	r4, [r6]
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
.L168:
	mvn	r0, #21
	ldmfd	sp!, {r4, r5, r6, pc}
.L163:
	movw	r0, #:lower16:.LC13
	movw	r3, #:lower16:printk
	mov	r2, r5
	movt	r3, #:upper16:printk
	ldr	r1, .L174
	movt	r0, #:upper16:.LC13
	blx	r3
	mvn	r0, #21
	ldmfd	sp!, {r4, r5, r6, pc}
.L173:
	movw	r0, #:lower16:.LC10
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L174
	movt	r0, #:upper16:.LC10
	blx	r3
	mvn	r0, #21
	ldmfd	sp!, {r4, r5, r6, pc}
.L175:
	.align	2
.L174:
	.word	.LANCHOR1+76
	.fnend
	.size	exynos_cpufreq_get_level, .-exynos_cpufreq_get_level
	.align	2
	.type	exynos_cpufreq_lock_free.part.2, %function
exynos_cpufreq_lock_free.part.2:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movw	r3, #:lower16:mutex_lock
	mov	r4, r0
	movw	r0, #:lower16:.LANCHOR2
	movt	r3, #:upper16:mutex_lock
	movt	r0, #:upper16:.LANCHOR2
	blx	r3
	movw	ip, #:lower16:.LANCHOR0
	mov	lr, #1
	movt	ip, #:upper16:.LANCHOR0
	ldr	r3, [ip]
	add	r2, ip, r4, asl #2
	ldr	r0, [ip, #8]
	ldr	r1, [r3, #16]
	bic	r4, r0, lr, asl r4
	str	r1, [r2, #12]
	ldr	r1, [r3, #16]
	cmp	r4, #0
	str	r4, [ip, #8]
	str	r1, [ip, #84]
	beq	.L179
	add	r3, ip, #8
	add	r0, ip, #80
.L180:
	ldr	r2, [r3, #4]!
	cmp	r1, r2
	movcc	r2, r1
	cmp	r3, r0
	mov	r1, r2
	bne	.L180
	str	r2, [ip, #84]
.L179:
	movw	r0, #:lower16:.LANCHOR2
	movw	r3, #:lower16:mutex_unlock
	movt	r0, #:upper16:.LANCHOR2
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	exynos_cpufreq_lock_free.part.2, .-exynos_cpufreq_lock_free.part.2
	.align	2
	.global	exynos_cpufreq_lock_free
	.type	exynos_cpufreq_lock_free, %function
exynos_cpufreq_lock_free:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	bxeq	lr
	b	exynos_cpufreq_lock_free.part.2
	.fnend
	.size	exynos_cpufreq_lock_free, .-exynos_cpufreq_lock_free
	.align	2
	.type	exynos_cpufreq_notifier_event, %function
exynos_cpufreq_notifier_event:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:cpufreq_cpu_get
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r3, #:upper16:cpufreq_cpu_get
	mov	r4, r1
	mov	r0, #0
	blx	r3
	sub	r1, r4, #1
	mov	r6, r0
	cmp	r1, #5
	bhi	.L191
	mov	r3, #1
	mov	r1, r3, asl r1
	tst	r1, #42
	beq	.L202
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L203
.L189:
	ldrb	r3, [r4, #92]	@ zero_extendqisi2
	mov	r2, #0
	movw	r5, #:lower16:.LANCHOR0
	strb	r2, [r4, #5]
	movt	r5, #:upper16:.LANCHOR0
	cmp	r3, r2
	bne	.L204
	mov	r0, #1
	ldmfd	sp!, {r4, r5, r6, pc}
.L202:
	ands	r0, r1, #21
	ldmeqfd	sp!, {r4, r5, r6, pc}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	ldrb	r3, [r4, #92]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L205
.L187:
	ldr	r3, [r4]
	mov	r0, #6
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	ldr	r1, [r3, #8]
	bl	exynos_cpufreq_lock
	cmp	r0, #0
	movge	r0, #1
	movwlt	r0, #32770
	strgeb	r0, [r4, #5]
	ldmfd	sp!, {r4, r5, r6, pc}
.L191:
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
.L204:
	ldr	r3, [r5]
	movw	r4, #:lower16:clk_get_rate
	movt	r4, #:upper16:clk_get_rate
	ldr	r0, [r3, #24]
	blx	r4
	movw	r3, #19923
	ldr	r2, [r5]
	movt	r3, 4194
	umull	r1, r3, r3, r0
	ldr	r1, [r2, #20]
	cmp	r1, r3, lsr #6
	beq	.L190
	mov	r2, #1
	mov	r0, r6
	bl	exynos_target
	ldr	r2, [r5]
.L190:
	ldr	r0, [r2, #24]
	blx	r4
	mov	r0, #1
	ldmfd	sp!, {r4, r5, r6, pc}
.L203:
	mov	r0, #6
	bl	exynos_cpufreq_lock_free.part.2
	b	.L189
.L205:
	ldr	r6, [r4]
	movw	r5, #:lower16:clk_get_rate
	movt	r5, #:upper16:clk_get_rate
	ldr	r0, [r6, #24]
	blx	r5
	movw	r3, #19923
	ldr	r2, [r4]
	movt	r3, 4194
	umull	r1, r3, r3, r0
	mov	r3, r3, lsr #6
	str	r3, [r6, #20]
	ldr	r0, [r2, #24]
	blx	r5
	b	.L187
	.fnend
	.size	exynos_cpufreq_notifier_event, .-exynos_cpufreq_notifier_event
	.align	2
	.type	exynos_cpufreq_policy_notifier_call, %function
exynos_cpufreq_policy_notifier_call:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	subs	r6, r1, #0
	mov	r5, r2
	beq	.L217
.L207:
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
.L217:
	movw	r1, #:lower16:.LC14
	movw	r4, #:lower16:strnicmp
	ldr	r0, [r2, #44]
	movt	r1, #:upper16:.LC14
	movt	r4, #:upper16:strnicmp
	mov	r2, #16
	blx	r4
	cmp	r0, #0
	beq	.L210
	movw	r1, #:lower16:.LC16
	ldr	r0, [r5, #44]
	movt	r1, #:upper16:.LC16
	mov	r2, #16
	blx	r4
	cmp	r0, #0
	beq	.L210
	movw	r1, #:lower16:.LC17
	ldr	r0, [r5, #44]
	movt	r1, #:upper16:.LC17
	mov	r2, #16
	blx	r4
	cmp	r0, #0
	beq	.L210
	movw	r3, #:lower16:.LANCHOR0
	mov	r0, #0
	movt	r3, #:upper16:.LANCHOR0
	strb	r6, [r3, #92]
	ldmfd	sp!, {r4, r5, r6, pc}
.L210:
	movw	r0, #:lower16:.LC15
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, [r5, #44]
	movt	r0, #:upper16:.LC15
	blx	r3
	movw	r3, #:lower16:.LANCHOR0
	mov	r2, #1
	movt	r3, #:upper16:.LANCHOR0
	strb	r2, [r3, #92]
	b	.L207
	.fnend
	.size	exynos_cpufreq_policy_notifier_call, .-exynos_cpufreq_policy_notifier_call
	.align	2
	.global	exynos_cpufreq_upper_limit
	.type	exynos_cpufreq_upper_limit, %function
exynos_cpufreq_upper_limit:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r9, #:lower16:.LANCHOR0
	movt	r9, #:upper16:.LANCHOR0
	.pad #12
	sub	sp, sp, #12
	mov	r6, r0
	mov	r5, r1
	ldrb	r3, [r9, #4]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L250
	ldr	r3, [r9]
	cmp	r3, #0
	beq	.L250
	ldrb	fp, [r9, #5]	@ zero_extendqisi2
	cmp	fp, #0
	bne	.L251
	ldr	r2, [r3, #12]
	cmp	r2, r1
	bhi	.L223
	ldr	r3, [r3, #16]
	cmp	r1, r3
	bhi	.L223
	movw	r3, #:lower16:cpufreq_cpu_get
	mov	r0, fp
	movt	r3, #:upper16:cpufreq_cpu_get
	blx	r3
	subs	r10, r0, #0
	beq	.L250
	ldr	r2, [r9]
	movw	r0, #:lower16:.LANCHOR2
	movw	r8, #:lower16:mutex_lock
	movt	r0, #:upper16:.LANCHOR2
	movt	r8, #:upper16:mutex_lock
	ldr	r3, [r2, #28]
	ldr	r4, [r2, #32]
	str	r3, [sp, #4]
	blx	r8
	mov	r1, #1
	ldr	r2, [r9, #188]
	mov	r1, r1, asl r6
	ands	r7, r1, r2
	bne	.L252
	ldr	r0, [r9, #88]
	add	r6, r9, r6, asl #2
	orr	r2, r1, r2
	str	r5, [r6, #116]
	movw	r6, #:lower16:mutex_unlock
	cmp	r5, r0
	movw	r0, #:lower16:.LANCHOR2
	movt	r0, #:upper16:.LANCHOR2
	movt	r6, #:upper16:mutex_unlock
	str	r2, [r9, #188]
	strhi	r5, [r9, #88]
	blx	r6
	ldr	r0, .L254
	blx	r8
	add	r2, r4, r5, asl #3
	ldr	r3, [r10, #36]
	ldr	r10, [r2, #4]
	cmp	r3, r10
	bls	.L227
	ldr	r1, [r4, #4]
	ldr	r2, [r9]
	cmp	r1, r3
	ldr	lr, [r2, #16]
	beq	.L236
	cmp	lr, #0
	addne	ip, r4, #8
	movne	r2, #0
	bne	.L233
	b	.L229
.L234:
	ldr	r4, [ip, #4]
	add	ip, ip, #8
	cmp	r4, r3
	beq	.L228
	cmp	r2, lr
	beq	.L229
.L233:
	add	r2, r2, #1
	mov	r1, ip
	cmp	r2, lr
	bls	.L234
.L232:
	movw	fp, #:lower16:.LANCHOR0
	movw	r4, #:lower16:cpufreq_notify_transition
	movt	fp, #:upper16:.LANCHOR0
	mov	r1, #0
	add	r0, fp, #96
	movt	r4, #:upper16:cpufreq_notify_transition
	str	r3, [r9, #100]
	str	r10, [r9, #104]
	blx	r4
	ldr	r3, [r9]
	mov	r0, r7
	mov	r1, r5
	ldr	r3, [r3, #36]
	blx	r3
	mov	r0, r7
	mov	r1, r5
	bl	exynos_get_safe_armvolt
	subs	r1, r0, #0
	movw	r7, #:lower16:regulator_set_voltage
	movteq	r7, #:upper16:regulator_set_voltage
	bne	.L253
.L235:
	ldr	r3, [sp, #4]
	ldr	r0, [r9, #112]
	ldr	r1, [r3, r5, asl #2]
	add	r2, r1, #24832
	add	r2, r2, #168
	blx	r7
	ldr	r0, .L254+4
	mov	r1, #1
	blx	r4
.L227:
	ldr	r0, .L254
	blx	r6
	mov	r0, #0
.L220:
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L236:
	mov	r1, r4
.L228:
	ldr	r7, [r1]
	b	.L232
.L253:
	add	r2, r1, #24832
	ldr	r0, [fp, #112]
	add	r2, r2, #168
	movt	r7, #:upper16:regulator_set_voltage
	blx	r7
	b	.L235
.L251:
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC0
	movt	r3, #:upper16:printk
	blx	r3
.L250:
	mvn	r0, #0
	b	.L220
.L223:
	movw	r0, #:lower16:.LC1
	movw	ip, #:lower16:printk
	mov	r2, r6
	mov	r3, r5
	movt	r0, #:upper16:.LC1
	movt	ip, #:upper16:printk
	ldr	r1, .L254+8
	blx	ip
	mvn	r0, #21
	b	.L220
.L252:
	movw	r0, #:lower16:.LC18
	movw	r3, #:lower16:printk
	mov	r1, r6
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC18
	blx	r3
	movw	r0, #:lower16:.LANCHOR2
	movw	r3, #:lower16:mutex_unlock
	movt	r0, #:upper16:.LANCHOR2
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	mov	r0, fp
	b	.L220
.L229:
	movw	r0, #:lower16:.LC19
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L254+8
	movt	r0, #:upper16:.LC19
	blx	r3
	ldr	r0, .L254
	blx	r6
	mvn	r0, #21
	b	.L220
.L255:
	.align	2
.L254:
	.word	.LANCHOR2+24
	.word	.LANCHOR0+96
	.word	.LANCHOR1+104
	.fnend
	.size	exynos_cpufreq_upper_limit, .-exynos_cpufreq_upper_limit
	.align	2
	.global	exynos_cpufreq_upper_limit_free
	.type	exynos_cpufreq_upper_limit_free, %function
exynos_cpufreq_upper_limit_free:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	mov	r5, r0
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #0
	ldmeqfd	sp!, {r3, r4, r5, pc}
	movw	r0, #:lower16:.LANCHOR2
	movw	r3, #:lower16:mutex_lock
	movt	r0, #:upper16:.LANCHOR2
	movt	r3, #:upper16:mutex_lock
	blx	r3
	ldr	r3, [r4]
	add	r2, r4, r5, asl #2
	ldr	r0, [r4, #188]
	mov	ip, #1
	ldr	r1, [r3, #12]
	bic	r5, r0, ip, asl r5
	str	r1, [r2, #116]
	ldr	r1, [r3, #12]
	cmp	r5, #0
	str	r5, [r4, #188]
	str	r1, [r4, #88]
	beq	.L260
	add	r3, r4, #112
	add	r0, r4, #184
.L261:
	ldr	r2, [r3, #4]!
	cmp	r1, r2
	movcs	r2, r1
	cmp	r3, r0
	mov	r1, r2
	bne	.L261
	str	r2, [r4, #88]
.L260:
	movw	r0, #:lower16:.LANCHOR2
	movw	r3, #:lower16:mutex_unlock
	movt	r0, #:upper16:.LANCHOR2
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	exynos_cpufreq_upper_limit_free, .-exynos_cpufreq_upper_limit_free
	.align	2
	.global	show_UV_mV_table
	.type	show_UV_mV_table, %function
show_UV_mV_table:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	subs	r10, r1, #0
	beq	.L269
	movw	r7, #:lower16:.LANCHOR0
	movt	r7, #:upper16:.LANCHOR0
	ldr	r3, [r7]
	ldr	r4, [r3, #12]
	ldr	r2, [r3, #16]
	cmp	r4, r2
	bhi	.L270
	movw	r6, #19923
	movw	r8, #:lower16:sprintf
	movt	r6, 4194
	movt	r8, #:upper16:sprintf
	mov	r5, #0
	mov	r9, #1000
.L268:
	ldr	r2, [r3, #32]
	movw	r1, #:lower16:.LC20
	add	r0, r10, r5
	movt	r1, #:upper16:.LC20
	add	r2, r2, r4, asl #3
	ldr	r2, [r2, #4]
	cmn	r2, #1
	umull	ip, r2, r6, r2
	beq	.L267
	ldr	r3, [r3, #28]
	mov	r2, r2, lsr #6
	ldr	r3, [r3, r4, asl #2]
	umull	lr, ip, r6, r3
	mov	ip, ip, lsr #6
	mls	ip, r9, ip, r3
	add	r3, ip, r3
	umull	ip, r3, r6, r3
	mov	r3, r3, lsr #6
	blx	r8
	add	r5, r5, r0
.L267:
	ldr	r3, [r7]
	add	r4, r4, #1
	ldr	r2, [r3, #16]
	cmp	r4, r2
	bls	.L268
.L266:
	mov	r0, r5
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L269:
	mov	r5, r10
	mov	r0, r5
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L270:
	mov	r5, #0
	b	.L266
	.fnend
	.size	show_UV_mV_table, .-show_UV_mV_table
	.align	2
	.global	store_UV_mV_table
	.type	store_UV_mV_table, %function
store_UV_mV_table:
	.fnstart
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #140
	sub	sp, sp, #140
	add	lr, sp, #112
	add	ip, sp, #128
	add	fp, sp, #84
	add	r10, sp, #88
	str	lr, [sp, #28]
	add	lr, sp, #116
	str	lr, [sp, #32]
	add	lr, sp, #120
	str	lr, [sp, #36]
	add	lr, sp, #124
	str	r1, [sp, #64]
	add	r9, sp, #92
	add	r8, sp, #96
	add	r7, sp, #100
	add	r6, sp, #104
	add	r5, sp, #108
	str	lr, [sp, #40]
	movw	r1, #:lower16:.LC21
	add	lr, sp, #132
	movw	r4, #:lower16:sscanf
	str	r2, [sp, #68]
	add	r3, sp, #80
	str	ip, [sp, #44]
	add	r2, sp, #76
	str	ip, [sp, #60]
	movt	r1, #:upper16:.LC21
	ldr	r0, [sp, #64]
	movt	r4, #:upper16:sscanf
	str	fp, [sp]
	str	r10, [sp, #4]
	str	r9, [sp, #8]
	str	r8, [sp, #12]
	str	r7, [sp, #16]
	str	r6, [sp, #20]
	str	r5, [sp, #24]
	str	lr, [sp, #48]
	blx	r4
	cmp	r0, #15
	ldr	ip, [sp, #60]
	beq	.L277
	add	lr, sp, #112
	movw	r1, #:lower16:.LC22
	str	lr, [sp, #28]
	add	lr, sp, #116
	str	lr, [sp, #32]
	add	lr, sp, #120
	str	lr, [sp, #36]
	add	lr, sp, #124
	str	fp, [sp]
	movt	r1, #:upper16:.LC22
	str	r10, [sp, #4]
	add	r2, sp, #76
	str	r9, [sp, #8]
	add	r3, sp, #80
	ldr	r0, [sp, #64]
	str	r8, [sp, #12]
	str	r7, [sp, #16]
	str	r6, [sp, #20]
	str	r5, [sp, #24]
	str	lr, [sp, #40]
	str	ip, [sp, #44]
	blx	r4
	cmp	r0, #14
	beq	.L277
	add	ip, sp, #112
	add	lr, sp, #116
	str	ip, [sp, #28]
	movw	r1, #:lower16:.LC23
	str	lr, [sp, #32]
	add	ip, sp, #120
	add	lr, sp, #124
	str	fp, [sp]
	str	r10, [sp, #4]
	add	r3, sp, #80
	ldr	r0, [sp, #64]
	movt	r1, #:upper16:.LC23
	str	r9, [sp, #8]
	add	r2, sp, #76
	str	r8, [sp, #12]
	str	r7, [sp, #16]
	str	r6, [sp, #20]
	str	r5, [sp, #24]
	str	ip, [sp, #36]
	str	lr, [sp, #40]
	blx	r4
	cmp	r0, #12
	bne	.L296
.L277:
	movw	ip, #46473
	movw	r0, #58208
	movw	r7, #10175
	mov	r8, #10176
	add	r2, sp, #76
	movt	ip, 5368
	movt	r0, 22
	movt	r7, 9
	movt	r8, 9
	add	r6, sp, #136
	mov	r5, #1000
	movw	r4, #12500
.L276:
	ldr	r3, [r2], #4
	mul	r3, r5, r3
	smull	r1, r9, ip, r3
	mov	r1, r3, asr #31
	rsb	r1, r1, r9, asr #10
	mul	r1, r4, r1
	cmp	r3, r1
	movne	r3, r1
	cmp	r3, r0
	str	r3, [r2, #-4]
	strgt	r0, [r2, #-4]
	bgt	.L282
	cmp	r3, r7
	strle	r8, [r2, #-4]
.L282:
	cmp	r2, r6
	bne	.L276
	mov	r0, #0
	movw	r6, #:lower16:.LANCHOR0
	mov	r3, r0
	movt	r6, #:upper16:.LANCHOR0
	add	r5, sp, #72
.L284:
	ldr	r4, [r6]
	add	ip, r3, r0
	ldr	r2, [r4, #32]
	add	r2, r2, ip, asl #3
	ldr	r1, [r2, #4]
	cmn	r1, #1
	bne	.L287
.L288:
	add	r2, r2, #8
	ldr	r1, [r2, #4]
	add	r3, r3, #1
	add	ip, r0, r3
	cmn	r1, #1
	beq	.L288
.L287:
	ldr	r2, [r4, #28]
	add	r0, r0, #1
	ldr	r1, [r5, #4]!
	cmp	r0, #15
	str	r1, [r2, ip, asl #2]
	bne	.L284
	ldr	r0, [sp, #68]
.L278:
	add	sp, sp, #140
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L296:
	mvn	r0, #21
	b	.L278
	.fnend
	.size	store_UV_mV_table, .-store_UV_mV_table
	.global	exynos_cpufreq_lock_count
	.global	g_cpufreq_lock_level
	.global	g_cpufreq_lock_val
	.global	g_cpufreq_lock_id
	.global	g_cpufreq_limit_level
	.global	g_cpufreq_limit_val
	.global	g_cpufreq_limit_id
	.global	exynos_info
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.21038, %object
	.size	__func__.21038, 20
__func__.21038:
	.ascii	"exynos_cpufreq_lock\000"
	.type	__func__.21167, %object
	.size	__func__.21167, 20
__func__.21167:
	.ascii	"exynos_cpufreq_init\000"
	.type	__func__.20999, %object
	.size	__func__.20999, 34
__func__.20999:
	.ascii	"exynos_find_cpufreq_level_by_volt\000"
	.space	2
	.type	__func__.21014, %object
	.size	__func__.21014, 25
__func__.21014:
	.ascii	"exynos_cpufreq_get_level\000"
	.space	3
	.type	__func__.21072, %object
	.size	__func__.21072, 27
__func__.21072:
	.ascii	"exynos_cpufreq_upper_limit\000"
	.section	___ksymtab_gpl+exynos_cpufreq_level_unfix,"a",%progbits
	.align	2
	.type	__ksymtab_exynos_cpufreq_level_unfix, %object
	.size	__ksymtab_exynos_cpufreq_level_unfix, 8
__ksymtab_exynos_cpufreq_level_unfix:
	.word	exynos_cpufreq_level_unfix
	.word	__kstrtab_exynos_cpufreq_level_unfix
	.section	___ksymtab_gpl+exynos_find_cpufreq_level_by_volt,"a",%progbits
	.align	2
	.type	__ksymtab_exynos_find_cpufreq_level_by_volt, %object
	.size	__ksymtab_exynos_find_cpufreq_level_by_volt, 8
__ksymtab_exynos_find_cpufreq_level_by_volt:
	.word	exynos_find_cpufreq_level_by_volt
	.word	__kstrtab_exynos_find_cpufreq_level_by_volt
	.section	.initcall7.init,"aw",%progbits
	.align	2
	.type	__initcall_exynos_cpufreq_init7, %object
	.size	__initcall_exynos_cpufreq_init7, 4
__initcall_exynos_cpufreq_init7:
	.word	exynos_cpufreq_init
	.section	___ksymtab_gpl+exynos_cpufreq_level_fix,"a",%progbits
	.align	2
	.type	__ksymtab_exynos_cpufreq_level_fix, %object
	.size	__ksymtab_exynos_cpufreq_level_fix, 8
__ksymtab_exynos_cpufreq_level_fix:
	.word	exynos_cpufreq_level_fix
	.word	__kstrtab_exynos_cpufreq_level_fix
	.section	___ksymtab_gpl+exynos_cpufreq_lock_free,"a",%progbits
	.align	2
	.type	__ksymtab_exynos_cpufreq_lock_free, %object
	.size	__ksymtab_exynos_cpufreq_lock_free, 8
__ksymtab_exynos_cpufreq_lock_free:
	.word	exynos_cpufreq_lock_free
	.word	__kstrtab_exynos_cpufreq_lock_free
	.section	__ksymtab_strings,"a",%progbits
	.type	__kstrtab_exynos_cpufreq_is_fixed, %object
	.size	__kstrtab_exynos_cpufreq_is_fixed, 24
__kstrtab_exynos_cpufreq_is_fixed:
	.ascii	"exynos_cpufreq_is_fixed\000"
	.type	__kstrtab_exynos_cpufreq_level_unfix, %object
	.size	__kstrtab_exynos_cpufreq_level_unfix, 27
__kstrtab_exynos_cpufreq_level_unfix:
	.ascii	"exynos_cpufreq_level_unfix\000"
	.type	__kstrtab_exynos_cpufreq_level_fix, %object
	.size	__kstrtab_exynos_cpufreq_level_fix, 25
__kstrtab_exynos_cpufreq_level_fix:
	.ascii	"exynos_cpufreq_level_fix\000"
	.type	__kstrtab_exynos_cpufreq_lock_free, %object
	.size	__kstrtab_exynos_cpufreq_lock_free, 25
__kstrtab_exynos_cpufreq_lock_free:
	.ascii	"exynos_cpufreq_lock_free\000"
	.type	__kstrtab_exynos_cpufreq_lock, %object
	.size	__kstrtab_exynos_cpufreq_lock, 20
__kstrtab_exynos_cpufreq_lock:
	.ascii	"exynos_cpufreq_lock\000"
	.type	__kstrtab_exynos_cpufreq_get_level, %object
	.size	__kstrtab_exynos_cpufreq_get_level, 25
__kstrtab_exynos_cpufreq_get_level:
	.ascii	"exynos_cpufreq_get_level\000"
	.type	__kstrtab_exynos_find_cpufreq_level_by_volt, %object
	.size	__kstrtab_exynos_find_cpufreq_level_by_volt, 34
__kstrtab_exynos_find_cpufreq_level_by_volt:
	.ascii	"exynos_find_cpufreq_level_by_volt\000"
	.data
	.align	2
	.set	.LANCHOR2,. + 0
	.type	set_cpu_freq_lock, %object
	.size	set_cpu_freq_lock, 24
set_cpu_freq_lock:
	.word	1
	.word	0
	.space	4
	.word	set_cpu_freq_lock+12
	.word	set_cpu_freq_lock+12
	.space	4
	.type	set_freq_lock, %object
	.size	set_freq_lock, 24
set_freq_lock:
	.word	1
	.word	0
	.space	4
	.word	set_freq_lock+12
	.word	set_freq_lock+12
	.space	4
	.type	exynos_cpufreq_notifier, %object
	.size	exynos_cpufreq_notifier, 12
exynos_cpufreq_notifier:
	.word	exynos_cpufreq_notifier_event
	.space	8
	.type	exynos_cpufreq_reboot_notifier, %object
	.size	exynos_cpufreq_reboot_notifier, 12
exynos_cpufreq_reboot_notifier:
	.word	exynos_cpufreq_reboot_notifier_call
	.space	8
	.type	exynos_cpufreq_policy_notifier, %object
	.size	exynos_cpufreq_policy_notifier, 12
exynos_cpufreq_policy_notifier:
	.word	exynos_cpufreq_policy_notifier_call
	.space	8
	.type	exynos_driver, %object
	.size	exynos_driver, 68
exynos_driver:
	.space	4
	.ascii	"exynos_cpufreq\000"
	.space	1
	.byte	1
	.space	3
	.word	exynos_cpufreq_cpu_init
	.word	exynos_verify_speed
	.space	4
	.word	exynos_target
	.word	exynos_getspeed
	.space	8
	.word	exynos_cpufreq_cpu_exit
	.word	exynos_cpufreq_suspend
	.word	exynos_cpufreq_resume
	.word	exynos_cpufreq_attr
	.type	exynos_cpufreq_attr, %object
	.size	exynos_cpufreq_attr, 8
exynos_cpufreq_attr:
	.word	cpufreq_freq_attr_scaling_available_freqs
	.word	0
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<6>CPUFreq is already fixed\012\000"
	.space	3
.LC1:
	.ascii	"<4>%s: invalid cpufreq_level(%d:%d)\012\000"
	.space	3
.LC2:
	.ascii	"<3>%s:Device [%d] already locked cpufreq\012\000"
	.space	2
.LC3:
	.ascii	"<3>%s: Level not found\012\000"
.LC4:
	.ascii	"<6>REBOOT Notifier for CPUFREQ\012\000"
.LC5:
	.ascii	"<3>%s: CPU type not found\012\000"
	.space	1
.LC6:
	.ascii	"<3>%s: No set_freq function (ERR)\012\000"
	.space	1
.LC7:
	.ascii	"vdd_arm\000"
.LC8:
	.ascii	"<3>failed to get resource %s\012\000"
	.space	2
.LC9:
	.ascii	"<3>failed to register cpufreq driver\012\000"
	.space	2
.LC10:
	.ascii	"<3>%s: Failed to get the cpufreq table\012\000"
.LC11:
	.ascii	"<3>%s: req_volt has no value.\012\000"
	.space	1
.LC12:
	.ascii	"<3>%s: Failed to get level for %u uV\012\000"
	.space	2
.LC13:
	.ascii	"<3>%s: %u KHz is an unsupported cpufreq\012\000"
	.space	3
.LC14:
	.ascii	"powersave\000"
	.space	2
.LC15:
	.ascii	"<7>cpufreq governor is changed to %s\012\000"
	.space	2
.LC16:
	.ascii	"performance\000"
.LC17:
	.ascii	"userspace\000"
	.space	2
.LC18:
	.ascii	"<3>[CPUFREQ]This device [%d] already limited cpufre"
	.ascii	"q\012\000"
	.space	2
.LC19:
	.ascii	"<3>%s: Level is not found\012\000"
	.space	1
.LC20:
	.ascii	"%dmhz: %d mV\012\000"
	.space	2
.LC21:
	.ascii	"%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d\000"
	.space	3
.LC22:
	.ascii	"%d %d %d %d %d %d %d %d %d %d %d %d %d %d\000"
	.space	2
.LC23:
	.ascii	"%d %d %d %d %d %d %d %d %d %d %d %d %d\000"
	.section	___ksymtab_gpl+exynos_cpufreq_is_fixed,"a",%progbits
	.align	2
	.type	__ksymtab_exynos_cpufreq_is_fixed, %object
	.size	__ksymtab_exynos_cpufreq_is_fixed, 8
__ksymtab_exynos_cpufreq_is_fixed:
	.word	exynos_cpufreq_is_fixed
	.word	__kstrtab_exynos_cpufreq_is_fixed
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	exynos_info, %object
	.size	exynos_info, 4
exynos_info:
	.space	4
	.type	exynos_cpufreq_init_done, %object
	.size	exynos_cpufreq_init_done, 1
exynos_cpufreq_init_done:
	.space	1
	.type	exynos_cpufreq_disable, %object
	.size	exynos_cpufreq_disable, 1
exynos_cpufreq_disable:
	.space	1
	.space	2
	.type	g_cpufreq_lock_id, %object
	.size	g_cpufreq_lock_id, 4
g_cpufreq_lock_id:
	.space	4
	.type	g_cpufreq_lock_val, %object
	.size	g_cpufreq_lock_val, 72
g_cpufreq_lock_val:
	.space	72
	.type	g_cpufreq_lock_level, %object
	.size	g_cpufreq_lock_level, 4
g_cpufreq_lock_level:
	.space	4
	.type	g_cpufreq_limit_level, %object
	.size	g_cpufreq_limit_level, 4
g_cpufreq_limit_level:
	.space	4
	.type	exynos_cpufreq_lock_disable, %object
	.size	exynos_cpufreq_lock_disable, 1
exynos_cpufreq_lock_disable:
	.space	1
	.space	3
	.type	freqs, %object
	.size	freqs, 16
freqs:
	.space	16
	.type	arm_regulator, %object
	.size	arm_regulator, 4
arm_regulator:
	.space	4
	.type	g_cpufreq_limit_val, %object
	.size	g_cpufreq_limit_val, 72
g_cpufreq_limit_val:
	.space	72
	.type	g_cpufreq_limit_id, %object
	.size	g_cpufreq_limit_id, 4
g_cpufreq_limit_id:
	.space	4
	.type	exynos_cpufreq_lock_count, %object
	.size	exynos_cpufreq_lock_count, 4
exynos_cpufreq_lock_count:
	.space	4
	.section	___ksymtab_gpl+exynos_cpufreq_lock,"a",%progbits
	.align	2
	.type	__ksymtab_exynos_cpufreq_lock, %object
	.size	__ksymtab_exynos_cpufreq_lock, 8
__ksymtab_exynos_cpufreq_lock:
	.word	exynos_cpufreq_lock
	.word	__kstrtab_exynos_cpufreq_lock
	.section	___ksymtab_gpl+exynos_cpufreq_get_level,"a",%progbits
	.align	2
	.type	__ksymtab_exynos_cpufreq_get_level, %object
	.size	__ksymtab_exynos_cpufreq_get_level, 8
__ksymtab_exynos_cpufreq_get_level:
	.word	exynos_cpufreq_get_level
	.word	__kstrtab_exynos_cpufreq_get_level
	.ident	"GCC: (GNU) 4.8"
