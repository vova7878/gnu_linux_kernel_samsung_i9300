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
	.file	"s3c-pl330.c"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	get_from_queue, %function
get_from_queue:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, r0
	ldr	r0, [r0, #116]
	cmp	r0, #0
	bxeq	lr
	ldr	r2, [r0, #4]
	add	ip, r3, #28
	cmp	r2, ip
	ldreq	r2, [r3, #28]
	cmp	r1, #0
	sub	r2, r2, #4
	str	r2, [r3, #116]
	beq	.L22
.L5:
	str	lr, [sp, #-4]!
	.save {lr}
	ldr	lr, [r0, #28]
	mov	r1, lr
	ldr	r3, [r1, #28]!
	cmp	r1, r3
	sub	ip, r3, #4
	ldreq	pc, [sp], #4
	cmp	r0, ip
	beq	.L6
	mov	r2, ip
.L7:
	ldr	r3, [r2, #4]
	cmp	r1, r3
	sub	r2, r3, #4
	ldreq	pc, [sp], #4
	cmp	r0, r2
	bne	.L7
	ldr	r3, [r3]
	cmp	r3, r1
	beq	.L10
.L13:
	sub	ip, r3, #4
	cmp	r0, ip
	beq	.L12
.L10:
	ldr	r3, [lr, #116]
	cmp	r0, r3
	streq	ip, [lr, #116]
.L11:
	ldr	r3, [r0, #8]
	mov	ip, #256
	ldr	r2, [r0, #4]
	mov	r1, #512
	str	r3, [r2, #4]
	str	r2, [r3]
	str	ip, [r0, #4]
	str	r1, [r0, #8]
	ldr	pc, [sp], #4
.L22:
	ldr	r3, [r3, #8]
	tst	r3, #2
	beq	.L5
	bx	lr
.L6:
	ldr	r3, [r3]
	cmp	r3, r1
	bne	.L13
.L12:
	mov	r3, #0
	str	r3, [lr, #116]
	b	.L11
	.fnend
	.size	get_from_queue, .-get_from_queue
	.align	2
	.global	s3c2410_dma_config
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c2410_dma_config, %function
s3c2410_dma_config:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r3, #:lower16:_raw_spin_lock_irqsave
	mov	r5, r0
	movw	r0, #:lower16:.LANCHOR0
	movt	r3, #:upper16:_raw_spin_lock_irqsave
	movt	r0, #:upper16:.LANCHOR0
	mov	r4, r1
	blx	r3
	mov	r1, r0
	movw	r0, #:lower16:.LANCHOR1
	movt	r0, #:upper16:.LANCHOR1
	ldr	r3, [r0]
	cmp	r0, r3
	beq	.L34
	sub	r2, r3, #16
	ldr	r3, [r3, #-12]
	cmp	r5, r3
	bne	.L26
	b	.L25
.L27:
	ldr	r3, [r3, #-12]
	cmp	r5, r3
	beq	.L25
.L26:
	ldr	r3, [r2, #16]
	cmp	r0, r3
	sub	r2, r3, #16
	bne	.L27
.L34:
	mvn	r4, #21
.L24:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_spin_unlock_irqrestore
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_spin_unlock_irqrestore
	blx	r3
	mov	r0, r4
	pop	{r4, r5, r6, pc}
.L25:
	ldr	r3, [r2, #120]
	cmp	r3, #0
	beq	.L34
	ldr	r3, [r3, #16]
	ldrh	r3, [r3, #32]
	ubfx	r3, r3, #3, #7
	cmp	r3, r4
	blt	.L34
	cmp	r4, #1
	mov	r3, #0
	beq	.L28
	mov	r0, #1
.L29:
	add	r3, r3, #1
	cmp	r4, r0, lsl r3
	bne	.L29
	and	r3, r3, #7
.L28:
	ldrb	r0, [r2, #100]	@ zero_extendqisi2
	mov	r4, #0
	bfi	r0, r3, #5, #3
	strb	r0, [r2, #100]
	b	.L24
	.fnend
	.size	s3c2410_dma_config, .-s3c2410_dma_config
	.align	2
	.global	s3c2410_dma_setflags
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c2410_dma_setflags, %function
s3c2410_dma_setflags:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r3, #:lower16:_raw_spin_lock_irqsave
	mov	r4, r0
	movw	r0, #:lower16:.LANCHOR0
	movt	r3, #:upper16:_raw_spin_lock_irqsave
	movt	r0, #:upper16:.LANCHOR0
	mov	r5, r1
	blx	r3
	mov	r1, r0
	movw	r0, #:lower16:.LANCHOR1
	movt	r0, #:upper16:.LANCHOR1
	ldr	r3, [r0]
	cmp	r0, r3
	beq	.L40
	sub	r2, r3, #16
	ldr	r3, [r3, #-12]
	cmp	r4, r3
	bne	.L42
	b	.L41
.L43:
	ldr	r3, [r3, #-12]
	cmp	r4, r3
	beq	.L41
.L42:
	ldr	r3, [r2, #16]
	cmp	r0, r3
	sub	r2, r3, #16
	bne	.L43
.L40:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_spin_unlock_irqrestore
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_spin_unlock_irqrestore
	blx	r3
	mov	r0, #0
	pop	{r4, r5, r6, pc}
.L41:
	ldr	r3, [r2, #120]
	cmp	r3, #0
	beq	.L40
	bics	r3, r5, #3
	streq	r5, [r2, #8]
	b	.L40
	.fnend
	.size	s3c2410_dma_setflags, .-s3c2410_dma_setflags
	.align	2
	.global	s3c2410_dma_set_buffdone_fn
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c2410_dma_set_buffdone_fn, %function
s3c2410_dma_set_buffdone_fn:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r3, #:lower16:_raw_spin_lock_irqsave
	mov	r4, r0
	movw	r0, #:lower16:.LANCHOR0
	movt	r3, #:upper16:_raw_spin_lock_irqsave
	movt	r0, #:upper16:.LANCHOR0
	mov	r5, r1
	blx	r3
	mov	r1, r0
	movw	r0, #:lower16:.LANCHOR1
	movt	r0, #:upper16:.LANCHOR1
	ldr	r3, [r0]
	cmp	r0, r3
	beq	.L58
	sub	r2, r3, #16
	ldr	r3, [r3, #-12]
	cmp	r4, r3
	bne	.L54
	b	.L53
.L55:
	ldr	r3, [r3, #-12]
	cmp	r4, r3
	beq	.L53
.L54:
	ldr	r3, [r2, #16]
	cmp	r0, r3
	sub	r2, r3, #16
	bne	.L55
.L58:
	mvn	r4, #21
.L52:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_spin_unlock_irqrestore
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_spin_unlock_irqrestore
	blx	r3
	mov	r0, r4
	pop	{r4, r5, r6, pc}
.L53:
	ldr	r3, [r2, #120]
	cmp	r3, #0
	strne	r5, [r2, #92]
	movne	r4, #0
	bne	.L52
	b	.L58
	.fnend
	.size	s3c2410_dma_set_buffdone_fn, .-s3c2410_dma_set_buffdone_fn
	.align	2
	.global	s3c2410_dma_devconfig
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c2410_dma_devconfig, %function
s3c2410_dma_devconfig:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r3, #:lower16:_raw_spin_lock_irqsave
	mov	r4, r0
	movw	r0, #:lower16:.LANCHOR0
	movt	r3, #:upper16:_raw_spin_lock_irqsave
	movt	r0, #:upper16:.LANCHOR0
	mov	r5, r1
	mov	r6, r2
	blx	r3
	movw	ip, #:lower16:.LANCHOR1
	mov	r1, r0
	movt	ip, #:upper16:.LANCHOR1
	ldr	r3, [ip]
	cmp	ip, r3
	beq	.L76
	sub	r0, r3, #16
	ldr	r3, [r3, #-12]
	cmp	r4, r3
	bne	.L65
	b	.L64
.L66:
	ldr	r3, [r3, #-12]
	cmp	r4, r3
	beq	.L64
.L65:
	ldr	r3, [r0, #16]
	cmp	ip, r3
	sub	r0, r3, #16
	bne	.L66
.L76:
	mvn	r4, #21
.L63:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_spin_unlock_irqrestore
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_spin_unlock_irqrestore
	blx	r3
	mov	r0, r4
	pop	{r4, r5, r6, pc}
.L64:
	ldr	r3, [r0, #120]
	cmp	r3, #0
	beq	.L76
	cmp	r5, #3
	ldrls	pc, [pc, r5, asl #2]
	b	.L76
.L68:
	.word	.L67
	.word	.L69
	.word	.L70
	.word	.L71
.L71:
	ldrb	r3, [r0, #96]	@ zero_extendqisi2
	mov	r2, #0
.L80:
	and	r3, r3, #253
	str	r2, [r0, #36]
	orr	r3, r3, #1
	str	r2, [r0, #64]
	strb	r3, [r0, #96]
.L72:
	str	r6, [r0, #12]
	mov	r4, #0
	b	.L63
.L67:
	ldrb	r3, [r0, #96]	@ zero_extendqisi2
	mov	r2, #2
	b	.L80
.L69:
	ldrb	r3, [r0, #96]	@ zero_extendqisi2
	mov	r2, #1
	str	r2, [r0, #36]
	str	r2, [r0, #64]
	orr	r3, r3, #2
	bfc	r3, #0, #1
	strb	r3, [r0, #96]
	b	.L72
.L70:
	ldrb	r3, [r0, #96]	@ zero_extendqisi2
	mov	r2, #0
	str	r2, [r0, #36]
	str	r2, [r0, #64]
	orr	r3, r3, #3
	strb	r3, [r0, #96]
	b	.L72
	.fnend
	.size	s3c2410_dma_devconfig, .-s3c2410_dma_devconfig
	.global	__aeabi_uidiv
	.global	__aeabi_idiv
	.global	__aeabi_uidivmod
	.align	2
	.global	s3c2410_dma_ctrl
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c2410_dma_ctrl, %function
s3c2410_dma_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r0
	movw	r6, #:lower16:_raw_spin_lock_irqsave
	movw	r0, #:lower16:.LANCHOR0
	.pad #20
	sub	sp, sp, #20
	movt	r6, #:upper16:_raw_spin_lock_irqsave
	movt	r0, #:upper16:.LANCHOR0
	mov	r7, r1
	blx	r6
	movw	r2, #:lower16:.LANCHOR1
	mov	r9, r0
	movt	r2, #:upper16:.LANCHOR1
	ldr	r3, [r2]
	cmp	r2, r3
	beq	.L162
	sub	r4, r3, #16
	ldr	r3, [r3, #-12]
	cmp	r5, r3
	bne	.L84
	b	.L83
.L85:
	ldr	r3, [r3, #-12]
	cmp	r5, r3
	beq	.L83
.L84:
	ldr	r3, [r4, #16]
	cmp	r2, r3
	sub	r4, r3, #16
	bne	.L85
.L162:
	movw	r7, #:lower16:_raw_spin_unlock_irqrestore
	mvn	r8, #21
	movt	r7, #:upper16:_raw_spin_unlock_irqrestore
.L82:
	movw	r0, #:lower16:.LANCHOR0
	mov	r1, r9
	movt	r0, #:upper16:.LANCHOR0
	blx	r7
.L81:
	mov	r0, r8
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L83:
	ldr	r3, [r4, #120]
	cmp	r3, #0
	beq	.L162
	cmp	r7, #6
	ldrls	pc, [pc, r7, asl #2]
	b	.L86
.L88:
	.word	.L87
	.word	.L89
	.word	.L90
	.word	.L90
	.word	.L91
	.word	.L90
	.word	.L90
.L91:
	mov	r5, r4
	movw	r3, #:lower16:pl330_chan_ctrl
	ldr	r0, [r5], #36
	movt	r3, #:upper16:pl330_chan_ctrl
	mov	r1, #2
	blx	r3
	ldr	r3, [r4, #24]
	mov	r8, r0
	sub	r5, r3, r5
	clz	r5, r5
	lsr	r5, r5, #5
	lsl	r2, r5, #3
	sub	r3, r2, r5
	add	r3, r4, r3, lsl #2
	ldr	fp, [r3, #56]
	cmp	fp, #0
	movweq	r7, #:lower16:_raw_spin_unlock_irqrestore
	movteq	r7, #:upper16:_raw_spin_unlock_irqrestore
	beq	.L117
	subs	r10, fp, #12
	beq	.L210
	ldr	ip, [fp, #16]
	mov	r1, ip
	ldr	r0, [r1, #28]!
	cmp	r1, r0
	sub	r0, r0, #4
	beq	.L119
	cmp	r0, r10
	beq	.L120
	mov	r3, r0
	b	.L121
.L123:
	cmp	r3, r10
	beq	.L122
.L121:
	ldr	r3, [r3, #4]
	cmp	r1, r3
	sub	r3, r3, #4
	bne	.L123
.L119:
	sub	r3, r2, r5
	movw	r0, #:lower16:.LANCHOR0
	add	r3, r4, r3, lsl #2
	mov	r2, #0
	movw	r7, #:lower16:_raw_spin_unlock_irqrestore
	str	r2, [r3, #56]
	mov	r1, r9
	movt	r0, #:upper16:.LANCHOR0
	movt	r7, #:upper16:_raw_spin_unlock_irqrestore
	blx	r7
	mov	r3, #2
	str	r3, [sp, #4]
	b	.L151
.L90:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_spin_unlock_irqrestore
	mov	r1, r9
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_spin_unlock_irqrestore
	mov	r8, #0
	blx	r3
	b	.L81
.L87:
	ldr	r5, [r4, #24]
	add	r3, r4, #36
	sub	r5, r5, r3
	clz	r5, r5
	lsr	r5, r5, #5
	lsl	r6, r5, #3
	sub	r7, r6, r5
	add	r7, r4, r7, lsl #2
	ldr	r1, [r7, #56]
	cmp	r1, #0
	beq	.L211
.L93:
	rsb	r5, r5, #1
	lsl	r6, r5, #3
	sub	r7, r6, r5
	add	r7, r4, r7, lsl #2
	ldr	r1, [r7, #56]
	cmp	r1, #0
	beq	.L212
.L103:
	movw	r3, #:lower16:pl330_chan_ctrl
	ldr	r0, [r4]
	movt	r3, #:upper16:pl330_chan_ctrl
	mov	r1, #0
	blx	r3
	mov	r8, r0
.L111:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_spin_unlock_irqrestore
	mov	r1, r9
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_spin_unlock_irqrestore
	blx	r3
	b	.L81
.L89:
	mov	r5, r4
	movw	r3, #:lower16:pl330_chan_ctrl
	movt	r3, #:upper16:pl330_chan_ctrl
	ldr	r0, [r5], #36
	mov	r1, #1
	blx	r3
	ldr	r2, [r4, #24]
	mov	r8, r0
	cmp	r2, r5
	sub	r5, r2, r5
	moveq	r3, #28
	movne	r3, #0
	add	r3, r4, r3
	clz	r5, r5
	ldr	fp, [r3, #56]
	lsr	r5, r5, #5
	cmp	fp, #0
	movweq	r7, #:lower16:_raw_spin_unlock_irqrestore
	movteq	r7, #:upper16:_raw_spin_unlock_irqrestore
	beq	.L82
	mov	r2, #0
	movw	r0, #:lower16:.LANCHOR0
	movw	r7, #:lower16:_raw_spin_unlock_irqrestore
	str	r2, [r3, #56]
	mov	r1, r9
	movt	r0, #:upper16:.LANCHOR0
	movt	r7, #:upper16:_raw_spin_unlock_irqrestore
	sub	r10, fp, #12
	blx	r7
	cmp	r10, #0
	movne	r3, #1
	strne	r3, [sp, #4]
	beq	.L129
.L151:
	ldr	r9, [fp, #16]
	ldr	r3, [r9, #92]
	subs	ip, r3, #0
	beq	.L128
.L126:
	mov	r3, #2
	ldr	r2, [fp, #8]
	ldr	r1, [fp, #-12]
	mov	r0, #0
	blx	ip
.L128:
	ldr	r3, [sp, #4]
	cmp	r3, #2
	beq	.L127
	ldr	r3, [r9, #8]
	tst	r3, #2
	bne	.L129
	mov	r3, #1
	str	r3, [sp, #4]
.L127:
	ldr	r3, [r9, #120]
	movw	fp, #:lower16:kmem_cache_free
	mov	r1, r10
	movt	fp, #:upper16:kmem_cache_free
	ldr	r0, [r3, #20]
	blx	fp
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	blx	r6
	ldr	r3, [sp, #4]
	mov	r9, r0
	cmp	r3, #2
	bne	.L82
.L117:
	rsb	r5, r5, #1
	lsl	r1, r5, #3
	sub	r3, r1, r5
	add	r3, r4, r3, lsl #2
	ldr	fp, [r3, #56]
	cmp	fp, #0
	beq	.L130
	subs	r10, fp, #12
	beq	.L131
	ldr	ip, [fp, #16]
	mov	r2, ip
	ldr	r0, [r2, #28]!
	cmp	r2, r0
	sub	r0, r0, #4
	beq	.L132
	cmp	r10, r0
	beq	.L133
	mov	r3, r0
	b	.L134
.L136:
	cmp	r10, r3
	beq	.L135
.L134:
	ldr	r3, [r3, #4]
	cmp	r2, r3
	sub	r3, r3, #4
	bne	.L136
.L132:
	sub	r5, r1, r5
	mov	r2, #0
	add	r3, r4, r5, lsl #2
	movw	r0, #:lower16:.LANCHOR0
	mov	r1, r9
	str	r2, [r3, #56]
	movt	r0, #:upper16:.LANCHOR0
	blx	r7
.L139:
	ldr	r5, [fp, #16]
	ldr	r9, [r5, #92]
	cmp	r9, #0
	beq	.L140
	mov	r3, #2
	ldr	r2, [fp, #8]
	ldr	r1, [fp, #-12]
	mov	r0, #0
	blx	r9
.L140:
	ldr	r3, [r5, #120]
	movw	fp, #:lower16:kmem_cache_free
	mov	r1, r10
	movt	fp, #:upper16:kmem_cache_free
	ldr	r0, [r3, #20]
	blx	fp
.L153:
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	blx	r6
	mov	r9, r0
.L130:
	ldr	r5, [r4, #116]
	cmp	r5, #0
	beq	.L82
	movw	fp, #:lower16:kmem_cache_free
	movw	r10, #:lower16:.LANCHOR0
	movt	fp, #:upper16:kmem_cache_free
	movt	r10, #:upper16:.LANCHOR0
	mov	r1, r9
	str	r8, [sp, #4]
.L149:
	ldr	lr, [r5, #28]
	mov	r2, lr
	ldr	ip, [r2, #28]!
	cmp	r2, ip
	sub	ip, ip, #4
	beq	.L141
	cmp	ip, r5
	beq	.L142
	mov	r3, ip
	b	.L143
.L145:
	cmp	r3, r5
	beq	.L144
.L143:
	ldr	r3, [r3, #4]
	cmp	r2, r3
	sub	r3, r3, #4
	bne	.L145
.L141:
	mov	r0, r10
	blx	r7
	ldr	r8, [r5, #28]
	ldr	r9, [r8, #92]
	cmp	r9, #0
	beq	.L148
	mov	r3, #2
	ldr	r2, [r5, #20]
	ldr	r1, [r5]
	mov	r0, #0
	blx	r9
.L148:
	ldr	r3, [r8, #120]
	mov	r1, r5
	ldr	r0, [r3, #20]
	blx	fp
	mov	r0, r10
	blx	r6
	ldr	r5, [r4, #116]
	mov	r1, r0
	cmp	r5, #0
	bne	.L149
	mov	r9, r0
	ldr	r8, [sp, #4]
	b	.L82
.L129:
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	blx	r6
	mov	r9, r0
	b	.L82
.L144:
	ldr	r3, [r5, #4]
	cmp	r3, r2
	beq	.L146
.L159:
	sub	ip, r3, #4
	cmp	ip, r5
	beq	.L158
.L146:
	ldr	r3, [lr, #116]
	cmp	r3, r5
	streq	ip, [lr, #116]
.L147:
	ldrd	r2, [r5, #4]
	mov	r8, #256
	mov	r9, #512
	str	r3, [r2, #4]
	str	r2, [r3]
	strd	r8, [r5, #4]
	b	.L141
.L86:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_spin_unlock_irqrestore
	mov	r1, r9
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_spin_unlock_irqrestore
	mvn	r8, #21
	blx	r3
	b	.L81
.L142:
	ldr	r3, [r5, #4]
	cmp	r3, r2
	bne	.L159
.L158:
	mov	r3, #0
	str	r3, [lr, #116]
	b	.L147
.L212:
	mov	r0, r4
	bl	get_from_queue
	subs	r8, r0, #0
	beq	.L104
	ldr	r3, [r7, #36]
	add	r2, r8, #12
	str	r2, [r7, #56]
	cmp	r3, #0
	bne	.L105
	ldr	r2, [r8, #28]
	mov	r1, #1
	ldr	r0, [r8, #20]
	movw	r3, #:lower16:__aeabi_idiv
	ldrb	fp, [r4, #100]	@ zero_extendqisi2
	movt	r3, #:upper16:__aeabi_idiv
	ldr	r2, [r2, #120]
	str	r0, [sp, #4]
	ldr	r2, [r2, #16]
	lsr	fp, fp, #5
	lsl	r1, r1, fp
	ldrh	r0, [r2, #32]
	ldr	r2, [r2, #32]
	ubfx	r0, r0, #3, #7
	ubfx	r2, r2, #10, #10
	mul	r0, r0, r2
	blx	r3
	cmp	r0, #16
	movlt	r10, r0
	movge	r10, #16
	cmp	r0, #1
	ble	.L106
	movw	r7, #:lower16:__aeabi_uidivmod
	lsl	r1, r10, fp
	movt	r7, #:upper16:__aeabi_uidivmod
	ldr	r0, [sp, #4]
	blx	r7
	cmp	r1, #0
	beq	.L106
	sub	r3, r10, #1
	mvn	r1, #0
	lsl	r2, r3, fp
	str	r5, [sp, #8]
	str	r4, [sp, #12]
	lsl	fp, r1, fp
	mov	r4, r2
	mov	r5, r3
	b	.L107
.L108:
	blx	r7
	cmp	r1, #0
	beq	.L208
.L107:
	cmp	r5, #1
	mov	r1, r4
	mov	r10, r5
	ldr	r0, [sp, #4]
	sub	r5, r5, #1
	add	r4, r4, fp
	bne	.L108
.L208:
	ldr	r5, [sp, #8]
	ldr	r4, [sp, #12]
.L106:
	ldrb	r3, [r4, #100]	@ zero_extendqisi2
	bfi	r3, r10, #0, #5
	strb	r3, [r4, #100]
.L109:
	sub	r5, r6, r5
	movw	r3, #:lower16:pl330_submit_req
	lsl	r5, r5, #2
	movt	r3, #:upper16:pl330_submit_req
	ldr	r0, [r4]
	add	r6, r5, #36
	add	r6, r4, r6
	mov	r1, r6
	blx	r3
	subs	r1, r0, #0
	bne	.L110
	movw	r3, #:lower16:pl330_chan_ctrl
	str	r6, [r4, #24]
	ldr	r0, [r4]
	movt	r3, #:upper16:pl330_chan_ctrl
	blx	r3
	mov	r8, r0
	b	.L111
.L211:
	mov	r0, r4
	bl	get_from_queue
	subs	r8, r0, #0
	beq	.L93
	ldr	r3, [r7, #36]
	add	r2, r8, #12
	str	r2, [r7, #56]
	cmp	r3, #0
	bne	.L95
	ldr	r2, [r8, #28]
	mov	r1, #1
	ldr	r0, [r8, #20]
	movw	r3, #:lower16:__aeabi_idiv
	ldrb	fp, [r4, #100]	@ zero_extendqisi2
	movt	r3, #:upper16:__aeabi_idiv
	ldr	r2, [r2, #120]
	str	r0, [sp, #4]
	ldr	r2, [r2, #16]
	lsr	fp, fp, #5
	lsl	r1, r1, fp
	ldrh	r0, [r2, #32]
	ldr	r2, [r2, #32]
	ubfx	r0, r0, #3, #7
	ubfx	r2, r2, #10, #10
	mul	r0, r0, r2
	blx	r3
	cmp	r0, #16
	movlt	r10, r0
	movge	r10, #16
	cmp	r0, #1
	ble	.L96
	movw	r7, #:lower16:__aeabi_uidivmod
	lsl	r1, r10, fp
	movt	r7, #:upper16:__aeabi_uidivmod
	ldr	r0, [sp, #4]
	blx	r7
	cmp	r1, #0
	beq	.L96
	sub	r3, r10, #1
	mvn	r1, #0
	lsl	r2, r3, fp
	str	r5, [sp, #8]
	str	r4, [sp, #12]
	lsl	fp, r1, fp
	mov	r4, r2
	mov	r5, r3
	b	.L97
.L98:
	blx	r7
	cmp	r1, #0
	beq	.L207
.L97:
	cmp	r5, #1
	mov	r1, r4
	mov	r10, r5
	ldr	r0, [sp, #4]
	sub	r5, r5, #1
	add	r4, r4, fp
	bne	.L98
.L207:
	ldr	r5, [sp, #8]
	ldr	r4, [sp, #12]
.L96:
	ldrb	r3, [r4, #100]	@ zero_extendqisi2
	bfi	r3, r10, #0, #5
	strb	r3, [r4, #100]
.L99:
	sub	r6, r6, r5
	movw	r3, #:lower16:pl330_submit_req
	lsl	r6, r6, #2
	movt	r3, #:upper16:pl330_submit_req
	ldr	r0, [r4]
	add	r7, r6, #36
	add	r7, r4, r7
	mov	r1, r7
	blx	r3
	cmp	r0, #0
	streq	r7, [r4, #24]
	beq	.L93
	add	r6, r4, r6
	mov	r7, #0
	str	r7, [r6, #56]
	cmn	r0, #11
	ldr	r3, [r4, #120]
	movw	r2, #:lower16:.LANCHOR2
	movw	r1, #:lower16:.LC0
	movw	r6, #:lower16:dev_err
	movt	r2, #:upper16:.LANCHOR2
	movt	r1, #:upper16:.LC0
	ldr	r3, [r3, #16]
	movt	r6, #:upper16:dev_err
	ldr	r0, [r3]
	beq	.L213
	movw	r3, #486
	blx	r6
	ldr	r6, [r8, #28]
	ldr	r10, [r6, #92]
	cmp	r10, #0
	beq	.L102
	mov	r0, r7
	mov	r3, #1
	ldr	r2, [r8, #20]
	ldr	r1, [r8]
	blx	r10
.L102:
	ldr	r3, [r6, #8]
	tst	r3, #2
	bne	.L93
	ldr	r2, [r6, #120]
	movw	r3, #:lower16:kmem_cache_free
	mov	r1, r8
	movt	r3, #:upper16:kmem_cache_free
	ldr	r0, [r2, #20]
	blx	r3
	b	.L93
.L131:
	movw	r0, #:lower16:.LANCHOR0
	str	r10, [r3, #56]
	mov	r1, r9
	movt	r0, #:upper16:.LANCHOR0
	blx	r7
	b	.L153
.L210:
	movw	r0, #:lower16:.LANCHOR0
	movw	r7, #:lower16:_raw_spin_unlock_irqrestore
	mov	r1, r9
	str	r10, [r3, #56]
	movt	r0, #:upper16:.LANCHOR0
	movt	r7, #:upper16:_raw_spin_unlock_irqrestore
	blx	r7
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	blx	r6
	mov	r9, r0
	b	.L117
.L122:
	ldr	r3, [fp, #-8]
	cmp	r3, r1
	beq	.L124
.L155:
	sub	r0, r3, #4
	cmp	r0, r10
	beq	.L154
.L124:
	ldr	r3, [ip, #116]
	cmp	r3, r10
	streq	r0, [ip, #116]
.L125:
	ldr	r0, [fp, #-4]
	sub	r3, r2, r5
	ldr	ip, [fp, #-8]
	add	r3, r4, r3, lsl #2
	mov	r7, #256
	mov	lr, #512
	mov	r2, #0
	str	r0, [ip, #4]
	mov	r1, r9
	str	ip, [r0]
	movw	r0, #:lower16:.LANCHOR0
	str	r7, [fp, #-8]
	movw	r7, #:lower16:_raw_spin_unlock_irqrestore
	str	lr, [fp, #-4]
	movt	r0, #:upper16:.LANCHOR0
	str	r2, [r3, #56]
	movt	r7, #:upper16:_raw_spin_unlock_irqrestore
	blx	r7
	ldr	r9, [fp, #16]
	ldr	r3, [r9, #92]
	subs	ip, r3, #0
	mov	r3, #2
	str	r3, [sp, #4]
	bne	.L126
	b	.L127
.L135:
	ldr	r3, [fp, #-8]
	cmp	r3, r2
	beq	.L137
.L157:
	sub	r0, r3, #4
	cmp	r10, r0
	beq	.L156
.L137:
	ldr	r3, [ip, #116]
	cmp	r10, r3
	streq	r0, [ip, #116]
.L138:
	ldmdb	fp, {r0, r2}
	sub	r5, r1, r5
	add	r3, r4, r5, lsl #2
	mov	lr, #256
	mov	ip, #512
	str	r2, [r0, #4]
	mov	r1, r9
	str	r0, [r2]
	mov	r2, #0
	movw	r0, #:lower16:.LANCHOR0
	str	lr, [fp, #-8]
	str	ip, [fp, #-4]
	movt	r0, #:upper16:.LANCHOR0
	str	r2, [r3, #56]
	blx	r7
	b	.L139
.L110:
	add	r5, r4, r5
	mov	r7, #0
	str	r7, [r5, #56]
	cmn	r1, #11
	ldr	r3, [r4, #120]
	movw	r2, #:lower16:.LANCHOR2
	movw	r1, #:lower16:.LC0
	movw	r5, #:lower16:dev_err
	movt	r2, #:upper16:.LANCHOR2
	movt	r1, #:upper16:.LC0
	ldr	r3, [r3, #16]
	movt	r5, #:upper16:dev_err
	ldr	r0, [r3]
	beq	.L214
	movw	r3, #486
	blx	r5
	ldr	r6, [r8, #28]
	ldr	r5, [r6, #92]
	cmp	r5, #0
	beq	.L113
	mov	r0, r7
	mov	r3, #1
	ldr	r2, [r8, #20]
	ldr	r1, [r8]
	blx	r5
.L113:
	ldr	r3, [r6, #8]
	ands	r5, r3, #2
	bne	.L103
	ldr	r2, [r6, #120]
	movw	r3, #:lower16:kmem_cache_free
	mov	r1, r8
	movt	r3, #:upper16:kmem_cache_free
	ldr	r0, [r2, #20]
	blx	r3
	movw	r3, #:lower16:pl330_chan_ctrl
	mov	r1, r5
	ldr	r0, [r4]
	movt	r3, #:upper16:pl330_chan_ctrl
	blx	r3
	mov	r8, r0
	b	.L111
.L95:
	ldrb	r3, [r4, #100]	@ zero_extendqisi2
	mov	r2, #1
	bfi	r3, r2, #0, #5
	strb	r3, [r4, #100]
	b	.L99
.L105:
	ldrb	r3, [r4, #100]	@ zero_extendqisi2
	mov	r2, #1
	bfi	r3, r2, #0, #5
	strb	r3, [r4, #100]
	b	.L109
.L133:
	ldr	r3, [fp, #-8]
	cmp	r3, r2
	bne	.L157
.L156:
	mov	r3, #0
	str	r3, [ip, #116]
	b	.L138
.L104:
	movw	r3, #:lower16:pl330_chan_ctrl
	mov	r1, r8
	ldr	r0, [r4]
	movt	r3, #:upper16:pl330_chan_ctrl
	blx	r3
	mov	r8, r0
	b	.L111
.L120:
	ldr	r3, [fp, #-8]
	cmp	r3, r1
	bne	.L155
.L154:
	mov	r3, #0
	str	r3, [ip, #116]
	b	.L125
.L214:
	mov	r3, #480
	blx	r5
	mov	r2, r4
	str	r8, [r4, #116]
	ldr	ip, [r2, #28]!
	add	r0, r8, #4
	movw	r3, #:lower16:pl330_chan_ctrl
	mov	r1, r7
	movt	r3, #:upper16:pl330_chan_ctrl
	str	r0, [ip, #4]
	str	r2, [r8, #8]
	str	ip, [r8, #4]
	str	r0, [r4, #28]
	ldr	r0, [r4]
	blx	r3
	mov	r8, r0
	b	.L111
.L213:
	mov	r3, #480
	blx	r6
	mov	r3, r4
	str	r8, [r4, #116]
	ldr	r1, [r3, #28]!
	add	r2, r8, #4
	str	r2, [r1, #4]
	stmib	r8, {r1, r3}
	str	r2, [r4, #28]
	b	.L93
	.fnend
	.size	s3c2410_dma_ctrl, .-s3c2410_dma_ctrl
	.global	__aeabi_idivmod
	.align	2
	.global	s3c2410_dma_enqueue_ring
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c2410_dma_enqueue_ring, %function
s3c2410_dma_enqueue_ring:
	.fnstart
	@ args = 4, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r0
	movw	r4, #:lower16:_raw_spin_lock_irqsave
	movw	r0, #:lower16:.LANCHOR0
	.pad #36
	sub	sp, sp, #36
	movt	r4, #:upper16:_raw_spin_lock_irqsave
	movt	r0, #:upper16:.LANCHOR0
	mov	r9, r2
	mov	r7, r3
	mov	r8, r1
	blx	r4
	movw	r2, #:lower16:.LANCHOR1
	mov	r6, r0
	movt	r2, #:upper16:.LANCHOR1
	ldr	r3, [r2]
	cmp	r2, r3
	beq	.L252
	sub	r4, r3, #16
	ldr	r3, [r3, #-12]
	cmp	r5, r3
	bne	.L218
	b	.L217
.L219:
	ldr	r3, [r3, #-12]
	cmp	r5, r3
	beq	.L217
.L218:
	ldr	r3, [r4, #16]
	cmp	r2, r3
	sub	r4, r3, #16
	bne	.L219
.L252:
	mvn	r4, #21
.L216:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_spin_unlock_irqrestore
	mov	r1, r6
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_spin_unlock_irqrestore
	blx	r3
.L215:
	mov	r0, r4
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L217:
	ldr	r10, [r4, #120]
	cmp	r10, #0
	beq	.L252
	ldrb	r1, [r4, #100]	@ zero_extendqisi2
	tst	r1, #224
	beq	.L220
	lsr	r1, r1, #5
	mov	r2, #1
	movw	r3, #:lower16:__aeabi_idivmod
	lsl	r1, r2, r1
	movt	r3, #:upper16:__aeabi_idivmod
	mov	r0, r7
	blx	r3
	cmp	r1, #0
	bne	.L252
.L220:
	movw	r3, #:lower16:kmem_cache_alloc
	ldr	r0, [r10, #20]
	movt	r3, #:upper16:kmem_cache_alloc
	mov	r1, #32
	blx	r3
	cmp	r0, #0
	beq	.L250
	mov	r3, #0
	str	r8, [r0]
	str	r4, [r0, #28]
	str	r7, [r0, #20]
	str	r3, [r0, #24]
	ldr	r3, [r4, #36]
	cmp	r3, #1
	streq	r9, [r0, #12]
	ldrne	r3, [r4, #12]
	ldreq	r3, [r4, #12]
	strne	r9, [r0, #16]
	strne	r3, [r0, #12]
	streq	r3, [r0, #16]
	ldr	r3, [r4, #116]
	ldr	r2, [r4, #8]
	cmp	r3, #0
	moveq	r3, r0
	streq	r0, [r4, #116]
	tst	r2, #2
	beq	.L224
	ldr	r2, [r4, #56]
	add	r3, r3, #12
	cmp	r3, r2
	beq	.L225
	ldr	r2, [r4, #84]
	cmp	r3, r2
	beq	.L225
.L224:
	ldr	r3, [r4, #32]
	add	r2, r0, #4
	add	r8, r4, #28
	str	r2, [r4, #32]
	str	r8, [r0, #4]
	add	r7, r4, #36
	str	r3, [r0, #8]
	str	r2, [r3]
	ldr	r3, [r4, #24]
	sub	r7, r3, r7
	clz	r7, r7
	lsr	r7, r7, #5
	lsl	r9, r7, #3
	sub	fp, r9, r7
	add	fp, r4, fp, lsl #2
	ldr	r1, [fp, #56]
	cmp	r1, #0
	beq	.L297
	rsb	r7, r7, #1
	ldr	r3, [sp, #72]
	lsl	r9, r7, #3
	sub	fp, r9, r7
	add	fp, r4, fp, lsl #2
	ldr	r1, [fp, #56]
	str	r3, [fp, #60]
	cmp	r1, #0
	beq	.L298
.L228:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_spin_unlock_irqrestore
	mov	r1, r6
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_spin_unlock_irqrestore
	blx	r3
	ldr	r4, [r4, #8]
	ands	r4, r4, #1
	beq	.L215
	mov	r0, r5
	mov	r1, #0
	bl	s3c2410_dma_ctrl
	mov	r4, #0
	b	.L215
.L250:
	mvn	r4, #11
	b	.L216
.L297:
	ldr	r3, [sp, #72]
	mov	r0, r4
	str	r3, [fp, #60]
	bl	get_from_queue
	subs	r10, r0, #0
	beq	.L228
	ldr	r3, [fp, #36]
	add	r2, r10, #12
	str	r2, [fp, #56]
	cmp	r3, #0
	bne	.L238
	ldr	r0, [r10, #28]
	mov	r1, #1
	ldrb	r2, [r4, #100]	@ zero_extendqisi2
	movw	r3, #:lower16:__aeabi_idiv
	movt	r3, #:upper16:__aeabi_idiv
	ldr	r0, [r0, #120]
	lsr	r2, r2, #5
	ldr	r0, [r0, #16]
	lsl	r1, r1, r2
	str	r2, [sp, #12]
	ldr	r2, [r10, #20]
	ldrh	ip, [r0, #32]
	ldr	r0, [r0, #32]
	str	r2, [sp, #4]
	ubfx	ip, ip, #3, #7
	ubfx	r0, r0, #10, #10
	mul	r0, ip, r0
	blx	r3
	cmp	r0, #16
	movlt	fp, r0
	movge	fp, #16
	cmp	r0, #1
	str	fp, [sp, #8]
	ble	.L231
	ldr	r2, [sp, #12]
	movw	r3, #:lower16:__aeabi_uidivmod
	movt	r3, #:upper16:__aeabi_uidivmod
	ldr	r0, [sp, #4]
	str	r3, [sp, #12]
	str	r2, [sp, #16]
	lsl	r1, fp, r2
	blx	r3
	cmp	r1, #0
	beq	.L231
	ldr	r2, [sp, #16]
	sub	fp, fp, #1
	mvn	r1, #0
	str	r4, [sp, #16]
	str	r5, [sp, #20]
	lsl	r3, fp, r2
	lsl	r2, r1, r2
	mov	r5, r3
	mov	r4, r2
	b	.L232
.L233:
	ldr	r3, [sp, #12]
	blx	r3
	cmp	r1, #0
	beq	.L286
.L232:
	cmp	fp, #1
	mov	r1, r5
	str	fp, [sp, #8]
	add	r5, r5, r4
	ldr	r0, [sp, #4]
	sub	fp, fp, #1
	bne	.L233
.L286:
	ldrd	r4, [sp, #16]
.L231:
	ldrb	r3, [r4, #100]	@ zero_extendqisi2
	ldr	r2, [sp, #8]
	bfi	r3, r2, #0, #5
	strb	r3, [r4, #100]
.L242:
	sub	r7, r9, r7
	movw	r3, #:lower16:pl330_submit_req
	lsl	r7, r7, #2
	movt	r3, #:upper16:pl330_submit_req
	ldr	r0, [r4]
	add	r9, r7, #36
	add	r9, r4, r9
	mov	r1, r9
	blx	r3
	cmp	r0, #0
	streq	r9, [r4, #24]
	beq	.L228
	add	r7, r4, r7
	mov	r9, #0
	str	r9, [r7, #56]
	cmn	r0, #11
	ldr	r3, [r4, #120]
	movw	r2, #:lower16:.LANCHOR2
	movw	r1, #:lower16:.LC0
	movw	r7, #:lower16:dev_err
	movt	r2, #:upper16:.LANCHOR2
	movt	r1, #:upper16:.LC0
	ldr	r3, [r3, #16]
	movt	r7, #:upper16:dev_err
	ldr	r0, [r3]
	beq	.L299
	movw	r3, #486
	blx	r7
	ldr	r7, [r10, #28]
	ldr	r8, [r7, #92]
	cmp	r8, #0
	beq	.L245
	mov	r0, r9
	mov	r3, #1
	ldr	r2, [r10, #20]
	ldr	r1, [r10]
	blx	r8
.L245:
	ldr	r3, [r7, #8]
	tst	r3, #2
	bne	.L228
	ldr	r2, [r7, #120]
	movw	r3, #:lower16:kmem_cache_free
	mov	r1, r10
	movt	r3, #:upper16:kmem_cache_free
	ldr	r0, [r2, #20]
	blx	r3
	b	.L228
.L225:
	str	r0, [r4, #116]
	b	.L224
.L298:
	mov	r0, r4
	bl	get_from_queue
	subs	r10, r0, #0
	beq	.L228
	ldr	r3, [fp, #36]
	add	r2, r10, #12
	str	r2, [fp, #56]
	cmp	r3, #0
	bne	.L238
	ldr	r2, [r10, #28]
	mov	r1, #1
	ldr	r0, [r10, #20]
	movw	r3, #:lower16:__aeabi_idiv
	ldrb	fp, [r4, #100]	@ zero_extendqisi2
	movt	r3, #:upper16:__aeabi_idiv
	ldr	r2, [r2, #120]
	str	r0, [sp, #8]
	ldr	r2, [r2, #16]
	lsr	fp, fp, #5
	lsl	r1, r1, fp
	ldrh	r0, [r2, #32]
	ldr	r2, [r2, #32]
	ubfx	r0, r0, #3, #7
	ubfx	r2, r2, #10, #10
	mul	r0, r0, r2
	blx	r3
	cmp	r0, #16
	movlt	r3, r0
	movge	r3, #16
	cmp	r0, #1
	str	r3, [sp, #4]
	ble	.L239
	movw	r2, #:lower16:__aeabi_uidivmod
	lsl	r1, r3, fp
	movt	r2, #:upper16:__aeabi_uidivmod
	ldr	r0, [sp, #8]
	str	r2, [sp, #12]
	blx	r2
	cmp	r1, #0
	beq	.L239
	ldr	r3, [sp, #4]
	mvn	r1, #0
	str	r7, [sp, #4]
	str	r6, [sp, #16]
	sub	r3, r3, #1
	str	r4, [sp, #24]
	lsl	r2, r3, fp
	str	r5, [sp, #28]
	lsl	fp, r1, fp
	str	r8, [sp, #20]
	mov	r4, r2
	ldr	r5, [sp, #8]
	ldr	r7, [sp, #12]
	mov	r6, r3
	b	.L240
.L241:
	blx	r7
	cmp	r1, #0
	beq	.L287
.L240:
	cmp	r6, #1
	mov	r1, r4
	mov	r8, r6
	mov	r0, r5
	sub	r6, r6, #1
	add	r4, r4, fp
	bne	.L241
.L287:
	ldr	r7, [sp, #4]
	ldr	r6, [sp, #16]
	str	r8, [sp, #4]
	ldr	r4, [sp, #24]
	ldr	r8, [sp, #20]
	ldr	r5, [sp, #28]
.L239:
	ldrb	r3, [r4, #100]	@ zero_extendqisi2
	ldr	r2, [sp, #4]
	bfi	r3, r2, #0, #5
	strb	r3, [r4, #100]
	b	.L242
.L238:
	ldrb	r3, [r4, #100]	@ zero_extendqisi2
	mov	r2, #1
	bfi	r3, r2, #0, #5
	strb	r3, [r4, #100]
	b	.L242
.L299:
	mov	r3, #480
	blx	r7
	ldr	r2, [r4, #28]
	add	r3, r10, #4
	str	r10, [r4, #116]
	str	r3, [r2, #4]
	stmib	r10, {r2, r8}
	str	r3, [r4, #28]
	b	.L228
	.fnend
	.size	s3c2410_dma_enqueue_ring, .-s3c2410_dma_enqueue_ring
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_pl330_rq, %function
s3c_pl330_rq:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r3, #:lower16:_raw_spin_lock_irqsave
	mov	r7, r0
	movw	r0, #:lower16:.LANCHOR0
	mov	r4, r1
	.pad #28
	sub	sp, sp, #28
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_spin_lock_irqsave
	ldr	r6, [r1, #20]
	mov	r5, r2
	blx	r3
	ldr	r1, [r4, #24]
	mov	r8, r0
	cmp	r1, #0
	beq	.L341
.L302:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_spin_unlock_irqrestore
	movt	r3, #:upper16:_raw_spin_unlock_irqrestore
	mov	r1, r8
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	cmp	r5, #0
	moveq	r3, r5
	beq	.L312
	cmp	r5, #1
	moveq	r3, #2
	movne	r3, #1
.L312:
	ldr	r0, [r4, #24]
	cmp	r0, #0
	bne	.L313
	cmp	r6, #0
	beq	.L314
	subs	r7, r6, #12
	beq	.L300
	ldr	r4, [r6, #16]
	ldr	r5, [r4, #92]
	cmp	r5, #0
	beq	.L317
	ldr	r2, [r6, #8]
	ldr	r1, [r6, #-12]
	blx	r5
.L317:
	ldr	r3, [r4, #8]
	tst	r3, #2
	beq	.L342
.L300:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L313:
	ldr	lr, [r7, #92]
	cmp	lr, #0
	beq	.L300
	ldr	r2, [r6, #8]
	mov	r0, #0
	ldr	r1, [r6, #-12]
	mov	ip, lr
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	ip	@ indirect register sibling call
.L341:
	str	r1, [r4, #20]
	mov	r0, r7
	bl	get_from_queue
	subs	r9, r0, #0
	beq	.L302
	ldr	r3, [r4]
	add	r2, r9, #12
	str	r2, [r4, #20]
	cmp	r3, #0
	beq	.L343
	ldrb	r3, [r7, #100]	@ zero_extendqisi2
	mov	r2, #1
	bfi	r3, r2, #0, #5
	strb	r3, [r7, #100]
.L308:
	movw	r3, #:lower16:pl330_submit_req
	mov	r1, r4
	movt	r3, #:upper16:pl330_submit_req
	ldr	r0, [r7]
	blx	r3
	cmp	r0, #0
	streq	r4, [r7, #24]
	beq	.L302
	cmn	r0, #11
	mov	r10, #0
	str	r10, [r4, #20]
	movw	r2, #:lower16:.LANCHOR2
	ldr	r3, [r7, #120]
	movw	r1, #:lower16:.LC0
	beq	.L344
	ldr	r0, [r3, #16]
	movw	fp, #:lower16:dev_err
	movt	fp, #:upper16:dev_err
	movw	r3, #486
	movt	r2, #:upper16:.LANCHOR2
	movt	r1, #:upper16:.LC0
	ldr	r0, [r0]
	blx	fp
	ldr	fp, [r9, #28]
	ldr	r3, [fp, #92]
	subs	ip, r3, #0
	beq	.L311
	mov	r0, r10
	mov	r3, #1
	ldr	r2, [r9, #20]
	ldr	r1, [r9]
	blx	ip
.L311:
	ldr	r3, [fp, #8]
	tst	r3, #2
	bne	.L302
	ldr	r2, [fp, #120]
	movw	r3, #:lower16:kmem_cache_free
	mov	r1, r9
	movt	r3, #:upper16:kmem_cache_free
	ldr	r0, [r2, #20]
	blx	r3
	b	.L302
.L343:
	ldr	r2, [r9, #28]
	mov	r1, #1
	ldr	r0, [r9, #20]
	movw	r3, #:lower16:__aeabi_idiv
	ldrb	fp, [r7, #100]	@ zero_extendqisi2
	movt	r3, #:upper16:__aeabi_idiv
	ldr	r2, [r2, #120]
	str	r0, [sp, #4]
	ldr	r2, [r2, #16]
	lsr	fp, fp, #5
	lsl	r1, r1, fp
	ldrh	r0, [r2, #32]
	ldr	r2, [r2, #32]
	ubfx	r0, r0, #3, #7
	ubfx	r2, r2, #10, #10
	mul	r0, r0, r2
	blx	r3
	cmp	r0, #16
	movlt	r10, r0
	movge	r10, #16
	cmp	r0, #1
	ble	.L305
	movw	r3, #:lower16:__aeabi_uidivmod
	lsl	r1, r10, fp
	movt	r3, #:upper16:__aeabi_uidivmod
	ldr	r0, [sp, #4]
	str	r3, [sp, #8]
	blx	r3
	cmp	r1, #0
	beq	.L305
	sub	r3, r10, #1
	mvn	r1, #0
	lsl	r10, r3, fp
	str	r6, [sp, #12]
	str	r5, [sp, #20]
	lsl	fp, r1, fp
	ldr	r6, [sp, #4]
	mov	r5, r3
	str	r4, [sp, #4]
	mov	r4, r10
	str	r9, [sp, #16]
	ldr	r10, [sp, #8]
	b	.L306
.L307:
	blx	r10
	cmp	r1, #0
	beq	.L339
.L306:
	cmp	r5, #1
	mov	r1, r4
	mov	r9, r5
	mov	r0, r6
	sub	r5, r5, #1
	add	r4, r4, fp
	bne	.L307
.L339:
	mov	r10, r9
	ldr	r6, [sp, #12]
	ldr	r9, [sp, #16]
	ldr	r4, [sp, #4]
	ldr	r5, [sp, #20]
.L305:
	ldrb	r3, [r7, #100]	@ zero_extendqisi2
	bfi	r3, r10, #0, #5
	strb	r3, [r7, #100]
	b	.L308
.L314:
	ldr	r2, [r7, #120]
	movw	lr, #:lower16:_dev_info
	movt	lr, #:upper16:_dev_info
	movw	r1, #:lower16:.LC1
	movt	r1, #:upper16:.LC1
	movw	r3, #527
	ldr	r0, [r2, #16]
	mov	ip, lr
	ldr	r2, .L345
	ldr	r0, [r0]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	ip
.L342:
	ldr	r2, [r4, #120]
	movw	r3, #:lower16:kmem_cache_free
	mov	r1, r7
	movt	r3, #:upper16:kmem_cache_free
	ldr	r0, [r2, #20]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	r3	@ indirect register sibling call
.L344:
	ldr	r0, [r3, #16]
	movw	r10, #:lower16:dev_err
	movt	r2, #:upper16:.LANCHOR2
	movt	r1, #:upper16:.LC0
	mov	r3, #480
	movt	r10, #:upper16:dev_err
	ldr	r0, [r0]
	blx	r10
	mov	r3, r7
	str	r9, [r7, #116]
	ldr	r1, [r3, #28]!
	add	r2, r9, #4
	str	r2, [r1, #4]
	stmib	r9, {r1, r3}
	str	r2, [r7, #28]
	b	.L302
.L346:
	.align	2
.L345:
	.word	.LANCHOR2+20
	.fnend
	.size	s3c_pl330_rq, .-s3c_pl330_rq
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_pl330_rq1, %function
s3c_pl330_rq1:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r0
	mov	r2, r1
	sub	r0, r0, #64
	mov	r1, r3
	b	s3c_pl330_rq
	.fnend
	.size	s3c_pl330_rq1, .-s3c_pl330_rq1
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_pl330_rq0, %function
s3c_pl330_rq0:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r0
	mov	r2, r1
	sub	r0, r0, #36
	mov	r1, r3
	b	s3c_pl330_rq
	.fnend
	.size	s3c_pl330_rq0, .-s3c_pl330_rq0
	.align	2
	.global	s3c2410_dma_getposition
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c2410_dma_getposition, %function
s3c2410_dma_getposition:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	movw	lr, #:lower16:.LANCHOR1
	movt	lr, #:upper16:.LANCHOR1
	.pad #28
	sub	sp, sp, #28
	ldr	r3, [lr]
	cmp	lr, r3
	beq	.L356
	sub	ip, r3, #16
	ldr	r3, [r3, #-12]
	cmp	r0, r3
	bne	.L352
	b	.L351
.L353:
	ldr	r3, [r3, #-12]
	cmp	r0, r3
	beq	.L351
.L352:
	ldr	r3, [ip, #16]
	cmp	lr, r3
	sub	ip, r3, #16
	bne	.L353
.L356:
	mvn	r0, #21
.L349:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, pc}
.L351:
	ldr	r3, [ip, #120]
	cmp	r3, #0
	beq	.L356
	movw	r3, #:lower16:pl330_chan_status
	mov	r4, r1
	ldr	r0, [ip]
	movt	r3, #:upper16:pl330_chan_status
	add	r1, sp, #4
	mov	r5, r2
	blx	r3
	cmp	r0, #0
	blt	.L349
	ldr	r2, [sp, #8]
	mov	r0, #0
	ldr	r3, [sp, #12]
	str	r2, [r4]
	str	r3, [r5]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, pc}
	.fnend
	.size	s3c2410_dma_getposition, .-s3c2410_dma_getposition
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	pl330_init, %function
pl330_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:platform_driver_register
	ldr	r0, .L360
	movt	r3, #:upper16:platform_driver_register
	bx	r3
.L361:
	.align	2
.L360:
	.word	.LANCHOR1+8
	.fnend
	.size	pl330_init, .-pl330_init
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	pl330_irq_handler, %function
pl330_irq_handler:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:pl330_update
	push	{r4, lr}
	.save {r4, lr}
	mov	r0, r1
	movt	r3, #:upper16:pl330_update
	blx	r3
	adds	r0, r0, #0
	movne	r0, #1
	pop	{r4, pc}
	.fnend
	.size	pl330_irq_handler, .-pl330_irq_handler
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	pl330_probe, %function
pl330_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r0
	ldr	r10, [r0, #92]
	.pad #20
	sub	sp, sp, #20
	cmp	r10, #0
	beq	.L365
	movw	r7, #:lower16:kmalloc_caches
	movt	r7, #:upper16:kmalloc_caches
	ldr	r0, [r7, #24]
	cmp	r0, #0
	beq	.L412
	movw	r3, #:lower16:kmem_cache_alloc_trace
	mov	r2, #52
	movt	r3, #:upper16:kmem_cache_alloc_trace
	movw	r1, #32976
	blx	r3
	subs	r4, r0, #0
	beq	.L413
.L366:
	mov	r2, #0
	add	r6, r5, #8
	movw	r3, #:lower16:platform_get_resource
	str	r2, [r4, #16]
	str	r6, [r4]
	movt	r3, #:upper16:platform_get_resource
	mov	r1, #512
	mov	r0, r5
	blx	r3
	subs	r8, r0, #0
	beq	.L393
	movw	r3, #:lower16:pm_runtime_enable
	mov	r0, r6
	movt	r3, #:upper16:pm_runtime_enable
	blx	r3
	movw	r3, #:lower16:__pm_runtime_resume
	mov	r1, #4
	movt	r3, #:upper16:__pm_runtime_resume
	mov	r0, r6
	blx	r3
	subs	r9, r0, #0
	beq	.L370
	movw	r5, #:lower16:kfree
	movw	r1, #:lower16:.LC3
	movw	r3, #:lower16:dev_err
	movt	r5, #:upper16:kfree
	mvn	r9, #18
	mov	r0, r6
	movt	r1, #:upper16:.LC3
	movt	r3, #:upper16:dev_err
	blx	r3
.L369:
	mov	r0, r4
	blx	r5
.L364:
	mov	r0, r9
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L370:
	ldr	r2, [r8, #4]
	movw	r0, #:lower16:iomem_resource
	ldr	r1, [r8]
	movw	fp, #:lower16:__request_region
	ldr	r3, [r5]
	movt	r0, #:upper16:iomem_resource
	add	r2, r2, #1
	str	r9, [sp]
	sub	r2, r2, r1
	movt	fp, #:upper16:__request_region
	blx	fp
	ldr	r1, [r8, #4]
	movw	r3, #:lower16:__arm_ioremap
	ldr	r0, [r8]
	movt	r3, #:upper16:__arm_ioremap
	mov	r2, r9
	add	r1, r1, #1
	sub	r1, r1, r0
	blx	r3
	cmp	r0, #0
	str	r0, [r4, #8]
	beq	.L394
	movw	r3, #:lower16:platform_get_irq
	mov	r1, r9
	movt	r3, #:upper16:platform_get_irq
	mov	r0, r5
	blx	r3
	subs	r9, r0, #0
	blt	.L411
	ldr	r2, [r5, #52]
	mov	r3, #0
	movw	r1, #:lower16:pl330_irq_handler
	movw	fp, #:lower16:request_threaded_irq
	mov	r0, r9
	movt	r1, #:upper16:pl330_irq_handler
	cmp	r2, #0
	movt	fp, #:upper16:request_threaded_irq
	ldreq	r2, [r5, #16]
	str	r9, [sp, #8]
	stm	sp, {r2, r4}
	mov	r2, r3
	blx	fp
	subs	r9, r0, #0
	bne	.L411
	ldr	r0, [r7, #24]
	cmp	r0, #0
	beq	.L395
	movw	r3, #:lower16:kmem_cache_alloc_trace
	mov	r2, #28
	movt	r3, #:upper16:kmem_cache_alloc_trace
	mov	r1, #208
	blx	r3
	subs	fp, r0, #0
	beq	.L414
.L374:
	movw	r1, #:lower16:.LC4
	movw	r3, #:lower16:clk_get
	movt	r1, #:upper16:.LC4
	movt	r3, #:upper16:clk_get
	mov	r0, r6
	blx	r3
	cmn	r0, #4096
	str	r0, [fp, #24]
	bhi	.L415
	movw	r3, #:lower16:clk_enable
	movt	r3, #:upper16:clk_enable
	blx	r3
	movw	r3, #:lower16:pl330_add
	mov	r0, r4
	movt	r3, #:upper16:pl330_add
	blx	r3
	subs	r9, r0, #0
	bne	.L378
	str	r4, [fp, #16]
	movw	r1, #:lower16:kmem_cache_create
	str	r9, [fp]
	mov	r3, #0
	ldr	r0, [r5, #52]
	movt	r1, #:upper16:kmem_cache_create
	mov	ip, r1
	mov	r2, r3
	mov	r1, #32
	cmp	r0, #0
	ldreq	r0, [r5, #16]
	str	r3, [sp]
	blx	ip
	cmp	r0, #0
	str	r0, [fp, #20]
	bne	.L380
	movw	r3, #:lower16:pl330_del
	mov	r0, r4
	movt	r3, #:upper16:pl330_del
	mvn	r9, #11
	blx	r3
.L378:
	movw	r3, #:lower16:clk_disable
	ldr	r0, [fp, #24]
	movt	r3, #:upper16:clk_disable
	blx	r3
	movw	r3, #:lower16:clk_put
	ldr	r0, [fp, #24]
	movt	r3, #:upper16:clk_put
	blx	r3
.L377:
	movw	r5, #:lower16:kfree
	mov	r0, fp
	movt	r5, #:upper16:kfree
	blx	r5
.L375:
	movw	r3, #:lower16:free_irq
	ldr	r0, [sp, #8]
	movt	r3, #:upper16:free_irq
	mov	r1, r4
	blx	r3
	b	.L388
.L412:
	mov	r4, #16
	b	.L366
.L393:
	movw	r5, #:lower16:kfree
	mvn	r9, #18
	movt	r5, #:upper16:kfree
	b	.L369
.L411:
	movw	r5, #:lower16:kfree
	movt	r5, #:upper16:kfree
.L372:
.L388:
	movw	r3, #:lower16:__arm_iounmap
	ldr	r0, [r4, #8]
	movt	r3, #:upper16:__arm_iounmap
	blx	r3
.L371:
	ldr	r2, [r8, #4]
	movw	r0, #:lower16:iomem_resource
	ldr	r1, [r8]
	movw	r3, #:lower16:__release_region
	movt	r0, #:upper16:iomem_resource
	movt	r3, #:upper16:__release_region
	add	r2, r2, #1
	sub	r2, r2, r1
	blx	r3
	movw	r3, #:lower16:__pm_runtime_idle
	mov	r1, #5
	movt	r3, #:upper16:__pm_runtime_idle
	mov	r0, r6
	blx	r3
	movw	r3, #:lower16:__pm_runtime_disable
	mov	r0, r6
	movt	r3, #:upper16:__pm_runtime_disable
	mov	r1, #1
	blx	r3
	b	.L369
.L394:
	movw	r5, #:lower16:kfree
	mvn	r9, #5
	movt	r5, #:upper16:kfree
	b	.L371
.L414:
	movw	r5, #:lower16:kfree
	mvn	r9, #11
	movt	r5, #:upper16:kfree
	b	.L375
.L395:
	mov	fp, #16
	b	.L374
.L415:
	movw	r1, #:lower16:.LC5
	movw	r3, #:lower16:dev_err
	movt	r1, #:upper16:.LC5
	movt	r3, #:upper16:dev_err
	mov	r0, r6
	mvn	r9, #21
	blx	r3
	b	.L377
.L413:
	mvn	r9, #11
	b	.L364
.L365:
	movw	r1, #:lower16:.LC2
	movw	r3, #:lower16:dev_err
	movt	r1, #:upper16:.LC2
	movt	r3, #:upper16:dev_err
	add	r0, r0, #8
	mvn	r9, #18
	blx	r3
	b	.L364
.L380:
	movw	r8, #:lower16:.LANCHOR1
	movw	r3, #:lower16:kmem_cache_alloc_trace
	movt	r8, #:upper16:.LANCHOR1
	str	r10, [fp, #4]
	movt	r3, #:upper16:kmem_cache_alloc_trace
	ldr	r1, [r8, #92]
	add	r2, r8, #88
	str	r3, [sp, #8]
	mov	r10, #0
	mov	r3, r5
	mov	r5, r4
	str	r2, [fp, #8]
	add	r2, fp, #8
	str	r1, [fp, #12]
	str	r2, [r8, #92]
	str	r2, [r1]
.L387:
	ldr	r2, [fp, #4]
	ldr	r4, [r2, r10]
	cmp	r4, #77
	beq	.L382
	ldr	r2, [r8]
	cmp	r8, r2
	sub	r1, r2, #16
	bne	.L386
	b	.L383
.L416:
	ldr	r2, [r1, #16]
	cmp	r8, r2
	sub	r1, r2, #16
	beq	.L383
.L386:
	ldr	r2, [r2, #-12]
	cmp	r4, r2
	bne	.L416
.L382:
	add	r10, r10, #4
	cmp	r10, #128
	bne	.L387
	movw	r0, #:lower16:.LC6
	movw	r7, #:lower16:printk
	mov	r4, r5
	movt	r7, #:upper16:printk
	ldr	r2, [r3]
	movt	r0, #:upper16:.LC6
	ldr	r1, [r3, #4]
	blx	r7
	ldrb	ip, [r4, #40]	@ zero_extendqisi2
	movw	r0, #:lower16:.LC7
	ldrb	r3, [r4, #34]	@ zero_extendqisi2
	movt	r0, #:upper16:.LC7
	ldrh	r2, [r4, #32]
	and	ip, ip, #63
	ldr	r1, [r4, #32]
	str	ip, [sp, #4]
	ldrb	ip, [r4, #35]	@ zero_extendqisi2
	ubfx	r2, r2, #3, #7
	ubfx	r1, r1, #10, #10
	lsr	r3, r3, #4
	and	ip, ip, #63
	str	ip, [sp]
	blx	r7
	movw	r3, #:lower16:clk_disable
	ldr	r0, [fp, #24]
	movt	r3, #:upper16:clk_disable
	blx	r3
	movw	r3, #:lower16:__pm_runtime_idle
	mov	r0, r6
	movt	r3, #:upper16:__pm_runtime_idle
	mov	r1, #5
	blx	r3
	b	.L364
.L383:
	ldr	r0, [r7, #28]
	cmp	r0, #0
	beq	.L417
	str	r3, [sp, #12]
	mov	r2, #128
	ldr	r3, [sp, #8]
	mov	r1, #208
	blx	r3
	cmp	r0, #0
	ldr	r3, [sp, #12]
	beq	.L382
.L389:
	str	r4, [r0, #4]
	add	r1, r0, #16
	ldr	r2, [r8, #4]
	mov	ip, #0
	str	ip, [r0, #120]
	str	r8, [r0, #16]
	str	r2, [r0, #20]
	str	r1, [r8, #4]
	str	r1, [r2]
	b	.L382
.L417:
	mov	r0, #16
	b	.L389
	.fnend
	.size	pl330_probe, .-pl330_probe
	.align	2
	.global	s3c2410_dma_request
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c2410_dma_request, %function
s3c2410_dma_request:
	.fnstart
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #44
	sub	sp, sp, #44
	str	r0, [sp, #24]
	mov	r5, r0
	movw	r3, #:lower16:_raw_spin_lock_irqsave
	movw	r0, #:lower16:.LANCHOR0
	movw	r4, #:lower16:.LANCHOR1
	movt	r3, #:upper16:_raw_spin_lock_irqsave
	movt	r4, #:upper16:.LANCHOR1
	movt	r0, #:upper16:.LANCHOR0
	str	r3, [sp, #20]
	str	r1, [sp, #28]
	blx	r3
	ldr	r3, [r4]
	str	r0, [sp, #12]
	cmp	r4, r3
	beq	.L484
	ldr	r9, [r3, #-12]
	sub	fp, r3, #16
	mov	r2, r5
	mov	r10, fp
	cmp	r5, r9
	bne	.L421
	b	.L420
.L422:
	ldr	r3, [r3, #-12]
	cmp	r2, r3
	beq	.L420
.L421:
	ldr	r3, [r10, #16]
	cmp	r4, r3
	sub	r10, r3, #16
	bne	.L422
.L484:
	movw	r4, #:lower16:_raw_spin_unlock_irqrestore
	mvn	r6, #15
	movt	r4, #:upper16:_raw_spin_unlock_irqrestore
.L419:
	movw	r0, #:lower16:.LANCHOR0
	ldr	r1, [sp, #12]
	movt	r0, #:upper16:.LANCHOR0
	blx	r4
	mov	r0, r6
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L420:
	ldr	r3, [r10, #120]
	cmp	r3, #0
	str	r3, [sp, #4]
	bne	.L484
	ldr	r3, [r4, #88]
	ldr	r6, .L492
	sub	r2, r3, #8
	cmp	r3, r6
	str	r2, [sp, #16]
	beq	.L484
	mov	r5, r2
	str	r10, [sp, #8]
.L438:
	ldr	r3, [r5, #16]
	ldr	lr, [r5]
	ldrb	r3, [r3, #34]	@ zero_extendqisi2
	lsr	r10, r3, #4
	cmp	lr, r10
	bcs	.L423
	ldr	r8, [r5, #4]
	ldr	r3, [sp, #8]
	sub	r7, r8, #4
	add	r8, r8, #124
	ldr	r2, [r3, #4]
	mov	r3, r7
	b	.L425
.L486:
	cmp	r8, r3
	beq	.L423
.L425:
	ldr	r0, [r3, #4]!
	cmp	r0, r2
	bne	.L486
	ldr	r2, [sp, #16]
.L424:
	cmp	r5, r2
	beq	.L426
	cmp	r0, #77
	beq	.L426
	ldr	ip, [r2, #4]
	sub	r3, ip, #4
	add	ip, ip, #124
	b	.L428
.L487:
	cmp	r3, ip
	beq	.L426
.L428:
	ldr	r1, [r3, #4]!
	cmp	r0, r1
	bne	.L487
	ldr	r1, [r2, #16]
	ldr	r3, [r2]
	ldrb	r1, [r1, #34]	@ zero_extendqisi2
	cmp	r3, r1, lsr #4
	bcc	.L488
.L426:
	ldr	r2, [r2, #8]
	cmp	r2, r6
	sub	r2, r2, #8
	bne	.L424
.L482:
	ldr	r10, [sp, #8]
.L429:
	ldr	r3, [r5]
	movw	r0, #:lower16:.LANCHOR0
	movw	r4, #:lower16:_raw_spin_unlock_irqrestore
	ldr	r1, [sp, #12]
	movt	r0, #:upper16:.LANCHOR0
	movt	r4, #:upper16:_raw_spin_unlock_irqrestore
	add	r3, r3, #1
	str	r3, [r5]
	str	r5, [r10, #120]
	blx	r4
	ldr	r2, [r5, #16]
	movw	r3, #:lower16:__pm_runtime_resume
	mov	r1, #4
	movt	r3, #:upper16:__pm_runtime_resume
	ldr	r0, [r2]
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	ldr	r3, [sp, #20]
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	movw	r3, #:lower16:clk_enable
	str	r0, [sp, #12]
	movt	r3, #:upper16:clk_enable
	ldr	r0, [r5, #24]
	blx	r3
	movw	r3, #:lower16:pl330_request_channel
	ldr	r0, [r5, #16]
	movt	r3, #:upper16:pl330_request_channel
	blx	r3
	cmp	r0, #0
	str	r0, [r10]
	beq	.L489
	ldrb	r2, [r10, #100]	@ zero_extendqisi2
	mov	r1, #2
	ldr	r0, [sp, #24]
	ldr	r3, [sp, #28]
	bfi	r2, r1, #5, #3
	mov	r1, #3
	cmp	r0, #77
	strb	r2, [r10, #100]
	str	r3, [r10, #124]
	add	r2, r10, #96
	mov	r3, #0
	str	r1, [r10, #36]
	str	r3, [r10, #8]
	str	r3, [r10, #92]
	str	r3, [r10, #24]
	str	r3, [r10, #112]
	str	r3, [r10, #108]
	str	r3, [r10, #104]
	strb	r3, [r10, #98]
	strb	r3, [r10, #99]
	str	r1, [r10, #64]
	str	r2, [r10, #52]
	str	r2, [r10, #80]
	beq	.L453
	ldr	r2, [r5, #4]
	sub	r2, r2, #4
	b	.L443
.L442:
	cmp	r3, #32
	beq	.L453
.L443:
	ldr	r1, [r2, #4]!
	add	r3, r3, #1
	cmp	r0, r1
	bne	.L442
	sub	r3, r3, #1
	and	r3, r3, #31
	b	.L441
.L434:
	ldr	r1, [r1, #8]
	cmp	r1, r6
	sub	r1, r1, #8
	bne	.L436
	ldr	r3, [sp]
	add	r3, r3, #1
	str	r3, [sp]
.L433:
	cmp	r8, r7
	bne	.L437
.L491:
	ldr	r10, [sp, #36]
	ldr	r3, [sp, #32]
	add	lr, r10, r3
	ldr	r3, [sp]
	sub	r10, lr, r3
	cmn	r10, #1
	beq	.L482
	ldr	r3, [sp, #4]
	cmp	r10, #0
	movne	r3, r5
	str	r3, [sp, #4]
.L423:
	ldr	r5, [r5, #8]
	cmp	r5, r6
	sub	r5, r5, #8
	bne	.L438
	ldmib	sp, {r3, r10}
	cmp	r3, #0
	movne	r5, r3
	beq	.L484
	b	.L429
.L488:
	str	r10, [sp, #36]
	rsb	r3, lr, #100
	ldr	r10, [sp, #16]
	str	r3, [sp, #32]
	mov	r3, #0
	str	r3, [sp]
.L437:
	ldr	r2, [r7, #4]!
	mov	r0, fp
	cmp	r2, r9
	bne	.L431
	b	.L430
.L432:
	ldr	r3, [r3, #-12]
	cmp	r2, r3
	beq	.L430
.L431:
	ldr	r3, [r0, #16]
	cmp	r4, r3
	sub	r0, r3, #16
	bne	.L432
	b	.L433
.L430:
	cmp	r2, #77
	beq	.L433
	ldr	r3, [r0, #120]
	cmp	r3, #0
	bne	.L433
	mov	r1, r10
.L436:
	cmp	r5, r1
	beq	.L434
	ldr	ip, [r0, #4]
	cmp	ip, #77
	beq	.L434
	ldr	lr, [r1, #4]
	sub	r3, lr, #4
	add	lr, lr, #124
	b	.L435
.L490:
	cmp	lr, r3
	beq	.L434
.L435:
	ldr	r2, [r3, #4]!
	cmp	ip, r2
	bne	.L490
	cmp	r8, r7
	bne	.L437
	b	.L491
.L453:
	mov	r3, #31
.L441:
	ldrb	r0, [r10, #40]	@ zero_extendqisi2
	movw	r2, #:lower16:s3c_pl330_rq0
	ldrb	r1, [r10, #68]	@ zero_extendqisi2
	movt	r2, #:upper16:s3c_pl330_rq0
	str	r2, [r10, #48]
	movw	r2, #:lower16:s3c_pl330_rq1
	bfi	r0, r3, #0, #5
	movt	r2, #:upper16:s3c_pl330_rq1
	bfi	r1, r3, #0, #5
	strb	r0, [r10, #40]
	mov	r3, #0
	add	r0, r10, #36
	strb	r1, [r10, #68]
	add	r1, r10, #64
	str	r2, [r10, #76]
	add	r2, r10, #28
	str	r0, [r10, #44]
	mov	r6, r3
	str	r1, [r10, #72]
	str	r3, [r10, #56]
	str	r3, [r10, #84]
	str	r3, [r10, #116]
	str	r2, [r10, #28]
	str	r2, [r10, #32]
	b	.L419
.L489:
	ldr	r3, [r10, #120]
	mvn	r6, #15
	cmp	r3, #0
	strne	r0, [r10, #120]
	ldrne	r2, [r3]
	subne	r2, r2, #1
	strne	r2, [r3]
	movw	r3, #:lower16:clk_disable
	movt	r3, #:upper16:clk_disable
	ldr	r0, [r5, #24]
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	ldr	r1, [sp, #12]
	movt	r0, #:upper16:.LANCHOR0
	blx	r4
	ldr	r2, [r5, #16]
	movw	r3, #:lower16:__pm_runtime_idle
	movt	r3, #:upper16:__pm_runtime_idle
	mov	r1, #5
	ldr	r0, [r2]
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	ldr	r3, [sp, #20]
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	str	r0, [sp, #12]
	b	.L419
.L493:
	.align	2
.L492:
	.word	.LANCHOR1+88
	.fnend
	.size	s3c2410_dma_request, .-s3c2410_dma_request
	.align	2
	.global	s3c2410_dma_free
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c2410_dma_free, %function
s3c2410_dma_free:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r0
	movw	r7, #:lower16:_raw_spin_lock_irqsave
	movw	r0, #:lower16:.LANCHOR0
	movt	r7, #:upper16:_raw_spin_lock_irqsave
	movt	r0, #:upper16:.LANCHOR0
	mov	r6, r1
	blx	r7
	movw	r2, #:lower16:.LANCHOR1
	mov	r8, r0
	movt	r2, #:upper16:.LANCHOR1
	ldr	r3, [r2]
	cmp	r2, r3
	beq	.L532
	sub	r4, r3, #16
	ldr	r3, [r3, #-12]
	cmp	r5, r3
	bne	.L497
	b	.L496
.L498:
	ldr	r3, [r3, #-12]
	cmp	r5, r3
	beq	.L496
.L497:
	ldr	r3, [r4, #16]
	cmp	r2, r3
	sub	r4, r3, #16
	bne	.L498
.L532:
	movw	r6, #:lower16:_raw_spin_unlock_irqrestore
	mov	r5, #0
	movt	r6, #:upper16:_raw_spin_unlock_irqrestore
.L495:
	movw	r0, #:lower16:.LANCHOR0
	mov	r1, r8
	movt	r0, #:upper16:.LANCHOR0
	blx	r6
	mov	r0, r5
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L496:
	ldr	r5, [r4, #120]
	cmp	r5, #0
	beq	.L555
	ldr	r3, [r4, #124]
	cmp	r3, r6
	bne	.L533
	mov	r5, r4
	movw	r3, #:lower16:pl330_chan_ctrl
	movt	r3, #:upper16:pl330_chan_ctrl
	ldr	r0, [r5], #36
	mov	r1, #2
	blx	r3
	ldr	r2, [r4, #24]
	cmp	r2, r5
	sub	r5, r2, r5
	moveq	r3, #28
	movne	r3, #0
	add	r3, r4, r3
	clz	r5, r5
	ldr	r9, [r3, #56]
	lsr	r5, r5, #5
	cmp	r9, #0
	movweq	r6, #:lower16:_raw_spin_unlock_irqrestore
	movteq	r6, #:upper16:_raw_spin_unlock_irqrestore
	beq	.L499
	subs	r10, r9, #12
	mov	r2, #0
	str	r2, [r3, #56]
	beq	.L500
	ldr	r0, [r9, #16]
	mov	r2, r0
	ldr	r1, [r2, #28]!
	cmp	r2, r1
	sub	r1, r1, #4
	beq	.L501
	cmp	r1, r10
	beq	.L502
	mov	r3, r1
	b	.L503
.L505:
	cmp	r10, r3
	beq	.L504
.L503:
	ldr	r3, [r3, #4]
	cmp	r2, r3
	sub	r3, r3, #4
	bne	.L505
.L501:
	movw	r0, #:lower16:.LANCHOR0
	movw	r6, #:lower16:_raw_spin_unlock_irqrestore
	mov	r1, r8
	movt	r0, #:upper16:.LANCHOR0
	movt	r6, #:upper16:_raw_spin_unlock_irqrestore
	blx	r6
.L508:
	ldr	r8, [r9, #16]
	ldr	fp, [r8, #92]
	cmp	fp, #0
	beq	.L509
	mov	r3, #2
	ldr	r2, [r9, #8]
	ldr	r1, [r9, #-12]
	mov	r0, #0
	blx	fp
.L509:
	ldr	r2, [r8, #120]
	movw	r3, #:lower16:kmem_cache_free
	mov	r1, r10
	movt	r3, #:upper16:kmem_cache_free
	ldr	r0, [r2, #20]
	blx	r3
.L525:
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	blx	r7
	mov	r8, r0
.L499:
	rsb	r5, r5, #1
	rsb	r5, r5, r5, lsl #3
	add	r5, r4, r5, lsl #2
	ldr	r9, [r5, #56]
	cmp	r9, #0
	beq	.L510
	subs	r10, r9, #12
	mov	r3, #0
	str	r3, [r5, #56]
	beq	.L511
	ldr	r0, [r9, #16]
	mov	r2, r0
	ldr	r1, [r2, #28]!
	cmp	r2, r1
	sub	r1, r1, #4
	beq	.L512
	cmp	r10, r1
	beq	.L513
	mov	r3, r1
	b	.L514
.L516:
	cmp	r10, r3
	beq	.L515
.L514:
	ldr	r3, [r3, #4]
	cmp	r2, r3
	sub	r3, r3, #4
	bne	.L516
.L512:
	movw	r0, #:lower16:.LANCHOR0
	mov	r1, r8
	movt	r0, #:upper16:.LANCHOR0
	blx	r6
.L519:
	ldr	r5, [r9, #16]
	ldr	r8, [r5, #92]
	cmp	r8, #0
	beq	.L520
	mov	r3, #2
	ldr	r2, [r9, #8]
	ldr	r1, [r9, #-12]
	mov	r0, #0
	blx	r8
.L520:
	ldr	r2, [r5, #120]
	movw	r3, #:lower16:kmem_cache_free
	mov	r1, r10
	movt	r3, #:upper16:kmem_cache_free
	ldr	r0, [r2, #20]
	blx	r3
.L526:
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	blx	r7
	mov	r8, r0
.L510:
	movw	r9, #:lower16:.LANCHOR0
	movw	r10, #:lower16:kmem_cache_free
	movt	r9, #:upper16:.LANCHOR0
	movt	r10, #:upper16:kmem_cache_free
.L523:
	mov	r1, #1
	mov	r0, r4
	bl	get_from_queue
	mov	r1, r8
	mov	r5, r0
	mov	r0, r9
	blx	r6
	cmp	r5, #0
	mov	r3, #2
	mov	r0, #0
	beq	.L521
	ldr	r8, [r5, #28]
	ldr	fp, [r8, #92]
	cmp	fp, r0
	beq	.L522
	ldr	r2, [r5, #20]
	ldr	r1, [r5]
	blx	fp
.L522:
	ldr	r3, [r8, #120]
	mov	r1, r5
	ldr	r0, [r3, #20]
	blx	r10
	mov	r0, r9
	blx	r7
	mov	r8, r0
	b	.L523
.L555:
	movw	r6, #:lower16:_raw_spin_unlock_irqrestore
	movt	r6, #:upper16:_raw_spin_unlock_irqrestore
	b	.L495
.L521:
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	blx	r7
	movw	r3, #:lower16:pl330_release_channel
	mov	r8, r0
	movt	r3, #:upper16:pl330_release_channel
	ldr	r0, [r4]
	str	r5, [r4, #124]
	blx	r3
	ldr	r2, [r4, #120]
	movw	r3, #:lower16:clk_disable
	movt	r3, #:upper16:clk_disable
	str	r5, [r4]
	ldr	r0, [r2, #24]
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	mov	r1, r8
	movt	r0, #:upper16:.LANCHOR0
	blx	r6
	ldr	r2, [r4, #120]
	movw	r3, #:lower16:__pm_runtime_idle
	movt	r3, #:upper16:__pm_runtime_idle
	mov	r1, #5
	ldr	r2, [r2, #16]
	ldr	r0, [r2]
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	blx	r7
	ldr	r3, [r4, #120]
	mov	r8, r0
	cmp	r3, #0
	beq	.L556
	str	r5, [r4, #120]
	ldr	r2, [r3]
	sub	r2, r2, #1
	str	r2, [r3]
	b	.L495
.L556:
	mov	r5, r3
	b	.L495
.L511:
	movw	r0, #:lower16:.LANCHOR0
	mov	r1, r8
	movt	r0, #:upper16:.LANCHOR0
	blx	r6
	b	.L526
.L500:
	movw	r0, #:lower16:.LANCHOR0
	movw	r6, #:lower16:_raw_spin_unlock_irqrestore
	mov	r1, r8
	movt	r0, #:upper16:.LANCHOR0
	movt	r6, #:upper16:_raw_spin_unlock_irqrestore
	blx	r6
	b	.L525
.L515:
	ldr	r3, [r9, #-8]
	cmp	r3, r2
	beq	.L517
.L531:
	sub	r1, r3, #4
	cmp	r10, r1
	beq	.L530
.L517:
	ldr	r3, [r0, #116]
	cmp	r10, r3
	streq	r1, [r0, #116]
.L518:
	ldr	r3, [r9, #-4]
	mov	lr, #256
	ldr	r2, [r9, #-8]
	mov	ip, #512
	movw	r0, #:lower16:.LANCHOR0
	mov	r1, r8
	movt	r0, #:upper16:.LANCHOR0
	str	r3, [r2, #4]
	str	r2, [r3]
	str	lr, [r9, #-8]
	str	ip, [r9, #-4]
	blx	r6
	b	.L519
.L504:
	ldr	r3, [r9, #-8]
	cmp	r3, r2
	beq	.L506
.L529:
	sub	r1, r3, #4
	cmp	r10, r1
	beq	.L528
.L506:
	ldr	r3, [r0, #116]
	cmp	r10, r3
	streq	r1, [r0, #116]
.L507:
	ldr	r3, [r9, #-4]
	mov	lr, #256
	ldr	r2, [r9, #-8]
	mov	ip, #512
	movw	r0, #:lower16:.LANCHOR0
	movw	r6, #:lower16:_raw_spin_unlock_irqrestore
	mov	r1, r8
	movt	r0, #:upper16:.LANCHOR0
	str	r3, [r2, #4]
	movt	r6, #:upper16:_raw_spin_unlock_irqrestore
	str	r2, [r3]
	str	lr, [r9, #-8]
	str	ip, [r9, #-4]
	blx	r6
	b	.L508
.L502:
	ldr	r3, [r9, #-8]
	cmp	r3, r2
	bne	.L529
.L528:
	mov	r3, #0
	str	r3, [r0, #116]
	b	.L507
.L513:
	ldr	r3, [r9, #-8]
	cmp	r3, r2
	bne	.L531
.L530:
	mov	r3, #0
	str	r3, [r0, #116]
	b	.L518
.L533:
	movw	r6, #:lower16:_raw_spin_unlock_irqrestore
	mvn	r5, #15
	movt	r6, #:upper16:_raw_spin_unlock_irqrestore
	b	.L495
	.fnend
	.size	s3c2410_dma_free, .-s3c2410_dma_free
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	pl330_remove, %function
pl330_remove:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #92]
	cmp	r3, #0
	beq	.L572
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r9, #:lower16:.LANCHOR1
	mov	r8, r0
	movt	r9, #:upper16:.LANCHOR1
	movw	r0, #:lower16:.LANCHOR0
	movw	r10, #:lower16:_raw_spin_lock_irqsave
	mov	r6, r9
	.pad #20
	sub	sp, sp, #20
	movt	r0, #:upper16:.LANCHOR0
	movt	r10, #:upper16:_raw_spin_lock_irqsave
	blx	r10
	ldr	r3, [r6, #88]!
	mov	r1, r0
	cmp	r3, r6
	sub	r5, r3, #8
	beq	.L559
	ldr	r3, [r3, #8]
	add	r8, r8, #8
	ldr	r3, [r3]
	cmp	r8, r3
	bne	.L561
	b	.L560
.L562:
	ldr	r3, [r3, #8]
	ldr	r3, [r3]
	cmp	r3, r8
	beq	.L560
.L561:
	ldr	r3, [r5, #8]
	cmp	r3, r6
	sub	r5, r3, #8
	bne	.L562
.L559:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_spin_unlock_irqrestore
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_spin_unlock_irqrestore
	blx	r3
	mov	r0, #0
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L560:
	ldr	r7, [r9]
	movw	r3, #:lower16:kfree
	movw	fp, #:lower16:_raw_spin_unlock_irqrestore
	ldr	r4, [r7]
	cmp	r9, r7
	movteq	r3, #:upper16:kfree
	sub	r7, r7, #16
	movteq	fp, #:upper16:_raw_spin_unlock_irqrestore
	streq	r3, [sp, #4]
	sub	r4, r4, #16
	beq	.L570
	movw	r2, #:lower16:.LANCHOR0
	movt	fp, #:upper16:_raw_spin_unlock_irqrestore
	movt	r3, #:upper16:kfree
	movt	r2, #:upper16:.LANCHOR0
	str	r3, [sp, #4]
	str	r2, [sp, #8]
.L569:
	ldr	r0, [r7, #4]
	cmp	r0, #77
	beq	.L563
	ldr	ip, [r5, #4]
	sub	r3, ip, #4
	add	ip, ip, #124
	b	.L565
.L590:
	cmp	r3, ip
	beq	.L563
.L565:
	ldr	r2, [r3, #4]!
	cmp	r0, r2
	bne	.L590
	ldr	ip, [r9, #88]
	cmp	ip, r6
	sub	ip, ip, #8
	beq	.L571
.L568:
	cmp	ip, r5
	beq	.L566
	ldr	lr, [ip, #4]
	sub	r3, lr, #4
	add	lr, lr, #124
	b	.L567
.L591:
	cmp	r3, lr
	beq	.L566
.L567:
	ldr	r2, [r3, #4]!
	cmp	r0, r2
	bne	.L591
.L563:
	mov	r7, r4
	ldr	r3, [r4, #16]!
	cmp	r4, r9
	sub	r4, r3, #16
	bne	.L569
.L570:
	movw	r3, #:lower16:clk_put
	ldr	r0, [r5, #24]
	movt	r3, #:upper16:clk_put
	str	r1, [sp, #8]
	blx	r3
	ldr	r2, [r5, #8]
	mov	lr, #256
	ldr	r3, [r5, #12]
	mov	ip, #512
	mov	r0, r5
	str	r3, [r2, #4]
	str	r2, [r3]
	str	lr, [r5, #8]
	str	ip, [r5, #12]
	ldr	r3, [sp, #4]
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	ldr	r1, [sp, #8]
	movt	r0, #:upper16:.LANCHOR0
	blx	fp
	movw	r3, #:lower16:__pm_runtime_idle
	mov	r1, #5
	movt	r3, #:upper16:__pm_runtime_idle
	mov	r0, r8
	blx	r3
	movw	r3, #:lower16:__pm_runtime_disable
	mov	r0, r8
	movt	r3, #:upper16:__pm_runtime_disable
	mov	r1, #1
	blx	r3
	mov	r0, #0
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L566:
	ldr	ip, [ip, #8]
	cmp	ip, r6
	sub	ip, ip, #8
	bne	.L568
.L571:
	ldr	r0, [sp, #8]
	blx	fp
	ldr	r1, [r7, #124]
	ldr	r0, [r7, #4]
	bl	s3c2410_dma_free
	ldr	r0, [sp, #8]
	blx	r10
	ldrd	r2, [r7, #16]
	str	r0, [sp, #12]
	mov	r0, r7
	str	r3, [r2, #4]
	str	r2, [r3]
	mov	r2, #256
	mov	r3, #512
	strd	r2, [r7, #16]
	ldr	r3, [sp, #4]
	blx	r3
	ldr	r1, [sp, #12]
	b	.L563
.L572:
	mvn	r0, #21
	bx	lr
	.fnend
	.size	pl330_remove, .-pl330_remove
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	__func__.14561, %object
	.size	__func__.14561, 17
__func__.14561:
	.ascii	"s3c_pl330_submit\000"
	.space	3
	.type	__func__.14576, %object
	.size	__func__.14576, 13
__func__.14576:
	.ascii	"s3c_pl330_rq\000"
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	chan_list, %object
	.size	chan_list, 8
chan_list:
	.word	chan_list
	.word	chan_list
	.type	pl330_driver, %object
	.size	pl330_driver, 80
pl330_driver:
	.word	pl330_probe
	.word	pl330_remove
	.space	12
	.word	.LC8
	.space	4
	.word	0
	.space	44
	.space	4
	.type	dmac_list, %object
	.size	dmac_list, 8
dmac_list:
	.word	dmac_list
	.word	dmac_list
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	res_lock, %object
	.size	res_lock, 8
res_lock:
	.space	8
	.section	.initcall6.init,"aw",%progbits
	.align	2
	.type	__initcall_pl330_init6, %object
	.size	__initcall_pl330_init6, 4
__initcall_pl330_init6:
	.word	pl330_init
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%s:%d!\012\000"
.LC1:
	.ascii	"%s:%d No Xfer?!\012\000"
	.space	3
.LC2:
	.ascii	"platform data missing!\012\000"
.LC3:
	.ascii	"failed to get runtime pm\012\000"
	.space	2
.LC4:
	.ascii	"pdma\000"
	.space	3
.LC5:
	.ascii	"Cannot get operation clock.\012\000"
	.space	3
.LC6:
	.ascii	"<6>Loaded driver for PL330 DMAC-%d %s\012\000"
	.space	1
.LC7:
	.ascii	"<6>\011DBUFF-%ux%ubytes Num_Chans-%u Num_Peri-%u Nu"
	.ascii	"m_Events-%u\012\000"
	.space	3
.LC8:
	.ascii	"s3c-pl330\000"
	.section	___ksymtab+s3c2410_dma_config,"a",%progbits
	.align	2
	.type	__ksymtab_s3c2410_dma_config, %object
	.size	__ksymtab_s3c2410_dma_config, 8
__ksymtab_s3c2410_dma_config:
	.word	s3c2410_dma_config
	.word	__kstrtab_s3c2410_dma_config
	.section	___ksymtab+s3c2410_dma_ctrl,"a",%progbits
	.align	2
	.type	__ksymtab_s3c2410_dma_ctrl, %object
	.size	__ksymtab_s3c2410_dma_ctrl, 8
__ksymtab_s3c2410_dma_ctrl:
	.word	s3c2410_dma_ctrl
	.word	__kstrtab_s3c2410_dma_ctrl
	.section	___ksymtab+s3c2410_dma_devconfig,"a",%progbits
	.align	2
	.type	__ksymtab_s3c2410_dma_devconfig, %object
	.size	__ksymtab_s3c2410_dma_devconfig, 8
__ksymtab_s3c2410_dma_devconfig:
	.word	s3c2410_dma_devconfig
	.word	__kstrtab_s3c2410_dma_devconfig
	.section	___ksymtab+s3c2410_dma_enqueue_ring,"a",%progbits
	.align	2
	.type	__ksymtab_s3c2410_dma_enqueue_ring, %object
	.size	__ksymtab_s3c2410_dma_enqueue_ring, 8
__ksymtab_s3c2410_dma_enqueue_ring:
	.word	s3c2410_dma_enqueue_ring
	.word	__kstrtab_s3c2410_dma_enqueue_ring
	.section	___ksymtab+s3c2410_dma_free,"a",%progbits
	.align	2
	.type	__ksymtab_s3c2410_dma_free, %object
	.size	__ksymtab_s3c2410_dma_free, 8
__ksymtab_s3c2410_dma_free:
	.word	s3c2410_dma_free
	.word	__kstrtab_s3c2410_dma_free
	.section	___ksymtab+s3c2410_dma_getposition,"a",%progbits
	.align	2
	.type	__ksymtab_s3c2410_dma_getposition, %object
	.size	__ksymtab_s3c2410_dma_getposition, 8
__ksymtab_s3c2410_dma_getposition:
	.word	s3c2410_dma_getposition
	.word	__kstrtab_s3c2410_dma_getposition
	.section	___ksymtab+s3c2410_dma_request,"a",%progbits
	.align	2
	.type	__ksymtab_s3c2410_dma_request, %object
	.size	__ksymtab_s3c2410_dma_request, 8
__ksymtab_s3c2410_dma_request:
	.word	s3c2410_dma_request
	.word	__kstrtab_s3c2410_dma_request
	.section	___ksymtab+s3c2410_dma_set_buffdone_fn,"a",%progbits
	.align	2
	.type	__ksymtab_s3c2410_dma_set_buffdone_fn, %object
	.size	__ksymtab_s3c2410_dma_set_buffdone_fn, 8
__ksymtab_s3c2410_dma_set_buffdone_fn:
	.word	s3c2410_dma_set_buffdone_fn
	.word	__kstrtab_s3c2410_dma_set_buffdone_fn
	.section	___ksymtab+s3c2410_dma_setflags,"a",%progbits
	.align	2
	.type	__ksymtab_s3c2410_dma_setflags, %object
	.size	__ksymtab_s3c2410_dma_setflags, 8
__ksymtab_s3c2410_dma_setflags:
	.word	s3c2410_dma_setflags
	.word	__kstrtab_s3c2410_dma_setflags
	.section	__ksymtab_strings,"a",%progbits
	.type	__kstrtab_s3c2410_dma_getposition, %object
	.size	__kstrtab_s3c2410_dma_getposition, 24
__kstrtab_s3c2410_dma_getposition:
	.ascii	"s3c2410_dma_getposition\000"
	.type	__kstrtab_s3c2410_dma_devconfig, %object
	.size	__kstrtab_s3c2410_dma_devconfig, 22
__kstrtab_s3c2410_dma_devconfig:
	.ascii	"s3c2410_dma_devconfig\000"
	.type	__kstrtab_s3c2410_dma_set_buffdone_fn, %object
	.size	__kstrtab_s3c2410_dma_set_buffdone_fn, 28
__kstrtab_s3c2410_dma_set_buffdone_fn:
	.ascii	"s3c2410_dma_set_buffdone_fn\000"
	.type	__kstrtab_s3c2410_dma_setflags, %object
	.size	__kstrtab_s3c2410_dma_setflags, 21
__kstrtab_s3c2410_dma_setflags:
	.ascii	"s3c2410_dma_setflags\000"
	.type	__kstrtab_s3c2410_dma_config, %object
	.size	__kstrtab_s3c2410_dma_config, 19
__kstrtab_s3c2410_dma_config:
	.ascii	"s3c2410_dma_config\000"
	.type	__kstrtab_s3c2410_dma_free, %object
	.size	__kstrtab_s3c2410_dma_free, 17
__kstrtab_s3c2410_dma_free:
	.ascii	"s3c2410_dma_free\000"
	.type	__kstrtab_s3c2410_dma_request, %object
	.size	__kstrtab_s3c2410_dma_request, 20
__kstrtab_s3c2410_dma_request:
	.ascii	"s3c2410_dma_request\000"
	.type	__kstrtab_s3c2410_dma_enqueue_ring, %object
	.size	__kstrtab_s3c2410_dma_enqueue_ring, 25
__kstrtab_s3c2410_dma_enqueue_ring:
	.ascii	"s3c2410_dma_enqueue_ring\000"
	.type	__kstrtab_s3c2410_dma_ctrl, %object
	.size	__kstrtab_s3c2410_dma_ctrl, 17
__kstrtab_s3c2410_dma_ctrl:
	.ascii	"s3c2410_dma_ctrl\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
