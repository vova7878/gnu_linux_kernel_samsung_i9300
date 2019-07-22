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
	.file	"clock.c"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	clk_null_enable, %function
clk_null_enable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	clk_null_enable, .-clk_null_enable
	.align	2
	.global	clk_get_parent
	.syntax unified
	.arm
	.fpu softvfp
	.type	clk_get_parent, %function
clk_get_parent:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #12]
	bx	lr
	.fnend
	.size	clk_get_parent, .-clk_get_parent
	.align	2
	.global	clk_default_setrate
	.syntax unified
	.arm
	.fpu softvfp
	.type	clk_default_setrate, %function
clk_default_setrate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r1, [r0, #32]
	mov	r0, #0
	bx	lr
	.fnend
	.size	clk_default_setrate, .-clk_default_setrate
	.align	2
	.global	clk_enable
	.syntax unified
	.arm
	.fpu softvfp
	.type	clk_enable, %function
clk_enable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmn	r0, #4096
	movls	r3, #0
	movhi	r3, #1
	cmp	r0, #0
	moveq	r3, #1
	cmp	r3, #0
	bne	.L8
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	ldr	r0, [r0, #12]
	bl	clk_enable
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_spin_lock_irqsave
	movt	r3, #:upper16:_raw_spin_lock_irqsave
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	ldr	r3, [r4, #28]
	mov	r5, r0
	cmp	r3, #0
	add	r3, r3, #1
	str	r3, [r4, #28]
	bne	.L7
	ldr	r3, [r4, #44]
	mov	r0, r4
	mov	r1, #1
	blx	r3
.L7:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_spin_unlock_irqrestore
	mov	r1, r5
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_spin_unlock_irqrestore
	blx	r3
	mov	r0, #0
	pop	{r4, r5, r6, pc}
.L8:
	mvn	r0, #21
	bx	lr
	.fnend
	.size	clk_enable, .-clk_enable
	.align	2
	.global	clk_disable
	.syntax unified
	.arm
	.fpu softvfp
	.type	clk_disable, %function
clk_disable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmn	r0, #4096
	movls	r3, #0
	movhi	r3, #1
	cmp	r0, #0
	moveq	r3, #1
	cmp	r3, #0
	bxne	lr
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movw	r7, #:lower16:_raw_spin_lock_irqsave
	movw	r6, #:lower16:_raw_spin_unlock_irqrestore
	movw	r5, #:lower16:.LANCHOR0
	mov	r4, r0
	movt	r7, #:upper16:_raw_spin_lock_irqsave
	movt	r6, #:upper16:_raw_spin_unlock_irqrestore
	movt	r5, #:upper16:.LANCHOR0
.L16:
	mov	r0, r5
	blx	r7
	ldr	r3, [r4, #28]
	mov	r8, r0
	mov	r0, r4
	sub	r3, r3, #1
	cmp	r3, #0
	mov	r1, r3
	str	r3, [r4, #28]
	bne	.L15
	ldr	r3, [r4, #44]
	blx	r3
.L15:
	mov	r1, r8
	mov	r0, r5
	blx	r6
	ldr	r4, [r4, #12]
	cmn	r4, #4096
	movls	r3, #0
	movhi	r3, #1
	cmp	r4, #0
	moveq	r3, #1
	cmp	r3, #0
	beq	.L16
	pop	{r4, r5, r6, r7, r8, pc}
	.fnend
	.size	clk_disable, .-clk_disable
	.align	2
	.global	clk_get_rate
	.syntax unified
	.arm
	.fpu softvfp
	.type	clk_get_rate, %function
clk_get_rate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.L26:
	cmn	r0, #4096
	bhi	.L27
	ldr	r2, [r0, #32]
	cmp	r2, #0
	bne	.L23
	ldr	r3, [r0, #40]
	cmp	r3, #0
	beq	.L25
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L35
.L25:
	ldr	r0, [r0, #12]
	cmp	r0, #0
	bne	.L26
.L23:
	mov	r0, r2
	bx	lr
.L27:
	mov	r2, #0
	mov	r0, r2
	bx	lr
.L35:
	bx	r3
	.fnend
	.size	clk_get_rate, .-clk_get_rate
	.align	2
	.global	clk_round_rate
	.syntax unified
	.arm
	.fpu softvfp
	.type	clk_round_rate, %function
clk_round_rate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmn	r0, #4096
	mov	r2, r1
	bhi	.L37
	ldr	r3, [r0, #40]
	cmp	r3, #0
	beq	.L37
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L37
	bx	r3
.L37:
	mov	r0, r2
	bx	lr
	.fnend
	.size	clk_round_rate, .-clk_round_rate
	.align	2
	.global	clk_set_parent
	.syntax unified
	.arm
	.fpu softvfp
	.type	clk_set_parent, %function
clk_set_parent:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmn	r0, #4096
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	bhi	.L47
	mov	r4, r0
	movw	r3, #:lower16:_raw_spin_lock_irqsave
	movw	r0, #:lower16:.LANCHOR0
	movt	r3, #:upper16:_raw_spin_lock_irqsave
	movt	r0, #:upper16:.LANCHOR0
	mov	r5, r1
	blx	r3
	ldr	r3, [r4, #40]
	mov	r6, r0
	cmp	r3, #0
	beq	.L49
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L49
	mov	r0, r4
	mov	r1, r5
	blx	r3
	mov	r4, r0
.L46:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_spin_unlock_irqrestore
	mov	r1, r6
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_spin_unlock_irqrestore
	blx	r3
	mov	r0, r4
	pop	{r4, r5, r6, pc}
.L49:
	mov	r4, r3
	b	.L46
.L47:
	mvn	r4, #21
	mov	r0, r4
	pop	{r4, r5, r6, pc}
	.fnend
	.size	clk_set_parent, .-clk_set_parent
	.align	2
	.global	clk_set_rate
	.syntax unified
	.arm
	.fpu softvfp
	.type	clk_set_rate, %function
clk_set_rate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmn	r0, #4096
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	bhi	.L55
	ldr	r3, [r0, #40]
	mov	r5, r1
	mov	r4, r0
	cmp	r3, #0
	beq	.L68
.L54:
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L69
.L57:
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L55
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_spin_lock_irqsave
	movt	r3, #:upper16:_raw_spin_lock_irqsave
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	ldr	r3, [r4, #40]
	mov	r6, r0
	mov	r1, r5
	mov	r0, r4
	ldr	r3, [r3]
	blx	r3
	movw	r3, #:lower16:_raw_spin_unlock_irqrestore
	mov	r4, r0
	movw	r0, #:lower16:.LANCHOR0
	mov	r1, r6
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_spin_unlock_irqrestore
	blx	r3
	mov	r0, r4
	pop	{r4, r5, r6, pc}
.L69:
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:warn_slowpath_null
	movt	r3, #:upper16:warn_slowpath_null
	movt	r0, #:upper16:.LC0
	mov	r1, #156
	blx	r3
	ldr	r3, [r4, #40]
	cmp	r3, #0
	bne	.L57
.L55:
	mvn	r4, #21
	mov	r0, r4
	pop	{r4, r5, r6, pc}
.L68:
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:warn_slowpath_null
	movt	r3, #:upper16:warn_slowpath_null
	movt	r0, #:upper16:.LC0
	mov	r1, #155
	blx	r3
	ldr	r3, [r4, #40]
	cmp	r3, #0
	beq	.L55
	b	.L54
	.fnend
	.size	clk_set_rate, .-clk_set_rate
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_wdt_reset_init, %function
s3c_wdt_reset_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r1, #:lower16:.LC1
	movw	r3, #:lower16:clk_get
	movt	r3, #:upper16:clk_get
	push	{r4, lr}
	.save {r4, lr}
	movt	r1, #:upper16:.LC1
	mov	r0, #0
	blx	r3
	movw	r3, #:lower16:.LANCHOR0
	cmn	r0, #4096
	movt	r3, #:upper16:.LANCHOR0
	str	r0, [r3, #8]
	bhi	.L73
	mov	r0, #0
	pop	{r4, pc}
.L73:
	movw	r1, #:lower16:.LANCHOR1
	movw	r0, #:lower16:.LC2
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR1
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC2
	blx	r3
	mov	r0, #0
	pop	{r4, pc}
	.fnend
	.size	s3c_wdt_reset_init, .-s3c_wdt_reset_init
	.align	2
	.global	s3c24xx_register_clock
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c24xx_register_clock, %function
s3c24xx_register_clock:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	ldr	r3, [r0, #44]
	ldr	r1, [r0, #20]
	cmp	r3, #0
	ldr	r2, [r0, #16]
	movweq	r3, #:lower16:clk_null_enable
	movteq	r3, #:upper16:clk_null_enable
	streq	r3, [r0, #44]
	movw	r3, #:lower16:clkdev_add
	str	r1, [r4, #56]
	movt	r3, #:upper16:clkdev_add
	str	r2, [r4, #60]
	str	r0, [r4, #64]
	add	r0, r0, #48
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_spin_lock_irqsave
	movt	r3, #:upper16:_raw_spin_lock_irqsave
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	movw	r3, #:lower16:.LANCHOR2
	mov	r1, r0
	movt	r3, #:upper16:.LANCHOR2
	movw	r0, #:lower16:.LANCHOR0
	ldr	ip, [r3, #4]
	movw	r2, #:lower16:_raw_spin_unlock_irqrestore
	str	r4, [r3, #4]
	movt	r0, #:upper16:.LANCHOR0
	str	r3, [r4]
	movt	r2, #:upper16:_raw_spin_unlock_irqrestore
	str	ip, [r4, #4]
	str	r4, [ip]
	blx	r2
	mov	r0, #0
	pop	{r4, pc}
	.fnend
	.size	s3c24xx_register_clock, .-s3c24xx_register_clock
	.align	2
	.global	s3c24xx_register_clocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c24xx_register_clocks, %function
s3c24xx_register_clocks:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	subs	r4, r1, #0
	movle	r8, #0
	ble	.L77
	ldr	r9, .L85
	movw	r7, #:lower16:.LC3
	movw	r6, #:lower16:printk
	sub	r5, r0, #4
	movt	r7, #:upper16:.LC3
	movt	r6, #:upper16:printk
	mov	r8, #0
.L80:
	ldr	r0, [r5, #4]!
	bl	s3c24xx_register_clock
	cmp	r0, #0
	blt	.L84
.L79:
	subs	r4, r4, #1
	bne	.L80
.L77:
	mov	r0, r8
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L84:
	ldr	r2, [r5]
	mov	r1, r9
	mov	r0, r7
	add	r8, r8, #1
	ldr	r3, [r2, #16]
	blx	r6
	b	.L79
.L86:
	.align	2
.L85:
	.word	.LANCHOR1+20
	.fnend
	.size	s3c24xx_register_clocks, .-s3c24xx_register_clocks
	.align	2
	.global	s3c_register_clocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_register_clocks, %function
s3c_register_clocks:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	subs	r5, r1, #0
	pople	{r4, r5, r6, r7, r8, pc}
	movw	r7, #:lower16:.LC4
	movw	r6, #:lower16:printk
	mov	r4, r0
	movt	r7, #:upper16:.LC4
	movt	r6, #:upper16:printk
	b	.L90
.L89:
	subs	r5, r5, #1
	add	r4, r4, #68
	popeq	{r4, r5, r6, r7, r8, pc}
.L90:
	mov	r0, r4
	bl	s3c24xx_register_clock
	cmp	r0, #0
	bge	.L89
	mov	r2, r0
	ldr	r1, [r4, #16]
	mov	r0, r7
	blx	r6
	b	.L89
	.fnend
	.size	s3c_register_clocks, .-s3c_register_clocks
	.align	2
	.global	s3c_disable_clocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_disable_clocks, %function
s3c_disable_clocks:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	subs	r5, r1, #0
	pople	{r4, r5, r6, pc}
	mov	r4, r0
.L95:
	ldr	r3, [r4, #44]
	mov	r0, r4
	mov	r1, #0
	add	r4, r4, #68
	blx	r3
	subs	r5, r5, #1
	bne	.L95
	pop	{r4, r5, r6, pc}
	.fnend
	.size	s3c_disable_clocks, .-s3c_disable_clocks
	.align	2
	.global	s3c24xx_register_baseclocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c24xx_register_baseclocks, %function
s3c24xx_register_baseclocks:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r5, r0
	movw	r4, #:lower16:printk
	movw	r0, #:lower16:.LC5
	movt	r4, #:upper16:printk
	movt	r0, #:upper16:.LC5
	blx	r4
	movw	r3, #:lower16:.LANCHOR2
	movt	r3, #:upper16:.LANCHOR2
	add	r0, r3, #8
	str	r5, [r3, #40]
	bl	s3c24xx_register_clock
	cmp	r0, #0
	blt	.L106
.L99:
	ldr	r0, .L112
	bl	s3c24xx_register_clock
	cmp	r0, #0
	blt	.L107
.L100:
	ldr	r0, .L112+4
	bl	s3c24xx_register_clock
	cmp	r0, #0
	blt	.L108
.L101:
	ldr	r0, .L112+8
	bl	s3c24xx_register_clock
	cmp	r0, #0
	blt	.L109
.L102:
	ldr	r0, .L112+12
	bl	s3c24xx_register_clock
	cmp	r0, #0
	blt	.L110
.L103:
	ldr	r0, .L112+16
	bl	s3c24xx_register_clock
	cmp	r0, #0
	blt	.L111
.L104:
	mov	r0, #0
	pop	{r4, r5, r6, pc}
.L106:
	movw	r0, #:lower16:.LC6
	movt	r0, #:upper16:.LC6
	blx	r4
	b	.L99
.L111:
	movw	r0, #:lower16:.LC11
	movt	r0, #:upper16:.LC11
	blx	r4
	b	.L104
.L110:
	movw	r0, #:lower16:.LC10
	movt	r0, #:upper16:.LC10
	blx	r4
	b	.L103
.L109:
	movw	r0, #:lower16:.LC9
	movt	r0, #:upper16:.LC9
	blx	r4
	b	.L102
.L108:
	movw	r0, #:lower16:.LC8
	movt	r0, #:upper16:.LC8
	blx	r4
	b	.L101
.L107:
	movw	r0, #:lower16:.LC7
	movt	r0, #:upper16:.LC7
	blx	r4
	b	.L100
.L113:
	.align	2
.L112:
	.word	.LANCHOR2+76
	.word	.LANCHOR2+144
	.word	.LANCHOR2+212
	.word	.LANCHOR2+280
	.word	.LANCHOR2+348
	.fnend
	.size	s3c24xx_register_baseclocks, .-s3c24xx_register_baseclocks
	.global	s3c24xx_uclk
	.global	clk_usb_bus
	.global	clk_p
	.global	clk_h
	.global	clk_f
	.global	clk_upll
	.global	clk_mpll
	.global	clk_epll
	.global	clk_ext
	.global	clk_xtal
	.global	clk_ops_def_setrate
	.global	s3c2410_wdtclk
	.global	clocks_lock
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.22056, %object
	.size	__func__.22056, 19
__func__.22056:
	.ascii	"s3c_wdt_reset_init\000"
	.space	1
	.type	__func__.22167, %object
	.size	__func__.22167, 24
__func__.22167:
	.ascii	"s3c24xx_register_clocks\000"
	.data
	.align	2
	.set	.LANCHOR2,. + 0
	.type	clocks, %object
	.size	clocks, 8
clocks:
	.word	clocks
	.word	clocks
	.type	clk_xtal, %object
	.size	clk_xtal, 68
clk_xtal:
	.space	12
	.word	0
	.word	.LC21
	.space	4
	.word	-1
	.space	4
	.word	0
	.word	0
	.space	28
	.type	clk_mpll, %object
	.size	clk_mpll, 68
clk_mpll:
	.space	16
	.word	.LC18
	.space	4
	.word	-1
	.space	12
	.word	clk_ops_def_setrate
	.space	24
	.type	clk_upll, %object
	.size	clk_upll, 68
clk_upll:
	.space	12
	.word	0
	.word	.LC17
	.space	4
	.word	-1
	.space	8
	.word	0
	.space	28
	.type	clk_f, %object
	.size	clk_f, 68
clk_f:
	.space	12
	.word	clk_mpll
	.word	.LC16
	.space	4
	.word	-1
	.space	4
	.word	0
	.word	0
	.space	28
	.type	clk_h, %object
	.size	clk_h, 68
clk_h:
	.space	12
	.word	0
	.word	.LC15
	.space	4
	.word	-1
	.space	4
	.word	0
	.word	0
	.word	clk_ops_def_setrate
	.space	24
	.type	clk_p, %object
	.size	clk_p, 68
clk_p:
	.space	12
	.word	0
	.word	.LC14
	.space	4
	.word	-1
	.space	4
	.word	0
	.word	0
	.word	clk_ops_def_setrate
	.space	24
	.type	s3c24xx_uclk, %object
	.size	s3c24xx_uclk, 68
s3c24xx_uclk:
	.space	16
	.word	.LC12
	.space	4
	.word	-1
	.space	40
	.type	clk_usb_bus, %object
	.size	clk_usb_bus, 68
clk_usb_bus:
	.space	12
	.word	clk_upll
	.word	.LC13
	.space	4
	.word	-1
	.space	4
	.word	0
	.space	32
	.type	clk_epll, %object
	.size	clk_epll, 68
clk_epll:
	.space	16
	.word	.LC19
	.space	4
	.word	-1
	.space	40
	.type	clk_ext, %object
	.size	clk_ext, 68
clk_ext:
	.space	16
	.word	.LC20
	.space	4
	.word	-1
	.space	40
	.type	clk_ops_def_setrate, %object
	.size	clk_ops_def_setrate, 16
clk_ops_def_setrate:
	.word	clk_default_setrate
	.space	12
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	clocks_lock, %object
	.size	clocks_lock, 8
clocks_lock:
	.space	8
	.type	s3c2410_wdtclk, %object
	.size	s3c2410_wdtclk, 4
s3c2410_wdtclk:
	.space	4
	.section	.initcall3.init,"aw",%progbits
	.align	2
	.type	__initcall_s3c_wdt_reset_init3, %object
	.size	__initcall_s3c_wdt_reset_init3, 4
__initcall_s3c_wdt_reset_init3:
	.word	s3c_wdt_reset_init
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"/media/system1/root/CM14/kernel/samsung/smdk4412/ar"
	.ascii	"ch/arm/plat-samsung/clock.c\000"
	.space	1
.LC1:
	.ascii	"watchdog\000"
	.space	3
.LC2:
	.ascii	"<4>%s: warning: cannot get watchdog clock\012\000"
	.space	1
.LC3:
	.ascii	"<3>%s: failed to register %p: %s\012\000"
	.space	2
.LC4:
	.ascii	"<3>Failed to register clock %s (%d)\012\000"
	.space	3
.LC5:
	.ascii	"<6>S3C24XX Clocks, Copyright 2004 Simtec Electronic"
	.ascii	"s\012\000"
	.space	2
.LC6:
	.ascii	"<3>failed to register master xtal\012\000"
	.space	1
.LC7:
	.ascii	"<3>failed to register mpll clock\012\000"
	.space	2
.LC8:
	.ascii	"<3>failed to register upll clock\012\000"
	.space	2
.LC9:
	.ascii	"<3>failed to register cpu fclk\012\000"
.LC10:
	.ascii	"<3>failed to register cpu hclk\012\000"
.LC11:
	.ascii	"<3>failed to register cpu pclk\012\000"
.LC12:
	.ascii	"uclk\000"
	.space	3
.LC13:
	.ascii	"usb-bus\000"
.LC14:
	.ascii	"pclk\000"
	.space	3
.LC15:
	.ascii	"hclk\000"
	.space	3
.LC16:
	.ascii	"fclk\000"
	.space	3
.LC17:
	.ascii	"upll\000"
	.space	3
.LC18:
	.ascii	"mpll\000"
	.space	3
.LC19:
	.ascii	"epll\000"
	.space	3
.LC20:
	.ascii	"ext\000"
.LC21:
	.ascii	"xtal\000"
	.section	___ksymtab+clk_disable,"a",%progbits
	.align	2
	.type	__ksymtab_clk_disable, %object
	.size	__ksymtab_clk_disable, 8
__ksymtab_clk_disable:
	.word	clk_disable
	.word	__kstrtab_clk_disable
	.section	___ksymtab+clk_enable,"a",%progbits
	.align	2
	.type	__ksymtab_clk_enable, %object
	.size	__ksymtab_clk_enable, 8
__ksymtab_clk_enable:
	.word	clk_enable
	.word	__kstrtab_clk_enable
	.section	___ksymtab+clk_get_parent,"a",%progbits
	.align	2
	.type	__ksymtab_clk_get_parent, %object
	.size	__ksymtab_clk_get_parent, 8
__ksymtab_clk_get_parent:
	.word	clk_get_parent
	.word	__kstrtab_clk_get_parent
	.section	___ksymtab+clk_get_rate,"a",%progbits
	.align	2
	.type	__ksymtab_clk_get_rate, %object
	.size	__ksymtab_clk_get_rate, 8
__ksymtab_clk_get_rate:
	.word	clk_get_rate
	.word	__kstrtab_clk_get_rate
	.section	___ksymtab+clk_round_rate,"a",%progbits
	.align	2
	.type	__ksymtab_clk_round_rate, %object
	.size	__ksymtab_clk_round_rate, 8
__ksymtab_clk_round_rate:
	.word	clk_round_rate
	.word	__kstrtab_clk_round_rate
	.section	___ksymtab+clk_set_parent,"a",%progbits
	.align	2
	.type	__ksymtab_clk_set_parent, %object
	.size	__ksymtab_clk_set_parent, 8
__ksymtab_clk_set_parent:
	.word	clk_set_parent
	.word	__kstrtab_clk_set_parent
	.section	___ksymtab+clk_set_rate,"a",%progbits
	.align	2
	.type	__ksymtab_clk_set_rate, %object
	.size	__ksymtab_clk_set_rate, 8
__ksymtab_clk_set_rate:
	.word	clk_set_rate
	.word	__kstrtab_clk_set_rate
	.section	__ksymtab_strings,"a",%progbits
	.type	__kstrtab_clk_set_parent, %object
	.size	__kstrtab_clk_set_parent, 15
__kstrtab_clk_set_parent:
	.ascii	"clk_set_parent\000"
	.type	__kstrtab_clk_get_parent, %object
	.size	__kstrtab_clk_get_parent, 15
__kstrtab_clk_get_parent:
	.ascii	"clk_get_parent\000"
	.type	__kstrtab_clk_set_rate, %object
	.size	__kstrtab_clk_set_rate, 13
__kstrtab_clk_set_rate:
	.ascii	"clk_set_rate\000"
	.type	__kstrtab_clk_round_rate, %object
	.size	__kstrtab_clk_round_rate, 15
__kstrtab_clk_round_rate:
	.ascii	"clk_round_rate\000"
	.type	__kstrtab_clk_get_rate, %object
	.size	__kstrtab_clk_get_rate, 13
__kstrtab_clk_get_rate:
	.ascii	"clk_get_rate\000"
	.type	__kstrtab_clk_disable, %object
	.size	__kstrtab_clk_disable, 12
__kstrtab_clk_disable:
	.ascii	"clk_disable\000"
	.type	__kstrtab_clk_enable, %object
	.size	__kstrtab_clk_enable, 11
__kstrtab_clk_enable:
	.ascii	"clk_enable\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
