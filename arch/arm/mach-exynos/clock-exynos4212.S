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
	.file	"clock-exynos4212.c"
	.text
	.align	2
	.type	exynos4212_epll_get_rate, %function
exynos4212_epll_get_rate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #32]
	bx	lr
	.fnend
	.size	exynos4212_epll_get_rate, .-exynos4212_epll_get_rate
	.align	2
	.type	exynos4212_vpll_get_rate, %function
exynos4212_vpll_get_rate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #32]
	bx	lr
	.fnend
	.size	exynos4212_vpll_get_rate, .-exynos4212_vpll_get_rate
	.align	2
	.type	exynos4212_clock_resume, %function
exynos4212_clock_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movw	r0, #:lower16:.LANCHOR0
	movw	r4, #:lower16:s3c_pm_do_restore_core
	movt	r0, #:upper16:.LANCHOR0
	movt	r4, #:upper16:s3c_pm_do_restore_core
	mov	r1, #4
	blx	r4
	ldr	r0, .L9
	mov	r1, #4
	blx	r4
	mov	r2, #49152
	movt	r2, 65040
.L5:
	ldr	r3, [r2, #272]
	tst	r3, #536870912
	beq	.L5
	mov	r2, #49152
	movt	r2, 65040
.L7:
	ldr	r3, [r2, #288]
	tst	r3, #536870912
	beq	.L7
	ldr	r0, .L9+4
	mov	r1, #26
	blx	r4
	ldmfd	sp!, {r4, pc}
.L10:
	.align	2
.L9:
	.word	.LANCHOR0+32
	.word	.LANCHOR0+64
	.fnend
	.size	exynos4212_clock_resume, .-exynos4212_clock_resume
	.align	2
	.type	exynos4212_clock_suspend, %function
exynos4212_clock_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r5, #:lower16:.LANCHOR0
	movt	r5, #:upper16:.LANCHOR0
	movw	r4, #:lower16:s3c_pm_do_save
	movt	r4, #:upper16:s3c_pm_do_save
	add	r0, r5, #64
	mov	r1, #26
	blx	r4
	mov	r0, r5
	mov	r1, #4
	blx	r4
	add	r0, r5, #32
	mov	r1, #4
	blx	r4
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	exynos4212_clock_suspend, .-exynos4212_clock_suspend
	.align	2
	.type	exynos4212_clk_ip_isp_ctrl, %function
exynos4212_clk_ip_isp_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #51512
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65040
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4212_clk_ip_isp_ctrl, .-exynos4212_clk_ip_isp_ctrl
	.align	2
	.type	exynos4212_clk_bus_dmc0_ctrl, %function
exynos4212_clk_bus_dmc0_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	mov	r0, #1792
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65041
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4212_clk_bus_dmc0_ctrl, .-exynos4212_clk_bus_dmc0_ctrl
	.align	2
	.type	exynos4212_clk_bus_dmc1_ctrl, %function
exynos4212_clk_bus_dmc1_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #1796
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65041
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4212_clk_bus_dmc1_ctrl, .-exynos4212_clk_bus_dmc1_ctrl
	.align	2
	.type	exynos4212_clk_sclk_dmc_ctrl, %function
exynos4212_clk_sclk_dmc_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	mov	r0, #2048
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65041
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4212_clk_sclk_dmc_ctrl, .-exynos4212_clk_sclk_dmc_ctrl
	.align	2
	.type	exynos4212_clk_ip_isp1_ctrl, %function
exynos4212_clk_ip_isp1_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #34820
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65041
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4212_clk_ip_isp1_ctrl, .-exynos4212_clk_ip_isp1_ctrl
	.align	2
	.type	exynos4212_clk_ip_isp0_ctrl, %function
exynos4212_clk_ip_isp0_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	mov	r0, #34816
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65041
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4212_clk_ip_isp0_ctrl, .-exynos4212_clk_ip_isp0_ctrl
	.align	2
	.type	exynos4212_clk_ip_audio_ctrl, %function
exynos4212_clk_ip_audio_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #51516
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65040
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4212_clk_ip_audio_ctrl, .-exynos4212_clk_ip_audio_ctrl
	.align	2
	.type	exynos4212_clk_ip_dmc1_ctrl, %function
exynos4212_clk_ip_dmc1_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #2308
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65041
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4212_clk_ip_dmc1_ctrl, .-exynos4212_clk_ip_dmc1_ctrl
	.align	2
	.type	exynos4212_epll_set_rate, %function
exynos4212_epll_set_rate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r6, r0
	ldr	r3, [r0, #32]
	mov	r5, r1
	cmp	r3, r1
	beq	.L30
	ldr	r0, [r0, #12]
	cmp	r0, #0
	beq	.L22
	movw	r3, #:lower16:clk_get_rate
	movt	r3, #:upper16:clk_get_rate
	blx	r3
.L23:
	mov	r3, #13824
	movt	r3, 366
	cmp	r0, r3
	bne	.L34
	mov	r2, #49152
	mov	r3, #0
	movt	r2, 65040
	movw	r1, #:lower16:.LANCHOR1
	ldr	r0, [r2, #272]
	mov	ip, r3
	movt	r1, #:upper16:.LANCHOR1
.L28:
	ldr	r4, [r1, r3]
	movw	r2, #:lower16:.LANCHOR1
	movt	r2, #:upper16:.LANCHOR1
	add	r3, r3, #24
	cmp	r4, r5
	beq	.L35
	add	ip, ip, #1
	cmp	ip, #7
	bne	.L28
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:printk
	add	r1, r2, #168
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC1
	blx	r3
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L22:
	movw	r3, #:lower16:clk_ext_xtal_mux
	movt	r3, #:upper16:clk_ext_xtal_mux
	ldr	r0, [r3, #32]
	b	.L23
.L30:
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L35:
	add	ip, ip, ip, asl #1
	movw	r7, #4816
	movt	r7, 19
	add	r2, r2, ip, asl #3
	movw	r1, #49400
	movt	r1, 62976
	ldr	ip, [r2, #12]
	and	r1, r0, r1
	ldr	r9, [r2, #8]
	movw	r4, #60495
	ldr	r8, [r2, #16]
	movt	r4, 20164
	mov	r3, #49152
	ldr	r0, [r2, #20]
	mul	r7, r7, ip
	movt	r3, 65040
	orr	r1, r1, r9, asl #16
	mov	r2, r3
	orr	r1, r1, r8
	umull	r8, r4, r4, r7
	orr	ip, r1, ip, asl #8
	mov	r4, r4, lsr #7
	str	r4, [r3, #16]
	str	ip, [r3, #272]
	str	r0, [r3, #276]
.L26:
	ldr	r3, [r2, #272]
	tst	r3, #536870912
	beq	.L26
	str	r5, [r6, #32]
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L34:
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
	.fnend
	.size	exynos4212_epll_set_rate, .-exynos4212_epll_set_rate
	.align	2
	.type	exynos4212_vpll_set_rate, %function
exynos4212_vpll_set_rate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, [r0, #32]
	cmp	r3, r1
	beq	.L43
	mov	r2, #49152
	ldr	r4, .L48
	movt	r2, 65040
	mov	r3, #0
	ldr	r7, [r2, #288]
	ldr	r6, [r2, #292]
.L41:
	ldr	ip, [r4, r3, asl #5]
	movw	r2, #:lower16:.LANCHOR1
	mov	r5, r3, asl #5
	movt	r2, #:upper16:.LANCHOR1
	add	r3, r3, #1
	cmp	ip, r1
	beq	.L47
	cmp	r3, #10
	bne	.L41
	movw	r0, #:lower16:.LC2
	movw	r3, #:lower16:printk
	add	r1, r2, #516
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC2
	blx	r3
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L47:
	add	r2, r2, r5
	movw	ip, #49400
	ldr	r9, [r2, #200]
	movt	ip, 65024
	ldr	r8, [r2, #212]
	and	ip, r7, ip
	ldr	r5, [r2, #208]
	mov	r6, r6, lsr #16
	ldr	r4, [r2, #204]
	mov	r3, #49152
	orr	ip, ip, r9, asl #8
	movt	r3, 65040
	orr	r6, r8, r6, asl #16
	mov	r2, r3
	orr	ip, ip, r5
	orr	ip, ip, r4, asl #16
	str	ip, [r3, #288]
	str	r6, [r3, #292]
.L39:
	ldr	r3, [r2, #288]
	tst	r3, #536870912
	beq	.L39
	str	r1, [r0, #32]
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L43:
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L49:
	.align	2
.L48:
	.word	.LANCHOR1+196
	.fnend
	.size	exynos4212_vpll_set_rate, .-exynos4212_vpll_set_rate
	.align	2
	.global	exynos4212_register_clocks
	.type	exynos4212_register_clocks, %function
exynos4212_register_clocks:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L56
	movw	r3, #:lower16:exynos4_clk_sclk_fimg2d
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r9, #:lower16:exynos4_clkset_aclk_top_list
	movw	r8, #:lower16:exynos4_clkset_mout_mfc0_list
	movw	r6, #:lower16:exynos4_clkset_group_list
	movt	r6, #:upper16:exynos4_clkset_group_list
	movt	r9, #:upper16:exynos4_clkset_aclk_top_list
	movt	r8, #:upper16:exynos4_clkset_mout_mfc0_list
	ldr	r2, .L56+4
	str	r1, [r8]
	add	r8, r1, #88
	str	r1, [r9]
	movt	r3, #:upper16:exynos4_clk_sclk_fimg2d
	str	r1, [r6, #24]
	mov	r1, #0
	str	r1, [r6, #16]
	movw	r7, #:lower16:exynos4_clk_aclk_200
	mov	r6, #28
	movw	lr, #:lower16:exynos4_clk_mout_g2d0
	movt	r7, #:upper16:exynos4_clk_aclk_200
	movt	lr, #:upper16:exynos4_clk_mout_g2d0
	.pad #12
	sub	sp, sp, #12
	strh	r1, [r3, #84]	@ movhi
	strh	r6, [r3, #76]	@ movhi
	mov	r1, #4
	mov	r6, #20
	mov	r0, #512
	movw	ip, #:lower16:exynos4_clk_mout_mpll
	movt	r0, 65041
	movt	ip, #:upper16:exynos4_clk_mout_mpll
	str	r2, [sp]
	strh	r1, [r3, #86]	@ movhi
	movw	r10, #1284
	mov	r1, #1
	strh	r6, [r7, #76]	@ movhi
	strh	r6, [lr, #76]	@ movhi
	mov	r6, #12
	movt	r10, 65041
	str	r0, [ip, #72]
	strh	r1, [ip, #78]	@ movhi
	movw	fp, #49684
	strh	r6, [ip, #76]	@ movhi
	movw	r4, #:lower16:exynos4212_epll_set_rate
	ldr	ip, [sp]
	movt	fp, 65040
	str	r8, [r7, #68]
	movw	r8, #:lower16:exynos4_epll_ops
	str	r10, [r3, #80]
	movw	r10, #:lower16:exynos4212_epll_get_rate
	movt	r4, #:upper16:exynos4212_epll_set_rate
	movw	r5, #:lower16:s3c_register_clksrc
	movw	r2, #:lower16:exynos4_clk_mout_g2d1
	movt	r8, #:upper16:exynos4_epll_ops
	movt	r10, #:upper16:exynos4212_epll_get_rate
	movt	r2, #:upper16:exynos4_clk_mout_g2d1
	str	fp, [r7, #72]
	movw	r9, #:lower16:exynos4_clk_fimg2d
	strh	r1, [r7, #78]	@ movhi
	movw	fp, #:lower16:exynos4_clk_ip_dmc_ctrl
	strh	r1, [r3, #78]	@ movhi
	movw	r7, #:lower16:exynos4_vpll_ops
	str	r0, [r3, #72]
	movt	r5, #:upper16:s3c_register_clksrc
	str	r0, [lr, #72]
	movw	r3, #:lower16:exynos4212_vpll_get_rate
	strh	r1, [lr, #78]	@ movhi
	add	r6, ip, #56
	movw	lr, #:lower16:exynos4212_vpll_set_rate
	stmia	r8, {r4, r10}
	mov	r4, ip
	movt	r9, #:upper16:exynos4_clk_fimg2d
	movt	r7, #:upper16:exynos4_vpll_ops
	movt	fp, #:upper16:exynos4_clk_ip_dmc_ctrl
	movt	r3, #:upper16:exynos4212_vpll_get_rate
	movt	lr, #:upper16:exynos4212_vpll_set_rate
	str	r0, [r2, #72]
	mov	r0, #24
	strh	r1, [r2, #78]	@ movhi
	mov	r1, #8388608
	strh	r0, [r2, #76]	@ movhi
	str	fp, [r9, #44]
	str	r1, [r9, #36]
	str	r3, [r7, #4]
	str	lr, [r7]
.L52:
	ldr	r0, [r4, #4]!
	mov	r1, #1
	blx	r5
	movw	r7, #:lower16:s3c_register_clksrc
	cmp	r4, r6
	movt	r7, #:upper16:s3c_register_clksrc
	bne	.L52
	ldr	r0, .L56+8
	mov	r1, #1
	movw	r5, #:lower16:s3c_register_clocks
	movw	r4, #:lower16:s3c_disable_clocks
	blx	r7
	movt	r5, #:upper16:s3c_register_clocks
	ldr	r0, .L56+12
	mov	r1, #67
	movt	r4, #:upper16:s3c_disable_clocks
	blx	r5
	ldr	r0, .L56+16
	mov	r1, #30
	blx	r5
	ldr	r0, .L56+16
	mov	r1, #30
	blx	r4
	ldr	r0, .L56+20
	mov	r1, #1
	blx	r7
	ldr	r0, .L56+24
	mov	r1, #7
	blx	r7
	ldr	r0, .L56+28
	mov	r1, #2
	blx	r5
	ldr	r0, .L56+32
	mov	r1, #1
	blx	r4
	ldr	r0, .L56+36
	mov	r1, #1
	blx	r4
	ldr	r0, .L56+40
	mov	r1, #1
	blx	r4
	ldr	r0, .L56+44
	mov	r1, #1
	blx	r4
	ldr	ip, .L56+48
	mov	r2, #0
.L54:
	mov	r3, ip
	ldr	r1, [r3, r2]!
	add	r2, r2, #8
	cmp	r2, #48
	ldr	r0, [r3, #4]
	ldr	r3, [r1]
	bic	r3, r3, #65536
	orr	r3, r3, r0, asl #16
	str	r3, [r1]
	bne	.L54
	movw	r3, #:lower16:register_syscore_ops
	ldr	r0, .L56+52
	movt	r3, #:upper16:register_syscore_ops
	blx	r3
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L57:
	.align	2
.L56:
	.word	.LANCHOR0+272
	.word	.LANCHOR1+540
	.word	.LANCHOR0+388
	.word	.LANCHOR0+476
	.word	.LANCHOR2-3152
	.word	.LANCHOR2-1112
	.word	.LANCHOR2-1024
	.word	.LANCHOR2-408
	.word	.LANCHOR2-760
	.word	.LANCHOR2-672
	.word	.LANCHOR2-584
	.word	.LANCHOR2-496
	.word	.LANCHOR1+600
	.word	.LANCHOR0+368
	.fnend
	.size	exynos4212_register_clocks, .-exynos4212_register_clocks
	.global	exynos4212_clock_syscore_ops
	.global	exynos4212_clk_aclk_jpeg
	.global	exynos4212_clk_mout_jpeg1
	.global	exynos4212_clkset_mout_jpeg1
	.global	exynos4212_clk_mout_jpeg0
	.global	exynos4212_clk_aclk_266
	.global	exynos4212_clk_aclk_400_mcuisp
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	epll_div_4212, %object
	.size	epll_div_4212, 168
epll_div_4212:
	.word	416000000
	.word	0
	.word	104
	.word	3
	.word	1
	.word	0
	.word	408000000
	.word	0
	.word	68
	.word	2
	.word	1
	.word	0
	.word	400000000
	.word	0
	.word	100
	.word	3
	.word	1
	.word	0
	.word	200000000
	.word	0
	.word	100
	.word	3
	.word	2
	.word	0
	.word	192000000
	.word	0
	.word	64
	.word	2
	.word	2
	.word	0
	.word	180633600
	.word	0
	.word	90
	.word	3
	.word	2
	.word	20762
	.word	180000000
	.word	0
	.word	60
	.word	2
	.word	2
	.word	0
	.type	__func__.14706, %object
	.size	__func__.14706, 25
__func__.14706:
	.ascii	"exynos4212_epll_set_rate\000"
	.space	3
	.type	vpll_div_4212, %object
	.size	vpll_div_4212, 320
vpll_div_4212:
	.word	54000000
	.word	2
	.word	72
	.word	4
	.word	0
	.word	0
	.word	0
	.word	0
	.word	108000000
	.word	2
	.word	72
	.word	3
	.word	0
	.word	0
	.word	0
	.word	0
	.word	160000000
	.word	3
	.word	160
	.word	3
	.word	0
	.word	0
	.word	0
	.word	0
	.word	266000000
	.word	3
	.word	133
	.word	2
	.word	0
	.word	0
	.word	0
	.word	0
	.word	275000000
	.word	2
	.word	92
	.word	2
	.word	43692
	.word	0
	.word	0
	.word	0
	.word	300000000
	.word	2
	.word	100
	.word	2
	.word	0
	.word	0
	.word	0
	.word	0
	.word	333000000
	.word	2
	.word	111
	.word	2
	.word	0
	.word	0
	.word	0
	.word	0
	.word	350000000
	.word	3
	.word	175
	.word	2
	.word	0
	.word	0
	.word	0
	.word	0
	.word	440000000
	.word	3
	.word	110
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	533000000
	.word	3
	.word	133
	.word	1
	.word	16384
	.word	0
	.word	0
	.word	0
	.type	__func__.14729, %object
	.size	__func__.14729, 25
__func__.14729:
	.ascii	"exynos4212_vpll_set_rate\000"
	.space	3
	.type	exynos4212_sysclks, %object
	.size	exynos4212_sysclks, 56
exynos4212_sysclks:
	.word	exynos4212_clk_mout_mpll_user
	.word	exynos4212_clk_aclk_gdl_user
	.word	exynos4212_clk_aclk_gdr_user
	.word	exynos4212_clk_mout_aclk_400_mcuisp
	.word	exynos4212_clk_mout_aclk_266
	.word	exynos4212_clk_mout_aclk_200
	.word	exynos4212_clk_dout_aclk_200
	.word	exynos4212_clk_aclk_400_mcuisp
	.word	exynos4212_clk_aclk_266
	.word	exynos4212_clk_mout_jpeg0
	.word	exynos4212_clk_mout_jpeg1
	.word	exynos4212_clk_aclk_jpeg
	.word	exynos4212_clk_sclk_c2c
	.word	exynos4212_clk_aclk_c2c
	.type	exynos4x12_cmu_config, %object
	.size	exynos4x12_cmu_config, 48
exynos4x12_cmu_config:
	.word	-32486912
	.word	0
	.word	-32470528
	.word	0
	.word	-32454144
	.word	0
	.word	-32437760
	.word	0
	.word	-32421376
	.word	0
	.word	-32404992
	.word	0
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.set	.LANCHOR2,. + 8184
	.type	exynos4212_vpll_save, %object
	.size	exynos4212_vpll_save, 32
exynos4212_vpll_save:
	.word	-32456672
	.space	4
	.word	-32456416
	.space	4
	.word	-32456412
	.space	4
	.word	-32456408
	.space	4
	.type	exynos4212_epll_save, %object
	.size	exynos4212_epll_save, 32
exynos4212_epll_save:
	.word	-32456688
	.space	4
	.word	-32456432
	.space	4
	.word	-32456428
	.space	4
	.word	-32456424
	.space	4
	.type	exynos4212_clock_save, %object
	.size	exynos4212_clock_save, 208
exynos4212_clock_save:
	.word	-32436076
	.space	4
	.word	-32454344
	.space	4
	.word	-32438012
	.space	4
	.word	-32487120
	.space	4
	.word	-32470688
	.space	4
	.word	-32487680
	.space	4
	.word	-32487632
	.space	4
	.word	-32471296
	.space	4
	.word	-32471200
	.space	4
	.word	-32454832
	.space	4
	.word	-32438528
	.space	4
	.word	-32438524
	.space	4
	.word	-32438272
	.space	4
	.word	-32455320
	.space	4
	.word	-32455368
	.space	4
	.word	-32455376
	.space	4
	.word	-32455880
	.space	4
	.word	-32456136
	.space	4
	.word	-32456104
	.space	4
	.word	-32486912
	.space	4
	.word	-32470528
	.space	4
	.word	-32454144
	.space	4
	.word	-32437760
	.space	4
	.word	-32421376
	.space	4
	.word	-32419808
	.space	4
	.word	-32419804
	.space	4
	.type	exynos4212_clk_mout_mpll_user, %object
	.size	exynos4212_clk_mout_mpll_user, 88
exynos4212_clk_mout_mpll_user:
	.space	16
	.word	.LC110
	.space	48
	.word	exynos4212_clk_src_mpll_user
	.word	-32423424
	.short	24
	.short	1
	.space	8
	.type	exynos4212_clkset_aclk_200, %object
	.size	exynos4212_clkset_aclk_200, 8
exynos4212_clkset_aclk_200:
	.word	2
	.word	exynos4212_clk_aclk_200_list
	.type	exynos4212_clock_syscore_ops, %object
	.size	exynos4212_clock_syscore_ops, 20
exynos4212_clock_syscore_ops:
	.space	8
	.word	exynos4212_clock_suspend
	.word	exynos4212_clock_resume
	.space	4
	.type	exynos4212_clksrcs, %object
	.size	exynos4212_clksrcs, 88
exynos4212_clksrcs:
	.space	16
	.word	.LC13
	.space	16
	.word	16777216
	.space	4
	.word	exynos4_clksrc_mask_fsys_ctrl
	.space	20
	.word	exynos4_clkset_mout_corebus
	.word	-32456128
	.short	24
	.short	1
	.word	-32455360
	.short	20
	.short	4
	.type	exynos4212_init_clocks, %object
	.size	exynos4212_init_clocks, 4556
exynos4212_init_clocks:
	.space	16
	.word	.LC14
	.space	16
	.word	262144
	.space	4
	.word	exynos4_clk_ip_perir_ctrl
	.space	20
	.space	16
	.word	.LC15
	.space	16
	.word	128
	.space	4
	.word	exynos4_clk_ip_rightbus_ctrl
	.space	20
	.space	16
	.word	.LC16
	.space	16
	.word	64
	.space	4
	.word	exynos4_clk_ip_rightbus_ctrl
	.space	20
	.space	16
	.word	.LC17
	.space	16
	.word	32
	.space	4
	.word	exynos4_clk_ip_rightbus_ctrl
	.space	20
	.space	16
	.word	.LC18
	.space	16
	.word	4
	.space	4
	.word	exynos4_clk_ip_rightbus_ctrl
	.space	20
	.space	16
	.word	.LC19
	.space	16
	.word	1
	.space	4
	.word	exynos4212_clk_ip_isp1_ctrl
	.space	20
	.space	16
	.word	.LC20
	.space	16
	.word	-2147483648
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC21
	.space	16
	.word	1073741824
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC22
	.space	16
	.word	268435456
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC23
	.space	16
	.word	67108864
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC24
	.space	16
	.word	8388608
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC25
	.space	16
	.word	128
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC26
	.space	16
	.word	32
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC27
	.space	16
	.word	16
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC28
	.space	16
	.word	4
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC29
	.space	16
	.word	2
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC30
	.space	16
	.word	1
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC31
	.space	16
	.word	8
	.space	4
	.word	exynos4212_clk_ip_dmc1_ctrl
	.space	20
	.space	16
	.word	.LC32
	.space	16
	.word	4
	.space	4
	.word	exynos4212_clk_ip_dmc1_ctrl
	.space	20
	.space	16
	.word	.LC33
	.space	16
	.word	2
	.space	4
	.word	exynos4212_clk_ip_dmc1_ctrl
	.space	20
	.space	16
	.word	.LC34
	.space	16
	.word	1
	.space	4
	.word	exynos4212_clk_ip_dmc1_ctrl
	.space	20
	.space	16
	.word	.LC35
	.space	16
	.word	536870912
	.space	4
	.word	exynos4_clk_ip_dmc_ctrl
	.space	20
	.space	16
	.word	.LC36
	.space	16
	.word	268435456
	.space	4
	.word	exynos4_clk_ip_dmc_ctrl
	.space	20
	.space	16
	.word	.LC37
	.space	16
	.word	4194304
	.space	4
	.word	exynos4_clk_ip_dmc_ctrl
	.space	20
	.space	16
	.word	.LC38
	.space	16
	.word	2097152
	.space	4
	.word	exynos4_clk_ip_dmc_ctrl
	.space	20
	.space	16
	.word	.LC39
	.space	16
	.word	1
	.space	4
	.word	exynos4_clk_ip_dmc_ctrl
	.space	20
	.space	16
	.word	.LC40
	.space	16
	.word	8
	.space	4
	.word	exynos4212_clk_ip_audio_ctrl
	.space	20
	.space	16
	.word	.LC41
	.space	16
	.word	4
	.space	4
	.word	exynos4212_clk_ip_audio_ctrl
	.space	20
	.space	16
	.word	.LC42
	.space	16
	.word	2
	.space	4
	.word	exynos4212_clk_ip_audio_ctrl
	.space	20
	.space	16
	.word	.LC43
	.space	16
	.word	1
	.space	4
	.word	exynos4212_clk_ip_audio_ctrl
	.space	20
	.space	16
	.word	.LC44
	.space	16
	.word	512
	.space	4
	.word	exynos4_clk_ip_rightbus_ctrl
	.space	20
	.space	16
	.word	.LC45
	.space	16
	.word	8
	.space	4
	.word	exynos4_clk_ip_rightbus_ctrl
	.space	20
	.space	16
	.word	.LC46
	.space	16
	.word	1
	.space	4
	.word	exynos4_clk_ip_rightbus_ctrl
	.space	20
	.space	16
	.word	.LC47
	.space	16
	.word	64
	.space	4
	.word	exynos4_clk_ip_leftbus_ctrl
	.space	20
	.space	16
	.word	.LC48
	.space	16
	.word	16
	.space	4
	.word	exynos4_clk_ip_leftbus_ctrl
	.space	20
	.space	16
	.word	.LC49
	.space	16
	.word	1
	.space	4
	.word	exynos4_clk_ip_leftbus_ctrl
	.space	20
	.space	16
	.word	.LC50
	.space	16
	.word	33554432
	.space	4
	.word	exynos4_clk_ip_dmc_ctrl
	.space	20
	.space	16
	.word	.LC51
	.space	16
	.word	8388608
	.space	4
	.word	exynos4_clk_ip_dmc_ctrl
	.space	20
	.space	16
	.word	.LC20
	.space	16
	.word	-2147483648
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC21
	.space	16
	.word	1073741824
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC22
	.space	16
	.word	268435456
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC52
	.space	16
	.word	134217728
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC23
	.space	16
	.word	67108864
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC53
	.space	16
	.word	33554432
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC54
	.space	16
	.word	16777216
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC24
	.space	16
	.word	8388608
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC55
	.space	16
	.word	262144
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC56
	.space	16
	.word	131072
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC57
	.space	16
	.word	65536
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC58
	.space	16
	.word	32768
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC59
	.space	16
	.word	16384
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC60
	.space	16
	.word	4096
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC61
	.space	16
	.word	2048
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC25
	.space	16
	.word	128
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC62
	.space	16
	.word	32
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC27
	.space	16
	.word	16
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC63
	.space	16
	.word	8
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC64
	.space	16
	.word	4
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC65
	.space	16
	.word	2
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC66
	.space	16
	.word	1
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC67
	.space	16
	.word	8192
	.space	4
	.word	exynos4212_clk_ip_isp1_ctrl
	.space	20
	.space	16
	.word	.LC68
	.space	16
	.word	4096
	.space	4
	.word	exynos4212_clk_ip_isp1_ctrl
	.space	20
	.space	16
	.word	.LC69
	.space	16
	.word	1
	.space	4
	.word	exynos4212_clk_ip_isp1_ctrl
	.space	20
	.space	16
	.word	.LC70
	.space	16
	.word	1024
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC71
	.space	16
	.word	512
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC72
	.space	16
	.word	256
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC73
	.space	16
	.word	16
	.space	4
	.word	exynos4212_clk_ip_isp1_ctrl
	.space	20
	.type	exynos4212_init_clocks_off, %object
	.size	exynos4212_init_clocks_off, 2040
exynos4212_init_clocks_off:
	.space	16
	.word	.LC74
	.space	16
	.word	524288
	.space	4
	.word	exynos4_clk_ip_cam_ctrl
	.space	20
	.space	16
	.word	.LC75
	.space	16
	.word	8
	.space	4
	.word	exynos4_clk_ip_leftbus_ctrl
	.space	20
	.space	12
	.word	exynos4_clk_aclk_133
	.word	.LC76
	.space	16
	.word	1024
	.space	4
	.word	exynos4_clk_ip_fsys_ctrl
	.space	20
	.space	16
	.word	.LC77
	.space	16
	.word	3145728
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC78
	.space	16
	.word	8
	.space	4
	.word	exynos4_clk_ip_gps_ctrl
	.space	20
	.space	16
	.word	.LC79
	.space	16
	.word	4
	.space	4
	.word	exynos4_clk_ip_gps_ctrl
	.space	20
	.space	16
	.word	.LC80
	.word	.LC81
	.space	12
	.word	16777216
	.space	4
	.word	exynos4_clk_ip_dmc_ctrl
	.space	20
	.space	16
	.word	.LC80
	.word	.LC82
	.space	12
	.word	16
	.space	4
	.word	exynos4212_clk_ip_isp1_ctrl
	.space	20
	.space	16
	.word	.LC80
	.word	.LC83
	.space	12
	.word	4096
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC80
	.word	.LC84
	.space	12
	.word	2048
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC80
	.word	.LC85
	.space	12
	.word	256
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC80
	.word	.LC86
	.space	12
	.word	512
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC80
	.word	.LC87
	.space	12
	.word	1024
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC80
	.word	.LC88
	.space	12
	.word	16
	.space	4
	.word	exynos4212_clk_ip_isp1_ctrl
	.space	20
	.space	16
	.word	.LC89
	.space	16
	.word	1073741824
	.space	4
	.word	exynos4_clk_ip_dmc_ctrl
	.space	20
	.space	16
	.word	.LC90
	.word	.LC91
	.space	12
	.word	-1946157056
	.space	4
	.word	exynos4_clk_ip_dmc_ctrl
	.space	20
	.space	16
	.word	.LC92
	.space	16
	.word	256
	.space	4
	.word	exynos4212_clk_sclk_dmc_ctrl
	.space	20
	.space	16
	.word	.LC93
	.space	16
	.word	1207959552
	.space	4
	.word	exynos4212_clk_bus_dmc1_ctrl
	.space	20
	.space	16
	.word	.LC94
	.space	16
	.word	23068672
	.space	4
	.word	exynos4212_clk_bus_dmc0_ctrl
	.space	20
	.space	16
	.word	.LC52
	.space	16
	.word	134217728
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC53
	.space	16
	.word	33554432
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC54
	.space	16
	.word	16777216
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC55
	.space	16
	.word	262144
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC56
	.space	16
	.word	131072
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC57
	.space	16
	.word	65536
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC58
	.space	16
	.word	32768
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC59
	.space	16
	.word	16384
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC63
	.space	16
	.word	8
	.space	4
	.word	exynos4212_clk_ip_isp0_ctrl
	.space	20
	.space	16
	.word	.LC67
	.space	16
	.word	8192
	.space	4
	.word	exynos4212_clk_ip_isp1_ctrl
	.space	20
	.space	16
	.word	.LC68
	.space	16
	.word	4096
	.space	4
	.word	exynos4212_clk_ip_isp1_ctrl
	.space	20
	.type	exynos4212_clk_isp_srcs_div0, %object
	.size	exynos4212_clk_isp_srcs_div0, 88
exynos4212_clk_isp_srcs_div0:
	.space	12
	.word	exynos4212_clk_aclk_400_mcuisp
	.word	.LC10
	.space	48
	.space	12
	.word	-32406780
	.short	4
	.short	3
	.type	exynos4212_clk_isp_srcs, %object
	.size	exynos4212_clk_isp_srcs, 616
exynos4212_clk_isp_srcs:
	.space	12
	.word	exynos4212_clk_isp_srcs_div0
	.word	.LC3
	.space	48
	.space	12
	.word	-32406780
	.short	8
	.short	3
	.space	12
	.word	exynos4_clk_aclk_200
	.word	.LC4
	.space	48
	.space	12
	.word	-32406784
	.short	0
	.short	3
	.space	12
	.word	exynos4_clk_aclk_200
	.word	.LC5
	.space	48
	.space	12
	.word	-32406784
	.short	4
	.short	3
	.space	16
	.word	.LC6
	.space	16
	.word	8
	.space	4
	.word	exynos4212_clk_ip_isp_ctrl
	.space	20
	.word	exynos4_clkset_group
	.word	-32456136
	.short	12
	.short	4
	.word	-32455368
	.short	28
	.short	4
	.space	16
	.word	.LC7
	.space	16
	.word	4
	.space	4
	.word	exynos4212_clk_ip_isp_ctrl
	.space	20
	.word	exynos4_clkset_group
	.word	-32456136
	.short	8
	.short	4
	.word	-32455368
	.short	16
	.short	12
	.space	16
	.word	.LC8
	.space	16
	.word	2
	.space	4
	.word	exynos4212_clk_ip_isp_ctrl
	.space	20
	.word	exynos4_clkset_group
	.word	-32456136
	.short	4
	.short	4
	.word	-32455368
	.short	4
	.short	12
	.space	16
	.word	.LC9
	.space	16
	.word	1
	.space	4
	.word	exynos4212_clk_ip_isp_ctrl
	.space	20
	.word	exynos4_clkset_group
	.word	-32456136
	.short	0
	.short	4
	.word	-32455368
	.short	0
	.short	4
	.type	exynos4212_clk_isp, %object
	.size	exynos4212_clk_isp, 136
exynos4212_clk_isp:
	.space	12
	.word	exynos4212_clk_aclk_400_mcuisp
	.word	.LC11
	.space	48
	.space	12
	.word	exynos4_clk_aclk_200
	.word	.LC12
	.space	48
	.type	exynos4212_clk_aclk_c2c, %object
	.size	exynos4212_clk_aclk_c2c, 88
exynos4212_clk_aclk_c2c:
	.space	12
	.word	exynos4212_clk_sclk_c2c
	.word	.LC95
	.space	4
	.word	-1
	.space	40
	.space	12
	.word	-32439036
	.short	12
	.short	3
	.type	exynos4212_clk_sclk_c2c, %object
	.size	exynos4212_clk_sclk_c2c, 88
exynos4212_clk_sclk_c2c:
	.space	16
	.word	.LC96
	.space	4
	.word	-1
	.space	40
	.word	exynos4212_clkset_sclk_c2c
	.word	-32439808
	.short	0
	.short	1
	.word	-32439036
	.short	4
	.short	3
	.type	exynos4212_clkset_sclk_c2c, %object
	.size	exynos4212_clkset_sclk_c2c, 8
exynos4212_clkset_sclk_c2c:
	.word	2
	.word	exynos4212_clkset_c2c_list
	.type	exynos4212_clkset_c2c_list, %object
	.size	exynos4212_clkset_c2c_list, 8
exynos4212_clkset_c2c_list:
	.word	exynos4_clk_mout_mpll
	.word	exynos4_clk_sclk_apll
	.type	exynos4212_clk_aclk_jpeg, %object
	.size	exynos4212_clk_aclk_jpeg, 88
exynos4212_clk_aclk_jpeg:
	.space	16
	.word	.LC97
	.space	48
	.word	exynos4212_clkset_mout_jpeg
	.word	-32456104
	.short	8
	.short	1
	.word	-32455320
	.short	0
	.short	4
	.type	exynos4212_clkset_mout_jpeg, %object
	.size	exynos4212_clkset_mout_jpeg, 8
exynos4212_clkset_mout_jpeg:
	.word	2
	.word	exynos4212_clkset_mout_jpeg_list
	.type	exynos4212_clkset_mout_jpeg_list, %object
	.size	exynos4212_clkset_mout_jpeg_list, 8
exynos4212_clkset_mout_jpeg_list:
	.word	exynos4212_clk_mout_jpeg0
	.word	exynos4212_clk_mout_jpeg1
	.type	exynos4212_clk_mout_jpeg1, %object
	.size	exynos4212_clk_mout_jpeg1, 88
exynos4212_clk_mout_jpeg1:
	.space	16
	.word	.LC98
	.space	48
	.word	exynos4212_clkset_mout_jpeg1
	.word	-32456104
	.short	4
	.short	1
	.space	8
	.type	exynos4212_clkset_mout_jpeg1, %object
	.size	exynos4212_clkset_mout_jpeg1, 8
exynos4212_clkset_mout_jpeg1:
	.word	2
	.word	exynos4212_clkset_mout_jpeg1_list
	.type	exynos4212_clkset_mout_jpeg1_list, %object
	.size	exynos4212_clkset_mout_jpeg1_list, 8
exynos4212_clkset_mout_jpeg1_list:
	.word	exynos4_clk_mout_epll
	.word	exynos4_clk_sclk_vpll
	.type	exynos4212_clk_mout_jpeg0, %object
	.size	exynos4212_clk_mout_jpeg0, 88
exynos4212_clk_mout_jpeg0:
	.space	16
	.word	.LC99
	.space	48
	.word	exynos4212_clkset_mout_jpeg0
	.word	-32456104
	.short	0
	.short	1
	.space	8
	.type	exynos4212_clkset_mout_jpeg0, %object
	.size	exynos4212_clkset_mout_jpeg0, 8
exynos4212_clkset_mout_jpeg0:
	.word	2
	.word	exynos4212_clkset_mout_jpeg0_list
	.type	exynos4212_clkset_mout_jpeg0_list, %object
	.size	exynos4212_clkset_mout_jpeg0_list, 8
exynos4212_clkset_mout_jpeg0_list:
	.word	exynos4212_clk_mout_mpll_user
	.word	exynos4_clk_sclk_apll
	.type	exynos4212_clk_aclk_200_list, %object
	.size	exynos4212_clk_aclk_200_list, 8
exynos4212_clk_aclk_200_list:
	.word	clk_ext_xtal_mux
	.word	exynos4212_clk_dout_aclk_200
	.type	exynos4212_clk_aclk_266, %object
	.size	exynos4212_clk_aclk_266, 88
exynos4212_clk_aclk_266:
	.space	16
	.word	.LC100
	.space	48
	.word	exynos4212_clkset_aclk_266
	.word	-32456172
	.short	16
	.short	1
	.space	8
	.type	exynos4212_clkset_aclk_266, %object
	.size	exynos4212_clkset_aclk_266, 8
exynos4212_clkset_aclk_266:
	.word	2
	.word	exynos4212_clk_aclk_266_list
	.type	exynos4212_clk_aclk_266_list, %object
	.size	exynos4212_clk_aclk_266_list, 8
exynos4212_clk_aclk_266_list:
	.word	clk_ext_xtal_mux
	.word	exynos4212_clk_dout_aclk_266
	.type	exynos4212_clk_aclk_400_mcuisp, %object
	.size	exynos4212_clk_aclk_400_mcuisp, 88
exynos4212_clk_aclk_400_mcuisp:
	.space	16
	.word	.LC101
	.space	48
	.word	exynos4212_clkset_aclk_400_mcuisp
	.word	-32456172
	.short	24
	.short	1
	.space	8
	.type	exynos4212_clkset_aclk_400_mcuisp, %object
	.size	exynos4212_clkset_aclk_400_mcuisp, 8
exynos4212_clkset_aclk_400_mcuisp:
	.word	2
	.word	exynos4212_clk_aclk_400_mcuisp_list
	.type	exynos4212_clk_aclk_400_mcuisp_list, %object
	.size	exynos4212_clk_aclk_400_mcuisp_list, 8
exynos4212_clk_aclk_400_mcuisp_list:
	.word	clk_ext_xtal_mux
	.word	exynos4212_clk_dout_aclk_400_mcuisp
	.type	exynos4212_clk_dout_aclk_400_mcuisp, %object
	.size	exynos4212_clk_dout_aclk_400_mcuisp, 88
exynos4212_clk_dout_aclk_400_mcuisp:
	.space	12
	.word	exynos4212_clk_mout_aclk_400_mcuisp
	.word	.LC102
	.space	48
	.space	12
	.word	-32455408
	.short	24
	.short	3
	.type	exynos4212_clk_mout_aclk_400_mcuisp, %object
	.size	exynos4212_clk_mout_aclk_400_mcuisp, 88
exynos4212_clk_mout_aclk_400_mcuisp:
	.space	16
	.word	.LC103
	.space	48
	.word	exynos4_clkset_aclk
	.word	-32456172
	.short	8
	.short	1
	.space	8
	.type	exynos4212_clk_dout_aclk_200, %object
	.size	exynos4212_clk_dout_aclk_200, 88
exynos4212_clk_dout_aclk_200:
	.space	12
	.word	exynos4212_clk_mout_aclk_200
	.word	.LC104
	.space	48
	.space	12
	.word	-32455408
	.short	0
	.short	3
	.type	exynos4212_clk_mout_aclk_200, %object
	.size	exynos4212_clk_mout_aclk_200, 88
exynos4212_clk_mout_aclk_200:
	.space	16
	.word	.LC105
	.space	48
	.word	exynos4_clkset_aclk
	.word	-32456176
	.short	12
	.short	1
	.space	8
	.type	exynos4212_clk_dout_aclk_266, %object
	.size	exynos4212_clk_dout_aclk_266, 88
exynos4212_clk_dout_aclk_266:
	.space	12
	.word	exynos4212_clk_mout_aclk_266
	.word	.LC106
	.space	48
	.space	12
	.word	-32455408
	.short	20
	.short	3
	.type	exynos4212_clk_mout_aclk_266, %object
	.size	exynos4212_clk_mout_aclk_266, 88
exynos4212_clk_mout_aclk_266:
	.space	16
	.word	.LC107
	.space	48
	.word	exynos4_clkset_aclk
	.word	-32456172
	.short	4
	.short	1
	.space	8
	.type	exynos4212_clk_aclk_gdr_user, %object
	.size	exynos4212_clk_aclk_gdr_user, 88
exynos4212_clk_aclk_gdr_user:
	.space	16
	.word	.LC108
	.space	48
	.word	exynos4212_clkset_aclk_lrbus_user
	.word	-32472576
	.short	4
	.short	1
	.space	8
	.type	exynos4212_clk_aclk_gdl_user, %object
	.size	exynos4212_clk_aclk_gdl_user, 88
exynos4212_clk_aclk_gdl_user:
	.space	16
	.word	.LC109
	.space	48
	.word	exynos4212_clkset_aclk_lrbus_user
	.word	-32488960
	.short	4
	.short	1
	.space	8
	.type	exynos4212_clkset_aclk_lrbus_user, %object
	.size	exynos4212_clkset_aclk_lrbus_user, 8
exynos4212_clkset_aclk_lrbus_user:
	.word	2
	.word	exynos4212_clkset_aclk_lrbus_user_list
	.type	exynos4212_clkset_aclk_lrbus_user_list, %object
	.size	exynos4212_clkset_aclk_lrbus_user_list, 8
exynos4212_clkset_aclk_lrbus_user_list:
	.word	clk_ext_xtal_mux
	.word	exynos4_clk_mout_mpll
	.type	exynos4212_clk_src_mpll_user, %object
	.size	exynos4212_clk_src_mpll_user, 8
exynos4212_clk_src_mpll_user:
	.word	2
	.word	exynos4212_clk_src_mpll_user_list
	.type	exynos4212_clk_src_mpll_user_list, %object
	.size	exynos4212_clk_src_mpll_user_list, 8
exynos4212_clk_src_mpll_user_list:
	.word	clk_ext_xtal_mux
	.word	exynos4_clk_mout_mpll
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>Invalid Clock : recommended clock is 24MHz.\012\000"
.LC1:
	.ascii	"<3>%s: Invalid Clock EPLL Frequency\012\000"
	.space	3
.LC2:
	.ascii	"<3>%s: Invalid Clock VPLL Frequency\012\000"
	.space	3
.LC3:
	.ascii	"sclk_mcuisp_div1\000"
	.space	3
.LC4:
	.ascii	"sclk_aclk_div0\000"
	.space	1
.LC5:
	.ascii	"sclk_aclk_div1\000"
	.space	1
.LC6:
	.ascii	"sclk_uart_isp\000"
	.space	2
.LC7:
	.ascii	"sclk_spi1_isp\000"
	.space	2
.LC8:
	.ascii	"sclk_spi0_isp\000"
	.space	2
.LC9:
	.ascii	"sclk_pwm_isp\000"
	.space	3
.LC10:
	.ascii	"sclk_mcuisp_div0\000"
	.space	3
.LC11:
	.ascii	"aclk_400_mcuisp_muxed\000"
	.space	2
.LC12:
	.ascii	"aclk_200_muxed\000"
	.space	1
.LC13:
	.ascii	"sclk_mipihsi\000"
	.space	3
.LC14:
	.ascii	"cmu_isp\000"
.LC15:
	.ascii	"async_maudiox\000"
	.space	2
.LC16:
	.ascii	"async_mfcr\000"
	.space	1
.LC17:
	.ascii	"async_fsysd\000"
.LC18:
	.ascii	"async_camx\000"
	.space	1
.LC19:
	.ascii	"async_axim\000"
	.space	1
.LC20:
	.ascii	"uart_isp\000"
	.space	3
.LC21:
	.ascii	"wdt_isp\000"
.LC22:
	.ascii	"pwm_isp\000"
.LC23:
	.ascii	"i2c1_isp\000"
	.space	3
.LC24:
	.ascii	"mcuctl_isp\000"
	.space	1
.LC25:
	.ascii	"gic_isp\000"
.LC26:
	.ascii	"mcuisp\000"
	.space	1
.LC27:
	.ascii	"lite1\000"
	.space	2
.LC28:
	.ascii	"fimc_fd\000"
.LC29:
	.ascii	"fimc_drc\000"
	.space	3
.LC30:
	.ascii	"fimc_isp\000"
	.space	3
.LC31:
	.ascii	"tzasc_lr\000"
	.space	3
.LC32:
	.ascii	"tzasc_lw\000"
	.space	3
.LC33:
	.ascii	"tzasc_rr\000"
	.space	3
.LC34:
	.ascii	"tzasc_rw\000"
	.space	3
.LC35:
	.ascii	"qegdl\000"
	.space	2
.LC36:
	.ascii	"async_cpu_xiur\000"
	.space	1
.LC37:
	.ascii	"async_gdr\000"
	.space	2
.LC38:
	.ascii	"async_gdl\000"
	.space	2
.LC39:
	.ascii	"drex2\000"
	.space	2
.LC40:
	.ascii	"i2s0\000"
	.space	3
.LC41:
	.ascii	"pcm0\000"
	.space	3
.LC42:
	.ascii	"imem\000"
	.space	3
.LC43:
	.ascii	"audioss\000"
.LC44:
	.ascii	"async_ispmx\000"
.LC45:
	.ascii	"async_lcd0x\000"
.LC46:
	.ascii	"gpio_right\000"
	.space	1
.LC47:
	.ascii	"async_g3d\000"
	.space	2
.LC48:
	.ascii	"async_mfcl\000"
	.space	1
.LC49:
	.ascii	"gpio_left\000"
	.space	2
.LC50:
	.ascii	"qeg2d_acp\000"
	.space	2
.LC51:
	.ascii	"g2d_acp\000"
.LC52:
	.ascii	"mtcadc\000"
	.space	1
.LC53:
	.ascii	"i2c0_isp\000"
	.space	3
.LC54:
	.ascii	"mpwm_isp\000"
	.space	3
.LC55:
	.ascii	"qelite1\000"
.LC56:
	.ascii	"qelite0\000"
.LC57:
	.ascii	"qefd\000"
	.space	3
.LC58:
	.ascii	"qedrc\000"
	.space	2
.LC59:
	.ascii	"qeisp\000"
	.space	2
.LC60:
	.ascii	"sysmmu_lite1\000"
	.space	3
.LC61:
	.ascii	"sysmmu_lite0\000"
	.space	3
.LC62:
	.ascii	"mcu_isp\000"
.LC63:
	.ascii	"lite0\000"
	.space	2
.LC64:
	.ascii	"fd\000"
	.space	1
.LC65:
	.ascii	"drc\000"
.LC66:
	.ascii	"isp\000"
.LC67:
	.ascii	"spi1_isp\000"
	.space	3
.LC68:
	.ascii	"spi0_isp\000"
	.space	3
.LC69:
	.ascii	"aync_caxim\000"
	.space	1
.LC70:
	.ascii	"sysmmu_fd\000"
	.space	2
.LC71:
	.ascii	"sysmmu_drc\000"
	.space	1
.LC72:
	.ascii	"sysmmu_isp\000"
	.space	1
.LC73:
	.ascii	"sysmmu_ispcx\000"
	.space	3
.LC74:
	.ascii	"qejpeg\000"
	.space	1
.LC75:
	.ascii	"async_tvx\000"
	.space	2
.LC76:
	.ascii	"mipihsi\000"
.LC77:
	.ascii	"ppmuisp\000"
.LC78:
	.ascii	"qegps\000"
	.space	2
.LC79:
	.ascii	"ppmugps\000"
.LC80:
	.ascii	"sysmmu\000"
	.space	1
.LC81:
	.ascii	"s5p-sysmmu.15\000"
	.space	2
.LC82:
	.ascii	"s5p-sysmmu.22\000"
	.space	2
.LC83:
	.ascii	"s5p-sysmmu.21\000"
	.space	2
.LC84:
	.ascii	"s5p-sysmmu.20\000"
	.space	2
.LC85:
	.ascii	"s5p-sysmmu.16\000"
	.space	2
.LC86:
	.ascii	"s5p-sysmmu.17\000"
	.space	2
.LC87:
	.ascii	"s5p-sysmmu.18\000"
	.space	2
.LC88:
	.ascii	"s5p-sysmmu.19\000"
	.space	2
.LC89:
	.ascii	"qec2c\000"
	.space	2
.LC90:
	.ascii	"c2c\000"
.LC91:
	.ascii	"samsung-c2c\000"
.LC92:
	.ascii	"sclk_c2c_off\000"
	.space	3
.LC93:
	.ascii	"pclk_c2c_off\000"
	.space	3
.LC94:
	.ascii	"aclk_c2c_off\000"
	.space	3
.LC95:
	.ascii	"aclk_c2c\000"
	.space	3
.LC96:
	.ascii	"sclk_c2c\000"
	.space	3
.LC97:
	.ascii	"aclk_clk_jpeg\000"
	.space	2
.LC98:
	.ascii	"mout_jpeg1\000"
	.space	1
.LC99:
	.ascii	"mout_jpeg0\000"
	.space	1
.LC100:
	.ascii	"aclk_266\000"
	.space	3
.LC101:
	.ascii	"aclk_400_mcuisp\000"
.LC102:
	.ascii	"dout_aclk_400_mcuisp\000"
	.space	3
.LC103:
	.ascii	"mout_aclk_400_mcuisp\000"
	.space	3
.LC104:
	.ascii	"dout_aclk_200\000"
	.space	2
.LC105:
	.ascii	"mout_aclk_200\000"
	.space	2
.LC106:
	.ascii	"dout_aclk_266\000"
	.space	2
.LC107:
	.ascii	"mout_aclk_266\000"
	.space	2
.LC108:
	.ascii	"aclk_gdr_user\000"
	.space	2
.LC109:
	.ascii	"aclk_gdl_user\000"
	.space	2
.LC110:
	.ascii	"mout_mpll_user\000"
	.ident	"GCC: (GNU) 4.8"
