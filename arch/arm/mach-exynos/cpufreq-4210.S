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
	.file	"cpufreq-4210.c"
	.text
	.align	2
	.type	set_clkdiv, %function
set_clkdiv:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5}
	.save {r4, r5}
	movw	r1, #:lower16:.LANCHOR0
	mov	r4, r0, asl #3
	movt	r1, #:upper16:.LANCHOR0
	mov	r2, #16384
	add	r1, r1, r4
	movt	r2, 65041
	ldr	r3, [r1, #4]
	mov	ip, r2
	str	r3, [r2, #1280]
.L3:
	ldr	r1, [ip, #1536]
	movw	r3, #4369
	movt	r3, 273
	mov	r2, #16384
	movt	r2, 65041
	and	r3, r1, r3
	cmp	r3, #0
	bne	.L3
	movw	r3, #:lower16:.LANCHOR1
	ldr	r5, [r2, #1284]
	movt	r3, #:upper16:.LANCHOR1
	mov	r1, r2
	ldr	ip, [r3, r0, asl #3]
	add	r3, r3, r4
	ldr	r0, [r3, #4]
	bic	r3, r5, #119
	orr	r3, r3, ip, asl #4
	orr	r3, r3, r0
	str	r3, [r2, #1284]
.L5:
	ldr	r3, [r1, #1540]
	tst	r3, #17
	bne	.L5
	ldmfd	sp!, {r4, r5}
	bx	lr
	.fnend
	.size	set_clkdiv, .-set_clkdiv
	.align	2
	.global	exynos4210_pms_change
	.type	exynos4210_pms_change, %function
exynos4210_pms_change:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	add	r1, r3, r1, asl #2
	add	r0, r3, r0, asl #2
	ldr	r3, [r1, #48]
	ldr	r2, [r0, #48]
	mov	r3, r3, lsr #8
	cmp	r3, r2, lsr #8
	moveq	r0, #0
	movne	r0, #1
	bx	lr
	.fnend
	.size	exynos4210_pms_change, .-exynos4210_pms_change
	.align	2
	.type	set_apll, %function
set_apll:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r4, #:lower16:.LANCHOR2
	movt	r4, #:upper16:.LANCHOR2
	movw	r5, #:lower16:clk_set_parent
	mov	r6, r0
	movt	r5, #:upper16:clk_set_parent
	ldr	r1, [r4, #4]
	ldr	r0, [r4]
	blx	r5
	cmp	r0, #0
	bne	.L23
.L9:
	mov	r1, #16384
	movt	r1, 65041
.L11:
	ldr	r2, [r1, #1024]
	mov	r3, #16384
	movt	r3, 65041
	ubfx	r2, r2, #16, #3
	cmp	r2, #2
	bne	.L11
	movw	r2, #:lower16:.LANCHOR1
	movw	r1, #7200
	movt	r2, #:upper16:.LANCHOR1
	str	r1, [r3]
	add	r2, r2, r6, asl #2
	ldr	ip, [r3, #256]
	movw	r1, #49400
	ldr	r0, [r2, #48]
	movt	r1, 64512
	and	r1, ip, r1
	mov	r2, r3
	orr	r1, r1, r0
	str	r1, [r3, #256]
.L13:
	ldr	r3, [r2, #256]
	tst	r3, #536870912
	beq	.L13
	ldr	r0, [r4]
	movw	r6, #:lower16:.LANCHOR2
	ldr	r1, [r4, #8]
	movt	r6, #:upper16:.LANCHOR2
	blx	r5
	cmp	r0, #0
	bne	.L24
.L14:
	mov	r2, #16384
	movt	r2, 65041
.L16:
	ldr	r3, [r2, #1024]
	and	r3, r3, #458752
	cmp	r3, #65536
	bne	.L16
	ldmfd	sp!, {r4, r5, r6, pc}
.L23:
	ldr	r1, [r4, #4]
	movw	r0, #:lower16:.LC0
	ldr	r2, [r4]
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	ldr	r1, [r1, #16]
	ldr	r2, [r2, #16]
	blx	r3
	b	.L9
.L24:
	ldr	r1, [r6, #8]
	movw	r0, #:lower16:.LC0
	ldr	r2, [r6]
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	ldr	r1, [r1, #16]
	ldr	r2, [r2, #16]
	blx	r3
	b	.L14
	.fnend
	.size	set_apll, .-set_apll
	.align	2
	.type	exynos4210_set_frequency, %function
exynos4210_set_frequency:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, r1
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r5, r0
	mov	r4, r1
	bls	.L26
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	add	r2, r3, r1, asl #2
	add	r3, r3, r0, asl #2
	ldr	r6, [r2, #48]
	mov	r0, r1
	ldr	r2, [r3, #48]
	mov	r3, r6, lsr #8
	cmp	r3, r2, lsr #8
	beq	.L30
	bl	set_clkdiv
	mov	r0, r4
	mov	r1, r5
	ldmfd	sp!, {r4, r5, r6, lr}
	b	set_apll
.L26:
	ldmcsfd	sp!, {r4, r5, r6, pc}
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	add	r2, r3, r1, asl #2
	add	r3, r3, r0, asl #2
	ldr	r2, [r2, #48]
	ldr	r1, [r3, #48]
	mov	r3, r2, lsr #8
	cmp	r3, r1, lsr #8
	beq	.L31
	mov	r1, r0
	mov	r0, r4
	bl	set_apll
	mov	r0, r4
	ldmfd	sp!, {r4, r5, r6, lr}
	b	set_clkdiv
.L30:
	bl	set_clkdiv
	mov	r3, #16384
	and	r6, r6, #7
	movt	r3, 65041
	ldr	r2, [r3, #256]
	bic	r2, r2, #7
	orr	r6, r6, r2
	str	r6, [r3, #256]
	ldmfd	sp!, {r4, r5, r6, pc}
.L31:
	mov	r3, #16384
	and	r2, r2, #7
	movt	r3, 65041
	mov	r0, r4
	ldr	r1, [r3, #256]
	bic	r1, r1, #7
	orr	r2, r2, r1
	str	r2, [r3, #256]
	ldmfd	sp!, {r4, r5, r6, lr}
	b	set_clkdiv
	.fnend
	.size	exynos4210_set_frequency, .-exynos4210_set_frequency
	.align	2
	.global	exynos4210_cpufreq_init
	.type	exynos4210_cpufreq_init, %function
exynos4210_cpufreq_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r3, #:lower16:exynos_result_of_asv
	movt	r3, #:upper16:exynos_result_of_asv
	mov	r7, r0
	ldr	r4, [r3]
	and	r3, r4, #-536870912
	and	r4, r4, #15
	cmp	r3, #1073741824
	beq	.L34
	cmp	r3, #-2147483648
	beq	.L35
	movw	r5, #:lower16:.LANCHOR2
	mov	r3, #1
	mov	r2, #2
	movt	r5, #:upper16:.LANCHOR2
	str	r2, [r5, #12]
.L39:
	cmp	r3, #0
	movw	r3, #:lower16:.LANCHOR0
	mvn	r2, #0
	movt	r3, #:upper16:.LANCHOR0
	str	r2, [r3, #52]
	movw	r0, #:lower16:.LC5
	strne	r2, [r3, #60]
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	mov	r1, r4
	movt	r0, #:upper16:.LC5
	blx	r3
	ldr	r1, .L71
	mov	r3, #0
	ldr	r2, .L71+4
	add	r1, r1, r4, asl #2
.L46:
	ldr	r0, [r1, r3]
	add	r3, r3, #32
	cmp	r3, #192
	str	r0, [r2, #4]!
	bne	.L46
.L45:
	movw	r1, #:lower16:.LC1
	movw	r4, #:lower16:clk_get
	movt	r1, #:upper16:.LC1
	movt	r4, #:upper16:clk_get
	mov	r0, #0
	movw	r8, #:lower16:.LANCHOR2
	blx	r4
	cmn	r0, #4096
	str	r0, [r5, #40]
	movt	r8, #:upper16:.LANCHOR2
	bhi	.L69
	movw	r1, #:lower16:.LC2
	mov	r0, #0
	movt	r1, #:upper16:.LC2
	blx	r4
	cmn	r0, #4096
	str	r0, [r8]
	bhi	.L49
	movw	r1, #:lower16:.LC3
	mov	r0, #0
	movt	r1, #:upper16:.LC3
	blx	r4
	cmn	r0, #4096
	str	r0, [r8, #4]
	bhi	.L51
	movw	r3, #:lower16:clk_get_rate
	movt	r3, #:upper16:clk_get_rate
	blx	r3
	movw	r3, #19923
	mov	r6, r0
	movt	r3, 4194
	movw	r1, #:lower16:.LC4
	umull	r2, r6, r3, r6
	mov	r0, #0
	movt	r1, #:upper16:.LC4
	blx	r4
	cmn	r0, #4096
	mov	r6, r6, lsr #6
	str	r0, [r8, #8]
	bhi	.L52
	mov	r2, #16384
	ldr	r3, .L71+8
	movt	r2, 65041
	movw	r8, #:lower16:.LANCHOR0
	ldr	ip, [r2, #1280]
	movt	r8, #:upper16:.LANCHOR0
	mov	r1, #0
.L54:
	ldr	r4, [r3]
	movw	r2, #34952
	ldr	r0, [r3, #4]
	movt	r2, 63624
	and	r2, ip, r2
	ldr	fp, [r3, #12]
	orr	ip, r2, r4
	ldr	r2, [r3, #8]
	ldr	r10, [r3, #16]
	add	r4, r8, r1
	orr	ip, ip, r0, asl #4
	ldr	r9, [r3, #20]
	ldr	r0, [r3, #24]
	add	r1, r1, #8
	orr	ip, ip, r2, asl #8
	cmp	r1, #48
	add	r3, r3, #28
	orr	ip, ip, fp, asl #12
	orr	ip, ip, r10, asl #16
	orr	ip, ip, r9, asl #20
	orr	ip, ip, r0, asl #24
	str	ip, [r4, #4]
	bne	.L54
	ldr	r10, [r5, #12]
	movw	r2, #:lower16:exynos4210_set_frequency
	ldr	r9, [r5, #40]
	movw	r3, #:lower16:exynos4210_pms_change
	ldr	r8, .L71+12
	movt	r2, #:upper16:exynos4210_set_frequency
	ldr	r5, .L71+16
	movt	r3, #:upper16:exynos4210_pms_change
	mov	r4, #3
	mov	ip, #2
	mov	r1, #5
	str	r6, [r7]
	str	r2, [r7, #36]
	mov	r0, #0
	str	r3, [r7, #40]
	str	r10, [r7, #12]
	str	r9, [r7, #24]
	str	r8, [r7, #28]
	str	r5, [r7, #32]
	str	r4, [r7, #8]
	str	ip, [r7, #4]
	str	r1, [r7, #16]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L34:
	movw	r5, #:lower16:.LANCHOR2
	mov	r2, #2
	movt	r5, #:upper16:.LANCHOR2
	mov	r3, #0
	str	r2, [r5, #12]
	b	.L39
.L35:
	movw	r5, #:lower16:.LANCHOR2
	cmp	r4, #0
	movt	r5, #:upper16:.LANCHOR2
	mov	r3, #0
	str	r3, [r5, #12]
	beq	.L70
	movw	r0, #:lower16:.LC5
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC5
	movt	r3, #:upper16:printk
	mov	r1, r4
	blx	r3
.L58:
	ldr	r1, .L71+20
	mov	r3, #0
	ldr	r2, .L71+4
	add	r1, r1, r4, asl #2
.L44:
	ldr	r0, [r1, r3]
	add	r3, r3, #20
	cmp	r3, #120
	str	r0, [r2, #4]!
	bne	.L44
	b	.L45
.L52:
	ldr	r0, [r8, #4]
	cmn	r0, #4096
	bhi	.L51
	movw	r3, #:lower16:clk_put
	movt	r3, #:upper16:clk_put
	blx	r3
.L51:
	ldr	r0, [r5]
	cmn	r0, #4096
	bhi	.L49
	movw	r3, #:lower16:clk_put
	movt	r3, #:upper16:clk_put
	blx	r3
.L49:
	ldr	r0, [r5, #40]
	cmn	r0, #4096
	bhi	.L59
	movw	r3, #:lower16:clk_put
	movt	r3, #:upper16:clk_put
	blx	r3
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L69:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L70:
	movw	r8, #:lower16:.LANCHOR0
	mvn	r2, #0
	movt	r8, #:upper16:.LANCHOR0
	movw	r0, #:lower16:.LC5
	movw	r3, #:lower16:printk
	mov	r1, r4
	movt	r3, #:upper16:printk
	str	r2, [r8, #52]
	movt	r0, #:upper16:.LC5
	blx	r3
	b	.L58
.L59:
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L72:
	.align	2
.L71:
	.word	.LANCHOR1+360
	.word	.LANCHOR2+12
	.word	.LANCHOR1+192
	.word	.LANCHOR2+16
	.word	.LANCHOR0+48
	.word	.LANCHOR1+72
	.fnend
	.size	exynos4210_cpufreq_init, .-exynos4210_cpufreq_init
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	clkdiv_cpu1, %object
	.size	clkdiv_cpu1, 48
clkdiv_cpu1:
	.word	5
	.word	0
	.word	5
	.word	0
	.word	4
	.word	0
	.word	3
	.word	0
	.word	3
	.word	0
	.word	3
	.word	0
	.type	exynos4_apll_pms_table, %object
	.size	exynos4_apll_pms_table, 24
exynos4_apll_pms_table:
	.word	22939137
	.word	9831169
	.word	16385537
	.word	13108737
	.word	16385538
	.word	13108739
	.type	asv_voltage_B, %object
	.size	asv_voltage_B, 120
asv_voltage_B:
	.word	1350000
	.word	1350000
	.word	1300000
	.word	1250000
	.word	1225000
	.word	1325000
	.word	1275000
	.word	1225000
	.word	1175000
	.word	1150000
	.word	1225000
	.word	1175000
	.word	1125000
	.word	1075000
	.word	1050000
	.word	1150000
	.word	1100000
	.word	1050000
	.word	1000000
	.word	975000
	.word	1050000
	.word	1000000
	.word	950000
	.word	950000
	.word	950000
	.word	1025000
	.word	975000
	.word	950000
	.word	950000
	.word	950000
	.type	clkdiv_cpu0, %object
	.size	clkdiv_cpu0, 168
clkdiv_cpu0:
	.word	0
	.word	3
	.word	7
	.word	3
	.word	4
	.word	1
	.word	7
	.word	0
	.word	3
	.word	7
	.word	3
	.word	4
	.word	1
	.word	7
	.word	0
	.word	3
	.word	7
	.word	3
	.word	4
	.word	1
	.word	7
	.word	0
	.word	3
	.word	7
	.word	3
	.word	3
	.word	1
	.word	7
	.word	0
	.word	3
	.word	7
	.word	3
	.word	3
	.word	1
	.word	7
	.word	0
	.word	1
	.word	3
	.word	1
	.word	3
	.word	1
	.word	0
	.type	asv_voltage_A, %object
	.size	asv_voltage_A, 192
asv_voltage_A:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1350000
	.word	1350000
	.word	1300000
	.word	1275000
	.word	1250000
	.word	1225000
	.word	1200000
	.word	1175000
	.word	1300000
	.word	1250000
	.word	1200000
	.word	1175000
	.word	1150000
	.word	1125000
	.word	1100000
	.word	1075000
	.word	1200000
	.word	1150000
	.word	1100000
	.word	1075000
	.word	1050000
	.word	1025000
	.word	1000000
	.word	975000
	.word	1100000
	.word	1050000
	.word	1000000
	.word	975000
	.word	975000
	.word	950000
	.word	925000
	.word	925000
	.word	1050000
	.word	1000000
	.word	975000
	.word	950000
	.word	950000
	.word	925000
	.word	925000
	.word	925000
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	exynos4210_clkdiv_table, %object
	.size	exynos4210_clkdiv_table, 48
exynos4210_clkdiv_table:
	.word	0
	.word	0
	.word	1
	.word	0
	.word	2
	.word	0
	.word	3
	.word	0
	.word	4
	.word	0
	.word	5
	.word	0
	.type	exynos4210_freq_table, %object
	.size	exynos4210_freq_table, 56
exynos4210_freq_table:
	.word	0
	.word	1400000
	.word	1
	.word	1200000
	.word	2
	.word	1000000
	.word	3
	.word	800000
	.word	4
	.word	500000
	.word	5
	.word	200000
	.word	0
	.word	-2
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>Unable to set parent %s of clock %s.\012\000"
	.space	3
.LC1:
	.ascii	"armclk\000"
	.space	1
.LC2:
	.ascii	"moutcore\000"
	.space	3
.LC3:
	.ascii	"mout_mpll\000"
	.space	2
.LC4:
	.ascii	"mout_apll\000"
	.space	2
.LC5:
	.ascii	"<6>DVFS : VDD_ARM Voltage table set with %d Group\012"
	.ascii	"\000"
	.bss
	.align	2
	.set	.LANCHOR2,. + 0
	.type	moutcore, %object
	.size	moutcore, 4
moutcore:
	.space	4
	.type	mout_mpll, %object
	.size	mout_mpll, 4
mout_mpll:
	.space	4
	.type	mout_apll, %object
	.size	mout_apll, 4
mout_apll:
	.space	4
	.type	max_support_idx, %object
	.size	max_support_idx, 4
max_support_idx:
	.space	4
	.type	exynos4210_volt_table, %object
	.size	exynos4210_volt_table, 24
exynos4210_volt_table:
	.space	24
	.type	cpu_clk, %object
	.size	cpu_clk, 4
cpu_clk:
	.space	4
	.ident	"GCC: (GNU) 4.8"
