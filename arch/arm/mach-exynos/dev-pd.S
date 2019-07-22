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
	.file	"dev-pd.c"
	.text
	.align	2
	.global	exynos_pd_init
	.type	exynos_pd_init, %function
exynos_pd_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	exynos_pd_init, .-exynos_pd_init
	.align	2
	.global	exynos_pd_enable
	.type	exynos_pd_enable, %function
exynos_pd_enable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r7, r0
	ldr	r9, [r0, #84]
	ldr	r6, [r9, #24]
	ldr	r3, [r6]
	cmp	r3, #0
	mvnne	r2, #0
	ldrne	r8, [r3]
	moveq	r8, r3
	strne	r2, [r3]
	ldr	r3, [r9, #20]
	mov	r2, #7
	str	r2, [r3]
	ldr	r3, [r9, #20]
	ldr	r3, [r3, #4]
	and	r3, r3, r2
	cmp	r3, r2
	movwne	r5, #:lower16:__const_udelay
	movne	r4, #1000
	movtne	r5, #:upper16:__const_udelay
	bne	.L8
	b	.L12
.L11:
	subs	r4, r4, #1
	beq	.L16
.L8:
	movw	r0, #59978
	movt	r0, 4
	blx	r5
	ldr	r3, [r9, #20]
	ldr	r3, [r3, #4]
	and	r3, r3, #7
	cmp	r3, #7
	bne	.L11
.L12:
	ldr	r3, [r6, #8]
	ldr	r0, [r6]
	cmp	r3, #0
	ldrne	r3, [r3]
	cmp	r0, #0
	strne	r8, [r0]
	movne	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L16:
	ldr	r1, [r7, #44]
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC0
	movt	r3, #:upper16:printk
	cmp	r1, #0
	ldreq	r1, [r7, #8]
	blx	r3
	mvn	r0, #109
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
	.fnend
	.size	exynos_pd_enable, .-exynos_pd_enable
	.align	2
	.global	exynos_pd_disable
	.type	exynos_pd_disable, %function
exynos_pd_disable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	ldr	r5, [r0, #84]
	mov	r8, r0
	ldr	r3, [r4]
	ldr	r7, [r5, #24]
	cmp	r3, #0
	beq	.L18
	ldr	r3, [r0, #-4]
	cmp	r3, #2
	cmpne	r3, #11
	beq	.L35
.L18:
	ldr	r3, [r7, #4]
	mov	r2, #0
	cmp	r3, #0
	ldrne	r9, [r3]
	moveq	r9, r3
	ldr	r3, [r5, #20]
	str	r2, [r3]
	ldr	r3, [r5, #20]
	ldr	r3, [r3, #4]
	tst	r3, #7
	movwne	r6, #:lower16:__const_udelay
	movne	r4, #1000
	movtne	r6, #:upper16:__const_udelay
	bne	.L24
	b	.L27
.L26:
	subs	r4, r4, #1
	beq	.L36
.L24:
	movw	r0, #59978
	movt	r0, 4
	blx	r6
	ldr	r3, [r5, #20]
	ldr	r3, [r3, #4]
	tst	r3, #7
	bne	.L26
.L27:
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L37
	mov	r0, #0
	str	r9, [r3]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L36:
	ldr	r1, [r8, #44]
	movw	r0, #:lower16:.LC2
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC2
	movt	r3, #:upper16:printk
	cmp	r1, #0
	ldreq	r1, [r8, #8]
	blx	r3
	mvn	r0, #109
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L37:
	mov	r0, r3
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L35:
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC1
	blx	r3
	ldr	r3, [r4]
	mov	r0, #0
	sub	r3, r3, #1
	str	r3, [r4]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
	.fnend
	.size	exynos_pd_disable, .-exynos_pd_disable
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	boot_lcd0.13278, %object
	.size	boot_lcd0.13278, 4
boot_lcd0.13278:
	.word	1
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>Power domain %s enable failed.\012\000"
	.space	1
.LC1:
	.ascii	"<6>lcd0 disable skip only one time\000"
	.space	1
.LC2:
	.ascii	"<3>Power domain %s disable failed.\012\000"
	.ident	"GCC: (GNU) 4.8"
