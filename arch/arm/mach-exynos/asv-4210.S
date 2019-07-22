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
	.file	"asv-4210.c"
	.text
	.align	2
	.type	exynos4210_asv_pre_clock_setup, %function
exynos4210_asv_pre_clock_setup:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r0, #1537
	str	r4, [sp, #-4]!
	.save {r4}
	mov	r1, r0
	movw	r3, #24575
	movw	r4, #1538
	movw	ip, #1540
	movt	r3, 65041
	mov	r2, #5242880
	movt	r1, 32968
	movt	r0, 33018
	movt	r4, 32968
	movt	ip, 32968
	str	r0, [r3, #-3839]
	mov	r0, #0
	str	r1, [r3, #-3835]
	str	r4, [r3, #-3831]
	str	ip, [r3, #-3827]
	str	r1, [r3, #-3823]
	str	r1, [r3, #-3819]
	str	r1, [r3, #-3815]
	str	r1, [r3, #-3811]
	str	r2, [r3, #-3327]
	str	r2, [r3, #-3323]
	str	r2, [r3, #-3319]
	str	r2, [r3, #-3315]
	str	r2, [r3, #-3311]
	str	r2, [r3, #-3307]
	str	r2, [r3, #-3303]
	str	r2, [r3, #-3299]
	ldr	r4, [sp], #4
	bx	lr
	.fnend
	.size	exynos4210_asv_pre_clock_setup, .-exynos4210_asv_pre_clock_setup
	.align	2
	.type	exynos4210_get_ids, %function
exynos4210_get_ids:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	mov	r3, r0
	ldr	ip, [r0, #4]
	cmp	ip, #0
	beq	.L3
	ldr	r1, [r0, #8]
	cmp	r1, #0
	beq	.L3
	mov	r2, #-33554432
	movw	r0, #:lower16:.LC1
	ldr	lr, [r2, #4]
	movw	r2, #:lower16:printk
	movt	r2, #:upper16:printk
	movt	r0, #:upper16:.LC1
	str	lr, [r3]
	and	r1, r1, lr, lsr ip
	str	r1, [r3, #16]
	blx	r2
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
.L3:
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	mvn	r0, #0
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4210_get_ids, .-exynos4210_get_ids
	.align	2
	.type	exynos4210_asv_pre_clock_init, %function
exynos4210_asv_pre_clock_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	movw	r1, #:lower16:.LC2
	movw	r4, #:lower16:clk_get
	movt	r1, #:upper16:.LC2
	movt	r4, #:upper16:clk_get
	mov	r0, #0
	blx	r4
	cmn	r0, #4096
	bhi	.L30
	movw	r5, #:lower16:clk_enable
	movt	r5, #:upper16:clk_enable
	blx	r5
	movw	r1, #:lower16:.LC4
	mov	r0, #0
	movt	r1, #:upper16:.LC4
	blx	r4
	cmn	r0, #4096
	bhi	.L31
	blx	r5
	movw	r1, #:lower16:.LC6
	mov	r0, #0
	movt	r1, #:upper16:.LC6
	blx	r4
	cmn	r0, #4096
	bhi	.L32
	blx	r5
	mov	r3, #16384
	movw	r1, #:lower16:.LC8
	movt	r3, 65041
	movt	r1, #:upper16:.LC8
	ldr	r2, [r3, #1284]
	mov	r0, #0
	bic	r2, r2, #119
	orr	r2, r2, #3
	str	r2, [r3, #1284]
	ldr	r2, [r3, #512]
	orr	r2, r2, #1048576
	str	r2, [r3, #512]
	blx	r4
	cmn	r0, #4096
	mov	r6, r0
	bhi	.L33
	movw	r1, #:lower16:.LC10
	mov	r0, #0
	movt	r1, #:upper16:.LC10
	blx	r4
	cmn	r0, #4096
	mov	r7, r0
	bhi	.L34
	movw	r8, #:lower16:clk_set_parent
	mov	r0, r6
	movt	r8, #:upper16:clk_set_parent
	mov	r1, r7
	blx	r8
	cmp	r0, #0
	bne	.L35
.L18:
	movw	r5, #:lower16:clk_put
	mov	r0, r7
	movt	r5, #:upper16:clk_put
	movw	r7, #:lower16:clk_set_rate
	blx	r5
	mov	r1, #15872
	mov	r0, r6
	movt	r1, 73
	movt	r7, #:upper16:clk_set_rate
	blx	r7
	mov	r0, r6
	movw	r9, #:lower16:clk_get
	blx	r5
	movw	r1, #:lower16:.LC13
	mov	r0, #0
	movt	r1, #:upper16:.LC13
	movt	r9, #:upper16:clk_get
	blx	r4
	cmn	r0, #4096
	mov	r6, r0
	bhi	.L36
	movw	r1, #:lower16:.LC15
	mov	r0, #0
	movt	r1, #:upper16:.LC15
	blx	r9
	cmn	r0, #4096
	mov	r9, r0
	bhi	.L37
	mov	r0, r6
	mov	r1, r9
	blx	r8
	cmp	r0, #0
	bne	.L38
.L21:
	mov	r0, r9
	movw	r8, #:lower16:clk_put
	blx	r5
	mov	r1, #33792
	mov	r0, r6
	movt	r1, 6103
	movw	r9, #:lower16:clk_set_rate
	blx	r7
	mov	r0, r6
	movt	r8, #:upper16:clk_put
	blx	r5
	movw	r1, #:lower16:.LC17
	mov	r0, #0
	movt	r1, #:upper16:.LC17
	movt	r9, #:upper16:clk_set_rate
	blx	r4
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L39
	mov	r1, #49664
	movt	r1, 3051
	blx	r9
	mov	r0, r4
	blx	r8
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L30:
	movw	r0, #:lower16:.LC3
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC3
	movt	r3, #:upper16:printk
	blx	r3
.L12:
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L39:
	movw	r0, #:lower16:.LC18
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC18
	blx	r3
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L38:
	movw	r0, #:lower16:.LC12
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, [r9, #16]
	ldr	r2, [r6, #16]
	movt	r0, #:upper16:.LC12
	blx	r3
	b	.L21
.L37:
	movw	r0, #:lower16:.LC16
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC16
	blx	r3
	mov	r0, r6
	blx	r5
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L36:
	movw	r0, #:lower16:.LC14
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC14
	blx	r3
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L35:
	movw	r0, #:lower16:.LC12
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, [r7, #16]
	ldr	r2, [r6, #16]
	movt	r0, #:upper16:.LC12
	blx	r3
	b	.L18
.L34:
	movw	r0, #:lower16:.LC11
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC11
	blx	r3
	movw	r3, #:lower16:clk_put
	mov	r0, r6
	movt	r3, #:upper16:clk_put
	blx	r3
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L33:
	movw	r0, #:lower16:.LC9
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC9
	blx	r3
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L32:
	movw	r0, #:lower16:.LC7
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC7
	blx	r3
	b	.L12
.L31:
	movw	r0, #:lower16:.LC5
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC5
	blx	r3
	b	.L12
	.fnend
	.size	exynos4210_asv_pre_clock_init, .-exynos4210_asv_pre_clock_init
	.align	2
	.type	exynos4210_get_hpm, %function
exynos4210_get_hpm:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movw	r3, #:lower16:__arm_ioremap
	mov	r6, r0
	mov	r0, #0
	movt	r3, #:upper16:__arm_ioremap
	movt	r0, 4166
	mov	r1, #131072
	mov	r2, #0
	blx	r3
	subs	r5, r0, #0
	beq	.L54
	ldr	r3, [r6, #24]
	cmp	r3, #0
	beq	.L55
	blx	r3
	subs	r7, r0, #0
	bne	.L56
	mov	r3, #16
	mov	r4, #10
	movt	r3, 1
	ldr	r2, [r5, r3]
	orr	r2, r2, #16
	str	r2, [r5, r3]
	ldr	r3, [r6, #28]
	blx	r3
	ldr	r2, [r5]
	mov	r1, #224
	movt	r1, 1
	mov	r3, r7
	orr	r2, r2, #1
	str	r2, [r5]
.L47:
	ldrb	r2, [r5, r1]	@ zero_extendqisi2
	subs	r4, r4, #1
	add	r3, r3, r2
	bne	.L47
	movw	r1, #52429
	movw	r0, #:lower16:.LC22
	movt	r1, 52428
	movw	r8, #:lower16:printk
	umull	r2, r1, r1, r3
	movt	r0, #:upper16:.LC22
	movt	r8, #:upper16:printk
	movw	r5, #:lower16:clk_get
	movt	r5, #:upper16:clk_get
	mov	r1, r1, lsr #3
	sub	r1, r1, #1
	str	r1, [r6, #12]
	blx	r8
	mov	r3, #16384
	movw	r1, #:lower16:.LC2
	movt	r3, 65041
	movt	r1, #:upper16:.LC2
	ldr	r2, [r3, #512]
	mov	r0, r4
	bic	r2, r2, #1048576
	str	r2, [r3, #512]
	blx	r5
	cmn	r0, #4096
	bhi	.L57
	movw	r6, #:lower16:clk_disable
	movt	r6, #:upper16:clk_disable
	blx	r6
	movw	r1, #:lower16:.LC4
	mov	r0, r4
	movt	r1, #:upper16:.LC4
	blx	r5
	cmn	r0, #4096
	bhi	.L58
	blx	r6
	movw	r1, #:lower16:.LC6
	mov	r0, r4
	movt	r1, #:upper16:.LC6
	blx	r5
	cmn	r0, #4096
	bhi	.L59
	blx	r6
.L53:
	mov	r0, r7
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L56:
	movw	r0, #:lower16:.LC21
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC21
	movt	r3, #:upper16:printk
	blx	r3
.L44:
	movw	r3, #:lower16:__arm_iounmap
	mov	r0, r5
	movt	r3, #:upper16:__arm_iounmap
	mvn	r7, #0
	blx	r3
	b	.L53
.L55:
	movw	r0, #:lower16:.LC20
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC20
	blx	r3
	b	.L44
.L54:
	movw	r0, #:lower16:.LC19
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC19
	movt	r3, #:upper16:printk
	blx	r3
	mvn	r7, #0
	b	.L53
.L59:
	movw	r0, #:lower16:.LC7
	movt	r0, #:upper16:.LC7
	blx	r8
.L49:
	mvn	r7, #0
	b	.L53
.L58:
	movw	r0, #:lower16:.LC5
	movt	r0, #:upper16:.LC5
	blx	r8
	b	.L49
.L57:
	movw	r0, #:lower16:.LC3
	movt	r0, #:upper16:.LC3
	blx	r8
	b	.L49
	.fnend
	.size	exynos4210_get_hpm, .-exynos4210_get_hpm
	.align	2
	.type	exynos4210_check_vdd_arm, %function
exynos4210_check_vdd_arm:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r1, #:lower16:.LC23
	movw	r3, #:lower16:regulator_get
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r1, #:upper16:.LC23
	movt	r3, #:upper16:regulator_get
	mov	r0, #0
	blx	r3
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L65
	movw	r3, #:lower16:regulator_get_voltage
	movw	r5, #20352
	movt	r3, #:upper16:regulator_get_voltage
	movt	r5, 18
	blx	r3
	cmp	r0, r5
	mov	r2, r0
	beq	.L63
	movw	r0, #:lower16:.LC25
	movw	r1, #:lower16:.LANCHOR0
	movw	r6, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR0
	movt	r0, #:upper16:.LC25
	movt	r6, #:upper16:printk
	blx	r6
	movw	r3, #:lower16:regulator_set_voltage
	mov	r2, r5
	mov	r0, r4
	mov	r1, r5
	movt	r3, #:upper16:regulator_set_voltage
	blx	r3
	subs	r2, r0, #0
	blt	.L66
.L64:
	movw	r3, #:lower16:regulator_put
	mov	r0, r4
	movt	r3, #:upper16:regulator_put
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
.L63:
	movw	r0, #:lower16:.LC27
	movw	r1, #:lower16:.LANCHOR0
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR0
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC27
	blx	r3
	b	.L64
.L65:
	movw	r0, #:lower16:.LC24
	movw	r1, #:lower16:.LANCHOR0
	movw	r2, #:lower16:.LC23
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR0
	movt	r2, #:upper16:.LC23
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC24
	blx	r3
	mvn	r0, #21
	ldmfd	sp!, {r4, r5, r6, pc}
.L66:
	movw	r0, #:lower16:.LC26
	movw	r1, #:lower16:.LANCHOR0
	movt	r1, #:upper16:.LANCHOR0
	movt	r0, #:upper16:.LC26
	blx	r6
	mvn	r0, #21
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	exynos4210_check_vdd_arm, .-exynos4210_check_vdd_arm
	.align	2
	.type	exynos4210_asv_store_result, %function
exynos4210_asv_store_result:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r3, #:lower16:samsung_cpu_id
	movt	r3, #:upper16:samsung_cpu_id
	ldr	r3, [r3]
	ubfx	r3, r3, #8, #2
	cmp	r3, #0
	beq	.L101
	ldr	r3, [r0]
	and	r3, r3, #7
	cmp	r3, #5
	beq	.L74
	cmp	r3, #7
	beq	.L75
	cmp	r3, #1
	movwne	r1, #:lower16:.LC30
	movne	r2, #536870912
	movtne	r1, #:upper16:.LC30
	beq	.L75
.L73:
	movw	r5, #:lower16:exynos_result_of_asv
	movw	r0, #:lower16:.LC31
	movw	r4, #:lower16:printk
	movt	r5, #:upper16:exynos_result_of_asv
	movt	r4, #:upper16:printk
	movt	r0, #:upper16:.LC31
	str	r2, [r5]
	blx	r4
	movw	r0, #:lower16:.LC32
	ldr	r1, [r5]
	movt	r0, #:upper16:.LC32
	blx	r4
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, pc}
.L74:
	ldr	lr, .L102
	mov	r3, #0
	ldr	r5, [r0, #12]
	mov	r2, r3
	mov	r4, lr
.L83:
	ldr	r1, [lr, r3]
	add	ip, r4, r3
	add	r3, r3, #8
	cmp	r5, r1
	bls	.L100
	ldr	r1, [ip, #4]
	ldr	ip, [r0, #16]
	cmp	ip, r1
	bls	.L100
	add	r2, r2, #1
	cmp	r2, #4
	bne	.L83
	mov	r2, #-2147483644
.L81:
	movw	r1, #:lower16:.LC29
	movt	r1, #:upper16:.LC29
	b	.L73
.L101:
	ldr	lr, .L102+4
	mov	r2, r3
	ldr	r5, [r0, #12]
	mov	r4, lr
.L72:
	ldr	r1, [lr, r3]
	add	ip, r4, r3
	add	r3, r3, #8
	cmp	r5, r1
	bls	.L99
	ldr	r1, [ip, #4]
	ldr	ip, [r0, #16]
	cmp	ip, r1
	bls	.L99
	add	r2, r2, #1
	cmp	r2, #4
	bne	.L72
	mov	r2, #1073741828
.L77:
	movw	r1, #:lower16:.LC28
	movt	r1, #:upper16:.LC28
	b	.L73
.L75:
	movw	lr, #:lower16:.LANCHOR1
	ldr	r5, [r0, #12]
	movt	lr, #:upper16:.LANCHOR1
	mov	r3, #0
	mov	r4, lr
	mov	r2, r3
.L79:
	ldr	r1, [lr, r3]
	add	ip, r4, r3
	add	r3, r3, #8
	cmp	r5, r1
	bls	.L99
	ldr	r1, [ip, #4]
	ldr	ip, [r0, #16]
	cmp	ip, r1
	bls	.L99
	add	r2, r2, #1
	cmp	r2, #7
	bne	.L79
	mov	r2, #1073741831
	b	.L77
.L99:
	orr	r2, r2, #1073741824
	b	.L77
.L100:
	orr	r2, r2, #-2147483648
	b	.L81
.L103:
	.align	2
.L102:
	.word	.LANCHOR0+60
	.word	.LANCHOR0+28
	.fnend
	.size	exynos4210_asv_store_result, .-exynos4210_asv_store_result
	.align	2
	.global	exynos4210_asv_init
	.type	exynos4210_asv_init, %function
exynos4210_asv_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r4, r0
	movw	r3, #:lower16:printk
	movw	r0, #:lower16:.LC33
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC33
	blx	r3
	movw	r7, #:lower16:exynos4210_get_ids
	movw	r6, #:lower16:exynos4210_get_hpm
	movw	r5, #:lower16:exynos4210_check_vdd_arm
	movw	ip, #:lower16:exynos4210_asv_pre_clock_init
	movw	r1, #:lower16:exynos4210_asv_pre_clock_setup
	movw	r2, #:lower16:exynos4210_asv_store_result
	movw	r3, #:lower16:exynos_result_of_asv
	mov	r8, #0
	mov	r9, #24
	mov	r0, #255
	movt	r7, #:upper16:exynos4210_get_ids
	movt	r6, #:upper16:exynos4210_get_hpm
	movt	r5, #:upper16:exynos4210_check_vdd_arm
	movt	ip, #:upper16:exynos4210_asv_pre_clock_init
	movt	r1, #:upper16:exynos4210_asv_pre_clock_setup
	movt	r2, #:upper16:exynos4210_asv_store_result
	movt	r3, #:upper16:exynos_result_of_asv
	str	r0, [r4, #8]
	str	r9, [r4, #4]
	mov	r0, r8
	str	r7, [r4, #32]
	str	r6, [r4, #36]
	str	r5, [r4, #20]
	str	ip, [r4, #24]
	str	r1, [r4, #28]
	str	r2, [r4, #40]
	str	r8, [r3]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
	.fnend
	.size	exynos4210_asv_init, .-exynos4210_asv_init
	.global	exynos4210_1200_limit
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.13439, %object
	.size	__func__.13439, 25
__func__.13439:
	.ascii	"exynos4210_check_vdd_arm\000"
	.space	3
	.type	exynos4210_single_1200_limit, %object
	.size	exynos4210_single_1200_limit, 32
exynos4210_single_1200_limit:
	.word	8
	.word	4
	.word	14
	.word	12
	.word	21
	.word	27
	.word	25
	.word	55
	.type	exynos4210_1400_limit, %object
	.size	exynos4210_1400_limit, 32
exynos4210_1400_limit:
	.word	13
	.word	8
	.word	17
	.word	12
	.word	22
	.word	32
	.word	26
	.word	52
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	exynos4210_1200_limit, %object
	.size	exynos4210_1200_limit, 56
exynos4210_1200_limit:
	.word	8
	.word	4
	.word	11
	.word	8
	.word	14
	.word	12
	.word	18
	.word	17
	.word	21
	.word	27
	.word	23
	.word	45
	.word	25
	.word	55
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<6>EXYNOS4: No ids_offset or No ids_mask\012\000"
	.space	2
.LC1:
	.ascii	"<6>EXYNOS4: IDS value = %d\012\000"
.LC2:
	.ascii	"iec\000"
.LC3:
	.ascii	"<3>ASV : IEM IEC clock get error\012\000"
	.space	2
.LC4:
	.ascii	"apc\000"
.LC5:
	.ascii	"<3>ASV : IEM APC clock get error\012\000"
	.space	2
.LC6:
	.ascii	"hpm\000"
.LC7:
	.ascii	"<3>ASV : HPM clock get error\012\000"
	.space	2
.LC8:
	.ascii	"sclk_pwi\000"
	.space	3
.LC9:
	.ascii	"<6>EXYNOS4210: ASV : SCLK_PWI clock get error\012\000"
	.space	1
.LC10:
	.ascii	"xusbxti\000"
.LC11:
	.ascii	"<6>EXYNOS4210: ASV: MOUT_APLL clock get error\012\000"
	.space	1
.LC12:
	.ascii	"<6>EXYNOS4210: ASV: Unable to set parent %s of cloc"
	.ascii	"k %s.\012\000"
	.space	2
.LC13:
	.ascii	"dout_copy\000"
	.space	2
.LC14:
	.ascii	"<6>EXYNOS4210: ASV: DOUT_COPY clock get error\012\000"
	.space	1
.LC15:
	.ascii	"mout_mpll\000"
	.space	2
.LC16:
	.ascii	"<6>EXYNOS4210: ASV: MOUT_MPLL clock get error\012\000"
	.space	1
.LC17:
	.ascii	"sclk_hpm\000"
	.space	3
.LC18:
	.ascii	"<6>EXYNOS4210: ASV: Fail to get sclk_hpm\012\000"
	.space	2
.LC19:
	.ascii	"<6>EXYNOS: ioremap fail\012\000"
	.space	3
.LC20:
	.ascii	"<6>EXYNOS: No Pre-setup function\012\000"
	.space	2
.LC21:
	.ascii	"<6>EXYNOS: pre_clock_init function fail\000"
.LC22:
	.ascii	"<6>EXYNOS4: HPM value = %d\012\000"
.LC23:
	.ascii	"vdd_arm\000"
.LC24:
	.ascii	"<3>%s failed to get resource %s\012\000"
	.space	3
.LC25:
	.ascii	"<6>%s: current vdd_arm(%duV), set vdd_arm (1.2V)\012"
	.ascii	"\000"
	.space	2
.LC26:
	.ascii	"<3>%s: fail to set vdd_arm(%d)\012\000"
.LC27:
	.ascii	"<6>%s: current vdd_arm(%duV)\012\000"
	.space	2
.LC28:
	.ascii	"1.2GHz\000"
	.space	1
.LC29:
	.ascii	"1.4GHz\000"
	.space	1
.LC30:
	.ascii	"1.0GHz\000"
	.space	1
.LC31:
	.ascii	"<6><6>Support %s\012\000"
	.space	2
.LC32:
	.ascii	"<6><6>ASV Group for This Exynos4210 is 0x%x\012\000"
	.space	3
.LC33:
	.ascii	"<6>EXYNOS4210: Adaptive Support Voltage init\012\000"
	.ident	"GCC: (GNU) 4.8"
