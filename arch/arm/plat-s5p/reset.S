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
	.file	"reset.c"
	.text
	.align	2
	.global	arch_reset
	.type	arch_reset, %function
arch_reset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:.LANCHOR0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r3, #:upper16:.LANCHOR0
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L2
	blx	r3
.L2:
	movw	r0, #:lower16:.LC0
	movw	r6, #:lower16:printk
	movt	r0, #:upper16:.LC0
	movt	r6, #:upper16:printk
	blx	r6
	mov	r2, #0
	movw	r3, #:lower16:s3c2410_wdtclk
	mov	r1, #0
	movt	r2, 64576
	movt	r3, #:upper16:s3c2410_wdtclk
	str	r1, [r2]
	ldr	r0, [r3]
	cmp	r0, r1
	beq	.L3
	movw	r3, #:lower16:clk_enable
	movt	r3, #:upper16:clk_enable
	blx	r3
.L3:
	movw	r5, #:lower16:__const_udelay
	mov	r3, #0
	movt	r5, #:upper16:__const_udelay
	mov	r4, #500
	movt	r3, 64576
	mov	r2, #128
	movw	r1, #8225
	str	r2, [r3, #8]
	str	r2, [r3, #4]
	str	r1, [r3]
.L5:
	movw	r0, #12560
	movt	r0, 4915
	blx	r5
	subs	r4, r4, #1
	bne	.L5
	movw	r0, #:lower16:.LC1
	mov	r4, #50
	movt	r0, #:upper16:.LC1
	blx	r6
.L7:
	movw	r0, #12560
	movt	r0, 4915
	blx	r5
	subs	r4, r4, #1
	bne	.L7
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	arch_reset, .-arch_reset
	.global	s5p_reset_hook
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"arch_reset: attempting watchdog reset\012\000"
	.space	1
.LC1:
	.ascii	"<3>Watchdog reset failed to assert reset\012\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	s5p_reset_hook, %object
	.size	s5p_reset_hook, 4
s5p_reset_hook:
	.space	4
	.ident	"GCC: (GNU) 4.8"
