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
	.file	"irq-pm.c"
	.text
	.align	2
	.global	s3c_irq_wake
	.type	s3c_irq_wake, %function
s3c_irq_wake:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0]
	sub	r2, r3, #108
	cmp	r2, #1
	bhi	.L5
	cmp	r1, #0
	sub	r3, r3, #107
	mov	r2, #1
	mov	r3, r2, asl r3
	beq	.L7
	movw	r2, #:lower16:s3c_irqwake_intmask
	mov	r0, #0
	movt	r2, #:upper16:s3c_irqwake_intmask
	ldr	r1, [r2]
	bic	r3, r1, r3
	str	r3, [r2]
	bx	lr
.L7:
	movw	ip, #:lower16:s3c_irqwake_intmask
	mov	r0, r1
	movt	ip, #:upper16:s3c_irqwake_intmask
	ldr	r2, [ip]
	orr	r3, r3, r2
	str	r3, [ip]
	bx	lr
.L5:
	mvn	r0, #1
	bx	lr
	.fnend
	.size	s3c_irq_wake, .-s3c_irq_wake
	.align	2
	.global	s3c24xx_irq_suspend
	.type	s3c24xx_irq_suspend, %function
s3c24xx_irq_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:s3c_pm_do_save
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:s3c_pm_do_save
	mov	r1, #16
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	s3c24xx_irq_suspend, .-s3c24xx_irq_suspend
	.align	2
	.global	s3c24xx_irq_resume
	.type	s3c24xx_irq_resume, %function
s3c24xx_irq_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:s3c_pm_do_restore
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:s3c_pm_do_restore
	mov	r1, #16
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	s3c24xx_irq_resume, .-s3c24xx_irq_resume
	.global	s3c_irqwake_eintallow
	.global	s3c_irqwake_intallow
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	eint_save, %object
	.size	eint_save, 128
eint_save:
	.word	-31191552
	.space	4
	.word	-31191548
	.space	4
	.word	-31191544
	.space	4
	.word	-31191540
	.space	4
	.word	-31191424
	.space	4
	.word	-31191420
	.space	4
	.word	-31191416
	.space	4
	.word	-31191412
	.space	4
	.word	-31191408
	.space	4
	.word	-31191404
	.space	4
	.word	-31191400
	.space	4
	.word	-31191396
	.space	4
	.word	-31191296
	.space	4
	.word	-31191292
	.space	4
	.word	-31191288
	.space	4
	.word	-31191284
	.space	4
	.type	s3c_irqwake_eintallow, %object
	.size	s3c_irqwake_eintallow, 4
s3c_irqwake_eintallow:
	.word	-1
	.type	s3c_irqwake_intallow, %object
	.size	s3c_irqwake_intallow, 4
s3c_irqwake_intallow:
	.word	6
	.ident	"GCC: (GNU) 4.8"
