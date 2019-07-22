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
	.file	"busfreq_opp_exynos4.c"
	.text
	.align	2
	.type	_target, %function
_target:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r5, #:lower16:opp_get_freq
	mov	r4, r0
	movt	r5, #:upper16:opp_get_freq
	mov	r0, r1
	mov	r6, r1
	blx	r5
	mov	r7, r0
	ldr	r0, [r4, #52]
	blx	r5
	ldr	r3, [r4, #276]
	mov	r5, r0
	mov	r0, r6
	blx	r3
	cmp	r7, #0
	cmpne	r7, r5
	mov	r8, r0
	beq	.L2
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3
.L2:
	ldr	r3, [r4, #276]
	ldr	r0, [r4, #52]
	blx	r3
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L3:
	movw	r3, #:lower16:opp_get_voltage
	mov	r0, r6
	movt	r3, #:upper16:opp_get_voltage
	blx	r3
	cmp	r7, r5
	mov	r9, r0
	bhi	.L12
.L5:
	ldr	r3, [r4, #288]
	cmp	r3, #0
	beq	.L6
	mov	r0, r8
	blx	r3
.L6:
	ldr	r3, [r4, #268]
	mov	r0, r8
	blx	r3
	cmp	r7, r5
	bcc	.L13
.L7:
	mov	r0, r8
	str	r6, [r4, #52]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L12:
	add	r2, r0, #24832
	movw	r10, #:lower16:regulator_set_voltage
	mov	r1, r0
	add	r2, r2, #168
	movt	r10, #:upper16:regulator_set_voltage
	ldr	r0, [r4, #68]
	blx	r10
	ldr	r3, [r4, #272]
	mov	r0, r8
	blx	r3
	mov	r9, r0
	ldr	r0, [r4, #64]
	add	r2, r9, #24832
	mov	r1, r9
	add	r2, r2, #168
	blx	r10
	b	.L5
.L13:
	add	r2, r9, #24832
	movw	r5, #:lower16:regulator_set_voltage
	mov	r1, r9
	add	r2, r2, #168
	movt	r5, #:upper16:regulator_set_voltage
	ldr	r0, [r4, #68]
	blx	r5
	ldr	r3, [r4, #272]
	mov	r0, r8
	blx	r3
	mov	r1, r0
	ldr	r0, [r4, #64]
	add	r2, r1, #24832
	add	r2, r2, #168
	blx	r5
	b	.L7
	.fnend
	.size	_target, .-_target
	.align	2
	.type	exynos_buspm_notifier_event, %function
exynos_buspm_notifier_event:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #4
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	mov	r4, r0
	beq	.L16
	cmp	r1, #6
	beq	.L16
	cmp	r1, #3
	beq	.L26
	mov	r0, #0
	ldmfd	sp!, {r4, pc}
.L26:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:mutex_lock
	movt	r3, #:upper16:mutex_lock
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	ldr	r1, [r4, #-112]
	sub	r0, r4, #168
	bl	_target
	mov	r2, #0
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:mutex_unlock
	strb	r2, [r4, #-168]
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	mov	r0, #1
	ldmfd	sp!, {r4, pc}
.L16:
	mov	r0, #1
	strb	r0, [r4, #-168]
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	exynos_buspm_notifier_event, .-exynos_buspm_notifier_event
	.align	2
	.type	exynos_busfreq_init, %function
exynos_busfreq_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:platform_driver_register
	movt	r3, #:upper16:platform_driver_register
	ldr	r0, .L28
	blx	r3
	ldmfd	sp!, {r3, pc}
.L29:
	.align	2
.L28:
	.word	.LANCHOR0+24
	.fnend
	.size	exynos_busfreq_init, .-exynos_busfreq_init
	.align	2
	.type	exynos_busfreq_suspend, %function
exynos_busfreq_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:dev_get_drvdata
	movt	r3, #:upper16:dev_get_drvdata
	blx	r3
	ldr	r3, [r0, #292]
	cmp	r3, #0
	beq	.L31
	blx	r3
.L31:
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos_busfreq_suspend, .-exynos_busfreq_suspend
	.align	2
	.type	exynos_busfreq_resume, %function
exynos_busfreq_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r3, #:lower16:dev_get_drvdata
	movt	r3, #:upper16:dev_get_drvdata
	mov	r5, r0
	blx	r3
	movw	r3, #:lower16:ppmu_reset
	mov	r4, r0
	movt	r3, #:upper16:ppmu_reset
	mov	r0, r5
	blx	r3
	ldr	r3, [r4, #296]
	cmp	r3, #0
	beq	.L36
	blx	r3
.L36:
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	exynos_busfreq_resume, .-exynos_busfreq_resume
	.align	2
	.type	exynos_busfreq_remove, %function
exynos_busfreq_remove:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:dev_get_drvdata
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r3, #:upper16:dev_get_drvdata
	add	r0, r0, #8
	movw	r6, #:lower16:regulator_put
	movw	r5, #:lower16:kfree
	blx	r3
	movw	r3, #:lower16:unregister_pm_notifier
	mov	r4, r0
	movt	r3, #:upper16:unregister_pm_notifier
	add	r0, r0, #168
	blx	r3
	movw	r3, #:lower16:unregister_reboot_notifier
	add	r0, r4, #180
	movt	r3, #:upper16:unregister_reboot_notifier
	movt	r6, #:upper16:regulator_put
	blx	r3
	ldr	r0, [r4, #64]
	movt	r5, #:upper16:kfree
	blx	r6
	ldr	r0, [r4, #68]
	blx	r6
	movw	r3, #:lower16:sysfs_remove_group
	add	r1, r4, #248
	movt	r3, #:upper16:sysfs_remove_group
	ldr	r0, [r4, #76]
	blx	r3
	ldr	r0, [r4, #88]
	blx	r5
	mov	r0, r4
	blx	r5
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	exynos_busfreq_remove, .-exynos_busfreq_remove
	.align	2
	.type	exynos_busfreq_reboot_event, %function
exynos_busfreq_reboot_event:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r3, #:lower16:opp_get_voltage
	mov	r4, r0
	movt	r3, #:upper16:opp_get_voltage
	movw	r5, #:lower16:.LANCHOR0
	ldr	r0, [r0, #-124]
	movt	r5, #:upper16:.LANCHOR0
	blx	r3
	ldr	r3, [r4, #96]
	mov	r6, r0
	ldr	r0, [r4, #-124]
	blx	r3
	movw	r3, #:lower16:mutex_lock
	mov	r7, r0
	movt	r3, #:upper16:mutex_lock
	mov	r0, r5
	blx	r3
	mov	r1, r6
	movw	r6, #:lower16:regulator_set_voltage
	add	r2, r1, #24832
	movt	r6, #:upper16:regulator_set_voltage
	add	r2, r2, #168
	ldr	r0, [r4, #-112]
	blx	r6
	ldr	r3, [r4, #92]
	mov	r0, r7
	blx	r3
	mov	r1, r0
	ldr	r0, [r4, #-116]
	add	r2, r1, #24832
	mov	r7, #0
	add	r2, r2, #168
	blx	r6
	movw	r3, #:lower16:mutex_unlock
	mov	r0, r5
	strb	r7, [r4, #-180]
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	mov	r0, r7
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
	.fnend
	.size	exynos_busfreq_reboot_event, .-exynos_busfreq_reboot_event
	.align	2
	.type	store_load_history_size, %function
store_load_history_size:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r4, #:lower16:load_history_size
	movt	r4, #:upper16:load_history_size
	movw	r1, #:lower16:.LC1
	movw	ip, #:lower16:sscanf
	mov	r0, r2
	movt	r1, #:upper16:.LC1
	mov	r2, r4
	movt	ip, #:upper16:sscanf
	mov	r5, r3
	blx	ip
	ldr	r2, [r4]
	cmp	r2, #0
	moveq	r3, #1
	streq	r3, [r4]
	beq	.L44
	cmp	r2, #5
	movhi	r3, #5
	strhi	r3, [r4]
.L44:
	mov	r0, r5
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	store_load_history_size, .-store_load_history_size
	.align	2
	.type	store_dmc_max_threshold, %function
store_dmc_max_threshold:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r4, #:lower16:dmc_max_threshold
	movt	r4, #:upper16:dmc_max_threshold
	movw	r1, #:lower16:.LC1
	movw	ip, #:lower16:sscanf
	mov	r0, r2
	movt	r1, #:upper16:.LC1
	mov	r2, r4
	movt	ip, #:upper16:sscanf
	mov	r5, r3
	blx	ip
	ldr	r3, [r4]
	mov	r0, r5
	cmp	r3, #0
	moveq	r3, #1
	streq	r3, [r4]
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	store_dmc_max_threshold, .-store_dmc_max_threshold
	.align	2
	.type	store_cpu_slope_size, %function
store_cpu_slope_size:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, r2
	movw	r1, #:lower16:.LC1
	movw	r2, #:lower16:cpu_slope_size
	movw	ip, #:lower16:sscanf
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movt	r1, #:upper16:.LC1
	mov	r4, r3
	movt	r2, #:upper16:cpu_slope_size
	movt	ip, #:upper16:sscanf
	blx	ip
	mov	r0, r4
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	store_cpu_slope_size, .-store_cpu_slope_size
	.align	2
	.type	store_max_cpu_threshold, %function
store_max_cpu_threshold:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, r2
	movw	r1, #:lower16:.LC1
	movw	r2, #:lower16:max_cpu_threshold
	movw	ip, #:lower16:sscanf
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movt	r1, #:upper16:.LC1
	mov	r4, r3
	movt	r2, #:upper16:max_cpu_threshold
	movt	ip, #:upper16:sscanf
	blx	ip
	mov	r0, r4
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	store_max_cpu_threshold, .-store_max_cpu_threshold
	.align	2
	.type	store_up_cpu_threshold, %function
store_up_cpu_threshold:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, r2
	movw	r1, #:lower16:.LC1
	movw	r2, #:lower16:up_cpu_threshold
	movw	ip, #:lower16:sscanf
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movt	r1, #:upper16:.LC1
	mov	r4, r3
	movt	r2, #:upper16:up_cpu_threshold
	movt	ip, #:upper16:sscanf
	blx	ip
	mov	r0, r4
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	store_up_cpu_threshold, .-store_up_cpu_threshold
	.align	2
	.type	store_idle_threshold, %function
store_idle_threshold:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, r2
	movw	r1, #:lower16:.LC1
	movw	r2, #:lower16:idle_threshold
	movw	ip, #:lower16:sscanf
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movt	r1, #:upper16:.LC1
	mov	r4, r3
	movt	r2, #:upper16:idle_threshold
	movt	ip, #:upper16:sscanf
	blx	ip
	mov	r0, r4
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	store_idle_threshold, .-store_idle_threshold
	.align	2
	.type	store_ppmu_threshold, %function
store_ppmu_threshold:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, r2
	movw	r1, #:lower16:.LC1
	movw	r2, #:lower16:ppmu_threshold
	movw	ip, #:lower16:sscanf
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movt	r1, #:upper16:.LC1
	mov	r4, r3
	movt	r2, #:upper16:ppmu_threshold
	movt	ip, #:upper16:sscanf
	blx	ip
	mov	r0, r4
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	store_ppmu_threshold, .-store_ppmu_threshold
	.align	2
	.type	store_up_threshold, %function
store_up_threshold:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, r2
	movw	r1, #:lower16:.LC1
	movw	r2, #:lower16:up_threshold
	movw	ip, #:lower16:sscanf
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movt	r1, #:upper16:.LC1
	mov	r4, r3
	movt	r2, #:upper16:up_threshold
	movt	ip, #:upper16:sscanf
	blx	ip
	mov	r0, r4
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	store_up_threshold, .-store_up_threshold
	.align	2
	.type	store_level_lock, %function
store_level_lock:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movw	r4, #:lower16:.LANCHOR1
	movw	r1, #:lower16:dev_get_drvdata
	movt	r4, #:upper16:.LANCHOR1
	movt	r1, #:upper16:dev_get_drvdata
	.pad #8
	sub	sp, sp, #8
	ldr	r0, [r4, #4]
	movw	r5, #:lower16:opp_get_freq
	mov	r7, r2
	mov	r6, r3
	movt	r5, #:upper16:opp_get_freq
	blx	r1
	ldr	r0, [r0, #56]
	blx	r5
	movw	r1, #:lower16:.LC2
	movw	ip, #:lower16:sscanf
	add	r2, sp, #4
	mov	r8, r0
	movt	r1, #:upper16:.LC2
	mov	r0, r7
	movt	ip, #:upper16:sscanf
	blx	ip
	ldr	r2, [sp, #4]
	cmp	r2, #0
	beq	.L54
	cmp	r0, #0
	beq	.L54
	cmp	r8, r2
	movw	r2, #:lower16:opp_find_freq_ceil
	add	r1, sp, #4
	movt	r2, #:upper16:opp_find_freq_ceil
	ldr	r0, [r4, #4]
	strcc	r8, [sp, #4]
	blx	r2
	str	r0, [r4]
	blx	r5
	movw	r2, #:lower16:printk
	mov	r1, r0
	movw	r0, #:lower16:.LC4
	movt	r2, #:upper16:printk
	movt	r0, #:upper16:.LC4
	blx	r2
	mov	r0, r6
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L54:
	movw	r0, #:lower16:.LC3
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC3
	blx	r3
	mov	r3, #0
	mov	r0, r6
	str	r3, [r4]
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
	.fnend
	.size	store_level_lock, .-store_level_lock
	.align	2
	.type	show_load_history_size, %function
show_load_history_size:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:load_history_size
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movt	ip, #:upper16:load_history_size
	movw	r1, #:lower16:.LC5
	movw	r3, #:lower16:sprintf
	mov	r0, r2
	movt	r1, #:upper16:.LC5
	ldr	r2, [ip]
	movt	r3, #:upper16:sprintf
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	show_load_history_size, .-show_load_history_size
	.align	2
	.type	show_dmc_max_threshold, %function
show_dmc_max_threshold:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:dmc_max_threshold
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movt	ip, #:upper16:dmc_max_threshold
	movw	r1, #:lower16:.LC5
	movw	r3, #:lower16:sprintf
	mov	r0, r2
	movt	r1, #:upper16:.LC5
	ldr	r2, [ip]
	movt	r3, #:upper16:sprintf
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	show_dmc_max_threshold, .-show_dmc_max_threshold
	.align	2
	.type	show_cpu_slope_size, %function
show_cpu_slope_size:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:cpu_slope_size
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movt	ip, #:upper16:cpu_slope_size
	movw	r1, #:lower16:.LC5
	movw	r3, #:lower16:sprintf
	mov	r0, r2
	movt	r1, #:upper16:.LC5
	ldr	r2, [ip]
	movt	r3, #:upper16:sprintf
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	show_cpu_slope_size, .-show_cpu_slope_size
	.align	2
	.type	show_max_cpu_threshold, %function
show_max_cpu_threshold:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:max_cpu_threshold
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movt	ip, #:upper16:max_cpu_threshold
	movw	r1, #:lower16:.LC5
	movw	r3, #:lower16:sprintf
	mov	r0, r2
	movt	r1, #:upper16:.LC5
	ldr	r2, [ip]
	movt	r3, #:upper16:sprintf
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	show_max_cpu_threshold, .-show_max_cpu_threshold
	.align	2
	.type	show_up_cpu_threshold, %function
show_up_cpu_threshold:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:up_cpu_threshold
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movt	ip, #:upper16:up_cpu_threshold
	movw	r1, #:lower16:.LC5
	movw	r3, #:lower16:sprintf
	mov	r0, r2
	movt	r1, #:upper16:.LC5
	ldr	r2, [ip]
	movt	r3, #:upper16:sprintf
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	show_up_cpu_threshold, .-show_up_cpu_threshold
	.align	2
	.type	show_idle_threshold, %function
show_idle_threshold:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:idle_threshold
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movt	ip, #:upper16:idle_threshold
	movw	r1, #:lower16:.LC5
	movw	r3, #:lower16:sprintf
	mov	r0, r2
	movt	r1, #:upper16:.LC5
	ldr	r2, [ip]
	movt	r3, #:upper16:sprintf
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	show_idle_threshold, .-show_idle_threshold
	.align	2
	.type	show_ppmu_threshold, %function
show_ppmu_threshold:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:ppmu_threshold
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movt	ip, #:upper16:ppmu_threshold
	movw	r1, #:lower16:.LC5
	movw	r3, #:lower16:sprintf
	mov	r0, r2
	movt	r1, #:upper16:.LC5
	ldr	r2, [ip]
	movt	r3, #:upper16:sprintf
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	show_ppmu_threshold, .-show_ppmu_threshold
	.align	2
	.type	show_up_threshold, %function
show_up_threshold:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:up_threshold
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movt	ip, #:upper16:up_threshold
	movw	r1, #:lower16:.LC5
	movw	r3, #:lower16:sprintf
	mov	r0, r2
	movt	r1, #:upper16:.LC5
	ldr	r2, [ip]
	movt	r3, #:upper16:sprintf
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	show_up_threshold, .-show_up_threshold
	.align	2
	.type	show_level_lock, %function
show_level_lock:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movw	r4, #:lower16:.LANCHOR1
	movt	r4, #:upper16:.LANCHOR1
	movw	r3, #:lower16:dev_get_drvdata
	movt	r3, #:upper16:dev_get_drvdata
	mov	r6, r2
	ldr	r0, [r4, #4]
	movw	r5, #:lower16:opp_get_freq
	blx	r3
	mov	r7, r0
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L71
	movt	r5, #:upper16:opp_get_freq
	blx	r5
	mov	r8, r0
.L70:
	ldr	r0, [r7, #52]
	movw	r4, #:lower16:sprintf
	blx	r5
	movw	r1, #:lower16:.LC6
	mov	r2, r0
	movt	r4, #:upper16:sprintf
	mov	r0, r6
	movt	r1, #:upper16:.LC6
	blx	r4
	movw	r1, #:lower16:.LC7
	mov	r5, r0
	mov	r2, r8
	add	r0, r6, r0
	movt	r1, #:upper16:.LC7
	blx	r4
	add	r0, r0, r5
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L71:
	mov	r8, r0
	movt	r5, #:upper16:opp_get_freq
	b	.L70
	.fnend
	.size	show_level_lock, .-show_level_lock
	.align	2
	.type	show_time_in_state, %function
show_time_in_state:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r1, #:lower16:.LANCHOR1
	movw	r3, #:lower16:dev_get_drvdata
	movt	r1, #:upper16:.LANCHOR1
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movt	r3, #:upper16:dev_get_drvdata
	.pad #20
	sub	sp, sp, #20
	ldr	r0, [r1, #4]
	str	r2, [sp, #12]
	blx	r3
	ldr	r3, [r0, #80]
	mov	r5, r0
	cmp	r3, #0
	ble	.L75
	mov	r4, #0
	movw	r10, #:lower16:jiffies_64_to_clock_t
	movw	r9, #:lower16:sprintf
	mov	r7, r4
	mov	r6, r4
	movt	r10, #:upper16:jiffies_64_to_clock_t
	movt	r9, #:upper16:sprintf
.L74:
	ldr	r1, [r5, #84]
	add	r2, r4, r4, asl #1
	ldr	r3, [r5, #88]
	add	r7, r7, #1
	ldr	r0, [sp, #12]
	add	r2, r1, r2
	ldr	fp, [r2, #4]
	add	r8, r0, r6
	ldrd	r0, [r3, r4]
	blx	r10
	strd	r0, [sp]
	movw	r1, #:lower16:.LC8
	mov	r2, fp
	mov	r0, r8
	movt	r1, #:upper16:.LC8
	add	r4, r4, #8
	blx	r9
	ldr	r3, [r5, #80]
	add	r6, r6, r0
	cmp	r3, r7
	bgt	.L74
.L73:
	mov	r0, r6
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L75:
	mov	r6, #0
	b	.L73
	.fnend
	.size	show_time_in_state, .-show_time_in_state
	.align	2
	.type	show_locklist, %function
show_locklist:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r0, #:lower16:.LANCHOR1
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movt	r0, #:upper16:.LANCHOR1
	movw	r3, #:lower16:dev_lock_list
	mov	r1, r2
	movt	r3, #:upper16:dev_lock_list
	ldr	r0, [r0, #4]
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	show_locklist, .-show_locklist
	.align	2
	.type	exynos_busfreq_probe, %function
exynos_busfreq_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #12
	sub	sp, sp, #12
	add	r1, sp, #8
	mov	r2, #0
	mov	r6, r0
	movw	r3, #:lower16:exynos_smc_readsfr
	mov	r0, #4
	str	r2, [r1, #-4]!
	movt	r0, 4192
	movt	r3, #:upper16:exynos_smc_readsfr
	blx	r3
	ldr	r1, [sp, #4]
	ubfx	r1, r1, #8, #4
	cmp	r1, #5
	str	r1, [sp, #4]
	bne	.L101
	movw	r3, #:lower16:kmalloc_caches
	movt	r3, #:upper16:kmalloc_caches
	ldr	r0, [r3, #36]
	cmp	r0, #0
	beq	.L93
	movw	r3, #:lower16:kmem_cache_alloc_trace
	movw	r1, #32976
	movt	r3, #:upper16:kmem_cache_alloc_trace
	mov	r2, #304
	blx	r3
	subs	r4, r0, #0
	beq	.L102
.L80:
	movw	r3, #:lower16:samsung_cpu_id
	movw	r2, #:lower16:exynos_buspm_notifier_event
	movt	r3, #:upper16:samsung_cpu_id
	movt	r2, #:upper16:exynos_buspm_notifier_event
	ldr	ip, [r3]
	movw	r3, #:lower16:exynos_busfreq_reboot_event
	str	r2, [r4, #168]
	movt	r3, #:upper16:exynos_busfreq_reboot_event
	mov	r1, #0
	str	r3, [r4, #180]
	movt	r1, 17186
	ldr	r0, .L109
	mov	r2, ip, lsr #17
	mov	r3, r2, asl #17
	str	r0, [r4, #256]
	cmp	r3, r1
	beq	.L81
	cmn	r3, #465567744
	bne	.L82
.L81:
	movw	fp, #:lower16:exynos4x12_init
	movw	r10, #:lower16:exynos4x12_target
	movw	r5, #:lower16:exynos4x12_get_int_volt
	movw	r9, #:lower16:exynos4x12_get_table_index
	movw	r8, #:lower16:exynos4x12_monitor
	movw	r7, #:lower16:exynos4x12_prepare
	movw	lr, #:lower16:exynos4x12_post
	movw	ip, #:lower16:exynos4x12_set_qos
	movw	r1, #:lower16:exynos4x12_suspend
	movw	r2, #:lower16:exynos4x12_resume
	movt	lr, #:upper16:exynos4x12_post
	movt	ip, #:upper16:exynos4x12_set_qos
	movt	r1, #:upper16:exynos4x12_suspend
	movt	r2, #:upper16:exynos4x12_resume
	add	r6, r6, #8
	movt	r5, #:upper16:exynos4x12_get_int_volt
	movt	r9, #:upper16:exynos4x12_get_table_index
	movt	r8, #:upper16:exynos4x12_monitor
	movt	r7, #:upper16:exynos4x12_prepare
	movt	fp, #:upper16:exynos4x12_init
	movt	r10, #:upper16:exynos4x12_target
	movw	r0, #34464
	movw	r3, #:lower16:usecs_to_jiffies
	str	r5, [r4, #272]
	movt	r3, #:upper16:usecs_to_jiffies
	str	r9, [r4, #276]
	str	r8, [r4, #264]
	movt	r0, 1
	str	r7, [r4, #280]
	movw	r5, #:lower16:.LANCHOR1
	str	lr, [r4, #284]
	add	r7, r4, #12
	str	ip, [r4, #288]
	mov	r9, #1280
	str	r1, [r4, #292]
	movt	r5, #:upper16:.LANCHOR1
	str	r2, [r4, #296]
	str	r6, [r4, #4]
	str	fp, [r4, #260]
	str	r10, [r4, #268]
	blx	r3
	ldr	r8, [r4, #4]
	movw	ip, #:lower16:exynos_busfreq_timer
	mov	lr, #0
	movt	ip, #:upper16:exynos_busfreq_timer
	movw	r3, #:lower16:init_timer_key
	mov	r1, lr
	str	r0, [r4, #72]
	mov	r2, lr
	str	ip, [r4, #20]
	movt	r3, #:upper16:init_timer_key
	add	r0, r4, #24
	str	r9, [r4, #8]
	str	r7, [r4, #12]
	str	r7, [r4, #16]
	str	lr, [r5]
	str	r4, [r5, #8]
	str	r8, [r5, #4]
	blx	r3
	mov	r0, r6
	ldr	r3, [r4, #260]
	mov	r1, r4
	blx	r3
	cmp	r0, #0
	bne	.L103
	ldr	r0, [r4, #80]
	movw	r3, #:lower16:__kmalloc
	movt	r3, #:upper16:__kmalloc
	movw	r1, #32976
	mov	r0, r0, asl #3
	blx	r3
	cmp	r0, #0
	str	r0, [r4, #88]
	beq	.L104
	movw	r3, #:lower16:get_jiffies_64
	movt	r3, #:upper16:get_jiffies_64
	blx	r3
	movw	r3, #:lower16:cpu_subsys
	strd	r0, [r4, #96]
	movt	r3, #:upper16:cpu_subsys
	movw	r0, #:lower16:.LC14
	ldr	r1, [r3, #8]
	movw	r3, #:lower16:kobject_create_and_add
	movt	r0, #:upper16:.LC14
	movt	r3, #:upper16:kobject_create_and_add
	add	r1, r1, #8
	blx	r3
	cmp	r0, #0
	str	r0, [r4, #76]
	beq	.L105
.L87:
	movw	r3, #:lower16:sysfs_create_group
	add	r1, r4, #248
	movt	r3, #:upper16:sysfs_create_group
	blx	r3
	cmp	r0, #0
	bne	.L106
.L88:
	movw	r3, #:lower16:register_pm_notifier
	add	r0, r4, #168
	movt	r3, #:upper16:register_pm_notifier
	blx	r3
	subs	r7, r0, #0
	bne	.L107
	mov	r2, #1
	mov	r0, r4
	movw	r3, #:lower16:register_reboot_notifier
	strb	r2, [r0], #180
	movt	r3, #:upper16:register_reboot_notifier
	strb	r2, [r5, #12]
	blx	r3
	cmp	r0, #0
	bne	.L108
.L90:
	movw	r3, #:lower16:dev_set_drvdata
	mov	r1, r4
	movt	r3, #:upper16:dev_set_drvdata
	mov	r0, r6
	blx	r3
	ldr	r2, [r4, #72]
	movw	ip, #:lower16:system_freezable_wq
	movt	ip, #:upper16:system_freezable_wq
	movw	r3, #:lower16:queue_delayed_work
	add	r1, r4, #8
	ldr	r0, [ip]
	movt	r3, #:upper16:queue_delayed_work
	add	r2, r2, r2, asl #2
	mov	r2, r2, asl #1
	blx	r3
.L79:
	mov	r0, r7
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L93:
	mov	r4, #16
	b	.L80
.L101:
	movw	r0, #:lower16:.LC9
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC9
	mvn	r7, #18
	blx	r3
	b	.L79
.L108:
	movw	r0, #:lower16:.LC18
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC18
	blx	r3
	b	.L90
.L107:
	movw	r0, #:lower16:.LC17
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC17
	movt	r3, #:upper16:printk
	movw	r5, #:lower16:kfree
	blx	r3
	movt	r5, #:upper16:kfree
	ldr	r0, [r4, #88]
	blx	r5
.L85:
	ldr	r0, [r4, #64]
	cmn	r0, #4096
	bhi	.L91
	movw	r3, #:lower16:regulator_put
	movt	r3, #:upper16:regulator_put
	blx	r3
.L91:
	ldr	r0, [r4, #68]
	cmn	r0, #4096
	bhi	.L92
	movw	r3, #:lower16:regulator_put
	movt	r3, #:upper16:regulator_put
	blx	r3
.L92:
	mov	r0, r4
	mvn	r7, #18
	blx	r5
	b	.L79
.L106:
	movw	r0, #:lower16:.LC16
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC16
	blx	r3
	b	.L88
.L105:
	movw	r0, #:lower16:.LC15
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC15
	movt	r3, #:upper16:printk
	blx	r3
	ldr	r0, [r4, #76]
	b	.L87
.L104:
	movw	r0, #:lower16:.LC13
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC13
	movt	r3, #:upper16:printk
	movw	r5, #:lower16:kfree
	blx	r3
	movt	r5, #:upper16:kfree
	b	.L85
.L103:
	movw	r0, #:lower16:.LC12
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC12
	movt	r3, #:upper16:printk
	movw	r5, #:lower16:kfree
	blx	r3
	movt	r5, #:upper16:kfree
	b	.L85
.L102:
	movw	r0, #:lower16:.LC10
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC10
	movt	r3, #:upper16:printk
	blx	r3
	mvn	r7, #11
	b	.L79
.L82:
	movw	r0, #:lower16:.LC11
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC11
	movt	r3, #:upper16:printk
	movw	r5, #:lower16:kfree
	blx	r3
	movt	r5, #:upper16:kfree
	b	.L85
.L110:
	.align	2
.L109:
	.word	.LANCHOR0+104
	.fnend
	.size	exynos_busfreq_probe, .-exynos_busfreq_probe
	.align	2
	.global	update_busfreq_stat
	.type	update_busfreq_stat, %function
update_busfreq_stat:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r3, #:lower16:get_jiffies_64
	mov	r6, r0
	movt	r3, #:upper16:get_jiffies_64
	mov	r4, r1
	blx	r3
	ldr	r7, [r6, #88]
	mov	ip, r4, asl #3
	ldrd	r4, [r6, #96]
	ldrd	r2, [r7, ip]
	subs	r2, r2, r4
	sbc	r3, r3, r5
	adds	r2, r2, r0
	adc	r3, r3, r1
	strd	r2, [r7, ip]
	strd	r0, [r6, #96]
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
	.fnend
	.size	update_busfreq_stat, .-update_busfreq_stat
	.align	2
	.type	exynos_busfreq_timer, %function
exynos_busfreq_timer:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	sub	r5, r0, #8
	mov	r4, r0
	ldr	r3, [r0, #256]
	mov	r0, r5
	blx	r3
	movw	r3, #:lower16:ppmu_start
	mov	r6, r0
	movt	r3, #:upper16:ppmu_start
	ldr	r0, [r4, #-4]
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:mutex_lock
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:mutex_lock
	blx	r3
	movw	r3, #:lower16:.LANCHOR1
	mov	r0, r5
	movt	r3, #:upper16:.LANCHOR1
	ldr	r1, [r3]
	cmp	r1, #0
	moveq	r1, r6
	bl	_target
	mov	r1, r0
	mov	r0, r5
	bl	update_busfreq_stat
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:mutex_unlock
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	movw	r0, #:lower16:system_freezable_wq
	movw	r3, #:lower16:queue_delayed_work
	movt	r0, #:upper16:system_freezable_wq
	mov	r1, r4
	ldr	r2, [r4, #64]
	movt	r3, #:upper16:queue_delayed_work
	ldr	r0, [r0]
	blx	r3
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	exynos_busfreq_timer, .-exynos_busfreq_timer
	.align	2
	.global	step_down
	.type	step_down, %function
step_down:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	ldr	r3, [r5, #60]
	.pad #8
	sub	sp, sp, #8
	mov	r8, r1
	ldr	r0, [r0, #52]
	cmp	r0, r3
	beq	.L115
	cmp	r1, #0
	ble	.L115
	movw	r7, #:lower16:opp_get_freq
	movw	r6, #:lower16:opp_find_freq_floor
	movt	r7, #:upper16:opp_get_freq
	movt	r6, #:upper16:opp_find_freq_floor
	mov	r4, #0
	b	.L116
.L117:
	cmp	r4, r8
	beq	.L115
.L116:
	blx	r7
	sub	r3, r0, #1
	add	r1, sp, #4
	ldr	r0, [r5, #4]
	add	r4, r4, #1
	str	r3, [sp, #4]
	blx	r6
	ldr	r3, [r5, #60]
	cmp	r3, r0
	bne	.L117
.L115:
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
	.fnend
	.size	step_down, .-step_down
	.align	2
	.global	exynos_busfreq_lock
	.type	exynos_busfreq_lock, %function
exynos_busfreq_lock:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	exynos_busfreq_lock, .-exynos_busfreq_lock
	.align	2
	.global	exynos_busfreq_lock_free
	.type	exynos_busfreq_lock_free, %function
exynos_busfreq_lock_free:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	exynos_busfreq_lock_free, .-exynos_busfreq_lock_free
	.align	2
	.global	exynos_request_apply
	.type	exynos_request_apply, %function
exynos_request_apply:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	sub	sp, sp, #12
	str	r0, [sp, #4]
	movw	r3, #:lower16:mutex_lock
	movw	r0, #:lower16:.LANCHOR0
	movw	r4, #:lower16:.LANCHOR1
	movt	r3, #:upper16:mutex_lock
	movt	r0, #:upper16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR1
	blx	r3
	ldrb	r3, [r4, #12]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L125
.L122:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:mutex_unlock
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L125:
	ldr	r2, [r4, #8]
	movw	r3, #:lower16:opp_find_freq_ceil
	add	r1, sp, #4
	movt	r3, #:upper16:opp_find_freq_ceil
	movw	r6, #:lower16:opp_get_freq
	ldr	r0, [r2, #4]
	movt	r6, #:upper16:opp_get_freq
	blx	r3
	ldr	r5, [r4]
	ldr	r3, [r4, #8]
	cmp	r5, #0
	moveq	r5, r0
	ldr	r0, [r3, #52]
	blx	r6
	mov	r7, r0
	mov	r0, r5
	blx	r6
	cmp	r7, r0
	bcs	.L122
	mov	r1, r5
	ldr	r0, [r4, #8]
	bl	_target
	mov	r1, r0
	ldr	r0, [r4, #8]
	bl	update_busfreq_stat
	b	.L122
	.fnend
	.size	exynos_request_apply, .-exynos_request_apply
	.section	.rodata
	.align	2
	.type	exynos_busfreq_pm, %object
	.size	exynos_busfreq_pm, 68
exynos_busfreq_pm:
	.space	8
	.word	exynos_busfreq_suspend
	.word	exynos_busfreq_resume
	.space	52
	.section	.initcall7.init,"aw",%progbits
	.align	2
	.type	__initcall_exynos_busfreq_init7, %object
	.size	__initcall_exynos_busfreq_init7, 4
__initcall_exynos_busfreq_init7:
	.word	exynos_busfreq_init
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	busfreq_lock, %object
	.size	busfreq_lock, 24
busfreq_lock:
	.word	1
	.word	0
	.space	4
	.word	busfreq_lock+12
	.word	busfreq_lock+12
	.space	4
	.type	exynos_busfreq_driver, %object
	.size	exynos_busfreq_driver, 80
exynos_busfreq_driver:
	.word	exynos_busfreq_probe
	.word	exynos_busfreq_remove
	.space	12
	.word	.LC19
	.space	4
	.word	0
	.space	36
	.word	exynos_busfreq_pm
	.space	4
	.space	4
	.type	busfreq_attributes, %object
	.size	busfreq_attributes, 48
busfreq_attributes:
	.word	dev_attr_curr_freq
	.word	dev_attr_lock_list
	.word	dev_attr_time_in_state
	.word	dev_attr_up_threshold
	.word	dev_attr_ppmu_threshold
	.word	dev_attr_idle_threshold
	.word	dev_attr_up_cpu_threshold
	.word	dev_attr_max_cpu_threshold
	.word	dev_attr_cpu_slope_size
	.word	dev_attr_dmc_max_threshold
	.word	dev_attr_load_history_size
	.word	0
	.type	dev_attr_load_history_size, %object
	.size	dev_attr_load_history_size, 16
dev_attr_load_history_size:
	.word	.LC20
	.short	436
	.space	2
	.word	show_load_history_size
	.word	store_load_history_size
	.type	dev_attr_dmc_max_threshold, %object
	.size	dev_attr_dmc_max_threshold, 16
dev_attr_dmc_max_threshold:
	.word	.LC21
	.short	436
	.space	2
	.word	show_dmc_max_threshold
	.word	store_dmc_max_threshold
	.type	dev_attr_cpu_slope_size, %object
	.size	dev_attr_cpu_slope_size, 16
dev_attr_cpu_slope_size:
	.word	.LC22
	.short	436
	.space	2
	.word	show_cpu_slope_size
	.word	store_cpu_slope_size
	.type	dev_attr_max_cpu_threshold, %object
	.size	dev_attr_max_cpu_threshold, 16
dev_attr_max_cpu_threshold:
	.word	.LC23
	.short	436
	.space	2
	.word	show_max_cpu_threshold
	.word	store_max_cpu_threshold
	.type	dev_attr_up_cpu_threshold, %object
	.size	dev_attr_up_cpu_threshold, 16
dev_attr_up_cpu_threshold:
	.word	.LC24
	.short	436
	.space	2
	.word	show_up_cpu_threshold
	.word	store_up_cpu_threshold
	.type	dev_attr_idle_threshold, %object
	.size	dev_attr_idle_threshold, 16
dev_attr_idle_threshold:
	.word	.LC25
	.short	436
	.space	2
	.word	show_idle_threshold
	.word	store_idle_threshold
	.type	dev_attr_ppmu_threshold, %object
	.size	dev_attr_ppmu_threshold, 16
dev_attr_ppmu_threshold:
	.word	.LC26
	.short	436
	.space	2
	.word	show_ppmu_threshold
	.word	store_ppmu_threshold
	.type	dev_attr_up_threshold, %object
	.size	dev_attr_up_threshold, 16
dev_attr_up_threshold:
	.word	.LC27
	.short	436
	.space	2
	.word	show_up_threshold
	.word	store_up_threshold
	.type	dev_attr_time_in_state, %object
	.size	dev_attr_time_in_state, 16
dev_attr_time_in_state:
	.word	.LC28
	.short	436
	.space	2
	.word	show_time_in_state
	.word	0
	.type	dev_attr_lock_list, %object
	.size	dev_attr_lock_list, 16
dev_attr_lock_list:
	.word	.LC29
	.short	436
	.space	2
	.word	show_locklist
	.word	0
	.type	dev_attr_curr_freq, %object
	.size	dev_attr_curr_freq, 16
dev_attr_curr_freq:
	.word	.LC30
	.short	436
	.space	2
	.word	show_level_lock
	.word	store_level_lock
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<6>REBOOT Notifier for BUSFREQ\012\000"
.LC1:
	.ascii	"%d\000"
	.space	1
.LC2:
	.ascii	"%lu\000"
.LC3:
	.ascii	"<6>Release bus level lock.\012\000"
.LC4:
	.ascii	"<6>Lock Freq : %lu\012\000"
.LC5:
	.ascii	"%d\012\000"
.LC6:
	.ascii	"Current Freq(MIF/INT) : %lu\012\000"
	.space	3
.LC7:
	.ascii	"Current Lock Freq(MIF/INT) : %lu\012\000"
	.space	2
.LC8:
	.ascii	"%u %llu\012\000"
	.space	3
.LC9:
	.ascii	"<3>[ %x ] Memory Type Undertermined.\012\000"
	.space	2
.LC10:
	.ascii	"<3>Unable to create busfreq_data struct.\012\000"
	.space	2
.LC11:
	.ascii	"<3>Unsupport device type.\012\000"
	.space	1
.LC12:
	.ascii	"<3>Failed to init busfreq.\012\000"
.LC13:
	.ascii	"<3>Unable to create time_in_state.\012\000"
.LC14:
	.ascii	"busfreq\000"
.LC15:
	.ascii	"<3>Failed to create busfreq kobject.!\012\000"
	.space	1
.LC16:
	.ascii	"<3>Failed to create attributes group.!\012\000"
.LC17:
	.ascii	"<3>Failed to setup buspm notifier\012\000"
	.space	1
.LC18:
	.ascii	"<3>Failed to setup reboot notifier\012\000"
.LC19:
	.ascii	"exynos-busfreq\000"
	.space	1
.LC20:
	.ascii	"load_history_size\000"
	.space	2
.LC21:
	.ascii	"dmc_max_threshold\000"
	.space	2
.LC22:
	.ascii	"cpu_slope_size\000"
	.space	1
.LC23:
	.ascii	"max_cpu_threshold\000"
	.space	2
.LC24:
	.ascii	"up_cpu_threshold\000"
	.space	3
.LC25:
	.ascii	"idle_threshold\000"
	.space	1
.LC26:
	.ascii	"ppmu_threshold\000"
	.space	1
.LC27:
	.ascii	"up_threshold\000"
	.space	3
.LC28:
	.ascii	"time_in_state\000"
	.space	2
.LC29:
	.ascii	"lock_list\000"
	.space	2
.LC30:
	.ascii	"curr_freq\000"
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	bus_ctrl, %object
	.size	bus_ctrl, 16
bus_ctrl:
	.space	16
	.ident	"GCC: (GNU) 4.8"
