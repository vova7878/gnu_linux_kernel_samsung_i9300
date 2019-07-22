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
	.file	"adc.c"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_adc_try, %function
s3c_adc_try:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	ldr	r3, [r0, #20]
	ldr	r5, [r0, #16]
	ldr	r1, [r3]
	.syntax divided
@ 128 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-samsung/adc.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r5, #0
	beq	.L29
.L2:
	mov	r3, #0
	str	r3, [r4, #16]
.L3:
	cmp	r5, #0
	beq	.L4
	ldr	r3, [r4, #20]
	str	r5, [r4, #12]
	ldr	r6, [r3]
	.syntax divided
@ 97 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-samsung/adc.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r2, [r4]
	mov	r0, r5
	ldr	r3, [r5, #28]
	mov	r1, #1
	bic	r6, r6, #63
	ldr	r2, [r2, #352]
	orr	r6, r6, #16384
	ldr	r7, [r2, #20]
	blx	r3
	ldrb	r3, [r5, #24]	@ zero_extendqisi2
	cmp	r3, #0
	movwne	r7, #:lower16:outer_cache
	movtne	r7, #:upper16:outer_cache
	beq	.L30
.L5:
	.syntax divided
@ 115 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-samsung/adc.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r3, [r7, #28]
	cmp	r3, #0
	beq	.L8
	blx	r3
.L8:
	ldr	r3, [r4, #20]
	str	r6, [r3]
	ldr	r3, [r4, #20]
	ldr	r5, [r3]
	.syntax divided
@ 88 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-samsung/adc.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	orr	r5, r5, #1
	.syntax divided
@ 91 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-samsung/adc.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r3, [r7, #28]
	cmp	r3, #0
	beq	.L11
.L27:
	blx	r3
.L11:
	ldr	r3, [r4, #20]
	str	r5, [r3]
	pop	{r4, r5, r6, r7, r8, pc}
.L30:
	cmp	r7, #1
	bls	.L6
	.syntax divided
@ 109 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-samsung/adc.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	movw	r7, #:lower16:outer_cache
	movt	r7, #:upper16:outer_cache
	ldr	r3, [r7, #28]
	cmp	r3, #0
	beq	.L7
	blx	r3
.L7:
	ldrb	r3, [r5, #25]	@ zero_extendqisi2
	ldr	r2, [r4, #20]
	and	r3, r3, #15
	str	r3, [r2, #28]
	b	.L5
.L29:
	movw	r2, #:lower16:.LANCHOR0
	movt	r2, #:upper16:.LANCHOR0
	ldr	r3, [r2]
	cmp	r3, r2
	beq	.L2
	ldr	r2, [r3, #4]
	mov	lr, #256
	ldr	r0, [r3]
	mov	ip, #512
	sub	r5, r3, #4
	str	r2, [r0, #4]
	str	r0, [r2]
	str	lr, [r3]
	str	ip, [r3, #4]
	b	.L3
.L6:
	ldrb	r3, [r5, #25]	@ zero_extendqisi2
	movw	r7, #:lower16:outer_cache
	movt	r7, #:upper16:outer_cache
	lsl	r3, r3, #3
	and	r3, r3, #56
	orr	r6, r6, r3
	b	.L5
.L4:
	bic	r1, r1, #16384
	orr	r5, r1, #4
	.syntax divided
@ 146 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-samsung/adc.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	bne	.L27
	b	.L11
	.fnend
	.size	s3c_adc_try, .-s3c_adc_try
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_adc_default_select, %function
s3c_adc_default_select:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	s3c_adc_default_select, .-s3c_adc_default_select
	.align	2
	.global	s3c_adc_start
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_adc_start, %function
s3c_adc_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:.LANCHOR1
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movt	ip, #:upper16:.LANCHOR1
	.pad #16
	sub	sp, sp, #16
	ldr	r6, [ip]
	cmp	r6, #0
	beq	.L46
	ldrb	ip, [r0, #24]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L47
.L34:
	mov	r9, r3
	mov	r7, r2
	mov	r10, r1
	mov	r4, r0
	.syntax divided
@ 37 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cmpxchg.h" 1
	dmb
@ 0 "" 2
	.arm
	.syntax unified
	mov	r2, #1
	add	r0, r0, #36
	.syntax divided
@ 52 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cmpxchg.h" 1
	@	__xchg4
1:	ldrex	r3, [r0]
	strex	r1, r2, [r0]
	teq	r1, #0
	bne	1b
@ 0 "" 2
@ 98 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cmpxchg.h" 1
	dmb
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, #0
	bne	.L48
	add	r8, r6, #24
	movw	r5, #:lower16:_raw_spin_lock_irqsave
	mov	r0, r8
	movt	r5, #:upper16:_raw_spin_lock_irqsave
	blx	r5
	ldrb	r3, [r4, #24]	@ zero_extendqisi2
	mov	r1, r0
	cmp	r3, #0
	bne	.L49
	movw	r2, #:lower16:.LANCHOR0
	movw	r3, #:lower16:s3c_convert_done
	movt	r2, #:upper16:.LANCHOR0
	movt	r3, #:upper16:s3c_convert_done
	ldr	r0, [r2, #4]
	add	ip, r4, #4
	mvn	lr, #0
	str	r9, [r4, #12]
	strb	r10, [r4, #25]
	str	r7, [r4, #16]
	str	r0, [r4, #8]
	str	ip, [r2, #4]
	str	r3, [r4, #32]
	str	r2, [r4, #4]
	str	lr, [r4, #20]
	str	ip, [r0]
	ldr	r3, [r6, #12]
	cmp	r3, #0
	beq	.L50
.L39:
	movw	r3, #:lower16:_raw_spin_unlock_irqrestore
	mov	r0, r8
	movt	r3, #:upper16:_raw_spin_unlock_irqrestore
	blx	r3
	mov	r0, #0
.L32:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L47:
	ldr	ip, [r6, #16]
	cmp	ip, #0
	beq	.L34
	mvn	r0, #10
	b	.L32
.L49:
	ldr	r3, [r6, #16]
	cmp	r3, #0
	bne	.L51
	movw	r3, #:lower16:s3c_convert_done
	mvn	r2, #0
	movt	r3, #:upper16:s3c_convert_done
	str	r9, [r4, #12]
	strb	r10, [r4, #25]
	str	r7, [r4, #16]
	str	r3, [r4, #32]
	str	r2, [r4, #20]
	ldr	r3, [r6, #12]
	str	r4, [r6, #16]
	cmp	r3, #0
	bne	.L39
.L50:
	mov	r0, r6
	str	r1, [sp, #12]
	bl	s3c_adc_try
	ldr	r1, [sp, #12]
	b	.L39
.L46:
	.syntax divided
@ 164 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-samsung/adc.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-samsung/adc.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 164, 0
.popsection
@ 0 "" 2
	.arm
	.syntax unified
.L48:
	movw	r3, #:lower16:.LANCHOR2
	movw	r2, #:lower16:.LC0
	movw	r0, #:lower16:.LC1
	movw	r5, #:lower16:warn_slowpath_fmt
	movt	r0, #:upper16:.LC1
	str	r4, [sp]
	movt	r3, #:upper16:.LANCHOR2
	movt	r2, #:upper16:.LC0
	movt	r5, #:upper16:warn_slowpath_fmt
	mov	r1, #170
	blx	r5
	mvn	r0, #10
	b	.L32
.L51:
	movw	r3, #:lower16:_raw_spin_unlock_irqrestore
	mov	r0, r8
	movt	r3, #:upper16:_raw_spin_unlock_irqrestore
	blx	r3
	mvn	r0, #10
	b	.L32
	.fnend
	.size	s3c_adc_start, .-s3c_adc_start
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_adc_stop, %function
s3c_adc_stop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	movw	r5, #:lower16:.LANCHOR1
	movt	r5, #:upper16:.LANCHOR1
	mov	r4, r0
	movw	r3, #:lower16:_raw_spin_lock_irqsave
	.pad #12
	sub	sp, sp, #12
	ldr	r0, [r5]
	movt	r3, #:upper16:_raw_spin_lock_irqsave
	add	r0, r0, #24
	blx	r3
	ldr	r3, [r5]
	mov	r6, r0
	ldr	r2, [r3, #12]
	cmp	r2, r4
	moveq	r2, #0
	streq	r2, [r3, #12]
	ldr	r2, [r3, #16]
	cmp	r2, r4
	moveq	r2, #0
	streq	r2, [r3, #16]
	beq	.L55
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	ldr	r2, [r0]
	cmp	r2, r0
	ldr	r3, [r2]
	beq	.L55
	mov	r7, #256
	mov	lr, #512
	b	.L58
.L61:
	mov	r3, r1
.L58:
	sub	r1, r2, #4
	cmp	r4, r1
	ldreq	r1, [r2, #4]
	ldreq	ip, [r2]
	streq	r1, [ip, #4]
	streq	ip, [r1]
	stmeq	r2, {r7, lr}
	cmp	r3, r0
	ldr	r1, [r3]
	mov	r2, r3
	bne	.L61
.L55:
	.syntax divided
@ 37 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cmpxchg.h" 1
	dmb
@ 0 "" 2
	.arm
	.syntax unified
	mov	r3, #0
	add	r2, r4, #36
	.syntax divided
@ 52 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cmpxchg.h" 1
	@	__xchg4
1:	ldrex	r1, [r2]
	strex	r0, r3, [r2]
	teq	r0, #0
	bne	1b
@ 0 "" 2
@ 98 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cmpxchg.h" 1
	dmb
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r1, r3
	beq	.L63
	ldr	r0, [r5]
	ldr	r3, [r0, #12]
	cmp	r3, #0
	beq	.L64
.L60:
	movw	r3, #:lower16:_raw_spin_unlock_irqrestore
	mov	r1, r6
	add	r0, r0, #24
	movt	r3, #:upper16:_raw_spin_unlock_irqrestore
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	r3	@ indirect register sibling call
.L63:
	movw	r2, #:lower16:.LC2
	movw	r0, #:lower16:.LC1
	movw	r7, #:lower16:warn_slowpath_fmt
	movt	r0, #:upper16:.LC1
	ldr	r3, .L65
	movt	r2, #:upper16:.LC2
	str	r4, [sp]
	movt	r7, #:upper16:warn_slowpath_fmt
	mov	r1, #225
	blx	r7
	ldr	r0, [r5]
	ldr	r3, [r0, #12]
	cmp	r3, #0
	bne	.L60
.L64:
	bl	s3c_adc_try
	ldr	r0, [r5]
	b	.L60
.L66:
	.align	2
.L65:
	.word	.LANCHOR2+16
	.fnend
	.size	s3c_adc_stop, .-s3c_adc_stop
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_convert_done, %function
s3c_convert_done:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	.save {lr}
	movw	lr, #:lower16:__wake_up
	str	r1, [r0, #20]
	movt	lr, #:upper16:__wake_up
	mov	ip, lr
	mov	r3, #0
	ldr	r0, [r0, #12]
	mov	r2, #1
	mov	r1, #3
	ldr	lr, [sp], #4
	bx	ip	@ indirect register sibling call
	.fnend
	.size	s3c_convert_done, .-s3c_convert_done
	.align	2
	.global	s3c_adc_read
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_adc_read, %function
s3c_adc_read:
	.fnstart
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r5, #:lower16:.LANCHOR1
	.pad #40
	sub	sp, sp, #40
	mov	r6, #0
	add	ip, sp, #12
	movt	r5, #:upper16:.LANCHOR1
	add	r3, sp, #4
	mov	r2, #1
	ldr	r8, [r5]
	mov	r4, r0
	str	r6, [sp, #8]
	str	r6, [sp, #4]
	str	ip, [sp, #12]
	str	ip, [sp, #16]
	bl	s3c_adc_start
	cmp	r0, #0
	blt	.L69
	ldr	r3, [r4, #20]
	cmp	r3, r6
	blt	.L77
.L71:
	add	r8, r8, #24
	mov	r5, #0
	movw	r3, #:lower16:_raw_spin_lock_irqsave
	mov	r0, r8
	movt	r3, #:upper16:_raw_spin_lock_irqsave
	str	r5, [r4, #40]
	blx	r3
	movw	r3, #:lower16:_raw_spin_unlock_irqrestore
	mov	r1, r0
	movt	r3, #:upper16:_raw_spin_unlock_irqrestore
	mov	r0, r8
	blx	r3
	ldr	r0, [r4, #20]
	str	r5, [r4, #32]
.L69:
	add	sp, sp, #40
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L77:
	mov	r3, sp
	movw	r9, #:lower16:prepare_to_wait
	bic	r3, r3, #8128
	movw	r10, #:lower16:schedule_timeout
	bic	r3, r3, #63
	movt	r9, #:upper16:prepare_to_wait
	ldr	r2, [r3, #12]
	movw	r3, #:lower16:autoremove_wake_function
	movt	r3, #:upper16:autoremove_wake_function
	movt	r10, #:upper16:schedule_timeout
	str	r6, [sp, #20]
	mov	r7, #150
	str	r2, [sp, #24]
	add	r2, sp, #32
	str	r3, [sp, #28]
	str	r2, [sp, #32]
	str	r2, [sp, #36]
	b	.L73
.L78:
	mov	r0, r7
	blx	r10
	subs	r7, r0, #0
	beq	.L72
.L73:
	mov	r2, #2
	add	r1, sp, #20
	add	r0, sp, #4
	blx	r9
	ldr	r3, [r4, #20]
	cmp	r3, #0
	blt	.L78
.L72:
	movw	r3, #:lower16:finish_wait
	add	r1, sp, #20
	movt	r3, #:upper16:finish_wait
	add	r0, sp, #4
	blx	r3
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bge	.L71
	mov	r0, r4
	bl	s3c_adc_stop
	ldr	r2, [r5]
	movw	r1, #:lower16:.LC3
	movw	r5, #:lower16:dev_warn
	mov	r3, r4
	movt	r1, #:upper16:.LC3
	movt	r5, #:upper16:dev_warn
	ldr	r0, [r2]
	ldr	r2, .L79
	add	r0, r0, #8
	blx	r5
	ldr	r3, [r4, #40]
	add	r3, r3, #1
	cmp	r3, #10
	str	r3, [r4, #40]
	mvnle	r0, #109
	ble	.L69
	.syntax divided
@ 250 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-samsung/adc.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-samsung/adc.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 250, 0
.popsection
@ 0 "" 2
	.arm
	.syntax unified
.L80:
	.align	2
.L79:
	.word	.LANCHOR2+32
	.fnend
	.size	s3c_adc_read, .-s3c_adc_read
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_adc_irq, %function
s3c_adc_irq:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r6, r1
	ldr	r2, [r6], #24
	movw	r3, #:lower16:_raw_spin_lock
	.pad #8
	sub	sp, sp, #8
	movt	r3, #:upper16:_raw_spin_lock
	ldr	r4, [r1, #12]
	mov	r5, r1
	ldr	r2, [r2, #352]
	mov	r0, r6
	ldr	r7, [r2, #20]
	blx	r3
	cmp	r4, #0
	beq	.L82
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L83
.L82:
	ldr	r0, [r5]
	movw	r1, #:lower16:.LC4
	movw	r3, #:lower16:dev_warn
	movt	r1, #:upper16:.LC4
	movt	r3, #:upper16:dev_warn
	ldr	r2, .L120
	add	r0, r0, #8
	blx	r3
.L84:
	cmp	r7, #0
	beq	.L93
	.syntax divided
@ 373 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-samsung/adc.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L94
	blx	r3
.L94:
	ldr	r3, [r5, #20]
	mov	r2, #0
	str	r2, [r3, #24]
.L93:
	movw	r3, #:lower16:_raw_spin_unlock
	mov	r0, r6
	movt	r3, #:upper16:_raw_spin_unlock
	blx	r3
	mov	r0, #1
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L83:
	ldr	r3, [r5, #20]
	ldr	r1, [r3, #12]
	.syntax divided
@ 333 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-samsung/adc.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r7, #3
	beq	.L85
	ldr	r3, [r5, #20]
	ldr	r3, [r3, #16]
	.syntax divided
@ 335 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-samsung/adc.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r2, [r4, #16]
	cmp	r2, #0
	bne	.L95
	cmp	r7, #0
	bne	.L87
.L118:
	ubfx	r1, r1, #0, #10
	ubfx	r2, r3, #0, #10
.L88:
	ldr	r8, [r4, #32]
	cmp	r8, #0
	beq	.L89
	add	r3, r4, #16
	mov	r0, r4
	blx	r8
.L89:
	ldr	r8, [r4, #16]
	ldr	r3, [r4, #28]
	cmp	r8, #0
	beq	.L90
	mov	r0, r4
	mov	r1, #1
	blx	r3
	ldr	r3, [r5, #20]
	ldr	r4, [r3]
	.syntax divided
@ 88 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-samsung/adc.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	orr	r4, r4, #1
	.syntax divided
@ 91 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-samsung/adc.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L91
	blx	r3
.L91:
	ldr	r3, [r5, #20]
	str	r4, [r3]
	b	.L84
.L85:
	ldr	r2, [r4, #16]
	cmp	r2, #0
	beq	.L96
	mov	r3, #0
.L95:
	cmp	r7, #0
	sub	r2, r2, #1
	str	r2, [r4, #16]
	beq	.L118
.L87:
	ubfx	r2, r3, #0, #12
.L96:
	ubfx	r1, r1, #0, #12
	b	.L88
.L90:
	mov	r1, r8
	mov	r0, r4
	blx	r3
	.syntax divided
@ 37 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cmpxchg.h" 1
	dmb
@ 0 "" 2
	.arm
	.syntax unified
	add	r3, r4, #36
	.syntax divided
@ 52 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cmpxchg.h" 1
	@	__xchg4
1:	ldrex	r2, [r3]
	strex	r1, r8, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
@ 98 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cmpxchg.h" 1
	dmb
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r2, #0
	beq	.L119
.L92:
	mov	r3, #0
	mov	r0, r5
	str	r3, [r5, #12]
	bl	s3c_adc_try
	b	.L84
.L119:
	movw	r2, #:lower16:.LC2
	movw	r0, #:lower16:.LC1
	movw	r8, #:lower16:warn_slowpath_fmt
	str	r4, [sp]
	movt	r2, #:upper16:.LC2
	movt	r0, #:upper16:.LC1
	movt	r8, #:upper16:warn_slowpath_fmt
	ldr	r3, .L120
	movw	r1, #363
	blx	r8
	b	.L92
.L121:
	.align	2
.L120:
	.word	.LANCHOR2+48
	.fnend
	.size	s3c_adc_irq, .-s3c_adc_irq
	.align	2
	.global	s3c_adc_register
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_adc_register, %function
s3c_adc_register:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	subs	r5, r0, #0
	beq	.L132
	mov	r4, r1
	movw	r1, #:lower16:kmalloc_caches
	movt	r1, #:upper16:kmalloc_caches
	mov	r6, r2
	ldr	r0, [r1, #24]
	movw	r2, #:lower16:s3c_adc_default_select
	cmp	r4, #0
	movt	r2, #:upper16:s3c_adc_default_select
	moveq	r4, r2
	mov	r7, r3
	cmp	r0, #0
	beq	.L133
	movw	r3, #:lower16:kmem_cache_alloc_trace
	mov	r2, #44
	movt	r3, #:upper16:kmem_cache_alloc_trace
	movw	r1, #32976
	blx	r3
	cmp	r0, #0
	beq	.L134
.L125:
	str	r5, [r0]
	strb	r7, [r0, #24]
	str	r4, [r0, #28]
	str	r6, [r0, #32]
	pop	{r4, r5, r6, r7, r8, pc}
.L133:
	mov	r0, #16
	b	.L125
.L132:
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:warn_slowpath_null
	movt	r0, #:upper16:.LC1
	movt	r3, #:upper16:warn_slowpath_null
	movw	r1, #289
	blx	r3
	mvn	r0, #21
	pop	{r4, r5, r6, r7, r8, pc}
.L134:
	movw	r1, #:lower16:.LC5
	movw	r3, #:lower16:dev_err
	add	r0, r5, #8
	movt	r1, #:upper16:.LC5
	movt	r3, #:upper16:dev_err
	blx	r3
	mvn	r0, #11
	pop	{r4, r5, r6, r7, r8, pc}
	.fnend
	.size	s3c_adc_register, .-s3c_adc_register
	.align	2
	.global	s3c_adc_release
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_adc_release, %function
s3c_adc_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	bl	s3c_adc_stop
	movw	r3, #:lower16:kfree
	mov	r0, r4
	movt	r3, #:upper16:kfree
	pop	{r4, lr}
	bx	r3	@ indirect register sibling call
	.fnend
	.size	s3c_adc_release, .-s3c_adc_release
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_adc_resume, %function
s3c_adc_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:dev_get_drvdata
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r3, #:upper16:dev_get_drvdata
	mov	r5, r0
	add	r0, r0, #8
	blx	r3
	ldr	r2, [r5, #352]
	movw	r3, #:lower16:clk_enable
	mov	r4, r0
	movt	r3, #:upper16:clk_enable
	ldr	r0, [r0, #8]
	ldr	r5, [r2, #20]
	blx	r3
	movw	r3, #:lower16:enable_irq
	ldr	r0, [r4, #36]
	movt	r3, #:upper16:enable_irq
	blx	r3
	cmp	r5, #0
	ldr	r5, [r4, #32]
	orreq	r5, r5, #16384
	orrne	r5, r5, #81920
	.syntax divided
@ 521 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-samsung/adc.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L140
	blx	r3
.L140:
	ldr	r3, [r4, #20]
	mov	r0, #0
	str	r5, [r3]
	pop	{r4, r5, r6, pc}
	.fnend
	.size	s3c_adc_resume, .-s3c_adc_resume
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_adc_suspend, %function
s3c_adc_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:dev_get_drvdata
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movt	r3, #:upper16:dev_get_drvdata
	add	r0, r0, #8
	blx	r3
	movw	r3, #:lower16:_raw_spin_lock_irqsave
	add	r6, r0, #24
	mov	r4, r0
	movt	r3, #:upper16:_raw_spin_lock_irqsave
	mov	r0, r6
	blx	r3
	ldr	r3, [r4, #20]
	mov	r7, r0
	ldr	r5, [r3]
	.syntax divided
@ 490 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-samsung/adc.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	orr	r5, r5, #4
	.syntax divided
@ 492 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-samsung/adc.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L146
	blx	r3
.L146:
	ldr	r2, [r4, #20]
	movw	r3, #:lower16:disable_irq
	movt	r3, #:upper16:disable_irq
	str	r5, [r2]
	ldr	r0, [r4, #36]
	blx	r3
	movw	r3, #:lower16:_raw_spin_unlock_irqrestore
	mov	r1, r7
	mov	r0, r6
	movt	r3, #:upper16:_raw_spin_unlock_irqrestore
	blx	r3
	movw	r3, #:lower16:clk_disable
	ldr	r0, [r4, #8]
	movt	r3, #:upper16:clk_disable
	blx	r3
	mov	r0, #0
	pop	{r4, r5, r6, r7, r8, pc}
	.fnend
	.size	s3c_adc_suspend, .-s3c_adc_suspend
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_adc_remove, %function
s3c_adc_remove:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:dev_get_drvdata
	push	{r4, lr}
	.save {r4, lr}
	movt	r3, #:upper16:dev_get_drvdata
	add	r0, r0, #8
	blx	r3
	movw	r3, #:lower16:__arm_iounmap
	mov	r4, r0
	movt	r3, #:upper16:__arm_iounmap
	ldr	r0, [r0, #20]
	blx	r3
	movw	r3, #:lower16:free_irq
	mov	r1, r4
	ldr	r0, [r4, #36]
	movt	r3, #:upper16:free_irq
	blx	r3
	movw	r3, #:lower16:clk_disable
	ldr	r0, [r4, #8]
	movt	r3, #:upper16:clk_disable
	blx	r3
	movw	r3, #:lower16:clk_put
	ldr	r0, [r4, #8]
	movt	r3, #:upper16:clk_put
	blx	r3
	movw	r3, #:lower16:kfree
	mov	r0, r4
	movt	r3, #:upper16:kfree
	blx	r3
	mov	r0, #0
	pop	{r4, pc}
	.fnend
	.size	s3c_adc_remove, .-s3c_adc_remove
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_adc_probe, %function
s3c_adc_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:kmalloc_caches
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movt	r3, #:upper16:kmalloc_caches
	mov	r5, r0
	.pad #8
	sub	sp, sp, #8
	add	r7, r5, #8
	ldr	r2, [r0, #352]
	ldr	r0, [r3, #24]
	ldr	r8, [r2, #20]
	cmp	r0, #0
	beq	.L167
	movw	r3, #:lower16:kmem_cache_alloc_trace
	mov	r2, #40
	movt	r3, #:upper16:kmem_cache_alloc_trace
	movw	r1, #32976
	blx	r3
	subs	r4, r0, #0
	bne	.L154
	movw	r1, #:lower16:.LC6
	movw	r3, #:lower16:dev_err
	mov	r0, r7
	movt	r1, #:upper16:.LC6
	movt	r3, #:upper16:dev_err
	mvn	r5, #11
	blx	r3
	mov	r0, r5
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L167:
	mov	r4, #16
.L154:
	mov	r6, #0
	mov	ip, #3136
	movw	r1, #:lower16:.LC7
	movw	r3, #:lower16:clk_get
	str	r6, [r4, #24]
	movt	r1, #:upper16:.LC7
	str	r6, [r4, #28]
	mov	r0, r6
	str	r5, [r4]
	movt	r3, #:upper16:clk_get
	str	ip, [r4, #32]
	blx	r3
	cmn	r0, #4096
	str	r0, [r4, #8]
	bhi	.L172
	movw	r3, #:lower16:platform_get_resource
	mov	r2, r6
	movt	r3, #:upper16:platform_get_resource
	mov	r1, #512
	mov	r0, r5
	blx	r3
	cmp	r0, #0
	beq	.L173
	ldr	r1, [r0, #4]
	movw	r3, #:lower16:__arm_ioremap
	ldr	r0, [r0]
	mov	r2, r6
	movt	r3, #:upper16:__arm_ioremap
	add	r1, r1, #1
	sub	r1, r1, r0
	blx	r3
	cmp	r0, #0
	str	r0, [r4, #20]
	beq	.L174
	movw	r3, #:lower16:clk_enable
	ldr	r0, [r4, #8]
	movt	r3, #:upper16:clk_enable
	blx	r3
	ldr	r6, [r4, #32]
	cmp	r8, #0
	orreq	r6, r6, #16384
	orrne	r6, r6, #81920
	orr	r6, r6, #4
	.syntax divided
@ 438 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-samsung/adc.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L163
	blx	r3
.L163:
	ldr	r2, [r4, #20]
	movw	r3, #:lower16:platform_get_irq
	movt	r3, #:upper16:platform_get_irq
	mov	r1, #1
	mov	r0, r5
	str	r6, [r2]
	blx	r3
	cmp	r0, #0
	str	r0, [r4, #36]
	ble	.L175
	ldr	r2, [r5, #52]
	mov	r3, #0
	movw	r1, #:lower16:s3c_adc_irq
	movt	r1, #:upper16:s3c_adc_irq
	cmp	r2, #0
	ldreq	r2, [r5, #16]
	movw	r5, #:lower16:request_threaded_irq
	movt	r5, #:upper16:request_threaded_irq
	stm	sp, {r2, r4}
	mov	r2, r3
	blx	r5
	subs	r5, r0, #0
	blt	.L176
	movw	r1, #:lower16:.LC13
	movw	r3, #:lower16:_dev_info
	movt	r1, #:upper16:.LC13
	movt	r3, #:upper16:_dev_info
	mov	r0, r7
	mov	r5, #0
	blx	r3
	movw	r3, #:lower16:dev_set_drvdata
	mov	r1, r4
	mov	r0, r7
	movt	r3, #:upper16:dev_set_drvdata
	blx	r3
	movw	r3, #:lower16:.LANCHOR1
	mov	r0, r5
	movt	r3, #:upper16:.LANCHOR1
	str	r4, [r3]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L172:
	movw	r1, #:lower16:.LC8
	movw	r3, #:lower16:dev_err
	mov	r0, r7
	movt	r1, #:upper16:.LC8
	movt	r3, #:upper16:dev_err
	blx	r3
	ldr	r5, [r4, #8]
.L157:
	movw	r3, #:lower16:kfree
	mov	r0, r4
	movt	r3, #:upper16:kfree
	blx	r3
	mov	r0, r5
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L173:
	movw	r1, #:lower16:.LC9
	movw	r3, #:lower16:dev_err
	mov	r0, r7
	movt	r1, #:upper16:.LC9
	movt	r3, #:upper16:dev_err
	mvn	r5, #5
	blx	r3
.L159:
	movw	r3, #:lower16:clk_put
	ldr	r0, [r4, #8]
	movt	r3, #:upper16:clk_put
	blx	r3
	b	.L157
.L174:
	movw	r1, #:lower16:.LC10
	movw	r3, #:lower16:dev_err
	mov	r0, r7
	movt	r1, #:upper16:.LC10
	movt	r3, #:upper16:dev_err
	mvn	r5, #5
	blx	r3
	b	.L159
.L175:
	movw	r1, #:lower16:.LC11
	movw	r3, #:lower16:dev_err
	mov	r0, r7
	movt	r1, #:upper16:.LC11
	movt	r3, #:upper16:dev_err
	mvn	r5, #1
	blx	r3
	b	.L159
.L176:
	movw	r1, #:lower16:.LC12
	movw	r3, #:lower16:dev_err
	mov	r0, r7
	movt	r1, #:upper16:.LC12
	movt	r3, #:upper16:dev_err
	blx	r3
	b	.L159
	.fnend
	.size	s3c_adc_probe, .-s3c_adc_probe
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	adc_init, %function
adc_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:platform_driver_register
	push	{r4, lr}
	.save {r4, lr}
	ldr	r0, .L184
	movt	r3, #:upper16:platform_driver_register
	blx	r3
	subs	r4, r0, #0
	bne	.L183
.L177:
	mov	r0, r4
	pop	{r4, pc}
.L183:
	movw	r0, #:lower16:.LC14
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L184+4
	movt	r0, #:upper16:.LC14
	blx	r3
	b	.L177
.L185:
	.align	2
.L184:
	.word	.LANCHOR0+8
	.word	.LANCHOR2+60
	.fnend
	.size	adc_init, .-adc_init
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	__func__.17095, %object
	.size	__func__.17095, 14
__func__.17095:
	.ascii	"s3c_adc_start\000"
	.space	2
	.type	__func__.17123, %object
	.size	__func__.17123, 13
__func__.17123:
	.ascii	"s3c_adc_stop\000"
	.space	3
	.type	__func__.17140, %object
	.size	__func__.17140, 13
__func__.17140:
	.ascii	"s3c_adc_read\000"
	.space	3
	.type	__func__.17191, %object
	.size	__func__.17191, 12
__func__.17191:
	.ascii	"s3c_adc_irq\000"
	.type	__func__.17246, %object
	.size	__func__.17246, 9
__func__.17246:
	.ascii	"adc_init\000"
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	adc_pending, %object
	.size	adc_pending, 8
adc_pending:
	.word	adc_pending
	.word	adc_pending
	.type	s3c_adc_driver, %object
	.size	s3c_adc_driver, 80
s3c_adc_driver:
	.word	s3c_adc_probe
	.word	s3c_adc_remove
	.space	4
	.word	s3c_adc_suspend
	.word	s3c_adc_resume
	.word	.LC15
	.space	4
	.word	0
	.space	44
	.word	s3c_adc_driver_ids
	.type	s3c_adc_driver_ids, %object
	.size	s3c_adc_driver_ids, 120
s3c_adc_driver_ids:
	.ascii	"s3c24xx-adc\000"
	.space	8
	.word	0
	.ascii	"s3c64xx-adc\000"
	.space	8
	.word	1
	.ascii	"samsung-adc-v3\000"
	.space	5
	.word	2
	.ascii	"samsung-adc-v4\000"
	.space	5
	.word	3
	.space	24
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	adc_dev, %object
	.size	adc_dev, 4
adc_dev:
	.space	4
	.section	.initcall3.init,"aw",%progbits
	.align	2
	.type	__initcall_adc_init3, %object
	.size	__initcall_adc_init3, 4
__initcall_adc_init3:
	.word	adc_init
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%s: %p is already running\012\000"
	.space	1
.LC1:
	.ascii	"/media/system1/root/CM14/kernel/samsung/smdk4412/ar"
	.ascii	"ch/arm/plat-samsung/adc.c\000"
	.space	3
.LC2:
	.ascii	"%s: %p is already stopped\012\000"
	.space	1
.LC3:
	.ascii	"%s: %p is timed out\012\000"
	.space	3
.LC4:
	.ascii	"%s: no adc pending\012\000"
.LC5:
	.ascii	"no memory for adc client\012\000"
	.space	2
.LC6:
	.ascii	"failed to allocate adc_device\012\000"
	.space	1
.LC7:
	.ascii	"adc\000"
.LC8:
	.ascii	"failed to get adc clock\012\000"
	.space	3
.LC9:
	.ascii	"failed to find registers\012\000"
	.space	2
.LC10:
	.ascii	"failed to map registers\012\000"
	.space	3
.LC11:
	.ascii	"failed to get adc irq\012\000"
	.space	1
.LC12:
	.ascii	"failed to attach adc irq\012\000"
	.space	2
.LC13:
	.ascii	"attached adc driver\012\000"
	.space	3
.LC14:
	.ascii	"<3>%s: failed to add adc driver\012\000"
	.space	3
.LC15:
	.ascii	"s3c-adc\000"
	.section	___ksymtab_gpl+s3c_adc_read,"a",%progbits
	.align	2
	.type	__ksymtab_s3c_adc_read, %object
	.size	__ksymtab_s3c_adc_read, 8
__ksymtab_s3c_adc_read:
	.word	s3c_adc_read
	.word	__kstrtab_s3c_adc_read
	.section	___ksymtab_gpl+s3c_adc_register,"a",%progbits
	.align	2
	.type	__ksymtab_s3c_adc_register, %object
	.size	__ksymtab_s3c_adc_register, 8
__ksymtab_s3c_adc_register:
	.word	s3c_adc_register
	.word	__kstrtab_s3c_adc_register
	.section	___ksymtab_gpl+s3c_adc_release,"a",%progbits
	.align	2
	.type	__ksymtab_s3c_adc_release, %object
	.size	__ksymtab_s3c_adc_release, 8
__ksymtab_s3c_adc_release:
	.word	s3c_adc_release
	.word	__kstrtab_s3c_adc_release
	.section	___ksymtab_gpl+s3c_adc_start,"a",%progbits
	.align	2
	.type	__ksymtab_s3c_adc_start, %object
	.size	__ksymtab_s3c_adc_start, 8
__ksymtab_s3c_adc_start:
	.word	s3c_adc_start
	.word	__kstrtab_s3c_adc_start
	.section	__ksymtab_strings,"a",%progbits
	.type	__kstrtab_s3c_adc_release, %object
	.size	__kstrtab_s3c_adc_release, 16
__kstrtab_s3c_adc_release:
	.ascii	"s3c_adc_release\000"
	.type	__kstrtab_s3c_adc_register, %object
	.size	__kstrtab_s3c_adc_register, 17
__kstrtab_s3c_adc_register:
	.ascii	"s3c_adc_register\000"
	.type	__kstrtab_s3c_adc_read, %object
	.size	__kstrtab_s3c_adc_read, 13
__kstrtab_s3c_adc_read:
	.ascii	"s3c_adc_read\000"
	.type	__kstrtab_s3c_adc_start, %object
	.size	__kstrtab_s3c_adc_start, 14
__kstrtab_s3c_adc_start:
	.ascii	"s3c_adc_start\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
