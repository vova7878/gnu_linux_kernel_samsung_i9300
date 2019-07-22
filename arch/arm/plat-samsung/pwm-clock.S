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
	.file	"pwm-clock.c"
	.text
	.global	__aeabi_uidiv
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	clk_pwm_tdiv_round_rate, %function
clk_pwm_tdiv_round_rate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:clk_get_rate
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r3, #:upper16:clk_get_rate
	ldr	r0, [r0, #12]
	mov	r5, r1
	blx	r3
	movw	r3, #:lower16:__aeabi_uidiv
	mov	r1, r5
	movt	r3, #:upper16:__aeabi_uidiv
	mov	r4, r0
	blx	r3
	cmp	r0, #1
	bls	.L1
	cmp	r0, #2
	lsreq	r4, r4, #1
	beq	.L1
	cmp	r0, #4
	lsrls	r4, r4, #2
	bls	.L1
	cmp	r0, #8
	lsrls	r4, r4, #3
	lsrhi	r4, r4, #4
.L1:
	mov	r0, r4
	pop	{r4, r5, r6, pc}
	.fnend
	.size	clk_pwm_tdiv_round_rate, .-clk_pwm_tdiv_round_rate
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	clk_pwm_tdiv_get_rate, %function
clk_pwm_tdiv_get_rate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r2, #0
	ldr	r3, [r0, #24]
	movt	r2, 64560
	ldr	r1, [r2, #4]
	lsl	r3, r3, #2
	lsr	r1, r1, r3
	movw	r3, #:lower16:clk_get_rate
	movt	r3, #:upper16:clk_get_rate
	and	r1, r1, #15
	cmp	r1, #5
	ldreq	r4, [r0, #68]
	movne	r4, #1
	lslne	r4, r4, r1
	ldr	r0, [r0, #12]
	blx	r3
	movw	r3, #:lower16:__aeabi_uidiv
	mov	r1, r4
	movt	r3, #:upper16:__aeabi_uidiv
	blx	r3
	pop	{r4, pc}
	.fnend
	.size	clk_pwm_tdiv_get_rate, .-clk_pwm_tdiv_get_rate
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	clk_pwm_scaler_round_rate, %function
clk_pwm_scaler_round_rate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:clk_get_rate
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r3, #:upper16:clk_get_rate
	mov	r6, r1
	movw	r4, #:lower16:__aeabi_uidiv
	ldr	r0, [r0, #12]
	movt	r4, #:upper16:__aeabi_uidiv
	blx	r3
	mov	r1, r6
	mov	r5, r0
	blx	r4
	cmp	r0, #2
	movcs	r1, r0
	movcc	r1, #2
	cmp	r1, #256
	mov	r0, r5
	movcs	r1, #256
	blx	r4
	pop	{r4, r5, r6, pc}
	.fnend
	.size	clk_pwm_scaler_round_rate, .-clk_pwm_scaler_round_rate
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	clk_pwm_scaler_get_rate, %function
clk_pwm_scaler_get_rate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, lr}
	.save {r4, lr}
	movt	r3, 64560
	ldr	r2, .L18
	ldr	r4, [r3]
	movw	r3, #:lower16:clk_get_rate
	cmp	r0, r2
	movt	r3, #:upper16:clk_get_rate
	ldr	r0, [r0, #12]
	ubfxeq	r4, r4, #8, #8
	uxtbne	r4, r4
	blx	r3
	movw	r3, #:lower16:__aeabi_uidiv
	add	r1, r4, #1
	movt	r3, #:upper16:__aeabi_uidiv
	blx	r3
	pop	{r4, pc}
.L19:
	.align	2
.L18:
	.word	.LANCHOR0+68
	.fnend
	.size	clk_pwm_scaler_get_rate, .-clk_pwm_scaler_get_rate
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	clk_pwm_scaler_set_rate, %function
clk_pwm_scaler_set_rate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movw	r5, #:lower16:clk_get_rate
	mov	r6, r0
	mov	r8, r1
	movt	r5, #:upper16:clk_get_rate
	movw	r4, #:lower16:__aeabi_uidiv
	ldr	r0, [r0, #12]
	movt	r4, #:upper16:__aeabi_uidiv
	blx	r5
	mov	r1, r8
	mov	r7, r0
	blx	r4
	cmp	r0, #2
	movcs	r1, r0
	movcc	r1, #2
	cmp	r1, #256
	mov	r0, r7
	movcs	r1, #256
	blx	r4
	mov	r7, r0
	ldr	r0, [r6, #12]
	blx	r5
	mov	r1, r7
	blx	r4
	sub	r0, r0, #1
	.syntax divided
@ 17 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/irqflags.h" 1
		mrs	r2, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.arm
	.syntax unified
	mov	r3, #0
	ldr	r1, .L26
	movt	r3, 64560
	ldr	r3, [r3]
	cmp	r6, r1
	biceq	r3, r3, #65280
	bicne	r3, r3, #255
	orreq	r0, r3, r0, lsl #8
	orrne	r0, r0, r3
	mov	r3, #0
	movt	r3, 64560
	str	r0, [r3]
	.syntax divided
@ 142 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r2	@ local_irq_restore
@ 0 "" 2
	.arm
	.syntax unified
	mov	r0, #0
	pop	{r4, r5, r6, r7, r8, pc}
.L27:
	.align	2
.L26:
	.word	.LANCHOR0+68
	.fnend
	.size	clk_pwm_scaler_set_rate, .-clk_pwm_scaler_set_rate
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	clk_pwm_tdiv_bits, %function
clk_pwm_tdiv_bits:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #68]
	.syntax divided
@ 268 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/bitops.h" 1
	clz	r0, r0
@ 0 "" 2
	.arm
	.syntax unified
	rsb	r0, r0, #31
	bx	lr
	.fnend
	.size	clk_pwm_tdiv_bits, .-clk_pwm_tdiv_bits
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	clk_pwm_tdiv_set_rate, %function
clk_pwm_tdiv_set_rate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movw	r3, #:lower16:clk_get_rate
	mov	r6, #0
	mov	r4, r0
	movt	r3, #:upper16:clk_get_rate
	movt	r6, 64560
	ldr	r0, [r0, #12]
	mov	r8, r1
	ldr	r5, [r6, #4]
	blx	r3
	ldr	r2, [r4, #24]
	movw	r3, #:lower16:clk_round_rate
	mov	r7, r0
	mov	r1, r8
	movt	r3, #:upper16:clk_round_rate
	mov	r0, r4
	lsl	r2, r2, #2
	lsr	r5, r5, r2
	blx	r3
	movw	r3, #:lower16:__aeabi_uidiv
	mov	r1, r0
	movt	r3, #:upper16:__aeabi_uidiv
	mov	r0, r7
	blx	r3
	cmp	r0, #16
	bhi	.L32
	and	r5, r5, #15
	str	r0, [r4, #68]
	cmp	r5, #5
	beq	.L33
	mov	r0, r4
	ldr	r3, [r6, #4]
	bl	clk_pwm_tdiv_bits
	ldr	r3, [r4, #24]
	mov	ip, r0
	lsl	r2, r3, #2
	.syntax divided
@ 17 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/irqflags.h" 1
		mrs	r1, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r3, [r6, #4]
	mov	lr, #15
	ands	r0, r1, #128
	bic	r3, r3, lr, lsl r2
	orr	r3, r3, ip, lsl r2
	str	r3, [r6, #4]
	bne	.L35
	.syntax divided
@ 142 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r1	@ local_irq_restore
@ 0 "" 2
	.arm
	.syntax unified
	pop	{r4, r5, r6, r7, r8, pc}
.L35:
	.syntax divided
@ 142 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r1	@ local_irq_restore
@ 0 "" 2
	.arm
	.syntax unified
	mov	r0, #0
	pop	{r4, r5, r6, r7, r8, pc}
.L33:
	mov	r0, #0
	pop	{r4, r5, r6, r7, r8, pc}
.L32:
	mvn	r0, #21
	pop	{r4, r5, r6, r7, r8, pc}
	.fnend
	.size	clk_pwm_tdiv_set_rate, .-clk_pwm_tdiv_set_rate
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	clk_pwm_tin_set_parent, %function
clk_pwm_tin_set_parent:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	ldr	r2, [r0, #24]
	ldr	r3, .L46
	cmp	r2, #1
	lsl	r5, r2, #2
	sub	r0, r3, #68
	movhi	r0, r3
	cmp	r1, r0
	moveq	r3, #5
	lsleq	ip, r3, r5
	beq	.L39
	add	r2, r2, r2, lsl #3
	add	r3, r3, #68
	add	r3, r3, r2, lsl #3
	cmp	r1, r3
	bne	.L43
	mov	r0, r1
	bl	clk_pwm_tdiv_bits
	lsl	ip, r0, r5
.L39:
	str	r1, [r4, #12]
	.syntax divided
@ 17 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/irqflags.h" 1
		mrs	r1, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.arm
	.syntax unified
	mov	r2, #0
	mov	lr, #15
	movt	r2, 64560
	ands	r0, r1, #128
	ldr	r3, [r2, #4]
	bic	r3, r3, lr, lsl r5
	orr	r3, r3, ip
	str	r3, [r2, #4]
	bne	.L45
	.syntax divided
@ 142 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r1	@ local_irq_restore
@ 0 "" 2
	.arm
	.syntax unified
	pop	{r4, r5, r6, pc}
.L45:
	.syntax divided
@ 142 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r1	@ local_irq_restore
@ 0 "" 2
	.arm
	.syntax unified
	mov	r0, #0
	pop	{r4, r5, r6, pc}
.L43:
	mvn	r0, #21
	pop	{r4, r5, r6, pc}
.L47:
	.align	2
.L46:
	.word	.LANCHOR0+204
	.fnend
	.size	clk_pwm_tin_set_parent, .-clk_pwm_tin_set_parent
	.align	2
	.global	s3c_pwmclk_init
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_pwmclk_init, %function
s3c_pwmclk_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r1, #:lower16:.LC0
	movw	r3, #:lower16:clk_get
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movt	r1, #:upper16:.LC0
	.pad #4
	sub	sp, sp, #4
	movt	r3, #:upper16:clk_get
	mov	r0, #0
	blx	r3
	cmn	r0, #4096
	bhi	.L49
	movw	r6, #:lower16:.LANCHOR0
	mov	r3, r0
	movt	r6, #:upper16:.LANCHOR0
	movw	r8, #:lower16:s3c_register_clocks
	movt	r8, #:upper16:s3c_register_clocks
	mov	r0, r6
	str	r3, [r6, #12]
	mov	r1, #2
	str	r3, [r6, #80]
	add	r7, r6, #272
	blx	r8
	movw	r4, #:lower16:s3c24xx_register_clock
	add	r0, r6, #136
	mov	r5, #0
	mov	r1, #2
	blx	r8
	movt	r4, #:upper16:s3c24xx_register_clock
	mov	r9, r7
	movt	r5, 64560
	mov	r8, #0
	mov	r6, #1
.L50:
	ldr	r2, [r5, #4]
	lsl	r3, r8, #2
	mov	r0, r9
	str	r8, [r9, #24]
	add	r9, r9, #72
	lsr	r3, r2, r3
	and	r3, r3, #15
	lsl	r3, r6, r3
	str	r3, [r9, #-4]
	blx	r4
	cmp	r0, #0
	blt	.L62
	add	r8, r8, #1
	cmp	r8, #5
	bne	.L50
	ldr	r5, .L63
	mov	r8, #0
	movt	r8, 64560
	mov	fp, #0
	sub	r10, r5, #428
.L56:
	ldr	r9, [r5, #24]
	mov	r0, r5
	ldr	r6, [r8, #4]
	blx	r4
	cmp	r0, #0
	lsl	r2, r9, #2
	add	r1, r9, r9, lsl #3
	blt	.L55
	lsr	r6, r6, r2
	add	r1, r7, r1, lsl #3
	and	r6, r6, #15
	cmp	r6, #5
	bne	.L54
	cmp	r9, #1
	ldr	r1, .L63+4
	movhi	r1, r10
.L54:
	movw	r3, #:lower16:clk_set_parent
	mov	r0, r5
	movt	r3, #:upper16:clk_set_parent
	add	r5, r5, #68
	blx	r3
	cmp	r0, #0
	blt	.L55
	add	fp, fp, #1
	cmp	fp, #5
	bne	.L56
	add	sp, sp, #4
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L55:
	movw	r0, #:lower16:.LC3
	movw	r3, #:lower16:printk
	mov	r1, fp
	movt	r0, #:upper16:.LC3
.L61:
	movt	r3, #:upper16:printk
	add	sp, sp, #4
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	r3
.L49:
	movw	r1, #:lower16:.LANCHOR1
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR1
	movt	r0, #:upper16:.LC1
	movt	r3, #:upper16:printk
	add	sp, sp, #4
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	r3
.L62:
	movw	r0, #:lower16:.LC2
	movw	r3, #:lower16:printk
	mov	r1, r8
	movt	r0, #:upper16:.LC2
	b	.L61
.L64:
	.align	2
.L63:
	.word	.LANCHOR0+632
	.word	.LANCHOR0+136
	.fnend
	.size	s3c_pwmclk_init, .-s3c_pwmclk_init
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.12366, %object
	.size	__func__.12366, 16
__func__.12366:
	.ascii	"s3c_pwmclk_init\000"
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	clk_timer_scaler, %object
	.size	clk_timer_scaler, 136
clk_timer_scaler:
	.space	16
	.word	.LC8
	.space	4
	.word	-1
	.space	12
	.word	clk_pwm_scaler_ops
	.space	24
	.space	16
	.word	.LC9
	.space	4
	.word	-1
	.space	12
	.word	clk_pwm_scaler_ops
	.space	24
	.type	clk_timer_tclk, %object
	.size	clk_timer_tclk, 136
clk_timer_tclk:
	.space	16
	.word	.LC6
	.space	4
	.word	-1
	.space	40
	.space	16
	.word	.LC7
	.space	4
	.word	-1
	.space	40
	.type	clk_timer_tdiv, %object
	.size	clk_timer_tdiv, 360
clk_timer_tdiv:
	.space	12
	.word	clk_timer_scaler
	.word	.LC5
	.space	20
	.word	clk_tdiv_ops
	.space	24
	.space	4
	.space	12
	.word	clk_timer_scaler
	.word	.LC5
	.space	20
	.word	clk_tdiv_ops
	.space	24
	.space	4
	.space	12
	.word	clk_timer_scaler+68
	.word	.LC5
	.space	20
	.word	clk_tdiv_ops
	.space	24
	.space	4
	.space	12
	.word	clk_timer_scaler+68
	.word	.LC5
	.space	20
	.word	clk_tdiv_ops
	.space	24
	.space	4
	.space	12
	.word	clk_timer_scaler+68
	.word	.LC5
	.space	20
	.word	clk_tdiv_ops
	.space	24
	.space	4
	.type	clk_tin, %object
	.size	clk_tin, 340
clk_tin:
	.space	16
	.word	.LC4
	.space	4
	.word	0
	.space	12
	.word	clk_tin_ops
	.space	24
	.space	16
	.word	.LC4
	.space	4
	.word	1
	.space	12
	.word	clk_tin_ops
	.space	24
	.space	16
	.word	.LC4
	.space	4
	.word	2
	.space	12
	.word	clk_tin_ops
	.space	24
	.space	16
	.word	.LC4
	.space	4
	.word	3
	.space	12
	.word	clk_tin_ops
	.space	24
	.space	16
	.word	.LC4
	.space	4
	.word	4
	.space	12
	.word	clk_tin_ops
	.space	24
	.type	clk_tin_ops, %object
	.size	clk_tin_ops, 16
clk_tin_ops:
	.space	12
	.word	clk_pwm_tin_set_parent
	.type	clk_tdiv_ops, %object
	.size	clk_tdiv_ops, 16
clk_tdiv_ops:
	.word	clk_pwm_tdiv_set_rate
	.word	clk_pwm_tdiv_get_rate
	.word	clk_pwm_tdiv_round_rate
	.space	4
	.type	clk_pwm_scaler_ops, %object
	.size	clk_pwm_scaler_ops, 16
clk_pwm_scaler_ops:
	.word	clk_pwm_scaler_set_rate
	.word	clk_pwm_scaler_get_rate
	.word	clk_pwm_scaler_round_rate
	.space	4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"timers\000"
	.space	1
.LC1:
	.ascii	"<3>%s: no parent clock\012\000"
.LC2:
	.ascii	"<3>error adding pwm%d tdiv clock\012\000"
	.space	2
.LC3:
	.ascii	"<3>error adding pwm%d tin clock\012\000"
	.space	3
.LC4:
	.ascii	"pwm-tin\000"
.LC5:
	.ascii	"pwm-tdiv\000"
	.space	3
.LC6:
	.ascii	"pwm-tclk0\000"
	.space	2
.LC7:
	.ascii	"pwm-tclk1\000"
	.space	2
.LC8:
	.ascii	"pwm-scaler0\000"
.LC9:
	.ascii	"pwm-scaler1\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
