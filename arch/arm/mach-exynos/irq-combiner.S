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
	.file	"irq-combiner.c"
	.text
	.align	2
	.type	combiner_mask_irq, %function
combiner_mask_irq:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0]
	mov	r1, #1
	ldr	r3, [r0, #28]
	and	r2, r2, #31
	ldr	r3, [r3, #8]
	mov	r2, r1, asl r2
	str	r2, [r3, #4]
	bx	lr
	.fnend
	.size	combiner_mask_irq, .-combiner_mask_irq
	.align	2
	.type	combiner_unmask_irq, %function
combiner_unmask_irq:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0]
	mov	r1, #1
	ldr	r3, [r0, #28]
	and	r2, r2, #31
	ldr	r3, [r3, #8]
	mov	r2, r1, asl r2
	str	r2, [r3]
	bx	lr
	.fnend
	.size	combiner_unmask_irq, .-combiner_unmask_irq
	.align	2
	.type	combiner_set_affinity, %function
combiner_set_affinity:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movw	r4, #:lower16:irq_get_irq_data
	ldr	r5, [r0, #28]
	movt	r4, #:upper16:irq_get_irq_data
	mov	r8, r1
	mov	r7, r2
	ldr	r0, [r5, #12]
	blx	r4
	cmp	r0, #0
	beq	.L4
	ldr	r6, [r0, #16]
	ldr	r0, [r5, #12]
	blx	r4
	cmp	r6, #0
	beq	.L9
	ldr	r3, [r6, #40]
	cmp	r3, #0
	beq	.L9
	mov	r1, r8
	mov	r2, r7
	blx	r3
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L4:
	ldr	r0, [r5, #12]
	blx	r4
.L9:
	mvn	r0, #21
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
	.fnend
	.size	combiner_set_affinity, .-combiner_set_affinity
	.align	2
	.type	combiner_handle_cascade_irq, %function
combiner_handle_cascade_irq:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r4, #:lower16:irq_get_irq_data
	movt	r4, #:upper16:irq_get_irq_data
	mov	r9, r1
	mov	r10, r0
	blx	r4
	cmp	r0, #0
	ldrne	r6, [r0, #24]
	moveq	r6, r0
	mov	r0, r10
	blx	r4
	cmp	r0, #0
	ldrne	r7, [r0, #16]
	moveq	r7, r0
	ldr	r3, [r7, #36]
	cmp	r3, #0
	beq	.L31
.L15:
	movw	r0, #:lower16:.LANCHOR0
	movw	r5, #:lower16:_raw_spin_lock
	movt	r0, #:upper16:.LANCHOR0
	movt	r5, #:upper16:_raw_spin_lock
	blx	r5
	ldr	r3, [r6, #8]
	movw	r0, #:lower16:.LANCHOR0
	movw	r4, #:lower16:_raw_spin_unlock
	movt	r0, #:upper16:.LANCHOR0
	movt	r4, #:upper16:_raw_spin_unlock
	ldr	r8, [r3, #12]
	blx	r4
	ldr	r3, [r6, #4]
	ands	r8, r8, r3
	beq	.L32
	ldr	r2, [r6]
	rsb	r3, r8, #0
	and	r8, r3, r8
@ 268 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/bitops.h" 1
	clz	r8, r8
@ 0 "" 2
	bic	r2, r2, #31
	rsb	r8, r8, #31
	add	r8, r8, r2
	cmp	r8, #500
	bhi	.L33
	movw	r3, #:lower16:generic_handle_irq
	mov	r0, r8
	movt	r3, #:upper16:generic_handle_irq
	blx	r3
.L19:
	ldr	r3, [r7, #36]
	mov	r0, r9
	cmp	r3, #0
	ldreq	r3, [r7, #32]
	blx	r3
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L32:
	add	r6, r9, #88
	mov	r0, r6
	blx	r5
	mov	r0, r10
.L29:
	movw	r3, #:lower16:handle_bad_irq
	mov	r1, r9
	movt	r3, #:upper16:handle_bad_irq
	blx	r3
	mov	r0, r6
	blx	r4
	b	.L19
.L31:
	ldr	r3, [r7, #28]
	cmp	r3, #0
	beq	.L16
.L28:
	mov	r0, r9
	blx	r3
	b	.L15
.L16:
	ldr	r3, [r7, #24]
	mov	r0, r9
	blx	r3
	ldr	r3, [r7, #20]
	cmp	r3, #0
	bne	.L28
	b	.L15
.L33:
	add	r6, r9, #88
	mov	r0, r6
	blx	r5
	mov	r0, r8
	b	.L29
	.fnend
	.size	combiner_handle_cascade_irq, .-combiner_handle_cascade_irq
	.align	2
	.global	combiner_cascade_irq
	.type	combiner_cascade_irq, %function
combiner_cascade_irq:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #19
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r5, r1
	bhi	.L37
	movw	r4, #:lower16:.LANCHOR0
	mov	r6, r0, asl #4
	movt	r4, #:upper16:.LANCHOR0
	add	r1, r4, #8
	movw	r3, #:lower16:irq_set_handler_data
	movt	r3, #:upper16:irq_set_handler_data
	add	r1, r1, r6
	mov	r0, r5
	blx	r3
	subs	r3, r0, #0
	bne	.L38
	movw	r1, #:lower16:combiner_handle_cascade_irq
	movw	ip, #:lower16:__irq_set_handler
	movt	r1, #:upper16:combiner_handle_cascade_irq
	movt	ip, #:upper16:__irq_set_handler
	mov	r0, r5
	mov	r2, #1
	add	r4, r4, r6
	blx	ip
	str	r5, [r4, #20]
	ldmfd	sp!, {r4, r5, r6, pc}
.L37:
@ 118 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/irq-combiner.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/irq-combiner.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 118, 0
.popsection
@ 0 "" 2
.L38:
@ 120 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/irq-combiner.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/irq-combiner.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 120, 0
.popsection
@ 0 "" 2
	.fnend
	.size	combiner_cascade_irq, .-combiner_cascade_irq
	.align	2
	.global	combiner_init
	.type	combiner_init, %function
combiner_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #19
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r4, r2
	bhi	.L44
	and	r2, r0, #3
	mov	ip, #255
	mov	r2, r2, asl #3
	mov	r0, r0, asl #4
	movw	r3, #:lower16:.LANCHOR0
	mov	r2, ip, asl r2
	movt	r3, #:upper16:.LANCHOR0
	add	r9, r3, r0
	str	r2, [r9, #12]
	str	r4, [r9, #8]
	str	r1, [r9, #16]
	str	r2, [r1, #4]
	ldr	r2, [r9, #8]
	add	r2, r2, #8
	cmp	r4, r2
	ldmcsfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
	add	r8, r3, #8
	movw	r7, #:lower16:irq_set_chip_and_handler_name
	movw	r6, #:lower16:irq_set_chip_data
	movw	r5, #:lower16:set_irq_flags
	add	r8, r8, r0
	movt	r7, #:upper16:irq_set_chip_and_handler_name
	movt	r6, #:upper16:irq_set_chip_data
	movt	r5, #:upper16:set_irq_flags
.L43:
	movw	r1, #:lower16:.LANCHOR1
	movw	r2, #:lower16:handle_level_irq
	mov	r3, #0
	movt	r2, #:upper16:handle_level_irq
	mov	r0, r4
	movt	r1, #:upper16:.LANCHOR1
	blx	r7
	mov	r0, r4
	mov	r1, r8
	blx	r6
	mov	r0, r4
	mov	r1, #3
	blx	r5
	ldr	r3, [r9, #8]
	add	r4, r4, #1
	add	r3, r3, #8
	cmp	r3, r4
	bhi	.L43
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L44:
@ 132 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/irq-combiner.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/irq-combiner.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 132, 0
.popsection
@ 0 "" 2
	.fnend
	.size	combiner_init, .-combiner_init
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	combiner_chip, %object
	.size	combiner_chip, 92
combiner_chip:
	.word	.LC0
	.space	20
	.word	combiner_mask_irq
	.space	4
	.word	combiner_unmask_irq
	.space	4
	.word	combiner_set_affinity
	.space	48
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"COMBINER\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	irq_controller_lock, %object
	.size	irq_controller_lock, 8
irq_controller_lock:
	.space	8
	.type	combiner_data, %object
	.size	combiner_data, 320
combiner_data:
	.space	320
	.ident	"GCC: (GNU) 4.8"
