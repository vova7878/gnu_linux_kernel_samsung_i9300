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
	.file	"tmu.c"
	.text
	.align	2
	.type	get_curr_temp, %function
get_curr_temp:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	subs	r4, r0, #0
	beq	.L6
	ldr	r2, [r4, #16]
	ldrb	r3, [r4, #32]	@ zero_extendqisi2
	ldr	r5, [r2, #64]
	uxtb	r5, r5
	rsb	r2, r5, r3
	cmp	r2, #15
	bgt	.L3
	rsb	r3, r3, r5
	cmp	r3, #100
	bgt	.L3
.L4:
	adds	r1, r3, #25
	bmi	.L8
.L5:
	mov	r0, r1
	ldmfd	sp!, {r3, r4, r5, pc}
.L6:
	mvn	r0, #10
	ldmfd	sp!, {r3, r4, r5, pc}
.L3:
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	ldrb	r3, [r4, #32]	@ zero_extendqisi2
	rsb	r3, r3, r5
	b	.L4
.L8:
	movw	r0, #:lower16:.LC1
	movw	r2, #:lower16:printk
	movt	r0, #:upper16:.LC1
	movt	r2, #:upper16:printk
	blx	r2
	mov	r1, #0
	b	.L5
	.fnend
	.size	get_curr_temp, .-get_curr_temp
	.section	.text.unlikely,"ax",%progbits
	.align	2
	.type	print_temperature_params, %function
print_temperature_params:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	.save {r4, r5, lr}
	.pad #28
	sub	sp, sp, #28
	ldr	r3, [r0]
	movw	r5, #:lower16:printk
	movw	r0, #:lower16:.LC2
	movt	r5, #:upper16:printk
	movt	r0, #:upper16:.LC2
	ldr	r4, [r3, #84]
	ldr	r3, [r4, #12]
	str	r3, [sp]
	ldr	r3, [r4, #16]
	str	r3, [sp, #4]
	ldr	r3, [r4, #20]
	str	r3, [sp, #8]
	ldr	r3, [r4, #24]
	str	r3, [sp, #12]
	ldr	r3, [r4, #28]
	str	r3, [sp, #16]
	ldmia	r4, {r1, r2, r3}
	blx	r5
	movw	r0, #:lower16:.LC3
	ldr	r1, [r4, #32]
	ldr	r2, [r4, #36]
	movt	r0, #:upper16:.LC3
	blx	r5
	add	sp, sp, #28
	@ sp needed
	ldmfd	sp!, {r4, r5, pc}
	.fnend
	.size	print_temperature_params, .-print_temperature_params
	.text
	.align	2
	.type	s5p_tmu_driver_init, %function
s5p_tmu_driver_init:
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
	.size	s5p_tmu_driver_init, .-s5p_tmu_driver_init
	.align	2
	.type	exynos_tc_volt, %function
exynos_tc_volt:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	subs	r4, r0, #0
	mov	r6, r1
	beq	.L20
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L20
	movw	r5, #:lower16:.LANCHOR1
	movt	r5, #:upper16:.LANCHOR1
	ldr	r3, [r5]
	cmp	r1, r3
	beq	.L21
	cmp	r1, #0
	beq	.L13
	movw	r3, #:lower16:exynos_cpufreq_lock
	mov	r0, #8
	movt	r3, #:upper16:exynos_cpufreq_lock
	ldr	r1, [r4, #64]
	blx	r3
	subs	r7, r0, #0
	bne	.L14
	movw	r3, #:lower16:dev_lock
	ldr	r0, [r4, #4]
	movt	r3, #:upper16:dev_lock
	ldr	r1, [r4]
	ldr	r2, [r4, #68]
	blx	r3
	subs	r7, r0, #0
	beq	.L26
.L14:
	movw	r1, #:lower16:.LC4
	movt	r1, #:upper16:.LC4
.L16:
	movw	r0, #:lower16:.LC7
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC7
	blx	r3
	mov	r0, r7
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L13:
	movw	r3, #:lower16:exynos_cpufreq_lock_free
	mov	r0, #8
	movt	r3, #:upper16:exynos_cpufreq_lock_free
	blx	r3
	movw	r3, #:lower16:dev_unlock
	ldr	r0, [r4, #4]
	movt	r3, #:upper16:dev_unlock
	ldr	r1, [r4]
	blx	r3
	subs	r7, r0, #0
	bne	.L22
	movw	r1, #:lower16:.LC5
	str	r7, [r5]
	movt	r1, #:upper16:.LC5
.L18:
	movw	r0, #:lower16:.LC6
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC6
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L22:
	movw	r1, #:lower16:.LC5
	movt	r1, #:upper16:.LC5
	b	.L16
.L26:
	movw	r1, #:lower16:.LC4
	str	r6, [r5]
	movt	r1, #:upper16:.LC4
	b	.L18
.L21:
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L20:
	mvn	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
	.fnend
	.size	exynos_tc_volt, .-exynos_tc_volt
	.align	2
	.type	s5p_tmu_resume, %function
s5p_tmu_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r3, #:lower16:dev_get_drvdata
	add	r0, r0, #8
	movt	r3, #:upper16:dev_get_drvdata
	blx	r3
	subs	r4, r0, #0
	beq	.L33
	ldr	r2, [r4]
	cmp	r2, #0
	beq	.L33
	ldr	r1, [r4, #16]
	movw	r0, #12560
	ldr	ip, [r4, #172]
	movw	r3, #:lower16:__const_udelay
	ldr	r5, [r2, #84]
	movt	r3, #:upper16:__const_udelay
	movt	r0, 4915
	str	ip, [r1, #32]
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #176]
	str	r1, [r2, #44]
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #180]
	str	r1, [r2, #48]
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #184]
	str	r1, [r2, #52]
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #192]
	str	r1, [r2, #80]
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #196]
	str	r1, [r2, #84]
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #188]
	str	r1, [r2, #112]
	blx	r3
	mov	r0, r4
	bl	get_curr_temp
	ldr	r3, [r5, #36]
	cmp	r0, r3
	bls	.L34
.L30:
	movw	r3, #:lower16:.LANCHOR1
	mov	r0, #0
	movt	r3, #:upper16:.LANCHOR1
	movw	ip, #:lower16:queue_delayed_work_on
	ldr	r1, [r3, #4]
	add	r2, r4, #120
	mov	r3, r0
	movt	ip, #:upper16:queue_delayed_work_on
	blx	ip
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, pc}
.L34:
	mov	r0, r4
	mov	r1, #1
	bl	exynos_tc_volt
	cmp	r0, #0
	bge	.L30
	movw	r0, #:lower16:.LC8
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC8
	blx	r3
	b	.L30
.L33:
	mvn	r0, #10
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	s5p_tmu_resume, .-s5p_tmu_resume
	.align	2
	.type	s5p_tmu_suspend, %function
s5p_tmu_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:dev_get_drvdata
	movt	r3, #:upper16:dev_get_drvdata
	add	r0, r0, #8
	blx	r3
	subs	r3, r0, #0
	beq	.L37
	ldr	r2, [r3, #16]
	movw	r1, #:lower16:disable_irq
	ldr	r0, [r3, #24]
	movt	r1, #:upper16:disable_irq
	ldr	ip, [r2, #32]
	str	ip, [r3, #172]
	ldr	ip, [r2, #44]
	str	ip, [r3, #176]
	ldr	ip, [r2, #48]
	str	ip, [r3, #180]
	ldr	ip, [r2, #52]
	str	ip, [r3, #184]
	ldr	ip, [r2, #112]
	str	ip, [r3, #188]
	ldr	ip, [r2, #80]
	str	ip, [r3, #192]
	ldr	r2, [r2, #84]
	str	r2, [r3, #196]
	blx	r1
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
.L37:
	mvn	r0, #10
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	s5p_tmu_suspend, .-s5p_tmu_suspend
	.align	2
	.type	show_tmu_state, %function
show_tmu_state:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r3, #:lower16:dev_get_drvdata
	mov	r4, r0
	movt	r3, #:upper16:dev_get_drvdata
	mov	r5, r2
	blx	r3
	cmp	r4, #0
	mov	r2, r0
	beq	.L40
	movw	r1, #:lower16:.LC9
	movw	r3, #:lower16:sprintf
	mov	r0, r5
	ldr	r2, [r2, #40]
	movt	r1, #:upper16:.LC9
	movt	r3, #:upper16:sprintf
	blx	r3
	ldmfd	sp!, {r3, r4, r5, pc}
.L40:
	mvn	r0, #18
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	show_tmu_state, .-show_tmu_state
	.align	2
	.type	s5p_tmu_show_curr_temp, %function
s5p_tmu_show_curr_temp:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r3, #:lower16:dev_get_drvdata
	movt	r3, #:upper16:dev_get_drvdata
	mov	r5, r2
	blx	r3
	bl	get_curr_temp
	add	r4, r0, r0, asl #2
	movw	r3, #:lower16:printk
	movw	r0, #:lower16:.LC10
	mov	r4, r4, asl #1
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC10
	mov	r1, r4
	blx	r3
	movw	r1, #:lower16:.LC9
	movw	r3, #:lower16:sprintf
	mov	r0, r5
	mov	r2, r4
	movt	r1, #:upper16:.LC9
	movt	r3, #:upper16:sprintf
	blx	r3
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	s5p_tmu_show_curr_temp, .-s5p_tmu_show_curr_temp
	.align	2
	.type	show_lot_id, %function
show_lot_id:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	mov	r3, #-33554432
	ldr	lr, [r3, #20]
	movw	r1, #:lower16:.LC11
	movw	ip, #:lower16:sprintf
	mov	r0, r2
	ldr	r3, [r3, #24]
	movt	r1, #:upper16:.LC11
	movt	ip, #:upper16:sprintf
	mov	r2, lr
	blx	ip
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	show_lot_id, .-show_lot_id
	.align	2
	.type	show_temperature, %function
show_temperature:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:dev_get_drvdata
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r3, #:upper16:dev_get_drvdata
	mov	r4, r0
	mov	r5, r2
	blx	r3
	cmp	r4, #0
	mov	r6, r0
	beq	.L45
	movw	r3, #:lower16:mutex_lock
	ldr	r0, .L46
	movt	r3, #:upper16:mutex_lock
	blx	r3
	mov	r0, r6
	bl	get_curr_temp
	movw	r3, #:lower16:mutex_unlock
	mov	r4, r0
	movt	r3, #:upper16:mutex_unlock
	ldr	r0, .L46
	blx	r3
	movw	r1, #:lower16:.LC12
	movw	r3, #:lower16:sprintf
	mov	r0, r5
	mov	r2, r4
	movt	r1, #:upper16:.LC12
	movt	r3, #:upper16:sprintf
	blx	r3
	ldmfd	sp!, {r4, r5, r6, pc}
.L45:
	mvn	r0, #18
	ldmfd	sp!, {r4, r5, r6, pc}
.L47:
	.align	2
.L46:
	.word	.LANCHOR0+80
	.fnend
	.size	show_temperature, .-show_temperature
	.align	2
	.type	exynos4_poll_cur_temp, %function
exynos4_poll_cur_temp:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	movw	r1, #:lower16:mutex_lock
	mov	r4, r0
	movt	r1, #:upper16:mutex_lock
	ldr	r5, [r3, #104]
	add	r0, r3, #80
	blx	r1
	tst	r5, #1
	beq	.L49
	sub	r0, r4, #76
	bl	get_curr_temp
.L49:
	movw	r3, #:lower16:.LANCHOR1
	movw	ip, #:lower16:queue_delayed_work_on
	movt	r3, #:upper16:.LANCHOR1
	mov	r2, r4
	ldr	r1, [r3, #4]
	movt	ip, #:upper16:queue_delayed_work_on
	ldr	r3, [r4, #88]
	mov	r0, #0
	blx	ip
	movw	r3, #:lower16:mutex_unlock
	ldr	r0, .L53
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	ldmfd	sp!, {r3, r4, r5, pc}
.L54:
	.align	2
.L53:
	.word	.LANCHOR0+80
	.fnend
	.size	exynos4_poll_cur_temp, .-exynos4_poll_cur_temp
	.align	2
	.type	s5p_tmu_remove, %function
s5p_tmu_remove:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r3, #:lower16:dev_get_drvdata
	add	r6, r0, #8
	movt	r3, #:upper16:dev_get_drvdata
	mov	r7, r0
	mov	r0, r6
	blx	r3
	movw	r3, #:lower16:del_timer_sync
	mov	r4, r0
	movt	r3, #:upper16:del_timer_sync
	add	r0, r0, #136
	blx	r3
	cmp	r0, #0
	add	r5, r4, #120
	bne	.L62
.L56:
	movw	r2, #:lower16:.LANCHOR1
	movw	r3, #:lower16:destroy_workqueue
	movt	r2, #:upper16:.LANCHOR1
	movt	r3, #:upper16:destroy_workqueue
	ldr	r0, [r2, #4]
	movw	r5, #:lower16:device_remove_file
	blx	r3
	movt	r5, #:upper16:device_remove_file
	mov	r0, r6
	ldr	r1, .L63
	blx	r5
	mov	r0, r6
	ldr	r1, .L63+4
	blx	r5
	ldr	r0, [r4, #24]
	cmp	r0, #0
	blt	.L57
	movw	r3, #:lower16:free_irq
	mov	r1, r4
	movt	r3, #:upper16:free_irq
	blx	r3
.L57:
	movw	r3, #:lower16:__arm_iounmap
	ldr	r0, [r4, #16]
	movt	r3, #:upper16:__arm_iounmap
	movw	r5, #:lower16:kfree
	blx	r3
	movw	r3, #:lower16:release_resource
	ldr	r0, [r4, #20]
	movt	r3, #:upper16:release_resource
	movt	r5, #:upper16:kfree
	blx	r3
	ldr	r0, [r4, #20]
	blx	r5
	mov	r0, r4
	blx	r5
	ldr	r1, [r7, #52]
	movw	r0, #:lower16:.LC13
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC13
	movt	r3, #:upper16:printk
	cmp	r1, #0
	ldreq	r1, [r7, #16]
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L62:
	movw	r3, #:lower16:_clear_bit
	mov	r1, r5
	movt	r3, #:upper16:_clear_bit
	mov	r0, #0
	blx	r3
	b	.L56
.L64:
	.align	2
.L63:
	.word	.LANCHOR0+108
	.word	.LANCHOR0+124
	.fnend
	.size	s5p_tmu_remove, .-s5p_tmu_remove
	.align	2
	.type	exynos4x12_tmu_irq_handler, %function
exynos4x12_tmu_irq_handler:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:disable_irq_nosync
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r3, #:upper16:disable_irq_nosync
	mov	r4, r1
	movw	r5, #:lower16:printk
	blx	r3
	ldr	r3, [r4, #16]
	movw	r0, #:lower16:.LC14
	movt	r0, #:upper16:.LC14
	movt	r5, #:upper16:printk
	ldr	r6, [r3, #116]
	ubfx	r1, r6, #0, #17
	blx	r5
	tst	r6, #65536
	beq	.L66
	ldr	r2, [r4, #16]
	movw	r5, #:lower16:.LANCHOR1
	movt	r5, #:upper16:.LANCHOR1
	movw	r3, #4369
	ldr	r1, [r5, #8]
	movt	r3, 17
	mov	r0, #5
	str	r0, [r4, #40]
	str	r3, [r2, #120]
	cmp	r1, #0
	ldr	r3, [r4, #16]
	ldreq	r2, [r3, #112]
	streq	r2, [r5, #8]
	mov	r2, #0
	str	r2, [r3, #112]
.L69:
	mov	r0, r4
	bl	get_curr_temp
	movw	ip, #:lower16:queue_delayed_work_on
	str	r0, [r4, #44]
	ldr	r1, [r5, #4]
	movt	ip, #:upper16:queue_delayed_work_on
	add	r2, r4, #120
	ldr	r3, [r4, #168]
	mov	r0, #0
	blx	ip
	mov	r0, #1
	ldmfd	sp!, {r4, r5, r6, pc}
.L66:
	tst	r6, #256
	beq	.L70
	ldr	r3, [r4, #16]
	mov	r1, #3
	mov	r2, #256
	movw	r5, #:lower16:.LANCHOR1
	str	r1, [r4, #40]
	movt	r5, #:upper16:.LANCHOR1
	str	r2, [r3, #120]
	b	.L69
.L70:
	tst	r6, #16
	bne	.L74
	ands	r6, r6, #1
	beq	.L72
	ldr	r2, [r4, #16]
	mov	r3, #1
	movw	r5, #:lower16:.LANCHOR1
	str	r3, [r4, #40]
	movt	r5, #:upper16:.LANCHOR1
	str	r3, [r2, #120]
	b	.L69
.L74:
	ldr	r3, [r4, #16]
	mov	r1, #2
	mov	r2, #16
	movw	r5, #:lower16:.LANCHOR1
	str	r1, [r4, #40]
	movt	r5, #:upper16:.LANCHOR1
	str	r2, [r3, #120]
	b	.L69
.L72:
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LANCHOR2
	movt	r1, #:upper16:.LANCHOR2
	movt	r0, #:upper16:.LC15
	blx	r5
	ldr	r2, [r4, #16]
	movw	r3, #4369
	movt	r3, 17
	movw	r1, #:lower16:.LANCHOR1
	movt	r1, #:upper16:.LANCHOR1
	movw	ip, #:lower16:queue_delayed_work_on
	str	r3, [r2, #120]
	mov	r0, r6
	ldr	r3, [r4, #168]
	add	r2, r4, #120
	ldr	r1, [r1, #4]
	movt	ip, #:upper16:queue_delayed_work_on
	mov	r3, r3, lsr #1
	blx	ip
	mvn	r0, #18
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	exynos4x12_tmu_irq_handler, .-exynos4x12_tmu_irq_handler
	.align	2
	.type	notify_change_of_tmu_state, %function
notify_change_of_tmu_state:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r4, #:lower16:__stack_chk_guard
	movt	r4, #:upper16:__stack_chk_guard
	.pad #32
	sub	sp, sp, #32
	add	r6, sp, #8
	movw	r2, #:lower16:.LC16
	ldr	lr, [r4]
	movw	ip, #:lower16:snprintf
	mov	r5, r0
	ldr	r3, [r0, #40]
	movt	r2, #:upper16:.LC16
	movt	ip, #:upper16:snprintf
	mov	r1, #20
	mov	r0, r6
	str	lr, [sp, #28]
	blx	ip
	movw	r0, #:lower16:.LC17
	movw	ip, #:lower16:printk
	mov	lr, #0
	mov	r3, r6
	ldr	r2, [r5, #40]
	movt	ip, #:upper16:printk
	ldr	r1, .L78
	movt	r0, #:upper16:.LC17
	stmia	sp, {r6, lr}
	blx	ip
	ldr	r0, [r5]
	movw	r3, #:lower16:kobject_uevent_env
	movt	r3, #:upper16:kobject_uevent_env
	mov	r2, sp
	mov	r1, #2
	add	r0, r0, #8
	blx	r3
	ldr	r2, [sp, #28]
	ldr	r3, [r4]
	cmp	r2, r3
	bne	.L77
	add	sp, sp, #32
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, pc}
.L77:
	movw	r3, #:lower16:__stack_chk_fail
	movt	r3, #:upper16:__stack_chk_fail
	blx	r3
.L79:
	.align	2
.L78:
	.word	.LANCHOR2+28
	.fnend
	.size	notify_change_of_tmu_state, .-notify_change_of_tmu_state
	.align	2
	.type	s5p_tmu_probe, %function
s5p_tmu_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r2, #:lower16:kmalloc_caches
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movt	r2, #:upper16:kmalloc_caches
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	.pad #28
	sub	sp, sp, #28
	ldr	r2, [r2, #32]
	mov	r8, r0
	ldr	r9, [r3, #104]
	cmp	r2, #0
	beq	.L118
	movw	r3, #:lower16:kmem_cache_alloc_trace
	mov	r0, r2
	movt	r3, #:upper16:kmem_cache_alloc_trace
	movw	r1, #32976
	mov	r2, #212
	blx	r3
	subs	r5, r0, #0
	bne	.L81
	add	r4, r8, #8
	movw	r1, #:lower16:.LC18
	movw	r8, #:lower16:dev_err
	mvn	fp, #11
	mov	r0, r4
	movt	r1, #:upper16:.LC18
	movt	r8, #:upper16:dev_err
	blx	r8
.L82:
	movw	r1, #:lower16:.LC37
	mov	r0, r4
	movt	r1, #:upper16:.LC37
	blx	r8
.L117:
	mov	r0, fp
	add	sp, sp, #28
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L118:
	mov	r5, #16
.L81:
	add	r4, r8, #8
	movw	r3, #:lower16:dev_set_drvdata
	movt	r3, #:upper16:dev_set_drvdata
	mov	r0, r4
	mov	r1, r5
	blx	r3
	mov	r3, #4
	str	r4, [r5]
	str	r3, [r5, #40]
	ldr	r10, [r8, #92]
	ldr	r0, [r10, #40]
	cmp	r0, #0
	bne	.L138
.L83:
	ldr	r0, [r10, #44]
	cmp	r0, #0
	bne	.L139
.L84:
	movw	r0, #:lower16:.LC19
	movw	r7, #:lower16:printk
	ldr	r1, .L152
	movt	r0, #:upper16:.LC19
	ldr	r2, [r5, #48]
	movt	r7, #:upper16:printk
	ldr	r3, [r5, #52]
	blx	r7
	movw	r3, #:lower16:exynos_find_cpufreq_level_by_volt
	ldr	r0, [r10, #48]
	movt	r3, #:upper16:exynos_find_cpufreq_level_by_volt
	add	r1, r5, #64
	blx	r3
	cmp	r0, #0
	blt	.L140
	movw	r0, #:lower16:.LC21
	movw	r3, #:lower16:dev_get
	movt	r3, #:upper16:dev_get
	movt	r0, #:upper16:.LC21
	blx	r3
	movw	r3, #:lower16:exynos4x12_find_busfreq_by_volt
	str	r0, [r5, #4]
	movt	r3, #:upper16:exynos4x12_find_busfreq_by_volt
	ldr	r0, [r10, #52]
	add	r1, r5, #68
	blx	r3
	cmp	r0, #0
	beq	.L87
	movw	r1, #:lower16:.LC22
	movw	r8, #:lower16:dev_err
	movt	r1, #:upper16:.LC22
.L137:
	movw	r6, #:lower16:kfree
	mvn	fp, #21
	movt	r6, #:upper16:kfree
	movt	r8, #:upper16:dev_err
	mov	r0, r4
	blx	r8
.L86:
	mov	r0, r5
	blx	r6
	b	.L82
.L138:
	movw	r3, #:lower16:exynos_cpufreq_get_level
	add	r1, r5, #48
	movt	r3, #:upper16:exynos_cpufreq_get_level
	blx	r3
	b	.L83
.L140:
	movw	r1, #:lower16:.LC20
	movw	r8, #:lower16:dev_err
	movt	r1, #:upper16:.LC20
	b	.L137
.L139:
	movw	r3, #:lower16:exynos_cpufreq_get_level
	add	r1, r5, #52
	movt	r3, #:upper16:exynos_cpufreq_get_level
	blx	r3
	b	.L84
.L87:
	movw	r0, #:lower16:.LC23
	ldr	r2, [r5, #64]
	ldr	r3, [r5, #68]
	movt	r0, #:upper16:.LC23
	ldr	r1, .L152
	movw	fp, #:lower16:usecs_to_jiffies
	blx	r7
	movw	r0, #:lower16:.LC24
	mov	r1, #46
	movt	r0, #:upper16:.LC24
	movt	fp, #:upper16:usecs_to_jiffies
	blx	r7
	mov	r3, #46
	movw	r0, #:lower16:.LC24
	mov	r1, #93
	str	r3, [r5, #56]
	movt	r0, #:upper16:.LC24
	blx	r7
	mov	r3, #93
	movw	r0, #16960
	str	r3, [r5, #60]
	movt	r0, 15
	blx	fp
	str	r0, [r5, #168]
	movw	r0, #38528
	movt	r0, 152
	blx	fp
	tst	r9, #2
	str	r0, [r5, #164]
	beq	.L88
	movw	r6, #:lower16:.LANCHOR1
	ldr	r2, [r5]
	movt	r6, #:upper16:.LANCHOR1
	ldr	r3, [r6, #12]
	ldr	ip, [r2, #84]
	cmp	r3, #0
	beq	.L89
	add	lr, r6, #16
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr, {r0, r1}
	stmia	ip, {r0, r1}
.L89:
	ldr	r2, [r6, #56]
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	cmp	r2, #0
	ldrne	r2, [r3, #60]
	ldrne	r3, [r3, #64]
	strne	r2, [r5, #48]
	strne	r3, [r5, #52]
	ldr	r3, [r6, #68]
	movw	r6, #:lower16:.LANCHOR1
	movt	r6, #:upper16:.LANCHOR1
	cmp	r3, #0
	beq	.L88
	ldr	r0, [r6, #72]
	mov	r3, #1000
	str	r3, [sp, #20]
	mul	r0, r3, r0
	blx	fp
	str	r0, [r5, #168]
	ldr	r2, [r6, #76]
	ldr	r3, [sp, #20]
	mul	r0, r3, r2
	blx	fp
	str	r0, [r5, #164]
.L88:
	movw	r3, #:lower16:print_temperature_params
	mov	r0, r5
	movt	r3, #:upper16:print_temperature_params
	blx	r3
	movw	r3, #:lower16:platform_get_resource
	mov	r0, r8
	movt	r3, #:upper16:platform_get_resource
	mov	r1, #512
	mov	r2, #0
	blx	r3
	subs	r6, r0, #0
	beq	.L141
	ldr	r2, [r6, #4]
	mov	fp, #0
	ldr	r1, [r6]
	movw	r0, #:lower16:iomem_resource
	movw	ip, #:lower16:__request_region
	str	fp, [sp]
	add	r2, r2, #1
	movt	r0, #:upper16:iomem_resource
	movt	ip, #:upper16:__request_region
	rsb	r2, r1, r2
	ldr	r3, [r8]
	blx	ip
	cmp	r0, fp
	str	r0, [r5, #20]
	beq	.L142
	ldr	r1, [r6, #4]
	movw	r3, #:lower16:__arm_ioremap
	ldr	r0, [r6]
	mov	r2, fp
	movt	r3, #:upper16:__arm_ioremap
	add	r1, r1, #1
	rsb	r1, r0, r1
	blx	r3
	cmp	r0, #0
	str	r0, [r5, #16]
	beq	.L143
	ldr	r0, [r8, #52]
	mov	fp, #0
	movw	ip, #:lower16:__alloc_workqueue_key
	mov	r3, fp
	movt	ip, #:upper16:__alloc_workqueue_key
	mov	r1, #14
	cmp	r0, #0
	mov	r2, #1
	ldreq	r0, [r8, #16]
	movw	r6, #:lower16:.LANCHOR1
	str	fp, [sp]
	movt	r6, #:upper16:.LANCHOR1
	blx	ip
	cmp	r0, fp
	str	r0, [r6, #4]
	beq	.L144
	tst	r9, #1
	bne	.L136
	movw	r9, #:lower16:init_timer_deferrable_key
	movt	r9, #:upper16:init_timer_deferrable_key
.L100:
	movw	r3, #:lower16:exynos4_handler_tmu_state
	add	ip, r5, #124
	movt	r3, #:upper16:exynos4_handler_tmu_state
	mov	r1, #0
	mov	r2, #1280
	str	r3, [r5, #132]
	str	r2, [r5, #120]
	add	r0, r5, #136
	mov	r2, r1
	str	ip, [r5, #124]
	str	ip, [r5, #128]
	blx	r9
	movw	r3, #:lower16:platform_get_irq
	mov	r0, r8
	mov	r1, #0
	movt	r3, #:upper16:platform_get_irq
	blx	r3
	cmp	r0, #0
	mov	r2, r0
	str	r0, [r5, #24]
	blt	.L145
	movw	r3, #:lower16:.LC30
	movw	r1, #:lower16:exynos4x12_tmu_irq_handler
	movt	r3, #:upper16:.LC30
	movw	ip, #:lower16:request_threaded_irq
	str	r3, [sp]
	movt	r1, #:upper16:exynos4x12_tmu_irq_handler
	str	r5, [sp, #4]
	movt	ip, #:upper16:request_threaded_irq
	mov	r2, #0
	mov	r3, #32
	blx	ip
	subs	fp, r0, #0
	beq	.L103
	movw	r1, #:lower16:.LC31
	movw	r8, #:lower16:dev_err
	movt	r1, #:upper16:.LC31
	movt	r8, #:upper16:dev_err
	mov	r0, r4
	mov	r2, fp
	blx	r8
.L102:
	movw	r3, #:lower16:destroy_workqueue
	ldr	r0, [r6, #4]
	movt	r3, #:upper16:destroy_workqueue
	blx	r3
.L99:
	movw	r3, #:lower16:__arm_iounmap
	ldr	r0, [r5, #16]
	movt	r3, #:upper16:__arm_iounmap
	blx	r3
.L96:
	movw	r3, #:lower16:release_resource
	ldr	r0, [r5, #20]
	movt	r3, #:upper16:release_resource
	movw	r6, #:lower16:kfree
	blx	r3
	movt	r6, #:upper16:kfree
	ldr	r0, [r5, #20]
	blx	r6
	b	.L86
.L141:
	movw	r1, #:lower16:.LC25
	movw	r8, #:lower16:dev_err
	movt	r1, #:upper16:.LC25
	movt	r8, #:upper16:dev_err
	mov	r0, r4
	movw	r6, #:lower16:kfree
	blx	r8
	movt	r6, #:upper16:kfree
	mvn	fp, #18
	b	.L86
.L103:
	movw	r9, #:lower16:device_create_file
	mov	r0, r4
	movt	r9, #:upper16:device_create_file
	ldr	r1, .L152+4
	blx	r9
	subs	fp, r0, #0
	bne	.L146
	mov	r0, r4
	ldr	r1, .L152+8
	blx	r9
	subs	fp, r0, #0
	bne	.L147
	mov	r0, r4
	ldr	r1, .L152+12
	blx	r9
	subs	fp, r0, #0
	bne	.L148
	movw	r3, #:lower16:dev_get_drvdata
	mov	r0, r4
	movt	r3, #:upper16:dev_get_drvdata
	blx	r3
	ldr	r2, [r0, #16]
	mov	r8, r0
	ldr	r3, [r2, #40]
	tst	r3, #1
	beq	.L149
	ldr	r3, [r8]
	movw	r0, #12560
	ldr	r1, [r2, #20]
	movw	fp, #:lower16:__const_udelay
	movt	fp, #:upper16:__const_udelay
	movt	r0, 4915
	ldr	r3, [r3, #84]
	orr	r1, r1, #1
	str	r1, [r2, #20]
	str	r3, [sp, #20]
	blx	fp
	ldr	r1, [r8, #16]
	movw	r0, #12560
	movt	r0, 4915
	ldr	r2, [r1]
	cmp	r2, #0
	strb	r2, [r8, #32]
	moveq	r2, #55
	ldr	r3, [sp, #20]
	streqb	r2, [r8, #32]
	ldrb	r2, [r8, #32]	@ zero_extendqisi2
	ldr	ip, [r3, #4]
	sub	r2, r2, #25
	uxtb	r2, r2
	add	ip, r2, ip
	str	ip, [sp, #16]
	ldr	ip, [r3, #16]
	add	lr, r2, ip
	ldr	ip, [sp, #16]
	uxtb	lr, lr
	str	lr, [sp, #16]
	ldr	lr, [r3, #12]
	uxtb	ip, ip
	str	ip, [sp, #12]
	orr	ip, ip, #-16777216
	add	r2, r2, lr
	ldr	lr, [sp, #16]
	uxtb	r2, r2
	orr	ip, ip, lr, asl #16
	orr	r2, ip, r2, asl #8
	str	r2, [r1, #80]
	ldr	r1, [r3, #36]
	ldrb	r2, [r8, #32]	@ zero_extendqisi2
	ldr	r3, [r8, #16]
	sub	r1, r1, #25
	add	r2, r1, r2
	ldr	r1, [r3, #80]
	str	r2, [r3, #84]
	ldr	r3, [r8, #16]
	ldr	r2, [r3, #84]
	ldr	r2, [r3, #32]
	orr	r2, r2, #6291456
	orr	r2, r2, #1
	str	r2, [r3, #32]
	blx	fp
	ldr	r3, [r8, #16]
	movw	r2, #273
	mov	r0, r4
	ldr	r1, .L152+16
	ldr	ip, [r3, #116]
	str	r2, [r3, #112]
	ldr	r3, [r8, #16]
	ldr	r2, [r3, #112]
	orr	r2, r2, #65536
	str	r2, [r3, #112]
	blx	r9
	subs	fp, r0, #0
	blt	.L150
	mov	r0, r5
	bl	get_curr_temp
	ldr	r3, [r10, #36]
	cmp	r0, r3
	bls	.L151
.L115:
	movw	ip, #:lower16:queue_delayed_work_on
	ldr	r1, [r6, #4]
	movt	ip, #:upper16:queue_delayed_work_on
	add	r2, r5, #120
	ldr	r3, [r5, #168]
	mov	r0, #0
	blx	ip
	b	.L117
.L145:
	movw	r1, #:lower16:.LC29
	movw	r8, #:lower16:dev_err
	movt	r1, #:upper16:.LC29
	movt	r8, #:upper16:dev_err
	mov	r0, r4
	mvn	fp, #21
	blx	r8
	b	.L102
.L151:
	mov	r0, r5
	mov	r1, #1
	bl	exynos_tc_volt
	cmp	r0, #0
	bge	.L115
	movw	r0, #:lower16:.LC8
	movt	r0, #:upper16:.LC8
	blx	r7
	b	.L115
.L150:
	movw	r1, #:lower16:.LC36
	movw	r8, #:lower16:dev_err
	movt	r1, #:upper16:.LC36
	movt	r8, #:upper16:dev_err
	mov	r0, r4
	blx	r8
.L111:
	movw	r9, #:lower16:device_remove_file
	mov	r0, r4
	movt	r9, #:upper16:device_remove_file
	ldr	r1, .L152+12
	blx	r9
.L109:
	mov	r0, r4
	ldr	r1, .L152+8
	blx	r9
.L107:
	mov	r0, r4
	ldr	r1, .L152+4
	blx	r9
.L105:
	ldr	r0, [r5, #24]
	cmp	r0, #0
	blt	.L102
	movw	r3, #:lower16:free_irq
	mov	r1, r5
	movt	r3, #:upper16:free_irq
	blx	r3
	b	.L102
.L149:
	movw	r0, #:lower16:.LC35
	movw	r8, #:lower16:dev_err
	movt	r0, #:upper16:.LC35
	movt	r8, #:upper16:dev_err
	blx	r7
	mvn	fp, #1
	b	.L111
.L148:
	movw	r0, #:lower16:.LC34
	mov	r1, fp
	movt	r0, #:upper16:.LC34
	movw	r8, #:lower16:dev_err
	movw	r9, #:lower16:device_remove_file
	movt	r8, #:upper16:dev_err
	blx	r7
	movt	r9, #:upper16:device_remove_file
	b	.L109
.L147:
	movw	r0, #:lower16:.LC33
	mov	r1, fp
	movt	r0, #:upper16:.LC33
	movw	r8, #:lower16:dev_err
	movw	r9, #:lower16:device_remove_file
	movt	r8, #:upper16:dev_err
	blx	r7
	movt	r9, #:upper16:device_remove_file
	b	.L107
.L146:
	movw	r0, #:lower16:.LC32
	mov	r1, fp
	movt	r0, #:upper16:.LC32
	movw	r8, #:lower16:dev_err
	blx	r7
	movt	r8, #:upper16:dev_err
	b	.L105
.L136:
	movw	r3, #:lower16:exynos4_poll_cur_temp
	add	r2, r5, #80
	movt	r3, #:upper16:exynos4_poll_cur_temp
	mov	r1, #1280
	movw	r9, #:lower16:init_timer_deferrable_key
	str	r3, [r5, #88]
	str	r1, [r5, #76]
	add	r0, r5, #92
	str	r2, [r5, #80]
	mov	r1, fp
	str	r2, [r5, #84]
	movt	r9, #:upper16:init_timer_deferrable_key
	mov	r2, fp
	blx	r9
	movw	ip, #:lower16:queue_delayed_work_on
	mov	r0, fp
	ldr	r1, [r6, #4]
	movt	ip, #:upper16:queue_delayed_work_on
	add	r2, r5, #76
	ldr	r3, [r5, #164]
	blx	ip
	b	.L100
.L144:
	movw	r0, #:lower16:.LC28
	movw	r8, #:lower16:dev_err
	movt	r0, #:upper16:.LC28
	movt	r8, #:upper16:dev_err
	blx	r7
	mvn	fp, #11
	b	.L99
.L143:
	movw	r1, #:lower16:.LC27
	movw	r8, #:lower16:dev_err
	movt	r1, #:upper16:.LC27
	movt	r8, #:upper16:dev_err
	mov	r0, r4
	mvn	fp, #11
	blx	r8
	b	.L96
.L142:
	movw	r1, #:lower16:.LC26
	movw	r8, #:lower16:dev_err
	movt	r1, #:upper16:.LC26
	movt	r8, #:upper16:dev_err
	mov	r0, r4
	movw	r6, #:lower16:kfree
	blx	r8
	movt	r6, #:upper16:kfree
	mvn	fp, #15
	b	.L86
.L153:
	.align	2
.L152:
	.word	.LANCHOR2+56
	.word	.LANCHOR0+108
	.word	.LANCHOR0+124
	.word	.LANCHOR0+140
	.word	.LANCHOR0+156
	.fnend
	.size	s5p_tmu_probe, .-s5p_tmu_probe
	.align	2
	.type	get_temperature_params, %function
get_temperature_params:
	.fnstart
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:.LANCHOR0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r3, #:upper16:.LANCHOR0
	mov	r4, r0
	.pad #72
	sub	sp, sp, #72
	ldr	r3, [r3, #104]
	tst	r3, #2
	mvneq	r0, #0
	bne	.L195
.L155:
	add	sp, sp, #72
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, pc}
.L195:
	movw	r3, #:lower16:get_options
	mov	r1, #11
	movt	r3, #:upper16:get_options
	add	r2, sp, #28
	blx	r3
	movw	r5, #:lower16:printk
	movw	r0, #:lower16:.LC38
	mov	r1, r4
	movt	r0, #:upper16:.LC38
	movt	r5, #:upper16:printk
	movw	r4, #:lower16:.LANCHOR1
	blx	r5
	ldr	r3, [sp, #28]
	cmp	r3, #0
	movteq	r4, #:upper16:.LANCHOR1
	beq	.L163
	mov	r2, #1
	movt	r4, #:upper16:.LANCHOR1
	str	r2, [r4, #12]
	ble	.L163
	ldr	r2, [sp, #32]
	cmp	r3, #1
	str	r2, [r4, #16]
	beq	.L163
	ldr	r2, [sp, #36]
	cmp	r3, #2
	str	r2, [r4, #20]
	beq	.L163
	ldr	r2, [sp, #40]
	cmp	r3, #3
	str	r2, [r4, #24]
	beq	.L163
	ldr	r2, [sp, #44]
	cmp	r3, #4
	str	r2, [r4, #28]
	beq	.L163
	ldr	r2, [sp, #48]
	cmp	r3, #5
	str	r2, [r4, #32]
	beq	.L163
	ldr	r2, [sp, #52]
	cmp	r3, #6
	str	r2, [r4, #36]
	beq	.L163
	cmp	r3, #7
	ldr	r2, [sp, #56]
	ldrne	r3, [sp, #60]
	str	r2, [r4, #40]
	strne	r3, [r4, #44]
.L163:
	ldr	r1, [r4, #36]
	movw	r0, #:lower16:.LC39
	ldr	r2, [r4, #44]
	movt	r0, #:upper16:.LC39
	ldr	r3, [r4, #40]
	movw	r6, #:lower16:.LANCHOR1
	ldr	lr, [r4, #24]
	movt	r6, #:upper16:.LANCHOR1
	ldr	ip, [r4, #32]
	str	r1, [sp, #8]
	str	lr, [sp]
	str	ip, [sp, #4]
	str	r2, [sp, #12]
	str	r3, [sp, #16]
	ldr	r3, [r4, #28]
	ldr	r1, [r4, #20]
	ldr	r2, [r4, #16]
	blx	r5
	ldr	r3, [sp, #28]
	cmp	r3, #8
	ble	.L165
	cmp	r3, #9
	ldr	r2, [sp, #64]
	ldrne	r3, [sp, #68]
	str	r2, [r6, #48]
	strne	r3, [r6, #52]
.L165:
	movw	r0, #:lower16:.LC40
	ldr	r1, [r4, #52]
	movt	r0, #:upper16:.LC40
	ldr	r2, [r4, #48]
	blx	r5
	mov	r0, #0
	b	.L155
	.fnend
	.size	get_temperature_params, .-get_temperature_params
	.align	2
	.type	get_cpufreq_limit_param, %function
get_cpufreq_limit_param:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:.LANCHOR0
	stmfd	sp!, {r4, r5, lr}
	.save {r4, r5, lr}
	movt	r3, #:upper16:.LANCHOR0
	mov	r4, r0
	.pad #20
	sub	sp, sp, #20
	ldr	r3, [r3, #104]
	tst	r3, #2
	mvneq	r0, #0
	bne	.L207
.L197:
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, pc}
.L207:
	movw	r3, #:lower16:get_options
	add	r2, sp, #4
	movt	r3, #:upper16:get_options
	mov	r1, #3
	blx	r3
	movw	r5, #:lower16:printk
	movw	r0, #:lower16:.LC41
	mov	r1, r4
	movt	r0, #:upper16:.LC41
	movt	r5, #:upper16:printk
	blx	r5
	ldr	r2, [sp, #4]
	movw	r3, #:lower16:.LANCHOR1
	cmp	r2, #0
	movteq	r3, #:upper16:.LANCHOR1
	beq	.L199
	mov	r1, #1
	movt	r3, #:upper16:.LANCHOR1
	str	r1, [r3, #56]
	ble	.L199
	cmp	r2, #1
	ldr	r1, [sp, #8]
	ldrne	r2, [sp, #12]
	str	r1, [r3, #60]
	strne	r2, [r3, #64]
.L199:
	movw	r0, #:lower16:.LC42
	ldr	r1, [r3, #60]
	movt	r0, #:upper16:.LC42
	ldr	r2, [r3, #64]
	blx	r5
	mov	r0, #0
	b	.L197
	.fnend
	.size	get_cpufreq_limit_param, .-get_cpufreq_limit_param
	.align	2
	.type	get_sampling_rate_param, %function
get_sampling_rate_param:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:.LANCHOR0
	stmfd	sp!, {r4, r5, lr}
	.save {r4, r5, lr}
	movt	r3, #:upper16:.LANCHOR0
	mov	r4, r0
	.pad #20
	sub	sp, sp, #20
	ldr	r3, [r3, #104]
	tst	r3, #2
	mvneq	r0, #0
	bne	.L219
.L209:
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, pc}
.L219:
	movw	r3, #:lower16:get_options
	add	r2, sp, #4
	movt	r3, #:upper16:get_options
	mov	r1, #3
	blx	r3
	movw	r5, #:lower16:printk
	movw	r0, #:lower16:.LC43
	mov	r1, r4
	movt	r0, #:upper16:.LC43
	movt	r5, #:upper16:printk
	blx	r5
	ldr	r2, [sp, #4]
	movw	r3, #:lower16:.LANCHOR1
	cmp	r2, #0
	movteq	r3, #:upper16:.LANCHOR1
	beq	.L211
	mov	r1, #1
	movt	r3, #:upper16:.LANCHOR1
	str	r1, [r3, #68]
	ble	.L211
	cmp	r2, #1
	ldr	r1, [sp, #8]
	ldrne	r2, [sp, #12]
	str	r1, [r3, #72]
	strne	r2, [r3, #76]
.L211:
	movw	r0, #:lower16:.LC44
	ldr	r1, [r3, #72]
	movt	r0, #:upper16:.LC44
	ldr	r2, [r3, #76]
	blx	r5
	mov	r0, #0
	b	.L209
	.fnend
	.size	get_sampling_rate_param, .-get_sampling_rate_param
	.align	2
	.global	get_refresh_interval
	.type	get_refresh_interval, %function
get_refresh_interval:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #56963
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movt	r3, 17179
	movw	r2, #19923
	umull	ip, r4, r3, r0
	movt	r2, 4194
	movw	r0, #:lower16:.LC24
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC24
	mov	r4, r4, lsr #18
	mul	r1, r1, r4
	umull	ip, r4, r2, r1
	mov	r4, r4, lsr #6
	mov	r1, r4
	blx	r3
	mov	r0, r4
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	get_refresh_interval, .-get_refresh_interval
	.align	2
	.global	set_refresh_rate
	.type	set_refresh_rate, %function
set_refresh_rate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r1, #12
	movw	r4, #:lower16:exynos_smc
	mov	r5, r0
	mov	r2, r0
	movt	r1, 17432
	movt	r4, #:upper16:exynos_smc
	mov	r3, #0
	mvn	r0, #100
	blx	r4
	movw	r1, #16396
	mov	r2, r5
	movt	r1, 17432
	mov	r3, #0
	mvn	r0, #100
	blx	r4
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	set_refresh_rate, .-set_refresh_rate
	.align	2
	.type	exynos4_handler_tmu_state, %function
exynos4_handler_tmu_state:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r3, #:lower16:mutex_lock
	ldr	r2, [r0, #-120]
	mov	r4, r0
	movt	r3, #:upper16:mutex_lock
	sub	r8, r0, #120
	ldr	r0, .L320
	ldr	r7, [r2, #84]
	blx	r3
	mov	r0, r8
	bl	get_curr_temp
	ldr	r2, [r4, #-76]
	mov	r5, r0
	ldr	r3, [r4, #-80]
	rsb	r9, r2, r0
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L223
.L225:
	.word	.L224
	.word	.L226
	.word	.L227
	.word	.L228
	.word	.L229
	.word	.L230
.L230:
	ldr	r3, [r7, #36]
	cmp	r0, r3
	bls	.L303
	ldr	r3, [r7, #32]
	cmp	r0, r3
	bcs	.L304
.L233:
	movw	r6, #:lower16:.LANCHOR1
	movt	r6, #:upper16:.LANCHOR1
	ldr	r3, [r6, #80]
	cmp	r3, #0
	bne	.L305
.L237:
	ldr	r3, [r7, #28]
	cmp	r5, r3
	bcc	.L268
.L314:
	ldr	r3, [r6, #84]
	movw	r7, #:lower16:.LANCHOR1
	movt	r7, #:upper16:.LANCHOR1
	cmp	r3, #0
	bne	.L269
	cmp	r9, #0
	bgt	.L306
.L269:
	movw	ip, #:lower16:queue_delayed_work_on
	ldr	r3, [r4, #48]
	mov	r2, r4
	str	r5, [r4, #-76]
	movt	ip, #:upper16:queue_delayed_work_on
	ldr	r1, [r6, #4]
	mov	r0, #0
	blx	ip
	movw	r3, #:lower16:mutex_unlock
	ldr	r0, .L320
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L224:
	ldr	r3, [r7, #4]
	cmp	r0, r3
	bcs	.L307
	ldr	r3, [r7, #36]
	cmp	r0, r3
	bls	.L308
	ldr	r3, [r7]
	cmp	r0, r3
	bhi	.L299
	ldr	r3, [r7, #24]
	movw	r6, #:lower16:.LANCHOR1
	movt	r6, #:upper16:.LANCHOR1
	cmp	r0, r3
	bhi	.L237
	ldr	r3, [r6, #80]
	tst	r3, #1
	beq	.L242
	movw	r3, #:lower16:exynos_cpufreq_upper_limit_free
	mov	r0, #8
	movt	r3, #:upper16:exynos_cpufreq_upper_limit_free
	blx	r3
	ldr	r3, [r6, #80]
	bic	r3, r3, #1
	str	r3, [r6, #80]
.L242:
	mov	r0, r8
	bl	notify_change_of_tmu_state
	movw	r0, #:lower16:.LC49
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC49
	blx	r3
	ldr	r1, [r4, #-104]
	movw	r2, #4369
	ldr	r0, [r6, #8]
	movt	r2, 17
	movw	r3, #:lower16:.LANCHOR1
	str	r2, [r1, #120]
	movt	r3, #:upper16:.LANCHOR1
	ldr	r2, [r4, #-104]
	cmp	r0, #0
	ldreq	r1, [r2, #112]
	streq	r1, [r3, #8]
	movw	r3, #:lower16:enable_irq
	ldr	r1, [r6, #8]
	movt	r3, #:upper16:enable_irq
	str	r1, [r2, #112]
	ldr	r0, [r4, #-96]
	blx	r3
	movw	r3, #:lower16:mutex_unlock
	ldr	r0, .L320
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L226:
	ldr	r3, [r7, #12]
	cmp	r0, r3
	bcs	.L309
	ldr	r3, [r7, #36]
	cmp	r0, r3
	bls	.L302
	ldr	r3, [r7, #4]
	movw	r6, #:lower16:.LANCHOR1
	movt	r6, #:upper16:.LANCHOR1
	cmp	r0, r3
	bcc	.L248
	ldr	r3, [r6, #80]
	tst	r3, #1
	beq	.L310
.L248:
	ldr	r3, [r7]
	cmp	r5, r3
	bhi	.L237
	cmp	r9, #0
	bge	.L237
	mov	r2, #0
	movw	r0, #:lower16:.LC52
	movw	r3, #:lower16:printk
	str	r2, [r4, #-80]
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC52
	blx	r3
	b	.L237
.L228:
	ldr	r3, [r7, #16]
	cmp	r0, r3
	bcc	.L255
	cmp	r9, #0
	ble	.L255
	movw	r6, #:lower16:.LANCHOR1
	movt	r6, #:upper16:.LANCHOR1
	ldr	r3, [r6, #80]
	tst	r3, #4
	beq	.L311
.L255:
	ldr	r3, [r7, #36]
	cmp	r5, r3
	bls	.L312
	ldr	r3, [r7, #8]
	cmp	r5, r3
	bhi	.L258
	cmp	r9, #0
	blt	.L313
.L258:
	ldr	r3, [r7, #20]
	cmp	r5, r3
	bcc	.L299
	cmp	r9, #0
	bgt	.L259
.L299:
	ldr	r3, [r7, #28]
	movw	r6, #:lower16:.LANCHOR1
	movt	r6, #:upper16:.LANCHOR1
	cmp	r5, r3
	bcs	.L314
.L268:
	ldr	r3, [r7, #24]
	cmp	r5, r3
	bhi	.L269
	ldr	r3, [r6, #84]
	movw	r7, #:lower16:.LANCHOR1
	movt	r7, #:upper16:.LANCHOR1
	cmp	r3, #0
	beq	.L269
	cmp	r9, #0
	bge	.L269
	movw	r0, #:lower16:.LC62
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC62
	blx	r3
	ldr	r0, [r4, #-60]
	bl	set_refresh_rate
	mov	r3, #0
	str	r3, [r7, #84]
	b	.L269
.L229:
	movw	r3, #:lower16:disable_irq
	ldr	r0, [r4, #-96]
	movt	r3, #:upper16:disable_irq
	blx	r3
	ldr	r3, [r7, #16]
	cmp	r5, r3
	bcc	.L260
	movw	r10, #:lower16:printk
	mov	r3, #3
	movt	r10, #:upper16:printk
	str	r3, [r4, #-80]
.L261:
	mov	r0, r8
	movw	r6, #:lower16:.LANCHOR1
	bl	notify_change_of_tmu_state
	movw	r0, #:lower16:.LC59
	ldr	r1, .L320+4
	movt	r0, #:upper16:.LC59
	movt	r6, #:upper16:.LANCHOR1
	blx	r10
	b	.L237
.L227:
	ldr	r3, [r7, #16]
	cmp	r0, r3
	bcs	.L315
	ldr	r3, [r7, #36]
	cmp	r0, r3
	bls	.L302
	ldr	r3, [r7, #12]
	movw	r6, #:lower16:.LANCHOR1
	movt	r6, #:upper16:.LANCHOR1
	cmp	r0, r3
	bcc	.L253
	ldr	r3, [r6, #80]
	tst	r3, #2
	beq	.L316
.L253:
	ldr	r3, [r7, #8]
	cmp	r5, r3
	bhi	.L237
	cmp	r9, #0
	bge	.L237
	mov	r2, #1
	movw	r0, #:lower16:.LC55
	movw	r3, #:lower16:printk
	str	r2, [r4, #-80]
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC55
	blx	r3
	b	.L237
.L223:
	movw	r0, #:lower16:.LC60
	movw	r10, #:lower16:printk
	movt	r0, #:upper16:.LC60
	movt	r10, #:upper16:printk
	blx	r10
	ldr	r3, [r7, #16]
	cmp	r5, r3
	bcc	.L266
	mov	r3, #3
	movw	r6, #:lower16:.LANCHOR1
	str	r3, [r4, #-80]
	movt	r6, #:upper16:.LANCHOR1
	b	.L237
.L302:
	mov	r0, r8
	mov	r1, #1
	bl	exynos_tc_volt
	cmp	r0, #0
	blt	.L298
.L300:
	mov	r3, #5
	movw	r6, #:lower16:.LANCHOR1
	str	r3, [r4, #-80]
	movt	r6, #:upper16:.LANCHOR1
	b	.L237
.L260:
	ldr	r3, [r7, #36]
	cmp	r5, r3
	bls	.L317
	ldr	r3, [r7, #12]
	cmp	r5, r3
	bcs	.L318
	ldr	r3, [r7, #4]
	cmp	r5, r3
	bcc	.L265
	mov	r3, #1
	movw	r10, #:lower16:printk
	str	r3, [r4, #-80]
	movt	r10, #:upper16:printk
	b	.L261
.L266:
	ldr	r3, [r7, #36]
	cmp	r5, r3
	bls	.L319
	movw	r6, #:lower16:.LANCHOR1
	mov	r3, #2
	movt	r6, #:upper16:.LANCHOR1
	str	r3, [r4, #-80]
	b	.L237
.L318:
	mov	r3, #2
	movw	r10, #:lower16:printk
	str	r3, [r4, #-80]
	movt	r10, #:upper16:printk
	b	.L261
.L312:
	mov	r0, r8
	mov	r1, #1
	bl	exynos_tc_volt
	cmp	r0, #0
	movge	r3, #5
	strge	r3, [r4, #-80]
	bge	.L258
	movw	r0, #:lower16:.LC8
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC8
	blx	r3
	b	.L258
.L308:
	mov	r0, r8
	mov	r1, #1
	bl	exynos_tc_volt
	cmp	r0, #0
	blt	.L298
	mov	r2, #5
	movw	r0, #:lower16:.LC48
	movw	r3, #:lower16:printk
	str	r2, [r4, #-80]
	movt	r0, #:upper16:.LC48
	movt	r3, #:upper16:printk
	movw	r6, #:lower16:.LANCHOR1
	blx	r3
	movt	r6, #:upper16:.LANCHOR1
	b	.L237
.L305:
	movw	r3, #:lower16:exynos_cpufreq_upper_limit_free
	mov	r0, #8
	movt	r3, #:upper16:exynos_cpufreq_upper_limit_free
	blx	r3
	mov	r3, #0
	str	r3, [r6, #80]
	b	.L237
.L303:
	mov	r0, r8
	mov	r1, #1
	bl	exynos_tc_volt
	cmp	r0, #0
	bge	.L233
	movw	r0, #:lower16:.LC8
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC8
	blx	r3
	b	.L233
.L304:
	mov	r0, r8
	mov	r1, #0
	bl	exynos_tc_volt
	cmp	r0, #0
	movwlt	r0, #:lower16:.LC45
	movwlt	r3, #:lower16:printk
	movge	r2, #0
	movwge	r0, #:lower16:.LC46
	movwge	r3, #:lower16:printk
	movtlt	r0, #:upper16:.LC45
	strge	r2, [r4, #-80]
	movtge	r0, #:upper16:.LC46
	movt	r3, #:upper16:printk
	blx	r3
	b	.L233
.L319:
	mov	r0, r8
	mov	r1, #1
	bl	exynos_tc_volt
	cmp	r0, #0
	bge	.L300
.L247:
	movw	r0, #:lower16:.LC8
	movw	r6, #:lower16:.LANCHOR1
	movt	r0, #:upper16:.LC8
	movt	r6, #:upper16:.LANCHOR1
	blx	r10
	b	.L237
.L317:
	mov	r0, r8
	mov	r1, #1
	bl	exynos_tc_volt
	cmp	r0, #0
	movge	r3, #5
	movwge	r10, #:lower16:printk
	strge	r3, [r4, #-80]
	movtge	r10, #:upper16:printk
	bge	.L261
	movw	r0, #:lower16:.LC8
	movw	r10, #:lower16:printk
	movt	r10, #:upper16:printk
	movt	r0, #:upper16:.LC8
	blx	r10
	b	.L261
.L265:
	ldr	r3, [r7]
	movw	r10, #:lower16:printk
	cmp	r5, r3
	movls	r3, #0
	movthi	r10, #:upper16:printk
	movtls	r10, #:upper16:printk
	strls	r3, [r4, #-80]
	b	.L261
.L298:
	movw	r10, #:lower16:printk
	movt	r10, #:upper16:printk
	b	.L247
.L307:
	mov	r2, #1
	movw	r0, #:lower16:.LC47
	movw	r3, #:lower16:printk
	str	r2, [r4, #-80]
	movt	r0, #:upper16:.LC47
	movt	r3, #:upper16:printk
	movw	r6, #:lower16:.LANCHOR1
	blx	r3
	movt	r6, #:upper16:.LANCHOR1
	b	.L237
.L306:
	movw	r0, #:lower16:.LC61
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC61
	blx	r3
	ldr	r0, [r4, #-64]
	bl	set_refresh_rate
	mov	r3, #1
	str	r3, [r7, #84]
	b	.L269
.L315:
	mov	r2, #3
	movw	r0, #:lower16:.LC53
	movw	r3, #:lower16:printk
	str	r2, [r4, #-80]
	movt	r0, #:upper16:.LC53
	movt	r3, #:upper16:printk
	movw	r6, #:lower16:.LANCHOR1
	blx	r3
	movt	r6, #:upper16:.LANCHOR1
	b	.L237
.L309:
	mov	r2, #2
	movw	r0, #:lower16:.LC50
	movw	r3, #:lower16:printk
	str	r2, [r4, #-80]
	movt	r0, #:upper16:.LC50
	movt	r3, #:upper16:printk
	movw	r6, #:lower16:.LANCHOR1
	blx	r3
	movt	r6, #:upper16:.LANCHOR1
	b	.L237
.L311:
	mov	r0, r8
	bl	notify_change_of_tmu_state
	movw	r0, #:lower16:.LC56
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC56
	blx	r3
	ldr	r2, [r7, #20]
	ldr	r3, [r6, #80]
	cmp	r5, r2
	orr	r3, r3, #4
	str	r3, [r6, #80]
	bcc	.L237
.L259:
	movw	r0, #:lower16:.LC57
	movw	r3, #:lower16:panic
	movt	r0, #:upper16:.LC57
	movt	r3, #:upper16:panic
	blx	r3
.L310:
	tst	r3, #2
	beq	.L249
	movw	r3, #:lower16:exynos_cpufreq_upper_limit_free
	mov	r0, #8
	movt	r3, #:upper16:exynos_cpufreq_upper_limit_free
	blx	r3
	ldr	r3, [r6, #80]
	bic	r3, r3, #2
	str	r3, [r6, #80]
.L249:
	movw	r3, #:lower16:exynos_cpufreq_upper_limit
	ldr	r1, [r4, #-72]
	movt	r3, #:upper16:exynos_cpufreq_upper_limit
	mov	r0, #8
	blx	r3
	ldr	r3, [r6, #80]
	mov	r0, r8
	orr	r3, r3, #1
	str	r3, [r6, #80]
	bl	notify_change_of_tmu_state
	movw	r0, #:lower16:.LC51
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC51
	blx	r3
	b	.L237
.L316:
	tst	r3, #1
	beq	.L254
	movw	r3, #:lower16:exynos_cpufreq_upper_limit_free
	mov	r0, #8
	movt	r3, #:upper16:exynos_cpufreq_upper_limit_free
	blx	r3
	ldr	r3, [r6, #80]
	bic	r3, r3, #1
	str	r3, [r6, #80]
.L254:
	movw	r3, #:lower16:exynos_cpufreq_upper_limit
	ldr	r1, [r4, #-68]
	movt	r3, #:upper16:exynos_cpufreq_upper_limit
	mov	r0, #8
	blx	r3
	ldr	r3, [r6, #80]
	mov	r0, r8
	orr	r3, r3, #2
	str	r3, [r6, #80]
	bl	notify_change_of_tmu_state
	movw	r0, #:lower16:.LC54
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC54
	blx	r3
	b	.L237
.L313:
	mov	r2, #2
	movw	r0, #:lower16:.LC58
	movw	r3, #:lower16:printk
	str	r2, [r4, #-80]
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC58
	blx	r3
	b	.L258
.L321:
	.align	2
.L320:
	.word	.LANCHOR0+80
	.word	.LANCHOR2+72
	.fnend
	.size	exynos4_handler_tmu_state, .-exynos4_handler_tmu_state
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	__func__.19598, %object
	.size	__func__.19598, 27
__func__.19598:
	.ascii	"exynos4x12_tmu_irq_handler\000"
	.space	1
	.type	__func__.19519, %object
	.size	__func__.19519, 27
__func__.19519:
	.ascii	"notify_change_of_tmu_state\000"
	.space	1
	.type	__func__.19622, %object
	.size	__func__.19622, 14
__func__.19622:
	.ascii	"s5p_tmu_probe\000"
	.space	2
	.type	__func__.19553, %object
	.size	__func__.19553, 26
__func__.19553:
	.ascii	"exynos4_handler_tmu_state\000"
	.type	__setup_str_get_sampling_rate_param, %object
	.size	__setup_str_get_sampling_rate_param, 18
__setup_str_get_sampling_rate_param:
	.ascii	"tmu_sampling_rate\000"
	.type	__setup_str_get_cpufreq_limit_param, %object
	.size	__setup_str_get_cpufreq_limit_param, 10
__setup_str_get_cpufreq_limit_param:
	.ascii	"cpu_level\000"
	.type	__setup_str_get_temperature_params, %object
	.size	__setup_str_get_temperature_params, 9
__setup_str_get_temperature_params:
	.ascii	"tmu_test\000"
	.space	1
	.type	__param_str_enable_mask, %object
	.size	__param_str_enable_mask, 16
__param_str_enable_mask:
	.ascii	"tmu.enable_mask\000"
	.section	.initcall7.init,"aw",%progbits
	.align	2
	.type	__initcall_s5p_tmu_driver_init7, %object
	.size	__initcall_s5p_tmu_driver_init7, 4
__initcall_s5p_tmu_driver_init7:
	.word	s5p_tmu_driver_init
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	s5p_tmu_driver, %object
	.size	s5p_tmu_driver, 80
s5p_tmu_driver:
	.word	s5p_tmu_probe
	.word	s5p_tmu_remove
	.space	4
	.word	s5p_tmu_suspend
	.word	s5p_tmu_resume
	.word	.LC63
	.space	4
	.word	0
	.space	44
	.space	4
	.type	tmu_lock, %object
	.size	tmu_lock, 24
tmu_lock:
	.word	1
	.word	0
	.space	4
	.word	tmu_lock+12
	.word	tmu_lock+12
	.space	4
	.type	enable_mask, %object
	.size	enable_mask, 4
enable_mask:
	.word	3
	.type	dev_attr_temperature, %object
	.size	dev_attr_temperature, 16
dev_attr_temperature:
	.word	.LC67
	.short	292
	.space	2
	.word	show_temperature
	.word	0
	.type	dev_attr_tmu_state, %object
	.size	dev_attr_tmu_state, 16
dev_attr_tmu_state:
	.word	.LC66
	.short	292
	.space	2
	.word	show_tmu_state
	.word	0
	.type	dev_attr_lot_id, %object
	.size	dev_attr_lot_id, 16
dev_attr_lot_id:
	.word	.LC65
	.short	292
	.space	2
	.word	show_lot_id
	.word	0
	.type	dev_attr_curr_temp, %object
	.size	dev_attr_curr_temp, 16
dev_attr_curr_temp:
	.word	.LC64
	.short	292
	.space	2
	.word	s5p_tmu_show_curr_temp
	.word	0
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<4>temperature code is in inaccurate -->check if vd"
	.ascii	"d_18_ts is on\012or surrounding temp is low.\012\000"
	.space	2
.LC1:
	.ascii	"<6>current temp is %d celsius degree.\012so, set to"
	.ascii	" 0 celsius degree!\012\000"
.LC2:
	.ascii	"<6>** temperature set value **\0121st throttling st"
	.ascii	"op_temp  = %u, start_temp     = %u\0122nd throttlin"
	.ascii	"g stop_temp  = %u, start_tmep     = %u\012tripping "
	.ascii	"temp             = %u, s/w emergency temp = %u\012m"
	.ascii	"em throttling stop_temp  = %u, start_temp     = %u\012"
	.ascii	"\000"
.LC3:
	.ascii	"<6>tc_voltage stop_temp = %u, start_temp = %u\012\000"
	.space	1
.LC4:
	.ascii	"lock\000"
	.space	3
.LC5:
	.ascii	"unlock\000"
	.space	1
.LC6:
	.ascii	"<6>TMU: %s is ok!\012\000"
	.space	1
.LC7:
	.ascii	"<3>TMU: %s is fail.\012\000"
	.space	3
.LC8:
	.ascii	"<3>TMU: lock error!\012\000"
	.space	3
.LC9:
	.ascii	"%d\012\000"
.LC10:
	.ascii	"<6>curr temp = %d\012\000"
	.space	1
.LC11:
	.ascii	"%08x-%08x\012\000"
	.space	1
.LC12:
	.ascii	"%u\012\000"
.LC13:
	.ascii	"<6>%s is removed\012\000"
	.space	2
.LC14:
	.ascii	"<6>EXYNOS4x12_tmu interrupt: INTSTAT = 0x%08x\012\000"
	.space	1
.LC15:
	.ascii	"<3>%s: interrupt error\012\000"
.LC16:
	.ascii	"TMUSTATE=%d\000"
.LC17:
	.ascii	"<6>%s: uevent: %d, name = %s\012\000"
	.space	2
.LC18:
	.ascii	"failed to alloc memory!\012\000"
	.space	3
.LC19:
	.ascii	"<6>@@@ %s: cpufreq_limit: 1st_throttle: %u, 2nd_thr"
	.ascii	"ottle = %u\012\000"
	.space	1
.LC20:
	.ascii	"cpufreq_get_level error\012\000"
	.space	3
.LC21:
	.ascii	"exynos-busfreq\000"
	.space	1
.LC22:
	.ascii	"get_busfreq_value error\012\000"
	.space	3
.LC23:
	.ascii	"<6>%s: cpufreq_level[%u], busfreq_value[%u]\012\000"
	.space	3
.LC24:
	.ascii	"<6>@@@ get_refresh_interval = 0x%02x\012\000"
	.space	2
.LC25:
	.ascii	"failed to get memory region resource\012\000"
	.space	2
.LC26:
	.ascii	"failed to reserve memory region\012\000"
	.space	3
.LC27:
	.ascii	"failed ioremap()\012\000"
	.space	2
.LC28:
	.ascii	"<6>Creation of tmu_monitor_wq failed\012\000"
	.space	2
.LC29:
	.ascii	"no irq for thermal %d\012\000"
	.space	1
.LC30:
	.ascii	"s5p-tmu interrupt\000"
	.space	2
.LC31:
	.ascii	"request_irq is failed. %d\012\000"
	.space	1
.LC32:
	.ascii	"<3>Failed to create temperatue file: %d\012\000"
	.space	3
.LC33:
	.ascii	"<3>Failed to create tmu_state file: %d\012\000"
.LC34:
	.ascii	"<3>Failed to create lot id file: %d\012\000"
	.space	3
.LC35:
	.ascii	"<3>failed to start tmu driver\012\000"
	.space	1
.LC36:
	.ascii	"Failed to create sysfs group\012\000"
	.space	2
.LC37:
	.ascii	"initialization failed.\012\000"
.LC38:
	.ascii	"<6>tmu_test=%s\012\000"
.LC39:
	.ascii	"<6>-->1st throttling temp: start[%u], stop[%u]\012-"
	.ascii	"->2nd throttling temp: start[%u], stop[%u]\012-->tr"
	.ascii	"pping temp[%u], emergency temp[%u]\012-->mem thrott"
	.ascii	"ling temp: start[%u], stop[%u]\012\000"
.LC40:
	.ascii	"<6>-->temp compensate : start[%u], stop[%u]\012\000"
	.space	3
.LC41:
	.ascii	"<6>cpu_level=%s\012\000"
	.space	3
.LC42:
	.ascii	"<6>--> cpufreq_limit: 1st cpu_level = %u, 2nd cpu_l"
	.ascii	"evel = %u\012\000"
	.space	2
.LC43:
	.ascii	"<6>tmu_sampling_rate=%s\012\000"
	.space	3
.LC44:
	.ascii	"<6>--> sampling_rate = %u ms, monitor_rate = %u ms\012"
	.ascii	"\000"
.LC45:
	.ascii	"<3>TMU: unlock error!\012\000"
	.space	1
.LC46:
	.ascii	"<6>change state: tc -> normal.\012\000"
.LC47:
	.ascii	"<6>change state: normal->throttle.\012\000"
.LC48:
	.ascii	"<6>change state: normal->tc.\012\000"
	.space	2
.LC49:
	.ascii	"<6>normal: free cpufreq_limit & interrupt enable.\012"
	.ascii	"\000"
	.space	1
.LC50:
	.ascii	"<6>change state: 1st throttle->2nd throttle.\012\000"
	.space	2
.LC51:
	.ascii	"<6>throttling: set cpufreq upper limit.\012\000"
	.space	3
.LC52:
	.ascii	"<6>change state: 1st throttle->normal.\012\000"
.LC53:
	.ascii	"<6>change state: 2nd throttle->trip\012\000"
	.space	3
.LC54:
	.ascii	"<6>2nd throttle: cpufreq is limited.\012\000"
	.space	2
.LC55:
	.ascii	"<6>change state: 2nd throttle->1st throttle, and re"
	.ascii	"lease cpufreq upper limit.\012\000"
	.space	1
.LC56:
	.ascii	"<6>tripping: on waiting shutdown.\012\000"
	.space	1
.LC57:
	.ascii	"Emergency!!!! tripping is not treated!\012\000"
.LC58:
	.ascii	"<6>change state: trip->2nd throttle, Check! occured"
	.ascii	" only test mode.\012\000"
	.space	3
.LC59:
	.ascii	"<6>%s: inform to init state to platform.\012\000"
	.space	2
.LC60:
	.ascii	"<4>Bug: checked tmu_state.\012\000"
.LC61:
	.ascii	"<6>set auto_refresh 1.95us\012\000"
.LC62:
	.ascii	"<6>set auto_refresh 3.9us\012\000"
	.space	1
.LC63:
	.ascii	"s5p-tmu\000"
.LC64:
	.ascii	"curr_temp\000"
	.space	2
.LC65:
	.ascii	"lot_id\000"
	.space	1
.LC66:
	.ascii	"tmu_state\000"
	.space	2
.LC67:
	.ascii	"temperature\000"
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
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	usage.19530, %object
	.size	usage.19530, 4
usage.19530:
	.space	4
	.type	tmu_monitor_wq, %object
	.size	tmu_monitor_wq, 4
tmu_monitor_wq:
	.space	4
	.type	save.19524, %object
	.size	save.19524, 4
save.19524:
	.space	4
	.type	tmu_in, %object
	.size	tmu_in, 68
tmu_in:
	.space	68
	.type	check_handle.19544, %object
	.size	check_handle.19544, 4
check_handle.19544:
	.space	4
	.type	auto_refresh_changed.19543, %object
	.size	auto_refresh_changed.19543, 4
auto_refresh_changed.19543:
	.space	4
	.section	.init.setup,"aw",%progbits
	.align	2
	.type	__setup_get_sampling_rate_param, %object
	.size	__setup_get_sampling_rate_param, 12
__setup_get_sampling_rate_param:
	.word	__setup_str_get_sampling_rate_param
	.word	get_sampling_rate_param
	.word	1
	.type	__setup_get_cpufreq_limit_param, %object
	.size	__setup_get_cpufreq_limit_param, 12
__setup_get_cpufreq_limit_param:
	.word	__setup_str_get_cpufreq_limit_param
	.word	get_cpufreq_limit_param
	.word	1
	.type	__setup_get_temperature_params, %object
	.size	__setup_get_temperature_params, 12
__setup_get_temperature_params:
	.word	__setup_str_get_temperature_params
	.word	get_temperature_params
	.word	1
	.ident	"GCC: (GNU) 4.8"
