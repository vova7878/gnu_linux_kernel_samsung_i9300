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
	.file	"irq-uart.c"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_irq_demux_uart, %function
s3c_irq_demux_uart:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, r1
	ldr	r2, [r1, #24]
	movw	r3, #:lower16:irq_get_irq_data
	movt	r3, #:upper16:irq_get_irq_data
	mov	r8, r0
	ldm	r2, {r1, r7}
	ldr	r4, [r1, #48]
	blx	r3
	cmp	r0, #0
	beq	.L2
	ldr	r6, [r0, #16]
	ldr	r3, [r6, #36]
	cmp	r3, #0
	beq	.L32
.L4:
	tst	r4, #15
	beq	.L33
	tst	r4, #1
	bne	.L34
.L8:
	tst	r4, #2
	bne	.L35
.L9:
	tst	r4, #4
	bne	.L36
.L10:
	tst	r4, #8
	bne	.L37
.L11:
	ldr	r3, [r6, #36]
	mov	r0, r5
	cmp	r3, #0
	ldreq	r3, [r6, #32]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	r3	@ indirect register sibling call
.L2:
	ldr	r3, [r0, #36]
	.inst	0xe7f000f0
.L33:
	add	r9, r5, #88
	movw	r3, #:lower16:_raw_spin_lock
	mov	r0, r9
	movt	r3, #:upper16:_raw_spin_lock
	blx	r3
	movw	r3, #:lower16:handle_bad_irq
	mov	r1, r5
	mov	r0, r8
	movt	r3, #:upper16:handle_bad_irq
	blx	r3
	movw	r3, #:lower16:_raw_spin_unlock
	mov	r0, r9
	movt	r3, #:upper16:_raw_spin_unlock
	blx	r3
	tst	r4, #1
	beq	.L8
.L34:
	movw	r3, #:lower16:generic_handle_irq
	mov	r0, r7
	movt	r3, #:upper16:generic_handle_irq
	blx	r3
	tst	r4, #2
	beq	.L9
.L35:
	movw	r3, #:lower16:generic_handle_irq
	add	r0, r7, #1
	movt	r3, #:upper16:generic_handle_irq
	blx	r3
	tst	r4, #4
	beq	.L10
.L36:
	movw	r3, #:lower16:generic_handle_irq
	add	r0, r7, #2
	movt	r3, #:upper16:generic_handle_irq
	blx	r3
	tst	r4, #8
	beq	.L11
.L37:
	movw	r3, #:lower16:generic_handle_irq
	add	r0, r7, #3
	movt	r3, #:upper16:generic_handle_irq
	blx	r3
	b	.L11
.L32:
	ldr	r3, [r6, #28]
	cmp	r3, #0
	beq	.L5
.L29:
	mov	r0, r5
	blx	r3
	b	.L4
.L5:
	ldr	r3, [r6, #24]
	mov	r0, r5
	blx	r3
	ldr	r3, [r6, #20]
	cmp	r3, #0
	bne	.L29
	b	.L4
	.fnend
	.size	s3c_irq_demux_uart, .-s3c_irq_demux_uart
	.align	2
	.global	s3c_init_uart_irqs
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_init_uart_irqs, %function
s3c_init_uart_irqs:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	subs	r6, r1, #0
	.pad #28
	sub	sp, sp, #28
	beq	.L38
	movw	r9, #:lower16:handle_level_irq
	mov	r4, r0
	movw	r3, #:lower16:irq_alloc_generic_chip
	movw	r2, #:lower16:.LC0
	movw	r1, #:lower16:irq_gc_ack_set_bit
	movw	r0, #:lower16:irq_gc_mask_set_bit
	movt	r9, #:upper16:handle_level_irq
	movt	r3, #:upper16:irq_alloc_generic_chip
	movt	r2, #:upper16:.LC0
	movt	r1, #:upper16:irq_gc_ack_set_bit
	movt	r0, #:upper16:irq_gc_mask_set_bit
	str	r3, [sp, #8]
	str	r2, [sp, #12]
	str	r1, [sp, #16]
	str	r0, [sp, #20]
.L42:
	ldr	r3, [r4]
	mov	r7, #15
	mov	r1, #1
	ldr	ip, [sp, #8]
	ldr	r0, [sp, #12]
	movw	r5, #:lower16:irq_setup_generic_chip
	str	r7, [r3, #56]
	mov	r8, #0
	ldr	r2, [r4, #4]
	mov	fp, #48
	str	r9, [sp]
	movt	r5, #:upper16:irq_setup_generic_chip
	blx	ip
	mov	r1, r7
	subs	r7, r0, #0
	movw	lr, #:lower16:irq_gc_mask_clr_bit
	movw	ip, #:lower16:irq_gc_mask_and_ack_set
	movt	ip, #:upper16:irq_gc_mask_and_ack_set
	movt	lr, #:upper16:irq_gc_mask_clr_bit
	mov	r2, #1
	mov	r3, #3072
	beq	.L48
	ldr	r10, [sp, #16]
	str	ip, [r7, #84]
	str	ip, [r7, #72]
	mov	ip, #56
	str	r10, [r7, #76]
	ldr	r10, [sp, #20]
	str	lr, [r7, #88]
	str	ip, [r7, #156]
	str	r10, [r7, #80]
	str	fp, [r7, #160]
	str	r8, [sp]
	blx	r5
	movw	r3, #:lower16:irq_set_handler_data
	mov	r1, r4
	movt	r3, #:upper16:irq_set_handler_data
	ldr	r0, [r4, #8]
	blx	r3
	movw	r5, #:lower16:__irq_set_handler
	movw	r1, #:lower16:s3c_irq_demux_uart
	mov	r3, r8
	movt	r1, #:upper16:s3c_irq_demux_uart
	movt	r5, #:upper16:__irq_set_handler
	mov	r2, #1
	ldr	r0, [r4, #8]
	blx	r5
.L41:
	subs	r6, r6, #1
	add	r4, r4, #12
	bne	.L42
.L38:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L48:
	movw	r1, #:lower16:.LANCHOR0
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR0
	movt	r3, #:upper16:printk
	ldr	r2, [r4, #4]
	movt	r0, #:upper16:.LC1
	blx	r3
	b	.L41
	.fnend
	.size	s3c_init_uart_irqs, .-s3c_init_uart_irqs
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.21437, %object
	.size	__func__.21437, 18
__func__.21437:
	.ascii	"s3c_init_uart_irq\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"s3c-uart\000"
	.space	3
.LC1:
	.ascii	"<3>%s: irq_alloc_generic_chip for IRQ %u failed\012"
	.ascii	"\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
