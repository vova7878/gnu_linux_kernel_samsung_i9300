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
	.file	"stand-hotplug.c"
	.text
	.align	2
	.type	hotplug_reboot_notifier_call, %function
hotplug_reboot_notifier_call:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	movw	r3, #:lower16:mutex_lock
	mov	r0, r4
	movt	r3, #:upper16:mutex_lock
	blx	r3
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LANCHOR1
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR1
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	movw	r2, #:lower16:.LANCHOR2
	movw	r3, #:lower16:mutex_unlock
	mov	r0, r4
	movt	r2, #:upper16:.LANCHOR2
	mov	r1, #1
	movt	r3, #:upper16:mutex_unlock
	str	r1, [r2]
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	hotplug_reboot_notifier_call, .-hotplug_reboot_notifier_call
	.align	2
	.type	exynos4_pm_hotplug_init, %function
exynos4_pm_hotplug_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r0, #:lower16:.LC1
	movw	r6, #:lower16:printk
	.pad #8
	sub	sp, sp, #8
	movt	r0, #:upper16:.LC1
	movt	r6, #:upper16:printk
	blx	r6
	mov	r4, #0
	movw	r0, #:lower16:.LC2
	movw	ip, #:lower16:__alloc_workqueue_key
	str	r4, [sp]
	mov	r1, r4
	mov	r2, r4
	mov	r3, r4
	movt	r0, #:upper16:.LC2
	movt	ip, #:upper16:__alloc_workqueue_key
	movw	r5, #:lower16:.LANCHOR2
	blx	ip
	cmp	r0, r4
	movt	r5, #:upper16:.LANCHOR2
	str	r0, [r5, #4]
	beq	.L16
	add	lr, r5, #12
	movw	ip, #:lower16:hotplug_timer
	movw	r3, #:lower16:init_timer_key
	movt	ip, #:upper16:hotplug_timer
	str	lr, [r5, #12]
	movt	r3, #:upper16:init_timer_key
	str	lr, [r5, #16]
	add	r0, r5, #24
	mov	r1, r4
	mov	r2, r4
	mov	r6, #1280
	str	ip, [r5, #20]
	str	r6, [r5, #8]
	blx	r3
	movw	ip, #:lower16:queue_delayed_work_on
	ldr	r1, [r5, #4]
	movt	ip, #:upper16:queue_delayed_work_on
	add	r2, r5, #8
	movw	r3, #18000
	mov	r0, r4
	blx	ip
	movw	r3, #:lower16:cpufreq_frequency_get_table
	mov	r0, r4
	movt	r3, #:upper16:cpufreq_frequency_get_table
	blx	r3
	ldr	ip, [r0, #4]
	cmn	ip, #2
	beq	.L5
	movw	r1, #:lower16:.LANCHOR0
	mov	lr, r0
	movt	r1, #:upper16:.LANCHOR0
	ldr	r2, [r1, #24]
.L8:
	adds	r3, ip, #1
	movne	r3, #1
	cmn	ip, #1
	cmpne	r4, ip
	movcc	r4, ip
	bcc	.L6
	cmp	r3, #0
	beq	.L6
	cmp	r2, ip
	movcs	r2, ip
.L6:
	add	lr, lr, #8
	ldr	ip, [lr, #4]
	cmn	ip, #2
	bne	.L8
	movw	r3, #:lower16:cpu_possible_mask
	str	r2, [r1, #24]
	movt	r3, #:upper16:cpu_possible_mask
	ldr	r3, [r3]
	ldr	r0, [r3]
	and	r0, r0, #15
.L9:
	movw	r3, #:lower16:__sw_hweight32
	movt	r3, #:upper16:__sw_hweight32
	blx	r3
	mul	r4, r0, r4
	movw	r3, #:lower16:register_pm_notifier
	movt	r3, #:upper16:register_pm_notifier
	ldr	r0, .L17
	str	r4, [r5, #52]
	blx	r3
	movw	r3, #:lower16:register_reboot_notifier
	ldr	r0, .L17+4
	movt	r3, #:upper16:register_reboot_notifier
	blx	r3
	movw	r3, #:lower16:cpufreq_register_notifier
	ldr	r0, .L17+8
	movt	r3, #:upper16:cpufreq_register_notifier
	mov	r1, #1
	blx	r3
	mov	r0, #0
.L14:
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, pc}
.L5:
	movw	r3, #:lower16:cpu_possible_mask
	movt	r3, #:upper16:cpu_possible_mask
	ldr	r3, [r3]
	ldr	r0, [r3]
	and	r0, r0, #15
	b	.L9
.L16:
	movw	r0, #:lower16:.LC3
	movt	r0, #:upper16:.LC3
	blx	r6
	mvn	r0, #13
	b	.L14
.L18:
	.align	2
.L17:
	.word	.LANCHOR0+28
	.word	.LANCHOR0+40
	.word	.LANCHOR0+52
	.fnend
	.size	exynos4_pm_hotplug_init, .-exynos4_pm_hotplug_init
	.align	2
	.type	pm_hotplug_cpufreq_policy_notifier_call, %function
pm_hotplug_cpufreq_policy_notifier_call:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r2
	beq	.L26
.L20:
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
.L26:
	movw	r1, #:lower16:.LC4
	movw	r3, #:lower16:strnicmp
	ldr	r0, [r2, #44]
	movt	r1, #:upper16:.LC4
	movt	r3, #:upper16:strnicmp
	mov	r2, #16
	blx	r3
	subs	r6, r0, #0
	movw	r5, #:lower16:.LANCHOR0
	movt	r5, #:upper16:.LANCHOR0
	bne	.L22
	ldrb	r3, [r5, #64]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L20
	movw	r0, #:lower16:.LC5
	movw	r3, #:lower16:printk
	ldr	r1, [r4, #44]
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC5
	blx	r3
	movw	r3, #:lower16:mutex_lock
	mov	r0, r5
	movt	r3, #:upper16:mutex_lock
	blx	r3
	movw	r3, #:lower16:mutex_unlock
	mov	r0, r5
	movt	r3, #:upper16:mutex_unlock
	strb	r6, [r5, #64]
	blx	r3
	b	.L20
.L22:
	ldrb	r6, [r5, #64]	@ zero_extendqisi2
	cmp	r6, #0
	bne	.L20
	movw	r0, #:lower16:.LC6
	movw	r3, #:lower16:printk
	ldr	r1, [r4, #44]
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC6
	blx	r3
	movw	r3, #:lower16:mutex_lock
	mov	r0, r5
	movt	r3, #:upper16:mutex_lock
	blx	r3
	movw	r2, #:lower16:.LANCHOR2
	movw	ip, #:lower16:queue_delayed_work_on
	movt	r2, #:upper16:.LANCHOR2
	mov	lr, #1
	ldr	r1, [r2, #4]
	mov	r0, r6
	ldr	r3, [r5, #68]
	add	r2, r2, #8
	movt	ip, #:upper16:queue_delayed_work_on
	strb	lr, [r5, #64]
	blx	ip
	movw	r3, #:lower16:mutex_unlock
	mov	r0, r5
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	b	.L20
	.fnend
	.size	pm_hotplug_cpufreq_policy_notifier_call, .-pm_hotplug_cpufreq_policy_notifier_call
	.align	2
	.type	exynos4_pm_hotplug_notifier_event, %function
exynos4_pm_hotplug_notifier_event:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #4
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	beq	.L29
	cmp	r1, #6
	beq	.L29
	cmp	r1, #3
	beq	.L39
	mov	r0, #0
	ldmfd	sp!, {r4, pc}
.L39:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:mutex_lock
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:mutex_lock
	blx	r3
	movw	r3, #:lower16:.LANCHOR2
	movw	r0, #:lower16:.LC7
	movt	r3, #:upper16:.LANCHOR2
	movw	ip, #:lower16:printk
	ldr	lr, [r3]
	mov	r4, #1
	movt	ip, #:upper16:printk
	ldr	r1, .L40
	movt	r0, #:upper16:.LC7
	str	r4, [r3]
	mov	r2, lr
	str	lr, [r3, #56]
	blx	ip
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:mutex_unlock
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	mov	r0, r4
	ldmfd	sp!, {r4, pc}
.L29:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:mutex_lock
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:mutex_lock
	movw	r4, #:lower16:.LANCHOR2
	blx	r3
	movt	r4, #:upper16:.LANCHOR2
	movw	r0, #:lower16:.LC8
	movw	r3, #:lower16:printk
	ldr	r2, [r4, #56]
	ldr	r1, .L40
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC8
	blx	r3
	ldr	r2, [r4, #56]
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:mutex_unlock
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:mutex_unlock
	str	r2, [r4]
	blx	r3
	mov	r0, #1
	ldmfd	sp!, {r4, pc}
.L41:
	.align	2
.L40:
	.word	.LANCHOR1+32
	.fnend
	.size	exynos4_pm_hotplug_notifier_event, .-exynos4_pm_hotplug_notifier_event
	.align	2
	.type	exynos4_pm_hotplug_device_init, %function
exynos4_pm_hotplug_device_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:.LANCHOR0
	movw	r2, #:lower16:platform_device_register
	movt	r3, #:upper16:.LANCHOR0
	mov	r1, #1
	add	r0, r3, #72
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movt	r2, #:upper16:platform_device_register
	strb	r1, [r3, #64]
	blx	r2
	subs	r4, r0, #0
	movwne	r0, #:lower16:.LC9
	movwne	r3, #:lower16:printk
	movweq	r0, #:lower16:.LC10
	movweq	r3, #:lower16:printk
	movtne	r0, #:upper16:.LC9
	movtne	r3, #:upper16:printk
	movwne	r1, #463
	movteq	r0, #:upper16:.LC10
	movteq	r3, #:upper16:printk
	moveq	r1, r4
	blx	r3
	mov	r0, r4
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	exynos4_pm_hotplug_device_init, .-exynos4_pm_hotplug_device_init
	.align	2
	.global	hotplug_out_chk
	.type	hotplug_out_chk, %function
hotplug_out_chk:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #1
	bls	.L49
	cmp	r2, r1
	bcc	.L48
	movw	r2, #:lower16:.LANCHOR0
	movt	r2, #:upper16:.LANCHOR0
	ldr	r2, [r2, #24]
	cmp	r2, r3
	bcs	.L48
.L49:
	mov	r0, #0
	bx	lr
.L48:
	mov	r0, #1
	bx	lr
	.fnend
	.size	hotplug_out_chk, .-hotplug_out_chk
	.global	__aeabi_uidiv
	.align	2
	.type	hotplug_timer, %function
hotplug_timer:
	.fnstart
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r5, #:lower16:.LANCHOR0
	movt	r5, #:upper16:.LANCHOR0
	movw	r3, #:lower16:mutex_lock
	.pad #76
	sub	sp, sp, #76
	movt	r3, #:upper16:mutex_lock
	mov	r0, r5
	str	r5, [sp, #16]
	blx	r3
	ldrb	r3, [r5, #64]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L81
	movw	r8, #:lower16:.LANCHOR2
	movt	r8, #:upper16:.LANCHOR2
	ldr	r3, [r8]
	str	r8, [sp, #24]
	cmp	r3, #1
	beq	.L54
	movw	r3, #:lower16:cpu_online_mask
	mvn	r5, #0
	movt	r3, #:upper16:cpu_online_mask
	mov	r8, #0
	ldr	fp, [r3]
	movw	r3, #:lower16:__per_cpu_offset
	movt	r3, #:upper16:__per_cpu_offset
	str	r5, [sp, #20]
	str	r8, [sp, #28]
	movw	r7, #:lower16:nr_cpu_ids
	movw	r8, #:lower16:_find_next_bit_le
	movw	r5, #:lower16:get_cpu_idle_time_us
	movt	r5, #:upper16:get_cpu_idle_time_us
	str	r3, [sp]
	movw	ip, #:lower16:__aeabi_uidiv
	movw	r3, #:lower16:get_cpu_nr_running
	mvn	r4, #0
	mov	r6, #0
	movt	r8, #:upper16:_find_next_bit_le
	movt	r7, #:upper16:nr_cpu_ids
	str	r5, [sp, #4]
	movt	ip, #:upper16:__aeabi_uidiv
	movt	r3, #:upper16:get_cpu_nr_running
	movw	r5, #:lower16:.LANCHOR3
	movt	r5, #:upper16:.LANCHOR3
	str	ip, [sp, #8]
	str	r3, [sp, #12]
.L57:
	add	r2, r4, #1
	mov	r1, #4
	mov	r0, fp
	blx	r8
	ldr	r3, [r7]
	mov	r4, r0
	add	r1, sp, #32
	cmp	r3, r0
	ble	.L82
	ldr	ip, [sp]
	ldr	r3, [sp, #4]
	ldr	r10, [ip, r4, asl #2]
	blx	r3
	mov	lr, #100
	add	r9, r5, r10
	ldr	r2, [r5, r10]
	str	r0, [r5, r10]
	str	r1, [r9, #4]
	ldr	r3, [sp, #32]
	rsb	r2, r2, r0
	ldr	r1, [r9, #8]
	ldr	ip, [sp, #36]
	str	r3, [r9, #8]
	rsb	r3, r1, r3
	cmp	r2, r3
	rsb	r0, r2, r3
	mov	r1, r3
	mul	r0, lr, r0
	str	ip, [r9, #12]
	bhi	.L54
	ldr	ip, [sp, #8]
	blx	ip
	mov	r3, r0
	mov	r0, r4
	str	r3, [r9, #16]
	add	r6, r6, r3
	ldr	r3, [sp, #12]
	blx	r3
	cmp	r4, #0
	beq	.L57
	ldr	ip, [sp, #20]
	cmp	ip, r0
	strhi	r0, [sp, #20]
	strhi	r4, [sp, #28]
	b	.L57
.L84:
	movw	r2, #19923
	movw	r3, #:lower16:__aeabi_uidiv
	movt	r2, 4194
	mov	r1, r9
	umull	r0, r8, r2, r8
	movt	r3, #:upper16:__aeabi_uidiv
	sub	r9, r7, #1
	mov	r8, r8, lsr #6
	mul	r0, r6, r8
	blx	r3
	add	r1, sp, #72
	mov	r6, r0
	add	r9, r1, r9, asl #3
	mov	r0, r7
	mov	r3, r8
	mov	r2, r6
	ldr	r1, [r9, #-40]
	bl	hotplug_out_chk
	cmp	r0, #0
	beq	.L83
.L64:
	ldr	ip, [sp, #28]
	cmp	ip, #0
	add	r2, ip, #31
	movge	r2, ip
	and	r3, ip, #31
	mov	r2, r2, asr #5
	ldr	r2, [fp, r2, asl #2]
	mov	r3, r2, lsr r3
	tst	r3, #1
	beq	.L54
	movw	r0, #:lower16:.LC15
	movw	r4, #:lower16:printk
	ldr	r1, [sp, #28]
	movt	r4, #:upper16:printk
	movt	r0, #:upper16:.LC15
	blx	r4
	movw	r3, #:lower16:cpu_down
	ldr	r0, [sp, #28]
	movt	r3, #:upper16:cpu_down
	blx	r3
	movw	r0, #:lower16:.LC16
	ldr	r1, [sp, #28]
	movt	r0, #:upper16:.LC16
	blx	r4
	ldr	r8, [sp, #16]
	mov	r3, #150
	str	r3, [r8, #68]
.L54:
	ldr	r5, [sp, #24]
	movw	ip, #:lower16:queue_delayed_work_on
	ldr	r8, [sp, #16]
	movt	ip, #:upper16:queue_delayed_work_on
	mov	r0, #0
	ldr	r2, .L85
	ldr	r1, [r5, #4]
	ldr	r3, [r8, #68]
	blx	ip
.L52:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:mutex_unlock
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	add	sp, sp, #76
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L82:
	movw	r3, #:lower16:cpu_possible_mask
	movw	r7, #:lower16:__sw_hweight32
	movt	r3, #:upper16:cpu_possible_mask
	movt	r7, #:upper16:__sw_hweight32
	ldr	r3, [r3]
	ldr	r0, [r3]
	and	r0, r0, #15
	blx	r7
	sub	r4, r0, #1
	cmp	r4, #0
	mov	r3, r4
	ble	.L71
	mov	r1, r4, asr #5
	and	r2, r4, #31
	ldr	r1, [fp, r1, asl #2]
	mov	r2, r1, lsr r2
	tst	r2, #1
	bne	.L60
	b	.L59
.L62:
	ldr	r1, [fp, r1, asl #2]
	mov	r2, r1, lsr r2
	tst	r2, #1
	beq	.L80
.L60:
	subs	r3, r3, #1
	mov	r1, r3, asr #5
	and	r2, r3, #31
	bne	.L62
.L80:
	mov	r4, r3
.L59:
	ldr	r5, [sp, #16]
	mov	r9, #0
	ldr	r8, [sp, #16]
	movw	r1, #:lower16:.LC12
	movw	r3, #:lower16:clk_get
	movt	r1, #:upper16:.LC12
	ldr	ip, [r5, #440]
	movt	r3, #:upper16:clk_get
	ldr	r0, [r5, #432]
	ldr	r2, [r5, #436]
	ldr	lr, [r5, #444]
	str	ip, [sp, #44]
	ldr	r5, [r5, #448]
	ldr	ip, [r8, #452]
	str	r0, [sp, #36]
	mov	r0, r9
	str	r2, [sp, #40]
	mov	r2, #100
	str	lr, [sp, #48]
	str	ip, [sp, #56]
	str	r2, [sp, #60]
	str	r5, [sp, #52]
	movw	r5, #:lower16:.LANCHOR0
	str	r9, [sp, #32]
	movt	r5, #:upper16:.LANCHOR0
	str	r9, [sp, #64]
	str	r9, [sp, #68]
	blx	r3
	movw	r3, #:lower16:clk_get_rate
	movt	r3, #:upper16:clk_get_rate
	blx	r3
	mov	r8, r0
	ldr	r0, [fp]
	and	r0, r0, #15
	blx	r7
	ldr	ip, [sp, #24]
	mov	r7, r0
	movw	r3, #:lower16:__arm_ioremap
	mov	r0, r9
	mov	r2, r9
	movt	r3, #:upper16:__arm_ioremap
	mov	r1, #4096
	movt	r0, 4098
	ldr	r9, [ip, #52]
	blx	r3
	ldr	r10, [r0, #2336]
	movw	r3, #:lower16:__arm_iounmap
	ldr	ip, [sp, #24]
	movt	r3, #:upper16:__arm_iounmap
	str	r0, [ip, #60]
	blx	r3
	tst	r10, #16
	beq	.L84
.L63:
	mov	r2, r4, asr #5
	and	r3, r4, #31
	ldr	r2, [fp, r2, asl #2]
	mov	r3, r2, lsr r3
	tst	r3, #1
	bne	.L54
	movw	r0, #:lower16:.LC13
	movw	r5, #:lower16:printk
	movt	r5, #:upper16:printk
	mov	r1, r4
	movt	r0, #:upper16:.LC13
	blx	r5
	movw	r3, #:lower16:cpu_up
	mov	r0, r4
	movt	r3, #:upper16:cpu_up
	blx	r3
	movw	r0, #:lower16:.LC14
	mov	r1, r4
	movt	r0, #:upper16:.LC14
	blx	r5
	ldr	r5, [sp, #16]
	mov	r3, #600
	str	r3, [r5, #68]
	b	.L54
.L83:
	movw	r3, #:lower16:nr_running
	movt	r3, #:upper16:nr_running
	blx	r3
	cmp	r7, r0
	bcs	.L65
	ldr	r3, [r9, #-36]
	cmp	r6, r3
	bls	.L65
	ldr	r3, [r5, #24]
	cmp	r8, r3
	bhi	.L63
.L65:
	cmp	r7, #1
	bls	.L54
	ldr	r5, [sp, #16]
	movw	r3, #:lower16:.LANCHOR0
	ldr	r8, [sp, #20]
	movt	r3, #:upper16:.LANCHOR0
	ldr	r2, [r5, #456]
	cmp	r2, r8
	bls	.L54
	ldr	ip, [sp, #28]
	movw	r1, #:lower16:__per_cpu_offset
	movt	r1, #:upper16:__per_cpu_offset
	movw	r2, #:lower16:.LANCHOR3
	movt	r2, #:upper16:.LANCHOR3
	ldr	r3, [r3, #460]
	ldr	r1, [r1, ip, asl #2]
	add	r2, r2, r1
	ldr	r2, [r2, #16]
	cmp	r2, r3
	bcc	.L64
	b	.L54
.L71:
	mov	r4, #0
	b	.L59
.L81:
	movw	r0, #:lower16:.LC11
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC11
	blx	r3
	b	.L52
.L86:
	.align	2
.L85:
	.word	.LANCHOR2+8
	.fnend
	.size	hotplug_timer, .-hotplug_timer
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.26854, %object
	.size	__func__.26854, 29
__func__.26854:
	.ascii	"hotplug_reboot_notifier_call\000"
	.space	3
	.type	__func__.26845, %object
	.size	__func__.26845, 34
__func__.26845:
	.ascii	"exynos4_pm_hotplug_notifier_event\000"
	.space	2
	.type	__param_str_load_l3, %object
	.size	__param_str_load_l3, 22
__param_str_load_l3:
	.ascii	"stand-hotplug.load_l3\000"
	.space	2
	.type	__param_str_load_h2, %object
	.size	__param_str_load_h2, 22
__param_str_load_h2:
	.ascii	"stand-hotplug.load_h2\000"
	.space	2
	.type	__param_str_load_l2, %object
	.size	__param_str_load_l2, 22
__param_str_load_l2:
	.ascii	"stand-hotplug.load_l2\000"
	.space	2
	.type	__param_str_load_h1, %object
	.size	__param_str_load_h1, 22
__param_str_load_h1:
	.ascii	"stand-hotplug.load_h1\000"
	.space	2
	.type	__param_str_load_l1, %object
	.size	__param_str_load_l1, 22
__param_str_load_l1:
	.ascii	"stand-hotplug.load_l1\000"
	.space	2
	.type	__param_str_load_h0, %object
	.size	__param_str_load_h0, 22
__param_str_load_h0:
	.ascii	"stand-hotplug.load_h0\000"
	.space	2
	.type	__param_str_load_rq, %object
	.size	__param_str_load_rq, 22
__param_str_load_rq:
	.ascii	"stand-hotplug.load_rq\000"
	.space	2
	.type	__param_str_min_rq, %object
	.size	__param_str_min_rq, 21
__param_str_min_rq:
	.ascii	"stand-hotplug.min_rq\000"
	.space	3
	.type	__param_str_lock, %object
	.size	__param_str_lock, 19
__param_str_lock:
	.ascii	"stand-hotplug.lock\000"
	.space	1
	.type	__param_str_rate, %object
	.size	__param_str_rate, 19
__param_str_rate:
	.ascii	"stand-hotplug.rate\000"
	.space	1
	.type	__param_str_freq_min, %object
	.size	__param_str_freq_min, 23
__param_str_freq_min:
	.ascii	"stand-hotplug.freq_min\000"
	.section	.data..percpu,"aw",%progbits
	.align	3
	.set	.LANCHOR3,. + 0
	.type	hotplug_cpu_time, %object
	.size	hotplug_cpu_time, 24
hotplug_cpu_time:
	.space	24
	.section	.initcall7.init,"aw",%progbits
	.align	2
	.type	__initcall_exynos4_pm_hotplug_device_init7, %object
	.size	__initcall_exynos4_pm_hotplug_device_init7, 4
__initcall_exynos4_pm_hotplug_device_init7:
	.word	exynos4_pm_hotplug_device_init
	.type	__initcall_exynos4_pm_hotplug_init7, %object
	.size	__initcall_exynos4_pm_hotplug_init7, 4
__initcall_exynos4_pm_hotplug_init7:
	.word	exynos4_pm_hotplug_init
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	hotplug_lock, %object
	.size	hotplug_lock, 24
hotplug_lock:
	.word	1
	.word	0
	.space	4
	.word	hotplug_lock+12
	.word	hotplug_lock+12
	.space	4
	.type	freq_min, %object
	.size	freq_min, 4
freq_min:
	.word	-1
	.type	exynos4_pm_hotplug_notifier, %object
	.size	exynos4_pm_hotplug_notifier, 12
exynos4_pm_hotplug_notifier:
	.word	exynos4_pm_hotplug_notifier_event
	.space	8
	.type	hotplug_reboot_notifier, %object
	.size	hotplug_reboot_notifier, 12
hotplug_reboot_notifier:
	.word	hotplug_reboot_notifier_call
	.space	8
	.type	pm_hotplug_cpufreq_policy_notifier, %object
	.size	pm_hotplug_cpufreq_policy_notifier, 12
pm_hotplug_cpufreq_policy_notifier:
	.word	pm_hotplug_cpufreq_policy_notifier_call
	.space	8
	.type	pm_hotplug_enabled, %object
	.size	pm_hotplug_enabled, 1
pm_hotplug_enabled:
	.byte	1
	.space	3
	.type	hotpluging_rate, %object
	.size	hotpluging_rate, 4
hotpluging_rate:
	.word	150
	.type	exynos4_pm_hotplug_device, %object
	.size	exynos4_pm_hotplug_device, 360
exynos4_pm_hotplug_device:
	.word	.LC17
	.word	-1
	.space	352
	.type	trans_load_h0, %object
	.size	trans_load_h0, 4
trans_load_h0:
	.word	20
	.type	trans_load_l1, %object
	.size	trans_load_l1, 4
trans_load_l1:
	.word	10
	.type	trans_load_h1, %object
	.size	trans_load_h1, 4
trans_load_h1:
	.word	35
	.type	trans_load_l2, %object
	.size	trans_load_l2, 4
trans_load_l2:
	.word	15
	.type	trans_load_h2, %object
	.size	trans_load_h2, 4
trans_load_h2:
	.word	45
	.type	trans_load_l3, %object
	.size	trans_load_l3, 4
trans_load_l3:
	.word	20
	.type	trans_rq, %object
	.size	trans_rq, 4
trans_rq:
	.word	2
	.type	trans_load_rq, %object
	.size	trans_load_rq, 4
trans_load_rq:
	.word	20
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>%s: disabling pm hotplug\012\000"
	.space	3
.LC1:
	.ascii	"<6>EXYNOS4 PM-hotplug init function\012\000"
	.space	3
.LC2:
	.ascii	"dynamic hotplug\000"
.LC3:
	.ascii	"<3>Creation of hotplug work failed\012\000"
.LC4:
	.ascii	"pegasusq\000"
	.space	3
.LC5:
	.ascii	"<6>pm-hotplug is disabled: governor=%s\012\000"
.LC6:
	.ascii	"<6>pm-hotplug is enabled: governor=%s\012\000"
	.space	1
.LC7:
	.ascii	"<6>%s: saving pm_hotplug lock %x\012\000"
	.space	2
.LC8:
	.ascii	"<6>%s: restoring pm_hotplug lock %x\012\000"
	.space	3
.LC9:
	.ascii	"<3>failed at(%d)\012\000"
	.space	2
.LC10:
	.ascii	"<6>exynos4_pm_hotplug_device_init: %d\012\000"
	.space	1
.LC11:
	.ascii	"<6>stand-hotplug: hotplug is disabled for current g"
	.ascii	"overnor\012\000"
.LC12:
	.ascii	"armclk\000"
	.space	1
.LC13:
	.ascii	"<6>cpu%d turning on!\012\000"
	.space	2
.LC14:
	.ascii	"<6>cpu%d on\012\000"
	.space	3
.LC15:
	.ascii	"<6>cpu%d turnning off!\012\000"
.LC16:
	.ascii	"<6>cpu%d off!\012\000"
	.space	1
.LC17:
	.ascii	"exynos4-dynamic-cpu-hotplug\000"
	.section	__param,"a",%progbits
	.align	2
	.type	__param_load_l3, %object
	.size	__param_load_l3, 16
__param_load_l3:
	.word	__param_str_load_l3
	.word	param_ops_uint
	.short	420
	.short	-1
	.word	trans_load_l3
	.type	__param_load_h2, %object
	.size	__param_load_h2, 16
__param_load_h2:
	.word	__param_str_load_h2
	.word	param_ops_uint
	.short	420
	.short	-1
	.word	trans_load_h2
	.type	__param_load_l2, %object
	.size	__param_load_l2, 16
__param_load_l2:
	.word	__param_str_load_l2
	.word	param_ops_uint
	.short	420
	.short	-1
	.word	trans_load_l2
	.type	__param_load_h1, %object
	.size	__param_load_h1, 16
__param_load_h1:
	.word	__param_str_load_h1
	.word	param_ops_uint
	.short	420
	.short	-1
	.word	trans_load_h1
	.type	__param_load_l1, %object
	.size	__param_load_l1, 16
__param_load_l1:
	.word	__param_str_load_l1
	.word	param_ops_uint
	.short	420
	.short	-1
	.word	trans_load_l1
	.type	__param_load_h0, %object
	.size	__param_load_h0, 16
__param_load_h0:
	.word	__param_str_load_h0
	.word	param_ops_uint
	.short	420
	.short	-1
	.word	trans_load_h0
	.type	__param_load_rq, %object
	.size	__param_load_rq, 16
__param_load_rq:
	.word	__param_str_load_rq
	.word	param_ops_uint
	.short	420
	.short	-1
	.word	trans_load_rq
	.type	__param_min_rq, %object
	.size	__param_min_rq, 16
__param_min_rq:
	.word	__param_str_min_rq
	.word	param_ops_uint
	.short	420
	.short	-1
	.word	trans_rq
	.type	__param_lock, %object
	.size	__param_lock, 16
__param_lock:
	.word	__param_str_lock
	.word	param_ops_uint
	.short	420
	.short	-1
	.word	user_lock
	.type	__param_rate, %object
	.size	__param_rate, 16
__param_rate:
	.word	__param_str_rate
	.word	param_ops_uint
	.short	420
	.short	-1
	.word	hotpluging_rate
	.type	__param_freq_min, %object
	.size	__param_freq_min, 16
__param_freq_min:
	.word	__param_str_freq_min
	.word	param_ops_uint
	.short	420
	.short	-1
	.word	freq_min
	.bss
	.align	2
	.set	.LANCHOR2,. + 0
	.type	user_lock, %object
	.size	user_lock, 4
user_lock:
	.space	4
	.type	hotplug_wq, %object
	.size	hotplug_wq, 4
hotplug_wq:
	.space	4
	.type	hotplug_work, %object
	.size	hotplug_work, 44
hotplug_work:
	.space	44
	.type	max_performance, %object
	.size	max_performance, 4
max_performance:
	.space	4
	.type	user_lock_saved.26843, %object
	.size	user_lock_saved.26843, 4
user_lock_saved.26843:
	.space	4
	.type	clk_fimc.26804, %object
	.size	clk_fimc.26804, 4
clk_fimc.26804:
	.space	4
	.ident	"GCC: (GNU) 4.8"
