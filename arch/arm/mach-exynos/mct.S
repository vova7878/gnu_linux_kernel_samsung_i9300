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
	.file	"mct.c"
	.text
	.align	2
	.type	exynos4_frc_read, %function
exynos4_frc_read:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	stmfd	sp!, {r4, r5}
	.save {r4, r5}
	movt	r2, 65104
	ldr	r1, [r2, #260]
	b	.L3
.L5:
	mov	r1, r3
.L3:
	ldr	r0, [r2, #256]
	ldr	r3, [r2, #260]
	cmp	r1, r3
	bne	.L5
	mov	r2, #0
	orr	r4, r2, r0
	mov	r0, r4
	ldmfd	sp!, {r4, r5}
	bx	lr
	.fnend
	.size	exynos4_frc_read, .-exynos4_frc_read
	.align	2
	.type	exynos4_frc_suspend, %function
exynos4_frc_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	ldr	r3, [r0]
	blx	r3
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	strd	r0, [r3]
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_frc_suspend, .-exynos4_frc_suspend
	.align	2
	.type	exynos4_tick_set_mode, %function
exynos4_tick_set_mode:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r2, sp
	bic	r3, r2, #8128
	movw	r2, #:lower16:__per_cpu_offset
	bic	r3, r3, #63
	movt	r2, #:upper16:__per_cpu_offset
	ldr	ip, [r3, #16]
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	mov	r4, r0
	ldr	r5, [r2, ip, asl #2]
	mov	r6, r1
	add	r5, r3, r5
	mov	r0, r5
	bl	exynos4_mct_tick_stop
	cmp	r4, #2
	beq	.L9
	cmp	r4, #4
	ldmnefd	sp!, {r4, r5, r6, pc}
	ldr	r1, [r5, #4]
	mov	r0, #1
	ldmfd	sp!, {r4, r5, r6, lr}
	b	exynos4_mct_write
.L9:
	ldr	r2, [r6, #40]
	movw	r3, #56533
	movt	r3, 50
	ldr	ip, [r6, #44]
	mov	r1, r5
	umull	r2, r3, r2, r3
	rsb	r4, ip, #32
	sub	r0, ip, #32
	mov	r2, r2, lsr ip
	orr	r2, r2, r3, asl r4
	ldmfd	sp!, {r4, r5, r6, lr}
	orr	r0, r2, r3, lsr r0
	b	exynos4_mct_tick_start
	.fnend
	.size	exynos4_tick_set_mode, .-exynos4_tick_set_mode
	.align	2
	.type	exynos4_mct_write, %function
exynos4_mct_write:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #767
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movt	r3, 65104
	mov	r7, r1
	cmp	r1, r3
	mov	r8, r0
	str	r0, [r7]
	bls	.L13
	uxtb	r3, r1
	bic	r5, r1, #255
	cmp	r3, #8
	beq	.L15
	cmp	r3, #32
	beq	.L16
	cmp	r3, #0
	ldmnefd	sp!, {r4, r5, r6, r7, r8, pc}
	add	r5, r5, #64
	mov	r6, #1
.L18:
	mov	r4, #4096
	b	.L27
.L25:
	subs	r4, r4, #1
	beq	.L39
.L27:
	ldr	ip, [r5]
	tst	ip, r6
	beq	.L25
.L29:
	str	r6, [r5]
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L16:
	add	r5, r5, #64
	mov	r6, #8
	b	.L18
.L15:
	add	r5, r5, #64
	mov	r6, #2
	b	.L18
.L39:
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LANCHOR2
	movw	ip, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR2
	mov	r2, r8
	mov	r3, r7
	str	r8, [r7]
	movt	r0, #:upper16:.LC0
	movt	ip, #:upper16:printk
	blx	ip
	movw	r3, #:lower16:loops_per_jiffy
	movw	r2, #19923
	movt	r3, #:upper16:loops_per_jiffy
	movt	r2, 4194
	ldr	r3, [r3]
	mov	r1, #300
	umull	r0, r3, r2, r3
	mov	r3, r3, lsr #6
	mul	r3, r1, r3
	cmp	r3, #0
	beq	.L28
	ldr	r2, [r5]
	tst	r2, r6
	bne	.L29
.L31:
	add	r4, r4, #1
	cmp	r4, r3
	beq	.L28
	ldr	ip, [r5]
	tst	ip, r6
	beq	.L31
	str	r6, [r5]
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L28:
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:panic
	mov	r1, r8
	mov	r2, r7
	movt	r0, #:upper16:.LC1
	movt	r3, #:upper16:panic
	blx	r3
.L13:
	mov	r3, #512
	movt	r3, 65104
	cmp	r1, r3
	beq	.L33
	bls	.L40
	mov	r3, #520
	movt	r3, 65104
	cmp	r1, r3
	beq	.L22
	mov	r3, #576
	movt	r3, 65104
	cmp	r1, r3
	beq	.L23
	mov	r3, #516
	movt	r3, 65104
	cmp	r1, r3
	ldmnefd	sp!, {r4, r5, r6, r7, r8, pc}
	mov	r5, #588
	mov	r6, #2
	movt	r5, 65104
	b	.L18
.L33:
	mov	r5, #588
	mov	r6, #1
	movt	r5, 65104
	b	.L18
.L23:
	mov	r5, #588
	mov	r6, #65536
	movt	r5, 65104
	b	.L18
.L22:
	mov	r5, #588
	mov	r6, #4
	movt	r5, 65104
	b	.L18
.L40:
	mov	r3, #256
	movt	r3, 65104
	cmp	r1, r3
	beq	.L20
	mov	r3, #260
	movt	r3, 65104
	cmp	r1, r3
	ldmnefd	sp!, {r4, r5, r6, r7, r8, pc}
	mov	r5, #272
	mov	r6, #2
	movt	r5, 65104
	b	.L18
.L20:
	mov	r5, #272
	mov	r6, #1
	movt	r5, 65104
	b	.L18
	.fnend
	.size	exynos4_mct_write, .-exynos4_mct_write
	.align	2
	.type	exynos4_mct_frc_start, %function
exynos4_mct_frc_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	mov	r4, r0
	mov	r0, r1
	mov	r1, #256
	movt	r1, 65104
	bl	exynos4_mct_write
	mov	r1, #260
	mov	r0, r4
	movt	r1, 65104
	bl	exynos4_mct_write
	mov	r3, #0
	mov	r1, #576
	movt	r3, 65104
	movt	r1, 65104
	ldr	r0, [r3, #576]
	ldmfd	sp!, {r4, lr}
	orr	r0, r0, #256
	b	exynos4_mct_write
	.fnend
	.size	exynos4_mct_frc_start, .-exynos4_mct_frc_start
	.align	2
	.type	exynos4_frc_resume, %function
exynos4_frc_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	ldr	r0, [r3, #4]
	ldr	r1, [r3]
	b	exynos4_mct_frc_start
	.fnend
	.size	exynos4_frc_resume, .-exynos4_frc_resume
	.align	2
	.type	exynos4_mct_tick_stop, %function
exynos4_mct_tick_stop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, [r0, #4]
	ldr	r0, [r1, #32]
	tst	r0, #3
	bxeq	lr
	bic	r0, r0, #3
	add	r1, r1, #32
	b	exynos4_mct_write
	.fnend
	.size	exynos4_mct_tick_stop, .-exynos4_mct_tick_stop
	.align	2
	.type	exynos4_mct_tick_isr, %function
exynos4_mct_tick_isr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r5, r1
	ldr	r4, [r1]
	ldr	r3, [r4, #48]
	cmp	r3, #2
	beq	.L46
	mov	r0, r1
	bl	exynos4_mct_tick_stop
.L46:
	ldr	r1, [r5, #4]
	ldr	r3, [r1, #48]
	tst	r3, #1
	beq	.L47
	add	r1, r1, #48
	mov	r0, #1
	bl	exynos4_mct_write
	ldr	r1, [r5, #4]
	mov	r0, #1
	add	r1, r1, #48
	bl	exynos4_mct_write
.L47:
	mov	r0, r4
	ldr	r3, [r4]
	blx	r3
	mov	r0, #1
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	exynos4_mct_tick_isr, .-exynos4_mct_tick_isr
	.align	2
	.type	exynos4_mct_tick_start, %function
exynos4_mct_tick_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r1
	mov	r5, r0
	mov	r0, r1
	bl	exynos4_mct_tick_stop
	ldr	r1, [r4, #4]
	orr	r0, r5, #-2147483648
	add	r1, r1, #8
	bl	exynos4_mct_write
	ldr	r1, [r4, #4]
	mov	r0, #1
	add	r1, r1, #52
	bl	exynos4_mct_write
	ldr	r1, [r4, #4]
	ldmfd	sp!, {r3, r4, r5, lr}
	ldr	r0, [r1, #32]!
	orr	r0, r0, #7
	b	exynos4_mct_write
	.fnend
	.size	exynos4_mct_tick_start, .-exynos4_mct_tick_start
	.align	2
	.type	exynos4_tick_set_next_event, %function
exynos4_tick_set_next_event:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r2, sp
	bic	r3, r2, #8128
	movw	r2, #:lower16:cpu_online_mask
	bic	r3, r3, #63
	movt	r2, #:upper16:cpu_online_mask
	ldr	r3, [r3, #16]
	movw	r1, #:lower16:__per_cpu_offset
	ldr	r4, [r2]
	movt	r1, #:upper16:__per_cpu_offset
	movw	r2, #:lower16:.LANCHOR1
	cmp	r3, #0
	add	r5, r3, #31
	movge	r5, r3
	and	ip, r3, #31
	ldr	r1, [r1, r3, asl #2]
	mov	r3, r5, asr #5
	movt	r2, #:upper16:.LANCHOR1
	ldr	r3, [r4, r3, asl #2]
	mov	r3, r3, lsr ip
	tst	r3, #1
	beq	.L56
	add	r1, r2, r1
	bl	exynos4_mct_tick_start
.L56:
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	exynos4_tick_set_next_event, .-exynos4_tick_set_next_event
	.align	2
	.type	exynos4_mct_comp_isr, %function
exynos4_mct_comp_isr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	mov	r4, r1
	mov	r1, #580
	mov	r0, #1
	movt	r1, 65104
	bl	exynos4_mct_write
	mov	r0, r4
	ldr	r3, [r4]
	blx	r3
	mov	r0, #1
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	exynos4_mct_comp_isr, .-exynos4_mct_comp_isr
	.align	2
	.type	exynos4_mct_comp0_start, %function
exynos4_mct_comp0_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	cmp	r0, #2
	mov	r3, #0
	mov	r7, r1
	movt	r3, 65104
	ldr	r6, [r3, #576]
	beq	.L65
.L62:
	mov	r2, #0
	movt	r2, 65104
	ldr	ip, [r2, #260]
	b	.L64
.L66:
	mov	ip, r3
.L64:
	ldr	r0, [r2, #256]
	ldr	r3, [r2, #260]
	cmp	r3, ip
	bne	.L66
	mov	r2, #0
	mov	r1, #512
	orr	r2, r2, r0
	movt	r1, 65104
	adds	r4, r2, r7
	mov	r0, r4
	adc	r5, ip, #0
	bl	exynos4_mct_write
	mov	r1, #516
	mov	r0, r5
	movt	r1, 65104
	bl	exynos4_mct_write
	mov	r1, #584
	mov	r0, #1
	movt	r1, 65104
	bl	exynos4_mct_write
	mov	r1, #576
	orr	r0, r6, #1
	movt	r1, 65104
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	b	exynos4_mct_write
.L65:
	mov	r1, #520
	mov	r0, r7
	movt	r1, 65104
	orr	r6, r6, #2
	bl	exynos4_mct_write
	b	.L62
	.fnend
	.size	exynos4_mct_comp0_start, .-exynos4_mct_comp0_start
	.align	2
	.type	exynos4_comp_set_next_event, %function
exynos4_comp_set_next_event:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	mov	r3, r0
	ldr	r0, [r1, #48]
	mov	r1, r3
	bl	exynos4_mct_comp0_start
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_comp_set_next_event, .-exynos4_comp_set_next_event
	.align	2
	.type	exynos4_local_timer_stop, %function
exynos4_local_timer_stop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r2, sp
	bic	r3, r2, #8128
	mov	r1, r0
	bic	r2, r3, #63
	movw	r3, #:lower16:__per_cpu_offset
	ldr	ip, [r2, #16]
	movt	r3, #:upper16:__per_cpu_offset
	ldr	r2, [r0, #64]
	mov	r5, r0
	mov	r0, #0
	movw	r4, #:lower16:.LANCHOR1
	ldr	r6, [r3, ip, asl #2]
	movt	r4, #:upper16:.LANCHOR1
	blx	r2
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	ldr	r3, [r3, #8]
	add	r7, r4, r6
	cmp	r3, #1
	movweq	r3, #:lower16:disable_irq
	movwne	r3, #:lower16:disable_percpu_irq
	movteq	r3, #:upper16:disable_irq
	movtne	r3, #:upper16:disable_percpu_irq
	ldreq	r0, [r5, #84]
	movne	r0, #60
	blx	r3
	ldr	r3, [r4, r6]
	ldr	r3, [r3, #48]
	cmp	r3, #2
	beq	.L71
	mov	r0, r7
	bl	exynos4_mct_tick_stop
.L71:
	ldr	r1, [r7, #4]
	ldr	r3, [r1, #48]
	tst	r3, #1
	ldmeqfd	sp!, {r3, r4, r5, r6, r7, pc}
	add	r1, r1, #48
	mov	r0, #1
	bl	exynos4_mct_write
	ldr	r1, [r7, #4]
	mov	r0, #1
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	add	r1, r1, #48
	b	exynos4_mct_write
	.fnend
	.size	exynos4_local_timer_stop, .-exynos4_local_timer_stop
	.align	2
	.type	exynos4_local_timer_setup, %function
exynos4_local_timer_setup:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #12
	sub	sp, sp, #12
	mov	r2, sp
	movw	r1, #:lower16:__per_cpu_offset
	bic	r3, r2, #8128
	movt	r1, #:upper16:__per_cpu_offset
	bic	r3, r3, #63
	mov	r4, r0
	ldr	r5, [r3, #16]
	mov	r2, #768
	movw	r3, #:lower16:.LANCHOR1
	movt	r2, 65104
	movt	r3, #:upper16:.LANCHOR1
	movw	ip, #:lower16:sprintf
	ldr	r0, [r1, r5, asl #2]
	movw	r9, #:lower16:cpu_bit_bitmap
	mov	lr, r5, asl #8
	movw	r1, #:lower16:.LC2
	add	r8, r3, r0
	add	r2, lr, r2
	add	r7, r8, #8
	movw	r6, #:lower16:.LANCHOR0
	and	fp, r5, #31
	str	r4, [r3, r0]
	movt	r1, #:upper16:.LC2
	mov	r0, r7
	str	r2, [r8, #4]
	movt	ip, #:upper16:sprintf
	mov	r2, r5
	movt	r6, #:upper16:.LANCHOR0
	add	fp, fp, #1
	movt	r9, #:upper16:cpu_bit_bitmap
	blx	ip
	add	fp, r9, fp, asl #2
	mov	r2, r5, lsr #5
	ldr	r3, [r6, #12]
	sub	fp, fp, r2, asl #2
	movw	r1, #:lower16:exynos4_tick_set_next_event
	movw	lr, #:lower16:exynos4_tick_set_mode
	str	r7, [r4, #76]
	movt	lr, #:upper16:exynos4_tick_set_mode
	mov	r0, #5
	movt	r1, #:upper16:exynos4_tick_set_next_event
	movw	r7, #450
	mov	r10, #3
	mov	r2, #51712
	movw	ip, #:lower16:clocks_calc_mult_shift
	movt	r2, 15258
	movt	ip, #:upper16:clocks_calc_mult_shift
	mov	r3, r3, lsr #1
	str	fp, [r4, #88]
	str	r0, [sp]
	add	r0, r4, #40
	str	lr, [r4, #64]
	str	r1, [r4, #4]
	add	r1, r4, #44
	str	r7, [r4, #80]
	movw	r7, #:lower16:clockevent_delta2ns
	str	r10, [r4, #52]
	movt	r7, #:upper16:clockevent_delta2ns
	blx	ip
	mov	r1, r4
	mvn	r0, #-2147483648
	blx	r7
	strd	r0, [r4, #24]
	mov	r1, r4
	mov	r0, #15
	blx	r7
	movw	r3, #:lower16:clockevents_register_device
	strd	r0, [r4, #32]
	movt	r3, #:upper16:clockevents_register_device
	mov	r0, r4
	blx	r3
	ldr	r1, [r8, #4]
	mov	r0, #1
	bl	exynos4_mct_write
	ldr	r3, [r6, #8]
	cmp	r3, #1
	beq	.L80
	movw	r3, #:lower16:enable_percpu_irq
	mov	r0, #60
	movt	r3, #:upper16:enable_percpu_irq
	mov	r1, #0
	blx	r3
	mov	r0, #0
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L80:
	cmp	r5, #0
	movw	r3, #:lower16:.LANCHOR3
	bne	.L78
	movt	r3, #:upper16:.LANCHOR3
	mov	r0, #106
	movw	r2, #:lower16:setup_irq
	mov	r1, r3
	str	r0, [r4, #84]
	movt	r2, #:upper16:setup_irq
	str	r8, [r3, #8]
	blx	r2
	mov	r0, #0
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L78:
	mov	r5, #112
	movt	r3, #:upper16:.LANCHOR3
	movw	r2, #:lower16:setup_irq
	add	r1, r3, #64
	movt	r2, #:upper16:setup_irq
	str	r5, [r4, #84]
	mov	r0, r5
	str	r8, [r3, #72]
	blx	r2
	movw	r3, #:lower16:irq_set_affinity
	mov	r0, r5
	add	r1, r9, #8
	movt	r3, #:upper16:irq_set_affinity
	blx	r3
	mov	r0, #0
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.fnend
	.size	exynos4_local_timer_setup, .-exynos4_local_timer_setup
	.align	2
	.type	exynos4_timer_init, %function
exynos4_timer_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r2, #0
	movw	r5, #:lower16:.LANCHOR0
	movw	r1, #:lower16:.LC3
	movw	r3, #:lower16:clk_get
	movt	r5, #:upper16:.LANCHOR0
	mov	r0, r2
	movt	r1, #:upper16:.LC3
	movt	r3, #:upper16:clk_get
	.pad #8
	sub	sp, sp, #8
	str	r2, [r5, #8]
	blx	r3
	movw	r3, #:lower16:clk_get_rate
	movt	r3, #:upper16:clk_get_rate
	blx	r3
	ldr	r3, [r5, #8]
	str	r0, [r5, #12]
	cmp	r3, #0
	beq	.L89
.L83:
	movw	r4, #:lower16:.LANCHOR3
	movw	r3, #:lower16:local_timer_register
	movt	r4, #:upper16:.LANCHOR3
	movt	r3, #:upper16:local_timer_register
	add	r0, r4, #128
	movw	r6, #:lower16:.LANCHOR0
	blx	r3
	mov	r0, #0
	movt	r6, #:upper16:.LANCHOR0
	mov	r1, r0
	bl	exynos4_mct_frc_start
	movw	r3, #:lower16:__clocksource_register_scale
	ldr	r2, [r5, #12]
	add	r0, r4, #192
	movt	r3, #:upper16:__clocksource_register_scale
	mov	r1, #1
	blx	r3
	cmp	r0, #0
	bne	.L90
	mov	r1, #5
	mov	r2, #51712
	movw	ip, #:lower16:clocks_calc_mult_shift
	ldr	r3, [r6, #12]
	movt	r2, 15258
	movt	ip, #:upper16:clocks_calc_mult_shift
	add	r0, r4, #360
	str	r1, [sp]
	movw	r5, #:lower16:clockevent_delta2ns
	add	r1, r4, #364
	blx	ip
	movt	r5, #:upper16:clockevent_delta2ns
	add	r1, r4, #320
	mvn	r0, #0
	blx	r5
	mov	r3, #344
	strd	r0, [r4, r3]
	add	r1, r4, #320
	mov	r0, #15
	blx	r5
	ldr	r2, .L91
	mov	ip, #352
	movw	r3, #:lower16:clockevents_register_device
	strd	r0, [r4, ip]
	movt	r3, #:upper16:clockevents_register_device
	add	r0, r4, #320
	str	r2, [r4, #408]
	blx	r3
	movw	r3, #:lower16:setup_irq
	add	r1, r4, #448
	movt	r3, #:upper16:setup_irq
	mov	r0, #121
	blx	r3
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, pc}
.L89:
	movw	r1, #:lower16:exynos4_mct_tick_isr
	movw	r2, #:lower16:.LC4
	movw	r3, #:lower16:.LANCHOR1
	movw	ip, #:lower16:request_percpu_irq
	movt	r3, #:upper16:.LANCHOR1
	movt	r1, #:upper16:exynos4_mct_tick_isr
	movt	r2, #:upper16:.LC4
	movt	ip, #:upper16:request_percpu_irq
	mov	r0, #60
	blx	ip
	subs	r3, r0, #0
	beq	.L83
	movw	r0, #:lower16:.LC5
	movw	r2, #:lower16:.LC6
	movw	ip, #:lower16:warn_slowpath_fmt
	str	r3, [sp]
	movt	r0, #:upper16:.LC5
	movt	r2, #:upper16:.LC6
	movt	ip, #:upper16:warn_slowpath_fmt
	mov	r1, #496
	mov	r3, #60
	blx	ip
	b	.L83
.L90:
	movw	r0, #:lower16:.LC7
	movw	r3, #:lower16:panic
	ldr	r1, [r4, #236]
	movt	r0, #:upper16:.LC7
	movt	r3, #:upper16:panic
	blx	r3
.L92:
	.align	2
.L91:
	.word	cpu_bit_bitmap+4
	.fnend
	.size	exynos4_timer_init, .-exynos4_timer_init
	.align	2
	.type	exynos4_comp_set_mode, %function
exynos4_comp_set_mode:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r3, #0
	movt	r3, 65104
	mov	r5, r1
	mov	r1, #576
	mov	r4, r0
	ldr	r3, [r3, #576]
	movt	r1, 65104
	bic	r0, r3, #3
	bl	exynos4_mct_write
	mov	r1, #584
	mov	r0, #0
	movt	r1, 65104
	bl	exynos4_mct_write
	cmp	r4, #2
	ldmnefd	sp!, {r3, r4, r5, pc}
	ldr	r2, [r5, #40]
	movw	r3, #56533
	movt	r3, 50
	ldr	ip, [r5, #44]
	mov	r0, r4
	umull	r2, r3, r2, r3
	rsb	r4, ip, #32
	sub	r1, ip, #32
	mov	r2, r2, lsr ip
	orr	r2, r2, r3, asl r4
	orr	r1, r2, r3, lsr r1
	ldmfd	sp!, {r3, r4, r5, lr}
	b	exynos4_mct_comp0_start
	.fnend
	.size	exynos4_comp_set_mode, .-exynos4_comp_set_mode
	.global	exynos4_timer
	.global	mct_frc
	.global	suspended_frc_count
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	__func__.18047, %object
	.size	__func__.18047, 18
__func__.18047:
	.ascii	"exynos4_mct_write\000"
	.section	.data..percpu,"aw",%progbits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	percpu_mct_tick, %object
	.size	percpu_mct_tick, 20
percpu_mct_tick:
	.space	20
	.data
	.align	6
	.set	.LANCHOR3,. + 0
	.type	mct_tick0_event_irq, %object
	.size	mct_tick0_event_irq, 64
mct_tick0_event_irq:
	.word	exynos4_mct_tick_isr
	.word	84480
	.space	32
	.word	.LC9
	.space	20
	.type	mct_tick1_event_irq, %object
	.size	mct_tick1_event_irq, 64
mct_tick1_event_irq:
	.word	exynos4_mct_tick_isr
	.word	84480
	.space	32
	.word	.LC8
	.space	20
	.type	exynos4_mct_tick_ops, %object
	.size	exynos4_mct_tick_ops, 8
exynos4_mct_tick_ops:
	.word	exynos4_local_timer_setup
	.word	exynos4_local_timer_stop
	.space	56
	.type	mct_frc, %object
	.size	mct_frc, 128
mct_frc:
	.word	exynos4_frc_read
	.space	12
	.word	-1
	.word	-1
	.space	20
	.word	.LC12
	.space	8
	.word	400
	.space	8
	.word	129
	.word	exynos4_frc_suspend
	.word	exynos4_frc_resume
	.space	48
	.type	mct_comp_device, %object
	.size	mct_comp_device, 128
mct_comp_device:
	.space	4
	.word	exynos4_comp_set_next_event
	.space	44
	.word	3
	.space	8
	.word	exynos4_comp_set_mode
	.space	8
	.word	.LC11
	.word	250
	.space	44
	.type	mct_comp_event_irq, %object
	.size	mct_comp_event_irq, 64
mct_comp_event_irq:
	.word	exynos4_mct_comp_isr
	.word	86528
	.word	mct_comp_device
	.space	28
	.word	.LC10
	.space	20
	.type	exynos4_timer, %object
	.size	exynos4_timer, 12
exynos4_timer:
	.word	exynos4_timer_init
	.space	8
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>[%s]value=%d addr=0x%X\012\000"
	.space	1
.LC1:
	.ascii	"MCT hangs after writing %d (addr:0x%08x)\012\000"
	.space	2
.LC2:
	.ascii	"mct_tick%d\000"
	.space	1
.LC3:
	.ascii	"xtal\000"
	.space	3
.LC4:
	.ascii	"MCT\000"
.LC5:
	.ascii	"/media/system1/root/CM14/kernel/samsung/smdk4412/ar"
	.ascii	"ch/arm/mach-exynos/mct.c\000"
.LC6:
	.ascii	"MCT: can't request IRQ %d (%d)\012\000"
.LC7:
	.ascii	"%s: can't register clocksource\012\000"
.LC8:
	.ascii	"mct_tick1_irq\000"
	.space	2
.LC9:
	.ascii	"mct_tick0_irq\000"
	.space	2
.LC10:
	.ascii	"mct_comp_irq\000"
	.space	3
.LC11:
	.ascii	"mct-comp\000"
	.space	3
.LC12:
	.ascii	"mct-frc\000"
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	suspended_frc_count, %object
	.size	suspended_frc_count, 8
suspended_frc_count:
	.space	8
	.type	mct_int_type, %object
	.size	mct_int_type, 4
mct_int_type:
	.space	4
	.type	clk_rate, %object
	.size	clk_rate, 4
clk_rate:
	.space	4
	.ident	"GCC: (GNU) 4.8"
