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
	.file	"cpuidle-exynos4.c"
	.text
	.align	2
	.global	set_sromc_access
	.type	set_sromc_access, %function
set_sromc_access:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #0
	movw	r3, #:lower16:.LANCHOR0
	movne	r2, #1
	movtne	r3, #:upper16:.LANCHOR0
	movteq	r3, #:upper16:.LANCHOR0
	strne	r2, [r3]
	streq	r0, [r3]
	bx	lr
	.fnend
	.size	set_sromc_access, .-set_sromc_access
	.align	2
	.type	exynos4_cpuidle_cpu_notifier_event, %function
exynos4_cpuidle_cpu_notifier_event:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	r1, r1, #3
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	cmp	r1, #20
	bhi	.L5
	mov	r2, #1
	mov	r3, #18
	mov	r1, r2, asl r1
	movt	r3, 18
	and	r3, r1, r3
	cmp	r3, #0
	bne	.L6
	orr	r2, r2, r2, asl #16
	tst	r2, r1
	bne	.L11
.L5:
	mov	r0, #1
	ldmfd	sp!, {r4, pc}
.L6:
	movw	r4, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_spin_lock
	movt	r4, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_spin_lock
	add	r0, r4, #4
	blx	r3
	ldr	r2, [r4, #12]
	movw	r3, #:lower16:_raw_spin_unlock
	add	r0, r4, #4
	movt	r3, #:upper16:_raw_spin_unlock
	sub	r2, r2, #1
	str	r2, [r4, #12]
	blx	r3
	mov	r0, #1
	ldmfd	sp!, {r4, pc}
.L11:
	movw	r4, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_spin_lock
	movt	r4, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_spin_lock
	add	r0, r4, #4
	blx	r3
	ldr	r2, [r4, #12]
	movw	r3, #:lower16:_raw_spin_unlock
	add	r0, r4, #4
	movt	r3, #:upper16:_raw_spin_unlock
	add	r2, r2, #1
	str	r2, [r4, #12]
	blx	r3
	b	.L5
	.fnend
	.size	exynos4_cpuidle_cpu_notifier_event, .-exynos4_cpuidle_cpu_notifier_event
	.align	2
	.type	exynos4_cpuidle_notifier_event, %function
exynos4_cpuidle_notifier_event:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	r1, r1, #1
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	cmp	r1, #5
	bhi	.L15
	mov	r4, #1
	mov	r1, r4, asl r1
	tst	r1, #42
	bne	.L14
	ands	r0, r1, #21
	ldmeqfd	sp!, {r4, pc}
	movw	r3, #:lower16:disable_hlt
	movt	r3, #:upper16:disable_hlt
	blx	r3
	mov	r0, r4
	ldmfd	sp!, {r4, pc}
.L15:
	mov	r0, #0
	ldmfd	sp!, {r4, pc}
.L14:
	movw	r3, #:lower16:enable_hlt
	movt	r3, #:upper16:enable_hlt
	blx	r3
	mov	r0, r4
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	exynos4_cpuidle_notifier_event, .-exynos4_cpuidle_notifier_event
	.align	2
	.type	exynos4_init_cpuidle, %function
exynos4_init_cpuidle:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:samsung_cpu_id
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movt	r3, #:upper16:samsung_cpu_id
	movw	ip, #:lower16:.LANCHOR0
	movw	r2, #24575
	mov	r1, #0
	ldr	r0, [r3]
	movt	ip, #:upper16:.LANCHOR0
	movt	r2, 65041
	.pad #36
	sub	sp, sp, #36
	mov	r3, r1
	str	ip, [sp, #24]
	str	r1, [ip, #16]
	movt	r3, 17186
	ldr	r1, [r2, #-4063]
	mov	r2, r0, lsr #17
	mov	r2, r2, asl #17
	bic	r1, r1, #1879048192
	cmp	r2, r3
	bic	r1, r1, #458752
	movweq	r2, #819
	movteq	r2, 28679
	orreq	r2, r1, r2
	beq	.L19
	cmn	r2, #465567744
	movweq	r2, #1023
	orrne	r2, r1, #1879048192
	movteq	r2, 28679
	orrne	r2, r2, #458752
	orreq	r2, r1, r2
.L19:
	movw	r3, #24575
	mov	r1, #136
	movt	r3, 65041
	movt	r1, 65280
	str	r2, [r3, #-4063]
	movw	r2, #273
	ldr	ip, [r3, #-4059]
	movt	r2, 769
	movw	lr, #:lower16:printk
	movw	r0, #:lower16:.LC0
	movt	lr, #:upper16:printk
	movt	r0, #:upper16:.LC0
	and	r1, ip, r1
	str	lr, [sp, #28]
	orr	r2, r1, r2
	str	r2, [r3, #-4059]
	ldr	r3, [sp, #28]
	blx	r3
	movw	r0, #:lower16:.LANCHOR1
	movw	r3, #:lower16:cpuidle_register_driver
	movt	r0, #:upper16:.LANCHOR1
	movt	r3, #:upper16:cpuidle_register_driver
	blx	r3
	subs	r4, r0, #0
	blt	.L46
	movw	r3, #:lower16:cpu_online_mask
	movw	r10, #:lower16:nr_cpu_ids
	movt	r3, #:upper16:cpu_online_mask
	movw	r6, #:lower16:memcpy
	ldr	r3, [r3]
	movw	ip, #:lower16:__per_cpu_offset
	movt	ip, #:upper16:__per_cpu_offset
	movt	r10, #:upper16:nr_cpu_ids
	movt	r6, #:upper16:memcpy
	mvn	r8, #0
	str	r3, [sp, #20]
	movw	r3, #:lower16:_find_next_bit_le
	movt	r3, #:upper16:_find_next_bit_le
	str	ip, [sp, #12]
	str	r3, [sp, #8]
	movw	r3, #:lower16:cpuidle_register_device
	movt	r3, #:upper16:cpuidle_register_device
	movw	ip, #:lower16:.LANCHOR2
	movt	ip, #:upper16:.LANCHOR2
	str	r3, [sp, #16]
	str	ip, [sp, #4]
.L27:
	add	r2, r8, #1
	ldr	r3, [sp, #8]
	ldr	r0, [sp, #20]
	mov	r1, #4
	blx	r3
	ldr	r3, [r10]
	mov	r8, r0
	cmp	r3, r0
	ble	.L47
	ldr	r3, [sp, #12]
	cmp	r8, #0
	ldr	ip, [sp, #4]
	mov	fp, #0
	moveq	r5, #2
	movne	r5, #1
	ldr	r7, [r3, r8, asl #2]
	add	r7, ip, r7
	ldr	ip, .L49
	add	r9, r7, #16
	str	r8, [r7, #4]
	mov	r3, r9
	str	r5, [r7, #12]
	rsb	r4, r7, ip
.L37:
	mov	r0, r3
	add	r1, r4, r3
	add	fp, fp, #1
	mov	r2, #96
	blx	r6
	cmp	fp, r5
	add	r3, r0, #96
	blt	.L37
	str	r9, [r7, #888]
	mov	r0, r7
	ldr	r3, [sp, #16]
	blx	r3
	cmp	r0, #0
	beq	.L27
	movw	r0, #:lower16:.LANCHOR1
	movw	r3, #:lower16:cpuidle_unregister_driver
	movt	r0, #:upper16:.LANCHOR1
	movt	r3, #:upper16:cpuidle_unregister_driver
	blx	r3
	movw	r0, #:lower16:.LC2
	ldr	ip, [sp, #28]
	movt	r0, #:upper16:.LC2
	blx	ip
	mvn	r0, #4
	b	.L45
.L47:
	movw	ip, #:lower16:__arm_ioremap
	mov	r5, #0
	movt	ip, #:upper16:__arm_ioremap
	movw	r10, #:lower16:platform_get_resource
	str	ip, [sp, #4]
	mov	r7, r5
	ldr	ip, [sp, #24]
	movt	r10, #:upper16:platform_get_resource
	mov	r3, #3
	str	r10, [sp, #8]
	mov	r9, ip
	str	r3, [ip, #20]
.L32:
	ldr	lr, .L49+4
	mov	r1, #512
	mov	r2, #0
	movw	r4, #:lower16:.LANCHOR1
	movt	r4, #:upper16:.LANCHOR1
	movw	fp, #:lower16:platform_get_resource
	add	r3, lr, r5
	add	r7, r7, #1
	ldr	r0, [r3, #4]
	movw	r8, #:lower16:__arm_ioremap
	ldr	r3, [sp, #8]
	movw	r6, #:lower16:.LANCHOR0
	blx	r3
	subs	r1, r0, #0
	mov	r2, #0
	add	r10, r4, #216
	movt	fp, #:upper16:platform_get_resource
	beq	.L33
	ldr	r0, [r1]
	movt	r8, #:upper16:__arm_ioremap
	ldr	r1, [r1, #4]
	movt	r6, #:upper16:.LANCHOR0
	ldr	r3, [sp, #4]
	add	r1, r1, #1
	rsb	r1, r0, r1
	blx	r3
	cmp	r0, #0
	str	r0, [r5, r10]
	add	r5, r5, #12
	beq	.L34
	ldr	r2, [r9, #20]
	cmp	r2, r7
	bgt	.L32
	ldr	r0, [r4, #256]
	mov	r1, #512
	mov	r2, #0
	blx	fp
	subs	r3, r0, #0
	beq	.L33
	ldr	r1, [r3, #4]
	mov	r2, #0
	ldr	r0, [r3]
	add	r1, r1, #1
	rsb	r1, r0, r1
	blx	r8
	cmp	r0, #0
	str	r0, [r4, #252]
	beq	.L34
	movw	r3, #:lower16:register_pm_notifier
	add	r0, r4, #264
	movt	r3, #:upper16:register_pm_notifier
	blx	r3
	ldr	r5, [r6, #16]
	cmp	r5, #1
	beq	.L48
.L35:
	movw	r3, #:lower16:sys_pwr_conf_addr
	mov	r2, #512
	mov	r1, #0
	movt	r3, #:upper16:sys_pwr_conf_addr
	movt	r2, 65048
	movt	r1, 65152
	str	r2, [r3]
	movw	r5, #:lower16:scu_save
	ldr	r2, [r1, #48]
	movt	r5, #:upper16:scu_save
	mov	r3, #0
	movw	r4, #:lower16:l2x0_save
	movt	r3, 65120
	movt	r4, #:upper16:l2x0_save
	str	r2, [r5]
	movw	r2, #:lower16:cpu_cache
	ldr	r1, [r1]
	movt	r2, #:upper16:cpu_cache
	movw	r6, #:lower16:outer_cache
	ldr	r2, [r2, #4]
	movt	r6, #:upper16:outer_cache
	str	r1, [r5, #4]
	ldr	r1, [r3, #264]
	str	r1, [r4]
	ldr	r1, [r3, #268]
	str	r1, [r4, #4]
	ldr	r3, [r3, #3936]
	str	r3, [r4, #8]
	blx	r2
	ldr	r3, [r6, #4]
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	r0, r4, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	cmp	r3, #0
	beq	.L36
	mov	r1, #3
	blx	r3
	ldr	r3, [r6, #4]
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	r0, r5, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	cmp	r3, #0
	beq	.L36
	mov	r1, #2
	blx	r3
	mov	r0, #0
.L45:
	add	sp, sp, #36
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L36:
	mov	r0, r3
	add	sp, sp, #36
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L48:
	movw	r3, #:lower16:get_online_cpus
	movt	r3, #:upper16:get_online_cpus
	blx	r3
	movw	r3, #:lower16:_raw_spin_lock
	add	r0, r6, #4
	movt	r3, #:upper16:_raw_spin_lock
	blx	r3
	ldr	r3, [sp, #20]
	ldr	r0, [r3]
	movw	r3, #:lower16:__sw_hweight32
	movt	r3, #:upper16:__sw_hweight32
	and	r0, r0, #15
	blx	r3
	movw	r3, #:lower16:_raw_spin_unlock
	str	r0, [r6, #12]
	movt	r3, #:upper16:_raw_spin_unlock
	add	r0, r6, #4
	blx	r3
	movw	r3, #:lower16:register_cpu_notifier
	add	r0, r4, #276
	movt	r3, #:upper16:register_cpu_notifier
	blx	r3
	movw	r3, #:lower16:cpufreq_register_notifier
	add	r0, r4, #288
	mov	r1, r5
	movt	r3, #:upper16:cpufreq_register_notifier
	blx	r3
	movw	r3, #:lower16:put_online_cpus
	movt	r3, #:upper16:put_online_cpus
	blx	r3
	b	.L35
.L33:
	movw	r0, #:lower16:.LC3
	ldr	ip, [sp, #28]
	movt	r0, #:upper16:.LC3
	blx	ip
	mvn	r0, #21
	b	.L45
.L34:
	movw	r0, #:lower16:.LC4
	ldr	ip, [sp, #28]
	movt	r0, #:upper16:.LC4
	blx	ip
	mvn	r0, #21
	b	.L45
.L46:
	movw	r0, #:lower16:.LC1
	ldr	ip, [sp, #28]
	movt	r0, #:upper16:.LC1
	blx	ip
	mov	r0, r4
	b	.L45
.L50:
	.align	2
.L49:
	.word	.LANCHOR1+8
	.word	.LANCHOR1+216
	.fnend
	.size	exynos4_init_cpuidle, .-exynos4_init_cpuidle
	.align	2
	.type	is_only_onlining_cpu, %function
is_only_onlining_cpu:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	movw	r5, #:lower16:_raw_spin_lock
	movt	r5, #:upper16:_raw_spin_lock
	add	r0, r4, #24
	blx	r5
	ldrb	r3, [r4, #32]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L54
	movw	r6, #:lower16:_raw_spin_unlock
	add	r0, r4, #24
	movt	r6, #:upper16:_raw_spin_unlock
	blx	r6
	add	r0, r4, #4
	blx	r5
	ldr	r3, [r4, #12]
	add	r0, r4, #4
	subs	r3, r3, #1
	rsbs	r4, r3, #0
	adcs	r4, r4, r3
	blx	r6
	mov	r0, r4
	ldmfd	sp!, {r4, r5, r6, pc}
.L54:
	movw	r3, #:lower16:_raw_spin_unlock
	add	r0, r4, #24
	movt	r3, #:upper16:_raw_spin_unlock
	blx	r3
	movw	r3, #:lower16:cpu_online_mask
	movt	r3, #:upper16:cpu_online_mask
	ldr	r3, [r3]
	ldr	r0, [r3]
	ubfx	r0, r0, #1, #1
	eor	r0, r0, #1
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	is_only_onlining_cpu, .-is_only_onlining_cpu
	.align	2
	.type	exynos4_enter_idle, %function
exynos4_enter_idle:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #16
	sub	sp, sp, #16
@ 35 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/irqflags.h" 1
		cpsid i			@ arch_local_irq_disable
@ 0 "" 2
	movw	r5, #:lower16:do_gettimeofday
	movw	r4, #:lower16:.LANCHOR0
	mov	r0, sp
	movt	r5, #:upper16:do_gettimeofday
	movt	r4, #:upper16:.LANCHOR0
	blx	r5
	ldr	r3, [r4, #16]
	cmp	r3, #1
	beq	.L77
	movw	r3, #:lower16:processor
	movt	r3, #:upper16:processor
	ldr	r3, [r3, #20]
	blx	r3
.L65:
	add	r0, sp, #8
	blx	r5
@ 26 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/irqflags.h" 1
		cpsie i			@ arch_local_irq_enable
@ 0 "" 2
	ldr	ip, [sp, #8]
	movw	r3, #16960
	ldr	r0, [sp]
	movt	r3, 15
	ldr	r1, [sp, #12]
	ldr	r2, [sp, #4]
	rsb	r0, r0, ip
	rsb	r2, r2, r1
	mla	r0, r3, r0, r2
	add	sp, sp, #16
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L77:
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	str	r2, [r3, #4]
	mov	r2, sp
	movw	r6, #:lower16:_raw_spin_lock
	bic	r3, r2, #8128
	movt	r6, #:upper16:_raw_spin_lock
	bic	r3, r3, #63
	add	r0, r4, #36
	ldr	r7, [r3, #16]
	blx	r6
	ldr	r3, [r4, #44]
	mov	r2, #1
	mov	r7, r2, asl r7
	orr	r3, r7, r3
	cmp	r3, #3
	str	r3, [r4, #44]
	beq	.L59
	bl	is_only_onlining_cpu
	cmp	r0, #0
	beq	.L62
.L59:
	mov	r3, #16384
	movt	r3, 65041
	ldr	r1, [r3, #1280]
	mov	r2, r3
	orr	r0, r1, #1879048199
	str	r1, [r4, #48]
	str	r0, [r3, #1280]
.L58:
	ldr	r3, [r2, #1536]
	tst	r3, #268435457
	bne	.L58
.L62:
	movw	r8, #:lower16:_raw_spin_unlock
	ldr	r0, .L78
	movt	r8, #:upper16:_raw_spin_unlock
	blx	r8
	movw	r3, #:lower16:processor
	movt	r3, #:upper16:processor
	ldr	r3, [r3, #20]
	blx	r3
	ldr	r0, .L78
	blx	r6
	ldr	r3, [r4, #44]
	cmp	r3, #3
	beq	.L60
	bl	is_only_onlining_cpu
	cmp	r0, #0
	beq	.L66
.L60:
	mov	r3, #16384
	ldr	r1, [r4, #48]
	movt	r3, 65041
	mov	r2, r3
	str	r1, [r3, #1280]
.L63:
	ldr	r3, [r2, #1536]
	tst	r3, #268435457
	bne	.L63
.L66:
	ldr	r3, [r4, #44]
	ldr	r0, .L78
	bic	r7, r3, r7
	str	r7, [r4, #44]
	blx	r8
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r3, [r3]
	tst	r3, #2
	beq	.L65
	movw	r3, #:lower16:preempt_schedule
	movt	r3, #:upper16:preempt_schedule
	blx	r3
	b	.L65
.L79:
	.align	2
.L78:
	.word	.LANCHOR0+36
	.fnend
	.size	exynos4_enter_idle, .-exynos4_enter_idle
	.align	2
	.type	exynos4_enter_lowpower, %function
exynos4_enter_lowpower:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r6, #:lower16:.LANCHOR0
	movt	r6, #:upper16:.LANCHOR0
	.pad #20
	sub	sp, sp, #20
	mov	r7, r0
	mov	r5, r1
	ldr	r3, [r6, #16]
	cmp	r3, #1
	beq	.L154
	movw	r3, #:lower16:cpu_online_mask
	movw	r4, #:lower16:__sw_hweight32
	movt	r3, #:upper16:cpu_online_mask
	movt	r4, #:upper16:__sw_hweight32
	ldr	r3, [r3]
	ldr	r0, [r3]
	and	r0, r0, #15
	blx	r4
	subs	r2, r0, #1
	rsbs	r0, r2, #0
	adcs	r0, r0, r2
.L82:
	cmp	r0, #0
	bne	.L83
	ldr	r5, [r7, #888]
	cmp	r5, #0
	beq	.L155
.L83:
	mov	r3, #0
	add	r1, r7, #16
	mov	r2, r3
	cmp	r1, r5
	movt	r3, 65048
	movt	r2, 257
	str	r5, [r7, #816]
	str	r2, [r3, #520]
	beq	.L100
	movw	r8, #:lower16:.LANCHOR1
	movt	r8, #:upper16:.LANCHOR1
	ldr	r4, [r8, #300]
	tst	r4, #3
	beq	.L100
	tst	r4, #2
	bne	.L156
.L87:
	tst	r4, #1
	beq	.L100
@ 35 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/irqflags.h" 1
		cpsid i			@ arch_local_irq_disable
@ 0 "" 2
	movw	r3, #:lower16:cpu_pm_enter
	movt	r3, #:upper16:cpu_pm_enter
	blx	r3
	ldr	r3, [r8, #304]
	cmp	r3, #0
	bne	.L157
.L123:
	movw	r7, #:lower16:do_gettimeofday
	mov	r0, sp
	movt	r7, #:upper16:do_gettimeofday
	movw	r9, #:lower16:cpu_possible_mask
	blx	r7
	mov	r0, #0
	mov	ip, #3344
	mov	r2, r0
	movw	lr, #65342
	movt	r2, 65089
	movt	r0, 65048
	movt	ip, 64698
	movw	r1, #:lower16:exynos4_idle_resume
	movw	r3, #:lower16:exynos4_sys_powerdown_conf
	str	lr, [r0, #1544]
	movt	r1, #:upper16:exynos4_idle_resume
	movt	r3, #:upper16:exynos4_sys_powerdown_conf
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	r1, r1, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	mov	r0, #0
	str	r1, [r2, #36]
	movt	r9, #:upper16:cpu_possible_mask
	str	ip, [r2, #32]
	movw	r6, #8200
	movw	r4, #:lower16:__sw_hweight32
	blx	r3
	movt	r6, 65048
	ldr	r10, [r9]
	movt	r4, #:upper16:__sw_hweight32
	mov	r5, #0
	b	.L101
.L100:
	mov	r0, r7
	mov	r1, r5
	bl	exynos4_enter_idle
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L102:
	ldr	r3, [r6]
	add	r5, r5, #1
	bic	r3, r3, #4096
	str	r3, [r6], #128
.L101:
	ldr	r0, [r10]
	and	r0, r0, #15
	blx	r4
	cmp	r5, r0
	bcc	.L102
	mov	r5, #0
	mov	r2, #131
	movt	r5, 65048
	movt	r2, 32768
	movw	r3, #:lower16:exynos4_enter_lp
	ldr	r6, [r5, #1932]
	movt	r3, #:upper16:exynos4_enter_lp
	str	r2, [r5, #1932]
	mov	r0, #0
	mov	r1, #-2147483648
	blx	r3
	cmp	r0, #0
	bne	.L103
	ldr	r3, [r5, #512]
	orr	r3, r3, #65536
	str	r3, [r5, #512]
.L104:
	movw	r3, #:lower16:exynos_result_of_asv
	movt	r3, #:upper16:exynos_result_of_asv
	ldr	r3, [r3]
	cmp	r3, #1
	bls	.L105
	and	r2, r6, #31
	mov	r3, #0
	orr	r2, r2, #-2147483648
	movt	r3, 65048
	orr	r2, r2, #128
	str	r2, [r3, #1932]
.L105:
	movw	r6, #8200
	ldr	r9, [r9]
	movt	r6, 65048
	mov	r5, #0
	b	.L106
.L107:
	ldr	r3, [r6]
	add	r5, r5, #1
	orr	r3, r3, #4096
	str	r3, [r6], #128
.L106:
	ldr	r0, [r9]
	and	r0, r0, #15
	blx	r4
	cmp	r5, r0
	bcc	.L107
	mov	r3, #0
	add	r0, sp, #8
	mov	r2, r3
	movt	r3, 65048
	str	r2, [r3, #1536]
	blx	r7
	ldr	r3, [r8, #304]
	cmp	r3, #0
	bne	.L158
.L108:
	movw	r3, #:lower16:cpu_pm_exit
	movt	r3, #:upper16:cpu_pm_exit
	blx	r3
@ 26 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/irqflags.h" 1
		cpsie i			@ arch_local_irq_enable
@ 0 "" 2
	ldr	ip, [sp, #8]
	movw	r3, #16960
	ldr	r0, [sp]
	movt	r3, 15
	ldr	r1, [sp, #12]
	ldr	r2, [sp, #4]
	rsb	r0, r0, ip
	rsb	r2, r2, r1
	mla	r0, r3, r0, r2
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L156:
	movw	r3, #16383
	movt	r3, 65048
	ldr	r2, [r3, #-895]
	and	r2, r2, #7
	cmp	r2, #7
	beq	.L87
	ldr	r2, [r3, #-959]
	and	r2, r2, #7
	cmp	r2, #7
	beq	.L87
	ldr	r2, [r3, #-927]
	and	r2, r2, #7
	cmp	r2, #7
	beq	.L87
	ldr	r2, [r3, #-1023]
	and	r2, r2, #7
	cmp	r2, #7
	beq	.L87
	ldr	r2, [r3, #-991]
	and	r2, r2, #7
	cmp	r2, #7
	beq	.L87
	ldr	r3, [r3, #-799]
	and	r3, r3, #7
	cmp	r3, #7
	beq	.L87
	movw	r3, #:lower16:clock_domain_enabled
	mov	r0, #1
	movt	r3, #:upper16:clock_domain_enabled
	blx	r3
	cmp	r0, #0
	bne	.L87
	ldr	r3, [r6, #20]
	cmp	r3, #0
	beq	.L97
	movw	fp, #:lower16:printk
	ldr	r10, .L163
	movt	fp, #:upper16:printk
	mov	r9, #0
	b	.L119
.L94:
	cmp	r3, #1
	beq	.L159
.L120:
	ldr	r3, [r6, #20]
	add	r9, r9, #1
	add	r10, r10, #12
	cmp	r9, r3
	bcs	.L97
.L119:
	cmp	r9, r3
	bcs	.L160
	ldr	r3, [r10]
	cmp	r3, #0
	bne	.L94
	ldr	r3, [r10, #-8]
	ldr	r3, [r3, #44]
@ 297 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/cpuidle-exynos4.c" 1
	dsb
@ 0 "" 2
	ubfx	r3, r3, #2, #1
.L95:
	cmp	r3, #0
	beq	.L120
	b	.L87
.L154:
	bl	is_only_onlining_cpu
	b	.L82
.L103:
	movw	r3, #:lower16:flush_tlb_all
	movt	r3, #:upper16:flush_tlb_all
	blx	r3
	movw	r3, #:lower16:cpu_init
	movt	r3, #:upper16:cpu_init
	blx	r3
@ 73 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cp15.h" 1
	mrc p15, 0, r3, c1, c0, 2 @ get copro access
@ 0 "" 2
	orr	r3, r3, #15728640
@ 80 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cp15.h" 1
	mcr p15, 0, r3, c1, c0, 2 @ set copro access
@ 0 "" 2
@ 82 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cp15.h" 1
	isb
@ 0 "" 2
	b	.L104
.L159:
	ldr	r3, [r10, #-8]
	ldr	r3, [r3, #72]
@ 302 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/cpuidle-exynos4.c" 1
	dsb
@ 0 "" 2
	tst	r3, #1536
	moveq	r3, #0
	movne	r3, #1
	b	.L95
.L97:
	ldr	r3, [r8, #252]
	ldr	r3, [r3]
	tst	r3, #786432
	bne	.L87
	movw	r3, #:lower16:bt_is_running
	movt	r3, #:upper16:bt_is_running
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L87
	ldr	r3, [r6, #52]
	movw	r6, #:lower16:.LANCHOR0
	movt	r6, #:upper16:.LANCHOR0
	cmp	r3, #0
	bne	.L87
	movw	r3, #:lower16:exynos4_check_usb_op
	movt	r3, #:upper16:exynos4_check_usb_op
	blx	r3
	cmp	r0, #0
	bne	.L87
	ldr	r3, [r6]
	cmp	r3, #0
	bne	.L161
	movw	r3, #:lower16:s3c_pm_do_save
	ldr	r0, .L163+4
	movt	r3, #:upper16:s3c_pm_do_save
	mov	r1, #10
	movw	r10, #:lower16:s3c_pm_do_restore_core
	movw	r8, #:lower16:bt_uart_rts_ctrl
	blx	r3
	movt	r10, #:upper16:s3c_pm_do_restore_core
	mov	r1, #9
	ldr	r0, .L163+8
	movt	r8, #:upper16:bt_uart_rts_ctrl
	blx	r10
	mov	r0, #1
	blx	r8
@ 35 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/irqflags.h" 1
		cpsid i			@ arch_local_irq_disable
@ 0 "" 2
	movw	r3, #:lower16:cpu_pm_enter
	movw	r7, #:lower16:do_gettimeofday
	movt	r3, #:upper16:cpu_pm_enter
	movt	r7, #:upper16:do_gettimeofday
	blx	r3
	mov	r0, sp
	blx	r7
	mov	r2, #0
	movw	r3, #:lower16:exynos4_sleep_gpio_table_set
	mov	r1, r2
	movt	r3, #:upper16:exynos4_sleep_gpio_table_set
	movt	r2, 65048
	movt	r1, 1023
	str	r1, [r2, #1544]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L162
	blx	r3
.L109:
	mov	r2, #0
	mov	r5, #3344
	mov	r1, r2
	mov	lr, r2
	movt	r1, 65089
	movt	r2, 65048
	movt	r5, 64698
	movt	lr, 43949
	movw	ip, #:lower16:exynos4_idle_resume
	movw	r3, #:lower16:exynos4_sys_powerdown_conf
	movw	r9, #:lower16:cpu_possible_mask
	movt	ip, #:upper16:exynos4_idle_resume
	movt	r3, #:upper16:exynos4_sys_powerdown_conf
	mov	r0, #1
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	ip, ip, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	movt	r9, #:upper16:cpu_possible_mask
	str	ip, [r2, #2048]
	movw	r6, #8200
	str	ip, [r1, #36]
	movw	r4, #:lower16:__sw_hweight32
	str	r5, [r1, #32]
	str	lr, [r2, #2052]
	movt	r6, 65048
	blx	r3
	movt	r4, #:upper16:__sw_hweight32
	ldr	fp, [r9]
	mov	r5, #0
	b	.L111
.L112:
	ldr	r3, [r6]
	add	r5, r5, #1
	bic	r3, r3, #4096
	str	r3, [r6], #128
.L111:
	ldr	r0, [fp]
	and	r0, r0, #15
	blx	r4
	cmp	r5, r0
	bcc	.L112
	mov	r3, #0
	movt	r3, 64770
.L114:
	ldr	r0, [r3, #24]
	ubfx	r0, r0, #16, #8
	cmp	r0, #0
	bne	.L114
	mov	r5, #0
	mov	r2, #131
	movt	r5, 65048
	movt	r2, 32768
	movw	r3, #:lower16:exynos4_enter_lp
	ldr	fp, [r5, #1932]
	movt	r3, #:upper16:exynos4_enter_lp
	ldr	r6, [r5, #1920]
	mov	r1, #-2147483648
	str	r2, [r5, #1932]
	str	r2, [r5, #1920]
	and	fp, fp, #31
	blx	r3
	cmp	r0, #0
	and	r6, r6, #31
	bne	.L115
	ldr	r3, [r5, #512]
	orr	r3, r3, #65536
	str	r3, [r5, #512]
.L116:
	ldr	r0, .L163+4
	mov	r1, #10
	blx	r10
	orr	r6, r6, #-2147483648
	orr	fp, fp, #-2147483648
	mov	r3, #0
	orr	r2, r6, #128
	movt	r3, 65048
	orr	fp, fp, #128
	movw	r6, #8200
	str	fp, [r3, #1932]
	ldr	r9, [r9]
	movt	r6, 65048
	str	r2, [r3, #1920]
	mov	r5, #0
	b	.L117
.L118:
	ldr	r3, [r6]
	add	r5, r5, #1
	orr	r3, r3, #4096
	str	r3, [r6], #128
.L117:
	ldr	r0, [r9]
	and	r0, r0, #15
	blx	r4
	cmp	r5, r0
	bcc	.L118
	mov	r3, #0
	add	r0, sp, #8
	mov	r2, r3
	movt	r3, 65048
	str	r2, [r3, #1536]
	str	r2, [r3, #1544]
	blx	r7
	movw	r3, #:lower16:cpu_pm_exit
	movt	r3, #:upper16:cpu_pm_exit
	blx	r3
@ 26 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/irqflags.h" 1
		cpsie i			@ arch_local_irq_enable
@ 0 "" 2
	ldr	ip, [sp]
	movw	r3, #16960
	ldr	r1, [sp, #12]
	movt	r3, 15
	ldr	r4, [sp, #8]
	mov	r0, #0
	ldr	r2, [sp, #4]
	rsb	r4, ip, r4
	rsb	r2, r2, r1
	mla	r4, r3, r4, r2
	blx	r8
	mov	r0, r4
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L115:
	movw	r3, #:lower16:flush_tlb_all
	movt	r3, #:upper16:flush_tlb_all
	blx	r3
	movw	r3, #:lower16:cpu_init
	movt	r3, #:upper16:cpu_init
	blx	r3
@ 73 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cp15.h" 1
	mrc p15, 0, r3, c1, c0, 2 @ get copro access
@ 0 "" 2
	orr	r3, r3, #15728640
@ 80 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cp15.h" 1
	mcr p15, 0, r3, c1, c0, 2 @ set copro access
@ 0 "" 2
@ 82 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cp15.h" 1
	isb
@ 0 "" 2
	movw	r3, #16383
	mov	r2, #268435456
	movt	r3, 65048
	str	r2, [r3, #-3831]
	str	r2, [r3, #-3799]
	str	r2, [r3, #-3767]
	str	r2, [r3, #-3735]
	str	r2, [r3, #-3703]
	str	r2, [r3, #-3671]
	b	.L116
.L162:
	mov	r0, #512
	movt	r3, 65056
	mov	lr, r0
	movw	ip, #65535
	movt	r0, 65056
	movt	lr, 65060
.L125:
	str	ip, [r3, #16]
	add	r3, r3, #32
	ldr	r2, [r3, #-24]
	movw	r1, #65535
	str	r2, [r3, #-12]
	cmp	r3, r0
	beq	.L126
	cmp	r3, lr
	bls	.L125
	mov	r3, #0
	movt	r3, 65064
	str	r1, [r3, #16]
	ldr	r2, [r3, #8]
	str	r2, [r3, #20]
	b	.L109
.L126:
	mov	r3, #0
	movt	r3, 65060
	b	.L125
.L161:
	movw	r0, #:lower16:.LC6
	movw	r1, #:lower16:.LANCHOR3
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR3
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC6
	blx	r3
	b	.L87
.L158:
	movw	r0, #:lower16:.LC8
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC8
	blx	r3
	b	.L108
.L160:
	movw	r0, #:lower16:.LC5
	mov	r1, r9
	movt	r0, #:upper16:.LC5
	blx	fp
	b	.L120
.L155:
@ 970 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/cpuidle-exynos4.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/cpuidle-exynos4.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 970, 0
.popsection
@ 0 "" 2
.L157:
	movw	r0, #:lower16:.LC7
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC7
	blx	r3
	b	.L123
.L164:
	.align	2
.L163:
	.word	.LANCHOR1+224
	.word	.LANCHOR1+308
	.word	.LANCHOR1+388
	.fnend
	.size	exynos4_enter_lowpower, .-exynos4_enter_lowpower
	.align	2
	.type	exynos4_cpuidle_cpufreq_policy_notifier_event, %function
exynos4_cpuidle_cpufreq_policy_notifier_event:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	subs	r5, r1, #0
	mov	r4, r2
	beq	.L172
.L166:
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
.L172:
	movw	r1, #:lower16:.LC9
	movw	r3, #:lower16:strnicmp
	ldr	r0, [r2, #44]
	movt	r1, #:upper16:.LC9
	movt	r3, #:upper16:strnicmp
	mov	r2, #16
	blx	r3
	cmp	r0, #0
	bne	.L168
	movw	r5, #:lower16:.LANCHOR0
	movt	r5, #:upper16:.LANCHOR0
	ldrb	r3, [r5, #32]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L166
	movw	r3, #:lower16:_raw_spin_lock
	add	r0, r5, #24
	movt	r3, #:upper16:_raw_spin_lock
	blx	r3
	movw	r3, #:lower16:_raw_spin_unlock
	mov	r2, #1
	add	r0, r5, #24
	movt	r3, #:upper16:_raw_spin_unlock
	strb	r2, [r5, #32]
	blx	r3
	movw	r0, #:lower16:.LC10
	movw	r3, #:lower16:printk
	ldr	r1, [r4, #44]
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC10
	blx	r3
	b	.L166
.L168:
	movw	r6, #:lower16:.LANCHOR0
	movt	r6, #:upper16:.LANCHOR0
	ldrb	r3, [r6, #32]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L166
	movw	r3, #:lower16:_raw_spin_lock
	add	r0, r6, #24
	movt	r3, #:upper16:_raw_spin_lock
	blx	r3
	movw	r3, #:lower16:_raw_spin_unlock
	add	r0, r6, #24
	movt	r3, #:upper16:_raw_spin_unlock
	strb	r5, [r6, #32]
	blx	r3
	movw	r0, #:lower16:.LC11
	movw	r3, #:lower16:printk
	ldr	r1, [r4, #44]
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC11
	blx	r3
	b	.L166
	.fnend
	.size	exynos4_cpuidle_cpufreq_policy_notifier_event, .-exynos4_cpuidle_cpufreq_policy_notifier_event
	.align	2
	.global	set_gps_uart_op
	.type	set_gps_uart_op, %function
set_gps_uart_op:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movw	r3, #:lower16:.LC12
	mov	r4, r0
	movt	r3, #:upper16:.LC12
	cmp	r4, #0
	movw	r2, #:lower16:.LC13
	movt	r2, #:upper16:.LC13
	movw	r0, #:lower16:.LC14
	movne	r2, r3
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC14
	ldr	r1, .L176
	blx	r3
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	str	r4, [r3, #52]
	ldmfd	sp!, {r4, pc}
.L177:
	.align	2
.L176:
	.word	.LANCHOR3+24
	.fnend
	.size	set_gps_uart_op, .-set_gps_uart_op
	.align	2
	.global	exynos4_flush_cache
	.type	exynos4_flush_cache, %function
exynos4_flush_cache:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r4, #:lower16:outer_cache
	movt	r4, #:upper16:outer_cache
	mov	r5, r1
	sub	r2, r0, #64
	add	r1, r0, #64
	ldr	r3, [r4, #4]
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	r0, r2, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	r1, r1, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	cmp	r3, #0
	beq	.L181
	blx	r3
	ldr	r2, [r4, #4]
	movw	r3, #:lower16:cpu_resume
	movt	r3, #:upper16:cpu_resume
	add	r1, r3, #64
	cmp	r2, #0
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	r1, r1, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	r0, r3, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	beq	.L181
	blx	r2
	ldr	r2, [r4, #4]
	add	r1, r5, #65280
	add	r1, r1, #255
	cmp	r2, #0
	beq	.L181
	mov	r0, r5
	blx	r2
.L181:
	movw	r3, #:lower16:cpu_cache
	movt	r3, #:upper16:cpu_cache
	ldr	r3, [r3, #4]
	blx	r3
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	exynos4_flush_cache, .-exynos4_flush_cache
	.global	log_en
	.global	use_clock_down
	.section	.rodata
	.align	2
	.set	.LANCHOR3,. + 0
	.type	__func__.22052, %object
	.size	__func__.22052, 24
__func__.22052:
	.ascii	"exynos4_check_operation\000"
	.type	__func__.22034, %object
	.size	__func__.22034, 16
__func__.22034:
	.ascii	"set_gps_uart_op\000"
	.type	__param_str_enable_mask, %object
	.size	__param_str_enable_mask, 28
__param_str_enable_mask:
	.ascii	"cpuidle-exynos4.enable_mask\000"
	.type	__param_str_log_en, %object
	.size	__param_str_log_en, 23
__param_str_log_en:
	.ascii	"cpuidle-exynos4.log_en\000"
	.section	.data..percpu,"aw",%progbits
	.align	3
	.set	.LANCHOR2,. + 0
	.type	exynos4_cpuidle_device, %object
	.size	exynos4_cpuidle_device, 896
exynos4_cpuidle_device:
	.space	896
	.section	.initcall6.init,"aw",%progbits
	.align	2
	.type	__initcall_exynos4_init_cpuidle6, %object
	.size	__initcall_exynos4_init_cpuidle6, 4
__initcall_exynos4_init_cpuidle6:
	.word	exynos4_init_cpuidle
	.data
	.align	3
	.set	.LANCHOR1,. + 0
	.type	exynos4_idle_driver, %object
	.size	exynos4_idle_driver, 20
exynos4_idle_driver:
	.ascii	"exynos4_idle\000"
	.space	3
	.word	0
	.space	4
	.type	exynos4_cpuidle_set, %object
	.size	exynos4_cpuidle_set, 192
exynos4_cpuidle_set:
	.ascii	"IDLE\000"
	.space	11
	.ascii	"ARM clock gating(WFI)\000"
	.space	10
	.space	4
	.word	1
	.word	1
	.space	4
	.word	10000
	.space	20
	.word	exynos4_enter_idle
	.space	4
	.ascii	"LOW_POWER\000"
	.space	6
	.ascii	"ARM power down\000"
	.space	17
	.space	4
	.word	1
	.word	300
	.space	4
	.word	10000
	.space	20
	.word	exynos4_enter_lowpower
	.space	4
	.type	chk_sdhc_op, %object
	.size	chk_sdhc_op, 36
chk_sdhc_op:
	.word	0
	.word	s3c_device_mshci
	.word	1
	.word	0
	.word	s3c_device_hsmmc2
	.word	0
	.word	0
	.word	s3c_device_hsmmc3
	.word	0
	.type	chk_usbotg_op, %object
	.size	chk_usbotg_op, 12
chk_usbotg_op:
	.word	0
	.word	s3c_device_usbgadget
	.word	0
	.type	exynos4_cpuidle_notifier, %object
	.size	exynos4_cpuidle_notifier, 12
exynos4_cpuidle_notifier:
	.word	exynos4_cpuidle_notifier_event
	.space	8
	.type	exynos4_cpuidle_cpu_notifier, %object
	.size	exynos4_cpuidle_cpu_notifier, 12
exynos4_cpuidle_cpu_notifier:
	.word	exynos4_cpuidle_cpu_notifier_event
	.space	8
	.type	exynos4_cpuidle_cpufreq_policy_notifier, %object
	.size	exynos4_cpuidle_cpufreq_policy_notifier, 12
exynos4_cpuidle_cpufreq_policy_notifier:
	.word	exynos4_cpuidle_cpufreq_policy_notifier_event
	.space	8
	.type	enable_mask, %object
	.size	enable_mask, 4
enable_mask:
	.word	2
	.type	log_en, %object
	.size	log_en, 4
log_en:
	.word	1
	.type	exynos4_lpa_save, %object
	.size	exynos4_lpa_save, 80
exynos4_lpa_save:
	.word	-32455920
	.space	4
	.word	-32455904
	.space	4
	.word	-32455900
	.space	4
	.word	-32455884
	.space	4
	.word	-32455880
	.space	4
	.word	-32455876
	.space	4
	.word	-32455872
	.space	4
	.word	-32455856
	.space	4
	.word	-32455852
	.space	4
	.word	-32439552
	.space	4
	.type	exynos4_set_clksrc, %object
	.size	exynos4_set_clksrc, 72
exynos4_set_clksrc:
	.word	-32455920
	.word	1
	.word	-32455904
	.word	286331153
	.word	-32455900
	.word	273
	.word	-32455884
	.word	4369
	.word	-32455876
	.word	1
	.word	-32455872
	.word	16847121
	.word	-32455856
	.word	17895697
	.word	-32455852
	.word	17891601
	.word	-32439552
	.word	65536
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<6>Exynos4 : ARM Clock down on idle mode is enabled"
	.ascii	"\012\000"
	.space	3
.LC1:
	.ascii	"<3>exynos4 idle register driver failed\012\000"
.LC2:
	.ascii	"<3>CPUidle register device failed\012,\000"
.LC3:
	.ascii	"<3>failed to get iomem region\012\000"
	.space	1
.LC4:
	.ascii	"<3>failed to map io region\012\000"
.LC5:
	.ascii	"<3>Invalid ch[%d] for SD/MMC\012\000"
	.space	2
.LC6:
	.ascii	"<6>%s: SROMC is in use!!!\012\000"
	.space	1
.LC7:
	.ascii	"<6>+++aftr\012\000"
.LC8:
	.ascii	"<6>---aftr\012\000"
.LC9:
	.ascii	"ondemand\000"
	.space	3
.LC10:
	.ascii	"<6>Include onlining cpu's for SW_CLK_DWN. Current g"
	.ascii	"overnor: %s\012\000"
.LC11:
	.ascii	"<6>Exclude onlining cpu's for SW_CLK_DWN. Current g"
	.ascii	"overnor: %s\012\000"
.LC12:
	.ascii	"on\000"
	.space	1
.LC13:
	.ascii	"off\000"
.LC14:
	.ascii	"<6>%s: %s\012\000"
	.section	___ksymtab+set_sromc_access,"a",%progbits
	.align	2
	.type	__ksymtab_set_sromc_access, %object
	.size	__ksymtab_set_sromc_access, 8
__ksymtab_set_sromc_access:
	.word	set_sromc_access
	.word	__kstrtab_set_sromc_access
	.section	__param,"a",%progbits
	.align	2
	.type	__param_enable_mask, %object
	.size	__param_enable_mask, 16
__param_enable_mask:
	.word	__param_str_enable_mask
	.word	param_ops_uint
	.short	420
	.short	-1
	.word	enable_mask
	.type	__param_log_en, %object
	.size	__param_log_en, 16
__param_log_en:
	.word	__param_str_log_en
	.word	param_ops_uint
	.short	420
	.short	-1
	.word	log_en
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	sromc_use_count, %object
	.size	sromc_use_count, 4
sromc_use_count:
	.space	4
	.type	online_lock, %object
	.size	online_lock, 8
online_lock:
	.space	8
	.type	n_onlining_cpus_impl, %object
	.size	n_onlining_cpus_impl, 4
n_onlining_cpus_impl:
	.space	4
	.type	use_clock_down, %object
	.size	use_clock_down, 4
use_clock_down:
	.space	4
	.type	sdmmc_dev_num, %object
	.size	sdmmc_dev_num, 4
sdmmc_dev_num:
	.space	4
	.type	onlining_lock, %object
	.size	onlining_lock, 8
onlining_lock:
	.space	8
	.type	include_onlining_cpus, %object
	.size	include_onlining_cpus, 1
include_onlining_cpus:
	.space	1
	.space	3
	.type	idle_lock, %object
	.size	idle_lock, 8
idle_lock:
	.space	8
	.type	cpu_core, %object
	.size	cpu_core, 4
cpu_core:
	.space	4
	.type	old_div, %object
	.size	old_div, 4
old_div:
	.space	4
	.type	gps_is_running, %object
	.size	gps_is_running, 4
gps_is_running:
	.space	4
	.section	__ksymtab_strings,"a",%progbits
	.type	__kstrtab_set_sromc_access, %object
	.size	__kstrtab_set_sromc_access, 17
__kstrtab_set_sromc_access:
	.ascii	"set_sromc_access\000"
	.ident	"GCC: (GNU) 4.8"
