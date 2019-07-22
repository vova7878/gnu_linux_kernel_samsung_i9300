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
	.file	"irq-vic-timer.c"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_irq_timer_ack, %function
s3c_irq_timer_ack:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, #32
	ldr	r5, [r0, #28]
	ldr	r3, [r0]
	ldr	r2, [r5, #12]
	sub	r3, r3, r2
	lsl	r4, r4, r3
	.syntax divided
@ 41 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-samsung/irq-vic-timer.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L2
	blx	r3
.L2:
	ldr	r2, [r5, #20]
	ldr	r3, [r5, #8]
	orr	r4, r4, r2
	str	r4, [r3]
	pop	{r4, r5, r6, pc}
	.fnend
	.size	s3c_irq_timer_ack, .-s3c_irq_timer_ack
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_irq_demux_vic_timer, %function
s3c_irq_demux_vic_timer:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:irq_get_irq_data
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r3, #:upper16:irq_get_irq_data
	mov	r5, r1
	blx	r3
	cmp	r0, #0
	beq	.L9
	ldr	r4, [r0, #16]
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L21
.L11:
	movw	r3, #:lower16:generic_handle_irq
	ldr	r0, [r5, #24]
	movt	r3, #:upper16:generic_handle_irq
	blx	r3
	ldr	r3, [r4, #36]
	mov	r0, r5
	cmp	r3, #0
	ldreq	r3, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	r3	@ indirect register sibling call
.L9:
	ldr	r3, [r0, #36]
	.inst	0xe7f000f0
.L21:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L12
.L19:
	mov	r0, r5
	blx	r3
	b	.L11
.L12:
	ldr	r3, [r4, #24]
	mov	r0, r5
	blx	r3
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L19
	b	.L11
	.fnend
	.size	s3c_irq_demux_vic_timer, .-s3c_irq_demux_vic_timer
	.align	2
	.global	s3c_init_vic_timer_irq
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_init_vic_timer_irq, %function
s3c_init_vic_timer_irq:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r5, #:lower16:.LANCHOR0
	movt	r5, #:upper16:.LANCHOR0
	mov	r4, r1
	mov	r7, r0
	movw	lr, #:lower16:handle_level_irq
	ldmia	r5!, {r0, r1, r2, r3}
	.pad #32
	sub	sp, sp, #32
	movt	lr, #:upper16:handle_level_irq
	add	ip, sp, #12
	str	lr, [sp]
	movw	r6, #:lower16:irq_alloc_generic_chip
	movt	r6, #:upper16:irq_alloc_generic_chip
	ldr	lr, [r5]
	stmia	ip!, {r0, r1, r2, r3}
	mov	r3, #68
	movw	r0, #:lower16:.LC1
	movt	r3, 64560
	movt	r0, #:upper16:.LC1
	mov	r2, r4
	mov	r1, #1
	str	lr, [ip]
	blx	r6
	subs	r6, r0, #0
	beq	.L33
	movw	r3, #:lower16:irq_gc_mask_clr_bit
	movw	r2, #:lower16:irq_gc_mask_set_bit
	movt	r3, #:upper16:irq_gc_mask_clr_bit
	cmp	r7, #31
	str	r3, [r6, #80]
	movw	r3, #:lower16:s3c_irq_timer_ack
	movt	r2, #:upper16:irq_gc_mask_set_bit
	movt	r3, #:upper16:s3c_irq_timer_ack
	str	r2, [r6, #88]
	str	r3, [r6, #76]
	bhi	.L24
	mov	r2, #1
	mov	r3, #0
	lsl	r1, r2, r7
	movw	r5, #:lower16:irq_setup_generic_chip
	str	r3, [sp]
	movt	r5, #:upper16:irq_setup_generic_chip
	mov	r3, #3072
	sub	r1, r1, #1
	blx	r5
	ldr	r3, [r6, #20]
	cmp	r7, #0
	and	r3, r3, #31
	str	r3, [r6, #20]
	beq	.L22
.L27:
	movw	r10, #:lower16:__irq_set_handler
	movw	r9, #:lower16:irq_set_handler_data
	movw	r8, #:lower16:s3c_irq_demux_vic_timer
	add	r6, sp, #12
	add	r7, r4, r7
	movt	r10, #:upper16:__irq_set_handler
	movt	r9, #:upper16:irq_set_handler_data
	movt	r8, #:upper16:s3c_irq_demux_vic_timer
.L26:
	ldr	r5, [r6], #4
	mov	r3, #0
	mov	r2, #1
	mov	r1, r8
	mov	r0, r5
	blx	r10
	mov	r1, r4
	mov	r0, r5
	add	r4, r4, #1
	blx	r9
	cmp	r4, r7
	bne	.L26
.L22:
	add	sp, sp, #32
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L24:
	mov	r3, #0
	movw	r5, #:lower16:irq_setup_generic_chip
	str	r3, [sp]
	movt	r5, #:upper16:irq_setup_generic_chip
	mov	r3, #3072
	mov	r2, #1
	mvn	r1, #0
	blx	r5
	ldr	r3, [r6, #20]
	and	r3, r3, #31
	str	r3, [r6, #20]
	b	.L27
.L33:
	movw	r0, #:lower16:.LC2
	movw	r3, #:lower16:printk
	mov	r2, r4
	add	r1, r5, #4
	movt	r0, #:upper16:.LC2
	movt	r3, #:upper16:printk
	add	sp, sp, #32
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	r3
	.fnend
	.size	s3c_init_vic_timer_irq, .-s3c_init_vic_timer_irq
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.word	101
	.word	102
	.word	103
	.word	104
	.word	105
	.type	__func__.10894, %object
	.size	__func__.10894, 23
__func__.10894:
	.ascii	"s3c_init_vic_timer_irq\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"s3c-timer\000"
	.space	2
.LC2:
	.ascii	"<3>%s: irq_alloc_generic_chip for IRQ %d failed\012"
	.ascii	"\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
