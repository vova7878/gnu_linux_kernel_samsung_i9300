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
	.file	"setup-usb-phy.c"
	.text
	.align	2
	.type	exynos5_usb_phy_host_suspend, %function
exynos5_usb_phy_host_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
@ 662 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r4, #:lower16:outer_cache
	movt	r4, #:upper16:outer_cache
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L2
	blx	r3
.L2:
	mov	r3, #0
	movt	r3, 65168
	ldr	r2, [r3, #16]
@ 662 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	mov	r3, #0
	orr	r2, r2, #16
	movt	r3, 65168
	str	r2, [r3, #16]
@ 664 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L3
	blx	r3
.L3:
	mov	r3, #0
	movt	r3, 65168
	ldr	r2, [r3, #32]
@ 664 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	mov	r3, #0
	orr	r2, r2, #16
	movt	r3, 65168
	str	r2, [r3, #32]
	ldr	r5, [r3]
@ 667 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	orr	r5, r5, #16
@ 670 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L4
	blx	r3
.L4:
	mov	r3, #0
	mov	r0, r3
	movt	r3, 65168
	str	r5, [r3]
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	exynos5_usb_phy_host_suspend, .-exynos5_usb_phy_host_suspend
	.align	2
	.type	exynos_usb_phy_set_clock, %function
exynos_usb_phy_set_clock:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r4, #:lower16:samsung_cpu_id
	movt	r4, #:upper16:samsung_cpu_id
	mov	r3, #0
	movt	r3, 17186
	add	r6, r0, #8
	ldr	r2, [r4]
	mov	r2, r2, lsr #17
	mov	r2, r2, asl #17
	cmp	r2, r3
	beq	.L16
	cmn	r2, #465567744
	beq	.L16
	movw	r1, #:lower16:.LC1
	movw	r3, #:lower16:clk_get
	mov	r0, r6
	movt	r1, #:upper16:.LC1
	movt	r3, #:upper16:clk_get
	blx	r3
	mov	r5, r0
	b	.L18
.L16:
	movw	r1, #:lower16:.LC0
	movw	r3, #:lower16:clk_get
	mov	r0, r6
	movt	r1, #:upper16:.LC0
	movt	r3, #:upper16:clk_get
	blx	r3
	mov	r5, r0
.L18:
	cmn	r5, #4096
	bhi	.L40
	ldr	r3, [r4]
	mov	r0, #0
	movt	r0, 17186
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmn	r3, #465567744
	cmpne	r3, r0
	movne	r4, #0
	moveq	r4, #1
	bne	.L21
	movw	r3, #:lower16:clk_get_rate
	mov	r0, r5
	movt	r3, #:upper16:clk_get_rate
	blx	r3
	mov	r3, #6912
	movt	r3, 183
	cmp	r0, r3
	beq	.L30
	bhi	.L24
	mov	r3, #31744
	movt	r3, 146
	cmp	r0, r3
	moveq	r4, #0
	beq	.L26
.L39:
	movw	r3, #38528
	movt	r3, 152
	cmp	r0, r3
	moveq	r4, #1
	bne	.L29
.L26:
	movw	r2, #:lower16:clk_put
	mov	r0, r5
	movt	r2, #:upper16:clk_put
	blx	r2
	mov	r0, r4
	ldmfd	sp!, {r4, r5, r6, pc}
.L21:
	movw	r2, #:lower16:clk_get_rate
	mov	r0, r5
	movt	r2, #:upper16:clk_get_rate
	blx	r2
	mov	r2, #6912
	movt	r2, 183
	cmp	r0, r2
	beq	.L30
	bls	.L41
	mov	r3, #11520
	movt	r3, 305
	cmp	r0, r3
	beq	.L33
	movw	r3, #61568
	movt	r3, 762
	cmp	r0, r3
	moveq	r4, #7
	beq	.L26
	mov	r3, #63488
	movt	r3, 292
	cmp	r0, r3
	beq	.L35
.L29:
	mov	r4, #5
	b	.L26
.L24:
	mov	r3, #63488
	movt	r3, 292
	cmp	r0, r3
	beq	.L35
	mov	r3, #11520
	movt	r3, 305
	cmp	r0, r3
	bne	.L29
.L33:
	mov	r4, #4
	b	.L26
.L35:
	mov	r4, #3
	b	.L26
.L41:
	mov	r3, #31744
	movt	r3, 146
	cmp	r0, r3
	bne	.L39
	b	.L26
.L30:
	mov	r4, #2
	b	.L26
.L40:
	movw	r1, #:lower16:.LC2
	movw	r3, #:lower16:dev_err
	mov	r0, r6
	movt	r1, #:upper16:.LC2
	movt	r3, #:upper16:dev_err
	blx	r3
	mov	r0, r5
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	exynos_usb_phy_set_clock, .-exynos_usb_phy_set_clock
	.align	2
	.type	exynos_usb_mux_change, %function
exynos_usb_mux_change:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:samsung_cpu_id
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movt	r3, #:upper16:samsung_cpu_id
	mov	r2, #0
	movt	r2, 17186
	mov	r4, r1
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmp	r3, r2
	beq	.L43
	cmn	r3, #465567744
	beq	.L43
	mov	r3, #0
	movt	r3, 64528
	ldr	r3, [r3, #560]
@ 88 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
@ 89 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L47
	blx	r3
.L47:
	mov	r3, #0
	movt	r3, 64528
	str	r4, [r3, #560]
	ldmfd	sp!, {r4, pc}
.L43:
	mov	r3, #0
	movt	r3, 64528
	ldr	r3, [r3, #540]
@ 85 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
@ 86 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L45
	blx	r3
.L45:
	mov	r3, #0
	movt	r3, 64528
	str	r4, [r3, #540]
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	exynos_usb_mux_change, .-exynos_usb_mux_change
	.align	2
	.type	exynos_usb_device_phy_is_on, %function
exynos_usb_device_phy_is_on:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:samsung_cpu_id
	mov	r2, #0
	movt	r3, #:upper16:samsung_cpu_id
	movt	r2, 17186
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmp	r3, r2
	beq	.L55
	cmn	r3, #465567744
	beq	.L55
	mov	r3, #0
	movt	r3, 64528
	ldr	r0, [r3, #560]
@ 112 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	rsbs	r0, r0, #1
	movcc	r0, #0
	bx	lr
.L55:
	mov	r3, #0
	movt	r3, 64528
	ldr	r0, [r3, #540]
@ 110 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	rsbs	r0, r0, #1
	movcc	r0, #0
	bx	lr
	.fnend
	.size	exynos_usb_device_phy_is_on, .-exynos_usb_device_phy_is_on
	.align	2
	.type	exynos_usb_phy_control, %function
exynos_usb_phy_control:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r3, #:lower16:samsung_cpu_id
	movt	r3, #:upper16:samsung_cpu_id
	mov	r2, #0
	movt	r2, 17186
	mov	r4, r0
	ldr	r3, [r3]
	mov	r5, r1
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmn	r3, #465567744
	cmpne	r3, r2
	bne	.L59
	tst	r0, #1
	beq	.L60
@ 264 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L61
	blx	r3
.L61:
	mov	r3, #0
	movt	r3, 65048
	str	r5, [r3, #1796]
.L60:
	tst	r4, #2
	beq	.L62
@ 267 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L63
	blx	r3
.L63:
	mov	r3, #0
	movt	r3, 65048
	str	r5, [r3, #1800]
.L62:
	tst	r4, #4
	ldmeqfd	sp!, {r3, r4, r5, pc}
@ 271 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L66
	blx	r3
.L66:
	mov	r3, #0
	movt	r3, 65048
	str	r5, [r3, #1804]
	ldmfd	sp!, {r3, r4, r5, pc}
.L59:
	tst	r0, #1
	beq	.L67
@ 275 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L68
	blx	r3
.L68:
	mov	r3, #0
	movt	r3, 65048
	str	r5, [r3, #1796]
.L67:
	tst	r4, #2
	ldmeqfd	sp!, {r3, r4, r5, pc}
@ 277 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L70
	blx	r3
.L70:
	mov	r3, #0
	movt	r3, 65048
	str	r5, [r3, #1800]
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	exynos_usb_phy_control, .-exynos_usb_phy_control
	.align	2
	.type	exynos4_usb_phy20_exit, %function
exynos4_usb_phy20_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r1, #:lower16:.LC3
	ldr	r5, [r0]
	movw	r4, #:lower16:strcmp
	mov	r6, r0
	movt	r1, #:upper16:.LC3
	movt	r4, #:upper16:strcmp
	mov	r0, r5
	blx	r4
	cmp	r0, #0
	beq	.L112
	movw	r1, #:lower16:.LC4
	mov	r0, r5
	movt	r1, #:upper16:.LC4
	blx	r4
	cmp	r0, #0
	beq	.L113
	movw	r1, #:lower16:.LC5
	mov	r0, r5
	movt	r1, #:upper16:.LC5
	blx	r4
	cmp	r0, #0
	beq	.L114
.L100:
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	ldr	r2, [r4, #8]
	cmp	r2, #0
	bne	.L115
	movw	r1, #:lower16:.LC7
	movw	r3, #:lower16:_dev_info
	add	r0, r6, #8
	movt	r1, #:upper16:.LC7
	movt	r3, #:upper16:_dev_info
	blx	r3
@ 637 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r5, #:lower16:outer_cache
	movt	r5, #:upper16:outer_cache
	ldr	r3, [r5, #28]
	cmp	r3, #0
	beq	.L104
	blx	r3
.L104:
	mov	r3, #0
	movt	r3, 65168
	ldr	r2, [r3]
@ 637 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	mov	r3, #0
	orr	r2, r2, #41
	movt	r3, 65168
	str	r2, [r3]
	ldr	r6, [r3]
@ 641 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	orr	r6, r6, #32512
	orr	r6, r6, #192
@ 645 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r5, #28]
	cmp	r3, #0
	beq	.L105
	blx	r3
.L105:
	mov	r3, #0
	mov	r0, #7
	movt	r3, 65168
	mov	r1, #0
	str	r6, [r3]
	bl	exynos_usb_phy_control
	mov	r3, #0
	mov	r0, r3
	strb	r3, [r4]
	ldmfd	sp!, {r4, r5, r6, pc}
.L112:
	movw	r3, #:lower16:_clear_bit
	mov	r0, #1
	movt	r3, #:upper16:_clear_bit
	ldr	r1, .L116
	blx	r3
	b	.L100
.L113:
	movw	r3, #:lower16:_clear_bit
	mov	r0, #2
	movt	r3, #:upper16:_clear_bit
	ldr	r1, .L116
	blx	r3
	b	.L100
.L114:
	movw	r3, #:lower16:_clear_bit
	mov	r0, #4
	movt	r3, #:upper16:_clear_bit
	ldr	r1, .L116
	blx	r3
	b	.L100
.L115:
	movw	r1, #:lower16:.LC6
	movw	r3, #:lower16:_dev_info
	add	r0, r6, #8
	movt	r1, #:upper16:.LC6
	movt	r3, #:upper16:_dev_info
	blx	r3
	mvn	r0, #15
	ldmfd	sp!, {r4, r5, r6, pc}
.L117:
	.align	2
.L116:
	.word	.LANCHOR0+8
	.fnend
	.size	exynos4_usb_phy20_exit, .-exynos4_usb_phy20_exit
	.align	2
	.type	exynos5_usb_phy20_exit, %function
exynos5_usb_phy20_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
@ 98 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/atomic.h" 1
	dmb
@ 0 "" 2
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	add	r2, r3, #12
@ 100 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub_return
1:	ldrex	r1, [r2]
	sub	r1, r1, #1
	strex	ip, r1, [r2]
	teq	ip, #0
	bne	1b
@ 0 "" 2
@ 110 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/atomic.h" 1
	dmb
@ 0 "" 2
	cmp	r1, #0
	bgt	.L137
@ 824 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r4, #:lower16:outer_cache
	movt	r4, #:upper16:outer_cache
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L121
	blx	r3
.L121:
	mov	r3, #0
	mov	r2, #112
	movt	r3, 65168
	movt	r2, 292
	str	r2, [r3, #16]
@ 825 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L122
	blx	r3
.L122:
	mov	r3, #0
	mov	r2, #112
	movt	r3, 65168
	movt	r2, 292
	str	r2, [r3, #32]
	ldr	r5, [r3]
@ 827 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	orr	r5, r5, #-2147483648
	orr	r5, r5, #113
@ 831 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L123
	blx	r3
.L123:
	mov	r3, #0
	movt	r3, 65168
	str	r5, [r3]
	ldr	r5, [r3, #56]
@ 833 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	orr	r5, r5, #11
@ 835 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L124
	blx	r3
.L124:
	mov	r3, #0
	mov	r0, #2
	movt	r3, 65168
	mov	r1, #0
	str	r5, [r3, #56]
	bl	exynos_usb_phy_control
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, pc}
.L137:
	movw	r1, #:lower16:.LC8
	movw	r3, #:lower16:_dev_info
	movt	r1, #:upper16:.LC8
	movt	r3, #:upper16:_dev_info
	add	r0, r0, #8
	blx	r3
	mvn	r0, #15
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	exynos5_usb_phy20_exit, .-exynos5_usb_phy20_exit
	.align	2
	.type	exynos_usb_dev_phy20_exit, %function
exynos_usb_dev_phy20_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:samsung_cpu_id
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movt	r3, #:upper16:samsung_cpu_id
	mov	r2, #0
	movt	r2, 17186
	mov	r4, r0
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmp	r3, r2
	beq	.L139
	cmn	r3, #465567744
	beq	.L139
	bl	exynos5_usb_phy20_exit
.L141:
	mov	r0, r4
	mov	r1, #1
	bl	exynos_usb_mux_change
	mov	r0, #0
	ldmfd	sp!, {r4, pc}
.L139:
	mov	r0, r4
	bl	exynos4_usb_phy20_exit
	b	.L141
	.fnend
	.size	exynos_usb_dev_phy20_exit, .-exynos_usb_dev_phy20_exit
	.align	2
	.type	exynos4_usb_phy20_init, %function
exynos4_usb_phy20_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r1, #:lower16:.LC3
	ldr	r6, [r0]
	movw	r4, #:lower16:strcmp
	mov	r5, r0
	movt	r1, #:upper16:.LC3
	movt	r4, #:upper16:strcmp
	mov	r0, r6
	blx	r4
	cmp	r0, #0
	beq	.L180
	movw	r1, #:lower16:.LC4
	mov	r0, r6
	movt	r1, #:upper16:.LC4
	blx	r4
	cmp	r0, #0
	beq	.L181
	movw	r1, #:lower16:.LC5
	mov	r0, r6
	movt	r1, #:upper16:.LC5
	blx	r4
	cmp	r0, #0
	beq	.L182
.L144:
	movw	r2, #:lower16:.LANCHOR0
	add	r4, r5, #8
	movt	r2, #:upper16:.LANCHOR0
	movw	r1, #:lower16:.LC9
	movw	r3, #:lower16:_dev_info
	ldr	r2, [r2, #8]
	mov	r0, r4
	movt	r1, #:upper16:.LC9
	movt	r3, #:upper16:_dev_info
	blx	r3
	mov	r3, #0
	movt	r3, 65168
	ldr	r3, [r3]
@ 100 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	tst	r3, #128
	beq	.L183
@ 563 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r4, #:lower16:outer_cache
	movt	r4, #:upper16:outer_cache
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L148
	blx	r3
.L148:
	mov	r3, #0
	mov	r0, #7
	movt	r3, 65060
	mov	r1, #1
	ldr	r2, [r3, #552]
	orr	r2, r2, #49152
	str	r2, [r3, #552]
	bl	exynos_usb_phy_control
	mov	r0, r5
	mov	r1, #1
	bl	exynos_usb_mux_change
	mov	r0, r5
	bl	exynos_usb_phy_set_clock
	bic	r0, r0, #16
	orr	r5, r0, #128
@ 583 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L149
	blx	r3
.L149:
	mov	r3, #0
	movt	r3, 65168
	str	r5, [r3, #4]
	ldr	r5, [r3]
@ 586 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	bic	r5, r5, #41
@ 587 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L150
	blx	r3
.L150:
	mov	r3, #0
	movt	r3, 65168
	str	r5, [r3]
	ldr	r5, [r3]
@ 590 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	bic	r5, r5, #32512
	bic	r5, r5, #192
@ 594 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L151
	blx	r3
.L151:
	mov	r3, #0
	movt	r3, 65168
	str	r5, [r3]
	ldr	r6, [r3, #8]
@ 597 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	orr	r7, r6, #7
@ 598 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L152
	blx	r3
.L152:
	mov	r3, #0
	movw	r0, #9956
	movt	r3, 65168
	movw	r5, #:lower16:__const_udelay
	str	r7, [r3, #8]
	movt	r0, 49
	movt	r5, #:upper16:__const_udelay
	bic	r6, r6, #7
	blx	r5
@ 601 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L153
	blx	r3
.L153:
	mov	r3, #0
	movt	r3, 65168
	str	r6, [r3, #8]
	ldr	r7, [r3, #8]
@ 604 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	orr	r6, r7, #2032
	orr	r6, r6, #8
@ 607 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L154
	blx	r3
.L154:
	mov	r3, #0
	movw	r0, #9956
	movt	r3, 65168
	movt	r0, 49
	str	r6, [r3, #8]
	bic	r7, r7, #2032
	blx	r5
	bic	r7, r7, #8
@ 612 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L155
	blx	r3
.L155:
	mov	r3, #0
	movw	r0, #14112
	movt	r3, 65168
	movt	r0, 393
	str	r7, [r3, #8]
	blx	r5
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L180:
	movw	r3, #:lower16:_set_bit
	mov	r0, #1
	movt	r3, #:upper16:_set_bit
	ldr	r1, .L184
	blx	r3
	b	.L144
.L183:
	movw	r1, #:lower16:.LC10
	movw	r3, #:lower16:dev_err
	mov	r0, r4
	movt	r1, #:upper16:.LC10
	movt	r3, #:upper16:dev_err
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L181:
	movw	r3, #:lower16:_set_bit
	mov	r0, #2
	movt	r3, #:upper16:_set_bit
	ldr	r1, .L184
	blx	r3
	b	.L144
.L182:
	movw	r3, #:lower16:_set_bit
	mov	r0, #4
	movt	r3, #:upper16:_set_bit
	ldr	r1, .L184
	blx	r3
	b	.L144
.L185:
	.align	2
.L184:
	.word	.LANCHOR0+8
	.fnend
	.size	exynos4_usb_phy20_init, .-exynos4_usb_phy20_init
	.align	2
	.type	exynos_usb_phy_clock_enable, %function
exynos_usb_phy_clock_enable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	ldr	r3, [r4, #16]
	cmp	r3, #0
	movne	r0, r3
	beq	.L193
.L187:
	movw	r3, #:lower16:clk_enable
	movt	r3, #:upper16:clk_enable
	blx	r3
	ldmfd	sp!, {r3, r4, r5, pc}
.L193:
	movw	r3, #:lower16:samsung_cpu_id
	mov	r2, #0
	movt	r3, #:upper16:samsung_cpu_id
	movt	r2, 17186
	ldr	r3, [r3]
	add	r5, r0, #8
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmp	r3, r2
	beq	.L188
	cmn	r3, #465567744
	beq	.L188
	movw	r1, #:lower16:.LC12
	movw	r3, #:lower16:clk_get
	movt	r3, #:upper16:clk_get
	mov	r0, r5
	movt	r1, #:upper16:.LC12
	blx	r3
	mov	r3, r0
	str	r3, [r4, #16]
.L190:
	cmn	r0, #4096
	bls	.L187
	movw	r1, #:lower16:.LC13
	movw	r3, #:lower16:dev_err
	mov	r0, r5
	movt	r1, #:upper16:.LC13
	movt	r3, #:upper16:dev_err
	blx	r3
	ldr	r0, [r4, #16]
	ldmfd	sp!, {r3, r4, r5, pc}
.L188:
	movw	r1, #:lower16:.LC11
	movw	r3, #:lower16:clk_get
	mov	r0, r5
	movt	r1, #:upper16:.LC11
	movt	r3, #:upper16:clk_get
	blx	r3
	str	r0, [r4, #16]
	b	.L190
	.fnend
	.size	exynos_usb_phy_clock_enable, .-exynos_usb_phy_clock_enable
	.align	2
	.type	exynos_usb_phy_clock_disable, %function
exynos_usb_phy_clock_disable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	ldr	r3, [r4, #16]
	cmp	r3, #0
	movne	r0, r3
	beq	.L201
.L195:
	movw	r3, #:lower16:clk_disable
	movt	r3, #:upper16:clk_disable
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, pc}
.L201:
	movw	r3, #:lower16:samsung_cpu_id
	mov	r2, #0
	movt	r3, #:upper16:samsung_cpu_id
	movt	r2, 17186
	ldr	r3, [r3]
	add	r5, r0, #8
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmp	r3, r2
	beq	.L196
	cmn	r3, #465567744
	beq	.L196
	movw	r1, #:lower16:.LC12
	movw	r3, #:lower16:clk_get
	movt	r3, #:upper16:clk_get
	mov	r0, r5
	movt	r1, #:upper16:.LC12
	blx	r3
	mov	r3, r0
	str	r3, [r4, #16]
.L198:
	cmn	r0, #4096
	bls	.L195
	movw	r1, #:lower16:.LC13
	movw	r3, #:lower16:dev_err
	mov	r0, r5
	movt	r1, #:upper16:.LC13
	movt	r3, #:upper16:dev_err
	blx	r3
	ldr	r0, [r4, #16]
	ldmfd	sp!, {r3, r4, r5, pc}
.L196:
	movw	r1, #:lower16:.LC11
	movw	r3, #:lower16:clk_get
	mov	r0, r5
	movt	r1, #:upper16:.LC11
	movt	r3, #:upper16:clk_get
	blx	r3
	str	r0, [r4, #16]
	b	.L198
	.fnend
	.size	exynos_usb_phy_clock_disable, .-exynos_usb_phy_clock_disable
	.align	2
	.type	exynos5_usb_phy20_init, %function
exynos5_usb_phy20_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:.LANCHOR0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movt	r3, #:upper16:.LANCHOR0
	mov	r4, r0
	add	r2, r3, #12
@ 44 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r1, [r2]
	add	r1, r1, #1
	strex	r0, r1, [r2]
	teq	r0, #0
	bne	1b
@ 0 "" 2
	mov	r3, #0
	movt	r3, 65168
	ldr	r3, [r3]
@ 124 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	tst	r3, #64
	beq	.L245
	mov	r0, r4
	mov	r1, #1
	bl	exynos_usb_mux_change
	mov	r0, #2
	mov	r1, #1
	bl	exynos_usb_phy_control
	mov	r3, #0
	movt	r3, 65168
	ldr	r8, [r3]
@ 757 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	mov	r3, #0
	bic	r8, r8, #458752
	movt	r3, 65168
	ldr	r7, [r3, #56]
@ 759 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	mov	r0, r4
	bic	r7, r7, #112
	bl	exynos_usb_phy_set_clock
	orr	r7, r7, r0, asl #4
	orr	r8, r8, r0, asl #16
	bic	r6, r7, #1664
	bic	r6, r6, #11
	orr	r6, r6, #29696
	orr	r6, r6, #4
@ 776 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r4, #:lower16:outer_cache
	movt	r4, #:upper16:outer_cache
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L205
	blx	r3
.L205:
	mov	r3, #0
	bic	r7, r7, #30208
	movt	r3, 65168
	movw	r0, #9956
	movw	r5, #:lower16:__const_udelay
	bic	r7, r7, #139
	str	r6, [r3, #56]
	movt	r0, 49
	movt	r5, #:upper16:__const_udelay
	orr	r7, r7, #1024
	blx	r5
	orr	r7, r7, #4
@ 779 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L206
	blx	r3
.L206:
	bic	r8, r8, #-2147483648
	mov	r3, #0
	bic	r6, r8, #113
	movt	r3, 65168
	orr	r6, r6, #516
	str	r7, [r3, #56]
	orr	r6, r6, #2
@ 785 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L207
	blx	r3
.L207:
	mov	r3, #0
	movw	r0, #9956
	movt	r3, 65168
	movt	r0, 49
	str	r6, [r3]
	bic	r8, r8, #119
	blx	r5
	orr	r8, r8, #512
@ 788 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L208
	blx	r3
.L208:
	mov	r3, #0
	movt	r3, 65168
	str	r8, [r3]
@ 793 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L209
	blx	r3
.L209:
	mov	r3, #0
	mov	r2, #1
	movt	r3, 65168
	movt	r2, 292
	str	r2, [r3, #16]
@ 794 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L210
	blx	r3
.L210:
	mov	r3, #0
	mov	r2, #1
	movt	r3, 65168
	movt	r2, 292
	movw	r0, #9956
	str	r2, [r3, #32]
	movt	r0, 49
	blx	r5
@ 797 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L211
	blx	r3
.L211:
	mov	r3, #0
	mov	r2, #19136512
	movt	r3, 65168
	str	r2, [r3, #16]
@ 798 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L212
	blx	r3
.L212:
	mov	r6, #0
	mov	r3, #19136512
	movt	r6, 65168
	movw	r0, #14112
	str	r3, [r6, #32]
	movt	r0, 393
	blx	r5
	ldr	r5, [r6, #48]
@ 802 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	orr	r5, r5, #1006632960
@ 805 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L213
	blx	r3
.L213:
	mov	r3, #0
	movt	r3, 65168
	str	r5, [r3, #48]
	ldr	r5, [r3, #52]
@ 807 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	orr	r5, r5, #8
@ 809 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L214
	blx	r3
.L214:
	mov	r3, #0
	mov	r0, #0
	movt	r3, 65168
	str	r5, [r3, #52]
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L245:
	movw	r1, #:lower16:.LC10
	movw	r3, #:lower16:dev_err
	add	r0, r4, #8
	movt	r1, #:upper16:.LC10
	movt	r3, #:upper16:dev_err
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
	.fnend
	.size	exynos5_usb_phy20_init, .-exynos5_usb_phy20_init
	.align	2
	.type	exynos_usb_dev_phy20_init, %function
exynos_usb_dev_phy20_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r3, #:lower16:samsung_cpu_id
	movt	r3, #:upper16:samsung_cpu_id
	mov	r2, #0
	movt	r2, 17186
	mov	r4, r0
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmp	r3, r2
	beq	.L247
	cmn	r3, #465567744
	beq	.L247
	bl	exynos5_usb_phy20_init
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L259
.L250:
	mov	r0, r4
	mov	r1, #0
	bl	exynos_usb_mux_change
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, pc}
.L247:
	mov	r0, r4
	bl	exynos4_usb_phy20_init
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L250
	mov	r3, #0
	movt	r3, 65168
	ldr	r3, [r3]
@ 325 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	mov	r3, #0
	movt	r3, 65168
	ldr	r5, [r3]
@ 331 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	orr	r5, r5, #4672
@ 336 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L251
	blx	r3
.L251:
	mov	r3, #0
	movt	r3, 65168
	str	r5, [r3]
	b	.L250
.L259:
	mov	r0, r4
	bl	exynos5_usb_phy_host_suspend
	b	.L250
	.fnend
	.size	exynos_usb_dev_phy20_init, .-exynos_usb_dev_phy20_init
	.align	2
	.global	exynos4_check_usb_op
	.type	exynos4_check_usb_op, %function
exynos4_check_usb_op:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r4, #:lower16:.LANCHOR0
	movw	r3, #:lower16:clk_enable
	movt	r4, #:upper16:.LANCHOR0
	movt	r3, #:upper16:clk_enable
	ldr	r0, [r4, #16]
	blx	r3
	cmp	r0, #0
	movne	r5, #0
	beq	.L279
	mov	r0, r5
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L279:
@ 17 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/irqflags.h" 1
		mrs	r6, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	mov	r3, #0
	movt	r3, 65168
	ldr	r7, [r3]
@ 1024 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	bl	exynos_usb_device_phy_is_on
	subs	r5, r0, #0
	beq	.L262
.L264:
	mov	r5, #1
.L263:
@ 142 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r6	@ local_irq_restore
@ 0 "" 2
	movw	r3, #:lower16:clk_disable
	ldr	r0, [r4, #16]
	movt	r3, #:upper16:clk_disable
	blx	r3
	mov	r0, r5
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L262:
	mov	r3, #0
	movt	r3, 65168
	ldr	r0, [r3]
@ 100 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ands	r0, r0, #128
	bne	.L263
	tst	r7, #4672
	beq	.L264
	movw	r3, #:lower16:set_hsic_lpa_states
	movt	r3, #:upper16:set_hsic_lpa_states
	blx	r3
@ 1083 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r7, #:lower16:outer_cache
	movt	r7, #:upper16:outer_cache
	ldr	r3, [r7, #28]
	cmp	r3, #0
	beq	.L265
	blx	r3
.L265:
	mov	r3, #0
	movt	r3, 65168
	ldr	r2, [r3]
@ 1083 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	mov	r3, #0
	orr	r2, r2, #9344
	movt	r3, 65168
	str	r2, [r3]
@ 1089 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r7, #28]
	cmp	r3, #0
	beq	.L266
	blx	r3
.L266:
	mov	r3, #0
	movt	r3, 65168
	ldr	r2, [r3]
@ 1089 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	mov	r3, #0
	orr	r2, r2, #41
	movt	r3, 65168
	mov	r0, #7
	str	r2, [r3]
	mov	r1, #0
	bl	exynos_usb_phy_control
	mov	r3, #1
	strb	r3, [r4]
	b	.L263
	.fnend
	.size	exynos4_check_usb_op, .-exynos4_check_usb_op
	.align	2
	.global	exynos_check_usb_op
	.type	exynos_check_usb_op, %function
exynos_check_usb_op:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:samsung_cpu_id
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movt	r3, #:upper16:samsung_cpu_id
	mov	r2, #0
	movt	r2, 17186
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmp	r3, r2
	beq	.L281
	cmn	r3, #465567744
	beq	.L281
	movw	r4, #:lower16:.LANCHOR0
	movw	r3, #:lower16:clk_enable
	movt	r4, #:upper16:.LANCHOR0
	movt	r3, #:upper16:clk_enable
	ldr	r0, [r4, #16]
	blx	r3
	cmp	r0, #0
	movne	r5, #0
	bne	.L292
@ 17 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/irqflags.h" 1
		mrs	r6, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	mov	r3, #0
	movt	r3, 65048
	ldr	r3, [r3, #1796]
@ 129 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	cmp	r3, #0
	beq	.L284
.L286:
	mov	r5, #1
.L285:
@ 142 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r6	@ local_irq_restore
@ 0 "" 2
	movw	r3, #:lower16:clk_disable
	ldr	r0, [r4, #16]
	movt	r3, #:upper16:clk_disable
	blx	r3
.L292:
	mov	r0, r5
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L281:
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	b	exynos4_check_usb_op
.L284:
	bl	exynos_usb_device_phy_is_on
	subs	r5, r0, #0
	bne	.L286
	mov	r3, #0
	movt	r3, 65168
	ldr	r3, [r3]
@ 124 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	tst	r3, #64
	bne	.L285
	mov	r3, #0
	movt	r3, 65168
	ldr	r3, [r3]
@ 1134 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	tst	r3, #16
	beq	.L286
	orr	r8, r3, #64
@ 1139 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r7, #:lower16:outer_cache
	movt	r7, #:upper16:outer_cache
	ldr	r2, [r7, #28]
	cmp	r2, #0
	beq	.L287
	blx	r2
.L287:
	mov	r2, #0
	movt	r2, 65168
	str	r8, [r2]
	ldr	r8, [r2, #56]
@ 1142 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	orr	r8, r8, #2
@ 1144 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r7, #28]
	cmp	r3, #0
	beq	.L288
	blx	r3
.L288:
	mov	r3, #0
	mov	r0, #2
	movt	r3, 65168
	mov	r1, #0
	str	r8, [r3, #56]
	bl	exynos_usb_phy_control
	mov	r3, #1
	strb	r3, [r4]
	b	.L285
	.fnend
	.size	exynos_check_usb_op, .-exynos_check_usb_op
	.align	2
	.global	s5p_usb_phy_suspend
	.type	s5p_usb_phy_suspend, %function
s5p_usb_phy_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:dev_get_drvdata
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movt	r3, #:upper16:dev_get_drvdata
	mov	r4, r0
	mov	r6, r1
	ldr	r0, .L326
	blx	r3
	ldr	r8, [r0, #4]
	mov	r0, r4
	bl	exynos_usb_phy_clock_enable
	cmp	r0, #0
	beq	.L323
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L323:
	movw	r0, #:lower16:.LANCHOR1
	movw	r3, #:lower16:mutex_lock
	movt	r0, #:upper16:.LANCHOR1
	movt	r3, #:upper16:mutex_lock
	blx	r3
	ldr	r7, [r4]
	movw	r1, #:lower16:.LC3
	movw	r5, #:lower16:strcmp
	movt	r1, #:upper16:.LC3
	movt	r5, #:upper16:strcmp
	mov	r0, r7
	blx	r5
	cmp	r0, #0
	beq	.L324
	movw	r1, #:lower16:.LC4
	mov	r0, r7
	movt	r1, #:upper16:.LC4
	blx	r5
	cmp	r0, #0
	beq	.L325
.L305:
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	ldr	r0, [r3, #4]
	cmp	r0, #0
	movne	r5, #0
	bne	.L306
	cmp	r6, #1
	movne	r5, r0
	bne	.L306
	movw	r3, #:lower16:samsung_cpu_id
	mov	r2, #0
	movt	r3, #:upper16:samsung_cpu_id
	movt	r2, 17186
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmp	r3, r2
	beq	.L307
	cmn	r3, #465567744
	beq	.L307
	mov	r0, r4
	bl	exynos5_usb_phy_host_suspend
	mov	r5, r0
.L306:
	movw	r0, #:lower16:.LANCHOR1
	movw	r3, #:lower16:mutex_unlock
	movt	r3, #:upper16:mutex_unlock
	movt	r0, #:upper16:.LANCHOR1
	blx	r3
	mov	r0, r4
	bl	exynos_usb_phy_clock_disable
	mov	r0, r5
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L325:
	movw	r3, #:lower16:_clear_bit
	mov	r0, #2
	movt	r3, #:upper16:_clear_bit
	ldr	r1, .L326+4
	blx	r3
	b	.L305
.L324:
	movw	r3, #:lower16:_clear_bit
	mov	r0, #1
	movt	r3, #:upper16:_clear_bit
	ldr	r1, .L326+4
	blx	r3
	b	.L305
.L307:
	movw	r1, #:lower16:.LC14
	movw	r3, #:lower16:_dev_info
	movt	r3, #:upper16:_dev_info
	movt	r1, #:upper16:.LC14
	add	r0, r4, #8
	blx	r3
	ldr	r3, [r8, #224]
	cmp	r3, #4
	beq	.L322
	movw	r5, #:lower16:outer_cache
	movt	r5, #:upper16:outer_cache
.L309:
	mov	r3, #0
	movt	r3, 65168
	ldr	r3, [r3]
@ 325 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	mov	r3, #0
	movt	r3, 65168
	ldr	r6, [r3]
@ 331 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	orr	r6, r6, #4672
@ 336 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r5, #28]
	cmp	r3, #0
	beq	.L311
	blx	r3
.L311:
	mov	r3, #0
	mov	r5, r3
	movt	r3, 65168
	str	r6, [r3]
	b	.L306
.L322:
	mov	r3, #0
	movt	r3, 65168
	ldr	r6, [r3, #4]
@ 1208 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	bic	r6, r6, #128
@ 1210 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r5, #:lower16:outer_cache
	movt	r5, #:upper16:outer_cache
	ldr	r3, [r5, #28]
	cmp	r3, #0
	beq	.L310
	blx	r3
.L310:
	mov	r3, #0
	movt	r3, 65168
	str	r6, [r3, #4]
	b	.L309
.L327:
	.align	2
.L326:
	.word	s5p_device_ohci+8
	.word	.LANCHOR0+4
	.fnend
	.size	s5p_usb_phy_suspend, .-s5p_usb_phy_suspend
	.align	2
	.global	s5p_usb_phy_resume
	.type	s5p_usb_phy_resume, %function
s5p_usb_phy_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r6, r1
	mov	r4, r0
	bl	exynos_usb_phy_clock_enable
	subs	r7, r0, #0
	beq	.L423
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L423:
	movw	r0, #:lower16:.LANCHOR1
	movw	r3, #:lower16:mutex_lock
	movw	r5, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR1
	movt	r3, #:upper16:mutex_lock
	movt	r5, #:upper16:.LANCHOR0
	blx	r3
	ldr	r0, [r5, #4]
	cmp	r0, #0
	movwne	r6, #:lower16:strcmp
	movtne	r6, #:upper16:strcmp
	beq	.L424
.L330:
	ldr	r8, [r4]
	movw	r1, #:lower16:.LC3
	movt	r1, #:upper16:.LC3
	movw	r5, #:lower16:strcmp
	movt	r5, #:upper16:strcmp
	mov	r0, r8
	blx	r6
	cmp	r0, #0
	beq	.L425
	movw	r1, #:lower16:.LC4
	mov	r0, r8
	movt	r1, #:upper16:.LC4
	blx	r5
	cmp	r0, #0
	beq	.L426
.L359:
	movw	r0, #:lower16:.LANCHOR1
	movw	r3, #:lower16:mutex_unlock
	movt	r3, #:upper16:mutex_unlock
	movt	r0, #:upper16:.LANCHOR1
	blx	r3
	mov	r0, r4
	bl	exynos_usb_phy_clock_disable
	mov	r0, r7
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L424:
	cmp	r6, #1
	movwne	r6, #:lower16:strcmp
	movne	r7, r0
	movtne	r6, #:upper16:strcmp
	bne	.L330
	movw	r3, #:lower16:samsung_cpu_id
	mov	r2, #0
	movt	r3, #:upper16:samsung_cpu_id
	movt	r2, 17186
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmp	r3, r2
	beq	.L331
	cmn	r3, #465567744
	beq	.L331
	mov	r3, #0
	movt	r3, 65168
	ldr	r3, [r3]
@ 124 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	tst	r3, #64
	bne	.L345
	mov	r3, #0
	movt	r3, 65168
	ldr	r7, [r3]
@ 682 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	bic	r7, r7, #16
@ 684 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r6, #:lower16:outer_cache
	movt	r6, #:upper16:outer_cache
	ldr	r3, [r6, #28]
	cmp	r3, #0
	beq	.L346
	blx	r3
.L346:
	mov	r3, #0
	movt	r3, 65168
	str	r7, [r3]
	ldr	r7, [r3, #16]
@ 687 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	bic	r7, r7, #16
@ 689 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r6, #28]
	cmp	r3, #0
	beq	.L347
	blx	r3
.L347:
	mov	r3, #0
	movt	r3, 65168
	str	r7, [r3, #16]
@ 690 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r6, #28]
	cmp	r3, #0
	beq	.L348
	blx	r3
.L348:
	mov	r2, #0
	movw	r3, #:lower16:.LANCHOR0
	movt	r2, 65168
	movt	r3, #:upper16:.LANCHOR0
	str	r7, [r2, #32]
	ldrb	r7, [r5]	@ zero_extendqisi2
	cmp	r7, #0
	movweq	r8, #:lower16:__const_udelay
	movteq	r8, #:upper16:__const_udelay
	beq	.L349
	movw	r8, #:lower16:__const_udelay
	mov	r7, #1
	movt	r8, #:upper16:__const_udelay
	mov	r2, #0
	strb	r2, [r3]
.L349:
	movw	r0, #14112
	movw	r6, #:lower16:strcmp
	movt	r0, 393
	movt	r6, #:upper16:strcmp
	blx	r8
	b	.L330
.L426:
	movw	r3, #:lower16:_set_bit
	mov	r0, #2
	movt	r3, #:upper16:_set_bit
	ldr	r1, .L427
	blx	r3
	b	.L359
.L425:
	movw	r3, #:lower16:_set_bit
	mov	r0, #1
	movt	r3, #:upper16:_set_bit
	ldr	r1, .L427
	blx	r3
	b	.L359
.L331:
	movw	r1, #:lower16:.LC15
	movw	r3, #:lower16:_dev_info
	movt	r1, #:upper16:.LC15
	movt	r3, #:upper16:_dev_info
	add	r0, r4, #8
	blx	r3
	mov	r3, #0
	movt	r3, 65168
	ldr	r7, [r3, #4]
@ 1243 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	orr	r7, r7, #128
@ 1245 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r6, #:lower16:outer_cache
	movt	r6, #:upper16:outer_cache
	ldr	r3, [r6, #28]
	cmp	r3, #0
	beq	.L333
	blx	r3
.L333:
	mov	r3, #0
	movt	r3, 65168
	str	r7, [r3, #4]
	ldr	r3, [r3]
@ 100 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	tst	r3, #128
	mov	r3, #0
	movt	r3, 65168
	ldr	r3, [r3]
	bne	.L334
@ 349 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	mov	r3, #0
	movt	r3, 65168
	ldr	r7, [r3]
@ 355 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	bic	r7, r7, #4672
@ 360 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r6, #28]
	cmp	r3, #0
	beq	.L335
	blx	r3
.L335:
	mov	r3, #0
	movw	r9, #:lower16:.LANCHOR0
	movt	r3, 65168
	movt	r9, #:upper16:.LANCHOR0
	str	r7, [r3]
	ldrb	r7, [r5]	@ zero_extendqisi2
	cmp	r7, #0
	beq	.L363
	movw	r1, #:lower16:.LC3
	movw	r6, #:lower16:strcmp
	movt	r1, #:upper16:.LC3
	movt	r6, #:upper16:strcmp
	ldr	r0, [r4]
	blx	r6
	subs	r5, r0, #0
	beq	.L337
	movw	r8, #:lower16:__const_udelay
	movt	r8, #:upper16:__const_udelay
.L422:
	mov	r7, #1
.L336:
	movw	r0, #14112
	movt	r0, 393
	blx	r8
	b	.L330
.L334:
@ 376 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	mov	r0, #7
	mov	r1, #1
	bl	exynos_usb_phy_control
	mov	r3, #0
	movt	r3, 65168
	ldr	r7, [r3]
@ 403 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	bic	r8, r7, #41
@ 404 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r6, #28]
	cmp	r3, #0
	beq	.L338
	blx	r3
.L338:
	mov	r3, #0
	movt	r3, 65168
	str	r8, [r3]
	ldr	r9, [r3, #8]
@ 407 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	orr	r10, r9, #7
@ 408 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r6, #28]
	cmp	r3, #0
	beq	.L339
	blx	r3
.L339:
	mov	r3, #0
	movw	r0, #9956
	movt	r3, 65168
	movw	r8, #:lower16:__const_udelay
	str	r10, [r3, #8]
	movt	r0, 49
	movt	r8, #:upper16:__const_udelay
	bic	r9, r9, #7
	blx	r8
@ 411 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r6, #28]
	cmp	r3, #0
	beq	.L340
	blx	r3
.L340:
	mov	r3, #0
	bic	r7, r7, #32512
	movt	r3, 65168
	bic	r7, r7, #233
	str	r9, [r3, #8]
@ 417 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r6, #28]
	cmp	r3, #0
	beq	.L341
	blx	r3
.L341:
	mov	r3, #0
	movt	r3, 65168
	str	r7, [r3]
	ldr	r9, [r3, #8]
@ 420 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	orr	r7, r9, #2032
	orr	r7, r7, #8
@ 423 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r6, #28]
	cmp	r3, #0
	beq	.L342
	blx	r3
.L342:
	mov	r3, #0
	movw	r0, #9956
	movt	r3, 65168
	movt	r0, 49
	str	r7, [r3, #8]
	bic	r7, r9, #2032
	blx	r8
	bic	r7, r7, #8
@ 428 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r6, #28]
	cmp	r3, #0
	beq	.L343
	blx	r3
.L343:
	mov	r3, #0
	movw	r1, #:lower16:.LC3
	movt	r3, 65168
	movw	r6, #:lower16:strcmp
	str	r7, [r3, #8]
	movt	r1, #:upper16:.LC3
	ldr	r0, [r4]
	movt	r6, #:upper16:strcmp
	blx	r6
	subs	r9, r0, #0
	bne	.L422
	movw	r3, #:lower16:set_hsic_lpa_states
	mov	r0, #1
	movt	r3, #:upper16:set_hsic_lpa_states
	mov	r7, r0
	blx	r3
	strb	r9, [r5]
	b	.L336
.L363:
	movw	r6, #:lower16:strcmp
	movw	r8, #:lower16:__const_udelay
	movt	r6, #:upper16:strcmp
	movt	r8, #:upper16:__const_udelay
	b	.L336
.L345:
	mov	r0, #2
	mov	r1, #1
	bl	exynos_usb_phy_control
	mov	r3, #0
	movt	r3, 65168
	ldr	r7, [r3, #56]
@ 700 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	bic	r9, r7, #2
	orr	r9, r9, #28672
@ 705 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r6, #:lower16:outer_cache
	movt	r6, #:upper16:outer_cache
	ldr	r3, [r6, #28]
	cmp	r3, #0
	beq	.L350
	blx	r3
.L350:
	mov	r3, #0
	movw	r0, #9956
	movt	r3, 65168
	movw	r8, #:lower16:__const_udelay
	str	r9, [r3, #56]
	movt	r0, 49
	movt	r8, #:upper16:__const_udelay
	bic	r7, r7, #28672
	blx	r8
	bic	r7, r7, #2
@ 710 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r6, #28]
	cmp	r3, #0
	beq	.L351
	blx	r3
.L351:
	mov	r3, #0
	movt	r3, 65168
	str	r7, [r3, #56]
	ldr	r7, [r3]
@ 713 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	bic	r9, r7, #80
	orr	r9, r9, #6
@ 716 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r6, #28]
	cmp	r3, #0
	beq	.L352
	blx	r3
.L352:
	mov	r3, #0
	movw	r0, #9956
	movt	r3, 65168
	movt	r0, 49
	str	r9, [r3]
	bic	r7, r7, #86
	blx	r8
@ 719 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r6, #28]
	cmp	r3, #0
	beq	.L353
	blx	r3
.L353:
	mov	r3, #0
	movt	r3, 65168
	str	r7, [r3]
	ldr	r9, [r3, #16]
@ 722 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	bic	r7, r9, #80
	orr	r7, r7, #5
@ 725 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r6, #28]
	cmp	r3, #0
	beq	.L354
	blx	r3
.L354:
	mov	r3, #0
	movt	r3, 65168
	str	r7, [r3, #16]
@ 726 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r6, #28]
	cmp	r3, #0
	beq	.L355
	blx	r3
.L355:
	mov	r3, #0
	movw	r0, #9956
	movt	r3, 65168
	movt	r0, 49
	str	r7, [r3, #32]
	bic	r9, r9, #85
	blx	r8
@ 729 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r6, #28]
	cmp	r3, #0
	beq	.L356
	blx	r3
.L356:
	mov	r3, #0
	movt	r3, 65168
	str	r9, [r3, #16]
@ 730 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r6, #28]
	cmp	r3, #0
	beq	.L357
	blx	r3
.L357:
	mov	r3, #0
	mov	r7, #1
	mov	r2, r3
	movt	r3, 65168
	str	r9, [r3, #32]
	strb	r2, [r5]
	b	.L349
.L337:
	movw	r3, #:lower16:set_hsic_lpa_states
	mov	r0, #1
	movt	r3, #:upper16:set_hsic_lpa_states
	movw	r8, #:lower16:__const_udelay
	blx	r3
	movt	r8, #:upper16:__const_udelay
	strb	r5, [r9]
	b	.L422
.L428:
	.align	2
.L427:
	.word	.LANCHOR0+4
	.fnend
	.size	s5p_usb_phy_resume, .-s5p_usb_phy_resume
	.align	2
	.global	s5p_usb_phy0_tune
	.type	s5p_usb_phy0_tune, %function
s5p_usb_phy0_tune:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	subs	r4, r0, #0
	mov	r5, r1
	bne	.L444
	mvn	r0, #0
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L444:
	movw	r0, #:lower16:.LC16
	movw	r1, #:lower16:.LANCHOR2
	movw	r6, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR2
	movt	r6, #:upper16:printk
	movt	r0, #:upper16:.LC16
	blx	r6
	mov	r3, #0
	movt	r3, 65168
	ldr	r9, [r3, #36]
@ 1272 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r7, #:lower16:.LANCHOR0
	movt	r7, #:upper16:.LANCHOR0
	ldr	r3, [r7, #20]
	cmp	r3, #0
	beq	.L445
.L431:
	movw	r0, #:lower16:.LC18
	movw	r1, #:lower16:.LANCHOR2
	movt	r1, #:upper16:.LANCHOR2
	mov	r2, r9
	movt	r0, #:upper16:.LC18
	movw	r8, #:lower16:printk
	blx	r6
	movw	r0, #:lower16:.LC19
	movw	r1, #:lower16:.LANCHOR2
	movt	r0, #:upper16:.LC19
	movt	r1, #:upper16:.LANCHOR2
	ldr	r2, [r4, #12]
	movt	r8, #:upper16:printk
	ldr	r3, [r4, #8]
	blx	r6
	ldr	r10, [r4, #12]
	cmp	r10, #0
	beq	.L432
	movw	r0, #9956
	movw	r3, #:lower16:__const_udelay
	movt	r0, 49
	movt	r3, #:upper16:__const_udelay
	ldr	r4, [r4, #8]
	blx	r3
	cmp	r5, #0
	beq	.L433
	movw	r0, #:lower16:.LC20
	movw	r1, #:lower16:.LANCHOR2
	movt	r1, #:upper16:.LANCHOR2
	ldr	r2, [r7, #20]
	movt	r0, #:upper16:.LC20
	blx	r8
@ 1291 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L434
	blx	r3
.L434:
	ldr	r2, [r7, #20]
	mov	r3, #0
	movt	r3, 65168
	str	r2, [r3, #36]
.L435:
	mov	r3, #0
	movt	r3, 65168
	ldr	r2, [r3, #36]
@ 1298 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r0, #:lower16:.LC22
	movw	r1, #:lower16:.LANCHOR2
	movt	r1, #:upper16:.LANCHOR2
	movt	r0, #:upper16:.LC22
	blx	r6
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L432:
	movw	r0, #:lower16:.LC23
	movw	r1, #:lower16:.LANCHOR2
	movt	r1, #:upper16:.LANCHOR2
	movt	r0, #:upper16:.LC23
	blx	r8
	mov	r0, r10
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L433:
	bic	r9, r9, r10
	movw	r0, #:lower16:.LC21
	orr	r4, r9, r4
	movw	r1, #:lower16:.LANCHOR2
	mov	r2, r4
	movt	r1, #:upper16:.LANCHOR2
	movt	r0, #:upper16:.LC21
	blx	r8
@ 1296 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L436
	blx	r3
.L436:
	mov	r3, #0
	movt	r3, 65168
	str	r4, [r3, #36]
	b	.L435
.L445:
	movw	r0, #:lower16:.LC17
	movw	r1, #:lower16:.LANCHOR2
	movt	r1, #:upper16:.LANCHOR2
	mov	r2, r9
	movt	r0, #:upper16:.LC17
	str	r9, [r7, #20]
	blx	r6
	b	.L431
	.fnend
	.size	s5p_usb_phy0_tune, .-s5p_usb_phy0_tune
	.align	2
	.global	set_exynos_usb_phy_tune
	.type	set_exynos_usb_phy_tune, %function
set_exynos_usb_phy_tune:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r3, #:lower16:samsung_cpu_id
	movt	r3, #:upper16:samsung_cpu_id
	mov	r2, r0
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmn	r3, #465567744
	bne	.L447
	cmp	r0, #0
	beq	.L458
	cmp	r0, #1
	ldmnefd	sp!, {r3, r4, r5, pc}
	mov	r3, #0
	movt	r3, 65168
	ldr	r5, [r3, #32]
@ 1324 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r0, #:lower16:.LC26
	movw	r4, #:lower16:printk
	mov	r2, r5
	ldr	r1, .L459
	movt	r4, #:upper16:printk
	mov	r3, #1
	movt	r0, #:upper16:.LC26
	bic	r5, r5, #14336
	blx	r4
	movw	r0, #9956
	movw	r3, #:lower16:__const_udelay
	movt	r0, 49
	movt	r3, #:upper16:__const_udelay
	orr	r5, r5, #12288
	blx	r3
@ 1331 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L451
	blx	r3
.L451:
	mov	r3, #0
	movt	r3, 65168
	str	r5, [r3, #32]
	ldr	r2, [r3, #32]
@ 1332 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r0, #:lower16:.LC27
	ldr	r1, .L459
	movt	r0, #:upper16:.LC27
	blx	r4
	ldmfd	sp!, {r3, r4, r5, pc}
.L458:
	mov	r3, #0
	movt	r3, 65168
	ldr	r5, [r3, #36]
@ 1312 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r0, #:lower16:.LC24
	movw	r4, #:lower16:printk
	mov	r2, r5
	ldr	r1, .L459
	movt	r4, #:upper16:printk
	mov	r3, #0
	movt	r0, #:upper16:.LC24
	bic	r5, r5, #14336
	blx	r4
	movw	r0, #9956
	movw	r3, #:lower16:__const_udelay
	movt	r0, 49
	movt	r3, #:upper16:__const_udelay
	orr	r5, r5, #12288
	blx	r3
@ 1319 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L449
	blx	r3
.L449:
	mov	r3, #0
	movt	r3, 65168
	str	r5, [r3, #36]
	ldr	r2, [r3, #36]
@ 1320 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r0, #:lower16:.LC25
	ldr	r1, .L459
	movt	r0, #:upper16:.LC25
	blx	r4
	ldmfd	sp!, {r3, r4, r5, pc}
.L447:
	movw	r0, #:lower16:.LC28
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L459
	movt	r0, #:upper16:.LC28
	blx	r3
	ldmfd	sp!, {r3, r4, r5, pc}
.L460:
	.align	2
.L459:
	.word	.LANCHOR2+20
	.fnend
	.size	set_exynos_usb_phy_tune, .-set_exynos_usb_phy_tune
	.align	2
	.global	s5p_usb_phy_init
	.type	s5p_usb_phy_init, %function
s5p_usb_phy_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r4, r1
	mov	r5, r0
	bl	exynos_usb_phy_clock_enable
	cmp	r0, #0
	bne	.L484
	movw	r0, #:lower16:.LANCHOR1
	movw	r3, #:lower16:mutex_lock
	movt	r0, #:upper16:.LANCHOR1
	movt	r3, #:upper16:mutex_lock
	blx	r3
	cmp	r4, #1
	beq	.L519
	cmp	r4, #0
	beq	.L520
	cmp	r4, #3
	beq	.L521
	cmp	r4, #2
	mvnne	r6, #21
	beq	.L522
.L471:
	movw	r0, #:lower16:.LANCHOR1
	movw	r3, #:lower16:mutex_unlock
	movt	r0, #:upper16:.LANCHOR1
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	mov	r0, r5
	bl	exynos_usb_phy_clock_disable
.L462:
	mov	r0, r6
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L519:
	ldr	r7, [r5]
	movw	r1, #:lower16:.LC3
	movw	r6, #:lower16:strcmp
	movt	r1, #:upper16:.LC3
	movt	r6, #:upper16:strcmp
	mov	r0, r7
	blx	r6
	cmp	r0, #0
	beq	.L523
	movw	r1, #:lower16:.LC4
	mov	r0, r7
	movt	r1, #:upper16:.LC4
	blx	r6
	cmp	r0, #0
	beq	.L524
.L467:
	movw	r3, #:lower16:samsung_cpu_id
	mov	r2, #0
	movt	r3, #:upper16:samsung_cpu_id
	movt	r2, 17186
	ldr	r3, [r3]
	mov	r0, r5
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmp	r3, r2
	beq	.L469
	cmn	r3, #465567744
	beq	.L469
	bl	exynos5_usb_phy20_init
	mov	r6, r0
	b	.L471
.L520:
	mov	r0, r5
	bl	exynos_usb_dev_phy20_init
	mov	r6, r0
	mov	r0, r4
	bl	set_exynos_usb_phy_tune
	ldr	r0, [r5, #92]
	cmp	r0, #0
	beq	.L471
	mov	r1, r4
	bl	s5p_usb_phy0_tune
	mov	r6, r0
	b	.L471
.L523:
	movw	r3, #:lower16:_set_bit
	mov	r0, r4
	movt	r3, #:upper16:_set_bit
	ldr	r1, .L525
	blx	r3
.L465:
	movw	r1, #:lower16:.LC3
	ldr	r0, [r5]
	movt	r1, #:upper16:.LC3
	blx	r6
	cmp	r0, #0
	bne	.L467
	movw	r3, #:lower16:set_hsic_lpa_states
	mov	r0, #2
	movt	r3, #:upper16:set_hsic_lpa_states
	blx	r3
	b	.L467
.L469:
	bl	exynos4_usb_phy20_init
	mov	r6, r0
	mov	r0, #1
	bl	set_exynos_usb_phy_tune
	b	.L471
.L484:
	mvn	r6, #21
	b	.L462
.L521:
	mov	r0, r5
	bl	exynos_usb_dev_phy20_init
	mov	r6, r0
	b	.L471
.L522:
	mov	r0, #1
	mov	r1, r0
	bl	exynos_usb_phy_control
@ 931 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r4, #:lower16:outer_cache
	movt	r4, #:upper16:outer_cache
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L474
	blx	r3
.L474:
	mov	r3, #0
	mov	r2, r3
	movt	r3, 65184
	str	r2, [r3, #20]
@ 932 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L475
	blx	r3
.L475:
	mov	r3, #0
	movw	r2, #59108
	movt	r3, 65184
	movt	r2, 9428
	str	r2, [r3, #28]
@ 933 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L476
	blx	r3
.L476:
	mov	r3, #0
	movw	r2, #63520
	movt	r3, 65184
	movt	r2, 1023
	str	r2, [r3, #32]
@ 934 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L477
	blx	r3
.L477:
	mov	r3, #0
	mov	r2, r3
	movt	r3, 65184
	str	r2, [r3, #52]
@ 943 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L478
	blx	r3
.L478:
	mov	r3, #0
	mov	r2, #134217728
	movt	r3, 65184
	str	r2, [r3, #4]
@ 944 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L479
	blx	r3
.L479:
	mov	r3, #0
	mov	r2, #4
	movt	r3, 65184
	str	r2, [r3, #48]
@ 951 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L480
	blx	r3
.L480:
	mov	r3, #0
	movt	r3, 65184
	ldr	r2, [r3, #28]
@ 951 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	mov	r3, #0
	orr	r2, r2, #-2147483648
	movt	r3, 65184
	str	r2, [r3, #28]
@ 959 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L481
	blx	r3
.L481:
	mov	r3, #0
	mov	r2, #64
	movt	r3, 65184
	str	r2, [r3, #8]
@ 980 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L482
	blx	r3
.L482:
	mov	r2, #0
	movw	r1, #52475
	movt	r2, 65184
	movt	r1, 24
	movw	r0, #9956
	movw	r3, #:lower16:__const_udelay
	str	r1, [r2, #16]
	movt	r0, 49
	movt	r3, #:upper16:__const_udelay
	blx	r3
@ 985 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L483
	blx	r3
.L483:
	mov	r3, #0
	movw	r2, #52473
	movt	r3, 65184
	movt	r2, 24
	str	r2, [r3, #16]
	mov	r6, #0
	b	.L471
.L524:
	movw	r3, #:lower16:_set_bit
	mov	r0, #2
	movt	r3, #:upper16:_set_bit
	ldr	r1, .L525
	blx	r3
	b	.L465
.L526:
	.align	2
.L525:
	.word	.LANCHOR0+4
	.fnend
	.size	s5p_usb_phy_init, .-s5p_usb_phy_init
	.align	2
	.global	s5p_usb_phy_exit
	.type	s5p_usb_phy_exit, %function
s5p_usb_phy_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r4, r1
	mov	r5, r0
	bl	exynos_usb_phy_clock_enable
	cmp	r0, #0
	bne	.L539
	movw	r0, #:lower16:.LANCHOR1
	movw	r3, #:lower16:mutex_lock
	movt	r0, #:upper16:.LANCHOR1
	movt	r3, #:upper16:mutex_lock
	blx	r3
	cmp	r4, #1
	beq	.L546
	cmp	r4, #0
	beq	.L538
	cmp	r4, #2
	beq	.L547
	cmp	r4, #3
	beq	.L538
	mvn	r4, #21
.L534:
	movw	r0, #:lower16:.LANCHOR1
	movw	r3, #:lower16:mutex_unlock
	movt	r0, #:upper16:.LANCHOR1
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	mov	r0, r5
	bl	exynos_usb_phy_clock_disable
.L528:
	mov	r0, r4
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L538:
	mov	r0, r5
	bl	exynos_usb_dev_phy20_exit
	mov	r4, r0
	b	.L534
.L546:
	movw	r3, #:lower16:samsung_cpu_id
	mov	r2, #0
	movt	r3, #:upper16:samsung_cpu_id
	movt	r2, 17186
	ldr	r3, [r3]
	mov	r0, r5
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmp	r3, r2
	beq	.L530
	cmn	r3, #465567744
	beq	.L530
	bl	exynos5_usb_phy20_exit
	mov	r4, r0
.L532:
	ldr	r7, [r5]
	movw	r1, #:lower16:.LC3
	movw	r6, #:lower16:strcmp
	movt	r1, #:upper16:.LC3
	movt	r6, #:upper16:strcmp
	mov	r0, r7
	blx	r6
	cmp	r0, #0
	beq	.L548
	movw	r1, #:lower16:.LC4
	mov	r0, r7
	movt	r1, #:upper16:.LC4
	blx	r6
	cmp	r0, #0
	bne	.L534
	movw	r3, #:lower16:_clear_bit
	mov	r0, #2
	movt	r3, #:upper16:_clear_bit
	ldr	r1, .L549
	blx	r3
	b	.L534
.L530:
	bl	exynos4_usb_phy20_exit
	mov	r4, r0
	b	.L532
.L539:
	mvn	r4, #21
	b	.L528
.L548:
	movw	r3, #:lower16:_clear_bit
	mov	r0, #1
	movt	r3, #:upper16:_clear_bit
	ldr	r1, .L549
	blx	r3
	b	.L534
.L547:
@ 997 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-usb-phy.c" 1
	dsb
@ 0 "" 2
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L537
	blx	r3
.L537:
	mov	r3, #0
	mov	r2, #67
	movt	r3, 65184
	mov	r0, #1
	str	r2, [r3, #8]
	mov	r1, #0
	bl	exynos_usb_phy_control
	mov	r4, #0
	b	.L534
.L550:
	.align	2
.L549:
	.word	.LANCHOR0+4
	.fnend
	.size	s5p_usb_phy_exit, .-s5p_usb_phy_exit
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	__func__.22208, %object
	.size	__func__.22208, 18
__func__.22208:
	.ascii	"s5p_usb_phy0_tune\000"
	.space	2
	.type	__func__.22225, %object
	.size	__func__.22225, 24
__func__.22225:
	.ascii	"set_exynos_usb_phy_tune\000"
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	phy_lock, %object
	.size	phy_lock, 24
phy_lock:
	.word	1
	.word	0
	.space	4
	.word	phy_lock+12
	.word	phy_lock+12
	.space	4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"xusbxti\000"
.LC1:
	.ascii	"ext_xtal\000"
	.space	3
.LC2:
	.ascii	"Failed to get reference clock\012\000"
	.space	1
.LC3:
	.ascii	"s5p-ehci\000"
	.space	3
.LC4:
	.ascii	"s5p-ohci\000"
	.space	3
.LC5:
	.ascii	"s3c-usbgadget\000"
	.space	2
.LC6:
	.ascii	"still being used(%ld)\012\000"
	.space	1
.LC7:
	.ascii	"usb host phy off\012\000"
	.space	2
.LC8:
	.ascii	"still being used\012\000"
	.space	2
.LC9:
	.ascii	"usb phy usage(%ld)\012\000"
.LC10:
	.ascii	"Already power on PHY\012\000"
	.space	2
.LC11:
	.ascii	"usbotg\000"
	.space	1
.LC12:
	.ascii	"usbhost\000"
.LC13:
	.ascii	"Failed to get phy clock\012\000"
	.space	3
.LC14:
	.ascii	"host_phy_susp\012\000"
	.space	1
.LC15:
	.ascii	"host_phy_resume\012\000"
	.space	3
.LC16:
	.ascii	"<7>usb: %s read original tune\012\000"
	.space	1
.LC17:
	.ascii	"<7>usb: %s save default phytune (0x%x)\012\000"
.LC18:
	.ascii	"<7>usb: %s original tune=0x%x\012\000"
	.space	1
.LC19:
	.ascii	"<7>usb: %s tune_mask=0x%x, tune=0x%x\012\000"
	.space	2
.LC20:
	.ascii	"<7>usb: %s set defult tune=0x%x\012\000"
	.space	3
.LC21:
	.ascii	"<7>usb: %s custom tune=0x%x\012\000"
	.space	3
.LC22:
	.ascii	"<7>usb: %s modified tune=0x%x\012\000"
	.space	1
.LC23:
	.ascii	"<7>usb: %s default tune\012\000"
	.space	3
.LC24:
	.ascii	"<7>usb: %s old phy0 tune=0x%x t=%d\012\000"
.LC25:
	.ascii	"<7>usb: %s new phy0 tune=0x%x\012\000"
	.space	1
.LC26:
	.ascii	"<7>usb: %s old phy1 tune=0x%x t=%d\012\000"
.LC27:
	.ascii	"<7>usb: %s new phy1 tune=0x%x\012\000"
	.space	1
.LC28:
	.ascii	"<7>usb: %s it is not exynos4412.(t=%d)\012\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	usb_phy_control, %object
	.size	usb_phy_control, 12
usb_phy_control:
	.space	12
	.type	host_usage, %object
	.size	host_usage, 4
host_usage:
	.space	4
	.type	phy_clk, %object
	.size	phy_clk, 4
phy_clk:
	.space	4
	.type	def_phytune.22207, %object
	.size	def_phytune.22207, 4
def_phytune.22207:
	.space	4
	.ident	"GCC: (GNU) 4.8"
