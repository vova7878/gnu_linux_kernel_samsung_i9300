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
	.file	"cpufreq-4x12.c"
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
	mov	r5, r0, asl #1
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	add	r2, r5, r0
	add	r2, r4, r2, asl #2
	mov	r3, #16384
	movt	r3, 65041
	ldr	r2, [r2, #4]
	mov	ip, r3
	str	r2, [r3, #1280]
.L3:
	ldr	r1, [ip, #1536]
	movw	r3, #4369
	movt	r3, 4369
	mov	r2, #16384
	movt	r2, 65041
	and	r3, r1, r3
	cmp	r3, #0
	bne	.L3
	add	r0, r5, r0
	movw	r3, #:lower16:samsung_cpu_id
	add	r4, r4, r0, asl #2
	movt	r3, #:upper16:samsung_cpu_id
	mov	ip, #0
	ldr	r4, [r4, #8]
	movt	ip, 17186
	movw	r0, #273
	mov	r1, r2
	str	r4, [r2, #1284]
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	cmp	ip, r3, asl #17
	movne	r2, r0
	moveq	r2, #17
.L6:
	ldr	r3, [r1, #1540]
	tst	r2, r3
	bne	.L6
	ldmfd	sp!, {r4, r5}
	bx	lr
	.fnend
	.size	set_clkdiv, .-set_clkdiv
	.align	2
	.global	exynos4x12_pms_change
	.type	exynos4x12_pms_change, %function
exynos4x12_pms_change:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	ldr	r2, [r3, r1, asl #2]
	ldr	r3, [r3, r0, asl #2]
	mov	r2, r2, lsr #8
	cmp	r2, r3, lsr #8
	moveq	r0, #0
	movne	r0, #1
	bx	lr
	.fnend
	.size	exynos4x12_pms_change, .-exynos4x12_pms_change
	.align	2
	.type	set_apll, %function
set_apll:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	movw	r5, #:lower16:clk_set_parent
	mov	r6, r0
	movt	r5, #:upper16:clk_set_parent
	ldr	r1, [r4, #184]
	ldr	r0, [r4, #180]
	blx	r5
	cmp	r0, #0
	bne	.L25
.L11:
	mov	r1, #16384
	movt	r1, 65041
.L13:
	ldr	r2, [r1, #1024]
	mov	r3, #16384
	movt	r3, 65041
	ubfx	r2, r2, #16, #3
	cmp	r2, #2
	bne	.L13
	movw	r2, #:lower16:.LANCHOR1
	mov	lr, #250
	movt	r2, #:upper16:.LANCHOR1
	movw	r1, #49400
	ldr	r0, [r2, r6, asl #2]
	movt	r1, 64512
	mov	r2, r3
	ubfx	ip, r0, #8, #6
	mul	ip, lr, ip
	str	ip, [r3]
	ldr	ip, [r3, #256]
	and	r1, ip, r1
	orr	r1, r1, r0
	str	r1, [r3, #256]
.L15:
	ldr	r3, [r2, #256]
	tst	r3, #536870912
	beq	.L15
	ldr	r0, [r4, #180]
	movw	r6, #:lower16:.LANCHOR0
	ldr	r1, [r4, #188]
	movt	r6, #:upper16:.LANCHOR0
	blx	r5
	cmp	r0, #0
	bne	.L26
.L16:
	mov	r2, #16384
	movt	r2, 65041
.L18:
	ldr	r3, [r2, #1024]
	and	r3, r3, #458752
	cmp	r3, #65536
	bne	.L18
	ldmfd	sp!, {r4, r5, r6, pc}
.L25:
	ldr	r1, [r4, #184]
	movw	r0, #:lower16:.LC0
	ldr	r2, [r4, #180]
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	ldr	r1, [r1, #16]
	ldr	r2, [r2, #16]
	blx	r3
	b	.L11
.L26:
	ldr	r1, [r6, #188]
	movw	r0, #:lower16:.LC0
	ldr	r2, [r6, #180]
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	ldr	r1, [r1, #16]
	ldr	r2, [r2, #16]
	blx	r3
	b	.L16
	.fnend
	.size	set_apll, .-set_apll
	.align	2
	.type	exynos4x12_set_frequency, %function
exynos4x12_set_frequency:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, r1
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r5, r0
	mov	r4, r1
	bls	.L28
	movw	r3, #:lower16:.LANCHOR0
	movw	r2, #32495
	movt	r3, #:upper16:.LANCHOR0
	movt	r2, 14
	add	r1, r3, r1, asl #2
	ldr	r1, [r1, #192]
	cmp	r1, r2
	bls	.L29
	ldrb	r3, [r3, #252]	@ zero_extendqisi2
	cmp	r3, #0
	movwne	r3, #24575
	movwne	r2, #257
	movtne	r3, 65041
	strne	r2, [r3, #-4087]
.L29:
	movw	r3, #:lower16:samsung_rev
	movt	r3, #:upper16:samsung_rev
	blx	r3
	cmp	r0, #31
	bls	.L30
	movw	r3, #:lower16:exynos_result_of_asv
	movt	r3, #:upper16:exynos_result_of_asv
	ldr	r3, [r3]
	cmp	r3, #2
	bls	.L30
	cmp	r5, #8
	movls	r3, #0
	movhi	r3, #1
	cmp	r4, #8
	movhi	r3, #0
	cmp	r3, #0
	movne	r3, #0
	movne	r2, #142
	movtne	r3, 65048
	movtne	r2, 32768
	strne	r2, [r3, #1932]
.L30:
	movw	r3, #:lower16:.LANCHOR1
	mov	r0, r4
	movt	r3, #:upper16:.LANCHOR1
	ldr	r6, [r3, r4, asl #2]
	ldr	r2, [r3, r5, asl #2]
	mov	r3, r6, lsr #8
	cmp	r3, r2, lsr #8
	beq	.L54
	bl	set_clkdiv
	mov	r0, r4
	mov	r1, r5
	bl	set_apll
.L32:
	movw	r3, #:lower16:samsung_cpu_id
	movt	r3, #:upper16:samsung_cpu_id
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmn	r3, #465567744
	ldmnefd	sp!, {r4, r5, r6, pc}
	movw	r3, #:lower16:exynos_result_of_asv
	movt	r3, #:upper16:exynos_result_of_asv
	ldr	r3, [r3]
	cmp	r3, #3
	ldmlsfd	sp!, {r4, r5, r6, pc}
	movw	r3, #:lower16:samsung_rev
	movt	r3, #:upper16:samsung_rev
	blx	r3
	cmp	r0, #31
	ldmhifd	sp!, {r4, r5, r6, pc}
	cmp	r4, #14
	mov	r3, #0
	moveq	r2, #136
	movne	r2, #142
	movt	r3, 65048
	movt	r2, 32768
	str	r2, [r3, #1932]
	ldmfd	sp!, {r4, r5, r6, pc}
.L28:
	bcs	.L32
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	ldr	r2, [r3, r1, asl #2]
	ldr	r1, [r3, r0, asl #2]
	mov	r3, r2, lsr #8
	cmp	r3, r1, lsr #8
	beq	.L55
	mov	r0, r4
	mov	r1, r5
	bl	set_apll
	mov	r0, r4
	bl	set_clkdiv
.L35:
	movw	r3, #:lower16:samsung_rev
	movt	r3, #:upper16:samsung_rev
	blx	r3
	cmp	r0, #31
	bls	.L36
	movw	r3, #:lower16:exynos_result_of_asv
	movt	r3, #:upper16:exynos_result_of_asv
	ldr	r3, [r3]
	cmp	r3, #2
	bls	.L36
	cmp	r5, #8
	movhi	r5, #0
	movls	r5, #1
	cmp	r4, #8
	movls	r5, #0
	cmp	r5, #0
	movne	r3, #0
	movne	r2, #136
	movtne	r3, 65048
	movtne	r2, 32768
	strne	r2, [r3, #1932]
.L36:
	movw	r3, #:lower16:.LANCHOR0
	movw	r2, #32495
	movt	r3, #:upper16:.LANCHOR0
	movt	r2, 14
	add	r1, r3, r4, asl #2
	ldr	r1, [r1, #192]
	cmp	r1, r2
	bhi	.L32
	ldrb	r3, [r3, #252]	@ zero_extendqisi2
	cmp	r3, #0
	movwne	r3, #24575
	movwne	r2, #1028
	movtne	r3, 65041
	strne	r2, [r3, #-4087]
	b	.L32
.L54:
	bl	set_clkdiv
	mov	r3, #16384
	and	r6, r6, #7
	movt	r3, 65041
	ldr	r2, [r3, #256]
	bic	r2, r2, #7
	orr	r6, r6, r2
	str	r6, [r3, #256]
	b	.L32
.L55:
	mov	r3, #16384
	and	r2, r2, #7
	movt	r3, 65041
	mov	r0, r4
	ldr	r1, [r3, #256]
	bic	r1, r1, #7
	orr	r2, r2, r1
	str	r2, [r3, #256]
	bl	set_clkdiv
	b	.L35
	.fnend
	.size	exynos4x12_set_frequency, .-exynos4x12_set_frequency
	.align	2
	.global	exynos4x12_cpufreq_init
	.type	exynos4x12_cpufreq_init, %function
exynos4x12_cpufreq_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r6, #:lower16:samsung_rev
	.pad #12
	sub	sp, sp, #12
	movt	r6, #:upper16:samsung_rev
	mov	r4, r0
	blx	r6
	cmp	r0, #31
	bhi	.L57
	movw	r3, #:lower16:exynos_armclk_max
	movw	r2, #23744
	movt	r3, #:upper16:exynos_armclk_max
	movt	r2, 21
	ldr	r3, [r3]
	cmp	r3, r2
	beq	.L57
	movw	r5, #:lower16:.LANCHOR0
	movw	r3, #:lower16:.LANCHOR3
	movt	r3, #:upper16:.LANCHOR3
	mvn	r2, #0
	movt	r5, #:upper16:.LANCHOR0
	mov	r1, #6
	str	r1, [r5, #260]
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	str	r2, [r3, #20]
	str	r2, [r3, #28]
	str	r2, [r3, #36]
	str	r2, [r3, #44]
	b	.L99
.L57:
	movw	r5, #:lower16:.LANCHOR0
	mov	r3, #0
	movt	r5, #:upper16:.LANCHOR0
	str	r3, [r5, #260]
.L99:
	movw	r9, #:lower16:exynos_result_of_asv
	movw	r0, #:lower16:.LC1
	movt	r9, #:upper16:exynos_result_of_asv
	movw	r7, #:lower16:printk
	ldr	r1, [r9]
	movt	r0, #:upper16:.LC1
	movt	r7, #:upper16:printk
	blx	r7
	ldr	r1, [r9]
	cmp	r1, #255
	beq	.L117
	movw	r8, #:lower16:samsung_cpu_id
	mov	r3, #0
	movt	r8, #:upper16:samsung_cpu_id
	movt	r3, 17186
	ldr	r2, [r8]
	mov	r2, r2, lsr #17
	mov	r2, r2, asl #17
	cmp	r2, r3
	beq	.L118
	cmn	r2, #465567744
	bne	.L66
	blx	r6
	cmp	r0, #31
	bls	.L67
	ldr	r0, [r9]
	mov	r3, #0
	ldr	r1, .L122
	ldr	r2, .L122+4
	add	r0, r1, r0, asl #2
.L69:
	ldr	r1, [r0, r3]
	add	r3, r3, #52
	cmp	r3, #780
	str	r1, [r2, #4]!
	bne	.L69
.L116:
	ldr	r3, [r8]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmn	r3, #465567744
	beq	.L119
.L75:
	movw	r1, #:lower16:.LC7
	movw	r9, #:lower16:clk_get
	movt	r1, #:upper16:.LC7
	movt	r9, #:upper16:clk_get
	mov	r0, #0
	movw	r7, #:lower16:.LANCHOR0
	blx	r9
	cmn	r0, #4096
	str	r0, [r5, #256]
	movt	r7, #:upper16:.LANCHOR0
	bhi	.L115
	movw	r1, #:lower16:.LC8
	mov	r0, #0
	movt	r1, #:upper16:.LC8
	blx	r9
	cmn	r0, #4096
	str	r0, [r7, #180]
	bhi	.L87
	movw	r1, #:lower16:.LC9
	mov	r0, #0
	movt	r1, #:upper16:.LC9
	blx	r9
	cmn	r0, #4096
	str	r0, [r7, #184]
	bhi	.L89
	movw	r3, #:lower16:clk_get_rate
	movt	r3, #:upper16:clk_get_rate
	blx	r3
	movw	r3, #19923
	mov	r2, r0
	movt	r3, 4194
	movw	r1, #:lower16:.LC10
	umull	ip, r3, r3, r2
	mov	r0, #0
	movt	r1, #:upper16:.LC10
	mov	r3, r3, lsr #6
	str	r3, [sp, #4]
	blx	r9
	cmn	r0, #4096
	str	r0, [r7, #188]
	bhi	.L90
	ldr	fp, [r8]
	mov	r10, #0
	ldr	ip, .L122+8
	mov	r8, #16384
	mov	r2, r7
	ldr	lr, .L122+12
	movt	r8, 65041
	movt	r10, 17186
	mov	fp, fp, lsr #17
	add	r7, ip, #480
	add	r3, ip, #600
	mov	fp, fp, asl #17
	mov	r0, #0
	b	.L94
.L91:
	ldr	r9, [r3]
	orr	r1, r1, r9
	ldr	r9, [r3, #4]
	orr	r1, r1, r9, asl #4
	ldr	r9, [r3, #8]
	orr	r1, r1, r9, asl #8
	ldr	r9, [r3, #12]
	orr	r1, r1, r9, asl #12
	ldr	r9, [r3, #16]
	orr	r1, r1, r9, asl #16
	ldr	r9, [r3, #20]
	orr	r1, r1, r9, asl #20
	ldr	r9, [r3, #24]
	orr	r1, r1, r9, asl #24
	ldr	r9, [r3, #28]
	orr	r1, r1, r9, asl #28
	ldr	r9, [lr]
	str	r1, [r2, #4]
	ldr	r1, [r8, #1284]
	bic	r1, r1, #1904
	bic	r1, r1, #7
	orr	r1, r1, r9
	ldr	r9, [lr, #4]
	orr	r1, r1, r9, asl #4
	ldr	r9, [lr, #8]
	orr	r1, r1, r9, asl #8
.L92:
	add	r0, r0, #1
	str	r1, [r2, #8]
	cmp	r0, #15
	add	ip, ip, #32
	add	r7, r7, #8
	add	r2, r2, #12
	add	r3, r3, #32
	add	lr, lr, #12
	beq	.L120
.L94:
	str	r0, [r2]
	movw	r1, #34952
	ldr	r9, [r8, #1280]
	cmp	fp, r10
	movt	r1, 34952
	and	r1, r9, r1
	bne	.L91
	ldr	r9, [ip]
	orr	r1, r1, r9
	ldr	r9, [ip, #4]
	orr	r1, r1, r9, asl #4
	ldr	r9, [ip, #8]
	orr	r1, r1, r9, asl #8
	ldr	r9, [ip, #12]
	orr	r1, r1, r9, asl #12
	ldr	r9, [ip, #16]
	orr	r1, r1, r9, asl #16
	ldr	r9, [ip, #20]
	orr	r1, r1, r9, asl #20
	ldr	r9, [ip, #24]
	orr	r1, r1, r9, asl #24
	ldr	r9, [ip, #28]
	orr	r1, r1, r9, asl #28
	ldr	r9, [r7]
	str	r1, [r2, #4]
	ldr	r1, [r8, #1284]
	bic	r1, r1, #119
	orr	r1, r1, r9
	ldr	r9, [r7, #4]
	orr	r1, r1, r9, asl #4
	b	.L92
.L67:
	movw	r3, #:lower16:exynos_armclk_max
	movw	r2, #16960
	movt	r3, #:upper16:exynos_armclk_max
	movt	r2, 15
	ldr	r3, [r3]
	ldr	r0, [r9]
	cmp	r3, r2
	mov	r3, #0
	beq	.L121
	ldr	r1, .L122+16
	ldr	r2, .L122+4
	add	r0, r1, r0, asl #2
.L73:
	ldr	r1, [r0, r3]
	add	r3, r3, #48
	cmp	r3, #720
	str	r1, [r2, #4]!
	bne	.L73
	b	.L116
.L90:
	ldr	r0, [r7, #184]
	cmn	r0, #4096
	bhi	.L89
	movw	r3, #:lower16:clk_put
	movt	r3, #:upper16:clk_put
	blx	r3
.L89:
	ldr	r0, [r5, #180]
	cmn	r0, #4096
	bhi	.L87
	movw	r3, #:lower16:clk_put
	movt	r3, #:upper16:clk_put
	blx	r3
.L87:
	ldr	r0, [r5, #256]
	cmn	r0, #4096
	bhi	.L101
	movw	r3, #:lower16:clk_put
	movt	r3, #:upper16:clk_put
	blx	r3
	mvn	r0, #21
.L115:
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L120:
	ldr	ip, [sp, #4]
	mov	r3, #6
	str	r3, [r4, #8]
	str	ip, [r4]
	blx	r6
	cmp	r0, #31
	ldr	r7, [r5, #260]
	movhi	r3, #7
	movls	r3, #8
	ldr	r6, [r5, #256]
	movw	r1, #:lower16:.LANCHOR3
	ldr	r5, .L122+20
	movw	r2, #:lower16:exynos4x12_set_frequency
	str	r3, [r4, #4]
	movw	r3, #:lower16:exynos4x12_pms_change
	movt	r1, #:upper16:.LANCHOR3
	movt	r2, #:upper16:exynos4x12_set_frequency
	movt	r3, #:upper16:exynos4x12_pms_change
	mov	ip, #14
	mov	r0, #0
	str	r1, [r4, #32]
	str	r2, [r4, #36]
	str	r3, [r4, #40]
	str	r7, [r4, #12]
	str	r6, [r4, #24]
	str	r5, [r4, #28]
	str	ip, [r4, #16]
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L117:
	ldr	r0, .L122+20
	mov	r3, #0
	ldr	r1, .L122+24
.L62:
	ldr	r2, [r1, r3]
	str	r2, [r0, r3]
	add	r3, r3, #4
	cmp	r3, #60
	bne	.L62
	movw	r8, #:lower16:samsung_cpu_id
	movt	r8, #:upper16:samsung_cpu_id
	ldr	r3, [r8]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmn	r3, #465567744
	bne	.L75
.L119:
	blx	r6
	cmp	r0, #31
	bls	.L75
	movw	r3, #:lower16:exynos_special_flag
	movt	r3, #:upper16:exynos_special_flag
	ldr	r9, [r3]
	ubfx	r9, r9, #3, #2
	cmp	r9, #0
	bne	.L76
.L82:
	movw	r3, #:lower16:exynos_dynamic_ema
	movt	r3, #:upper16:exynos_dynamic_ema
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L75
	movw	r0, #:lower16:.LC6
	mov	r3, #1
	ldr	r1, .L122+28
	movt	r0, #:upper16:.LC6
	strb	r3, [r5, #252]
	blx	r7
	b	.L75
.L118:
	ldr	r0, .L122+32
	mov	r3, #0
	ldr	r2, .L122+4
	add	r0, r0, r1, asl #2
.L65:
	ldr	r1, [r0, r3]
	add	r3, r3, #48
	cmp	r3, #720
	str	r1, [r2, #4]!
	bne	.L65
	b	.L75
.L121:
	ldr	r1, .L122+36
	ldr	r2, .L122+4
	add	r0, r1, r0, asl #2
.L72:
	ldr	r1, [r0, r3]
	add	r3, r3, #48
	cmp	r3, #720
	str	r1, [r2, #4]!
	bne	.L72
	b	.L116
.L101:
	mvn	r0, #21
	b	.L115
.L76:
	movw	r0, #:lower16:.LC3
	ldr	r1, .L122+28
	movt	r0, #:upper16:.LC3
	mov	r2, r9
	blx	r7
	cmp	r9, #2
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	beq	.L79
	cmp	r9, #3
	beq	.L100
	movw	r0, #:lower16:.LC4
	mov	r9, #12
	mov	r1, #11
	movt	r0, #:upper16:.LC4
	mov	r10, r1
	blx	r3
.L81:
	ldr	r3, .L122+20
	sub	fp, r9, #1
	add	r10, r5, r10, asl #2
	add	fp, r3, fp, asl #2
.L83:
	ldr	r3, [r10, #192]
	movw	r0, #:lower16:.LC5
	mov	r1, r9
	movt	r0, #:upper16:.LC5
	add	r9, r9, #1
	mov	r2, r3
	str	r3, [fp, #4]!
	blx	r7
	cmp	r9, #14
	bls	.L83
	b	.L82
.L100:
	mov	r9, #9
	mov	r10, #8
.L80:
	movw	r0, #:lower16:.LC4
	mov	r1, r10
	movt	r0, #:upper16:.LC4
	blx	r7
	b	.L81
.L66:
	movw	r0, #:lower16:.LC2
	ldr	r1, .L122+28
	movt	r0, #:upper16:.LC2
	blx	r7
	b	.L116
.L79:
	mov	r9, #10
	mov	r10, #9
	b	.L80
.L123:
	.align	2
.L122:
	.word	.LANCHOR1+840
	.word	.LANCHOR0+188
	.word	.LANCHOR1+3076
	.word	.LANCHOR2-4028
	.word	.LANCHOR1+2340
	.word	.LANCHOR0+192
	.word	.LANCHOR1+60
	.word	.LANCHOR1+3060
	.word	.LANCHOR1+120
	.word	.LANCHOR1+1620
	.fnend
	.size	exynos4x12_cpufreq_init, .-exynos4x12_cpufreq_init
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.set	.LANCHOR2,. + 8184
	.type	exynos4x12_apll_pms_table, %object
	.size	exynos4x12_apll_pms_table, 60
exynos4x12_apll_pms_table:
	.word	13959936
	.word	13107968
	.word	11469568
	.word	21300736
	.word	13108224
	.word	18023936
	.word	8192768
	.word	9831424
	.word	6554368
	.word	11469569
	.word	13108225
	.word	8192769
	.word	6554369
	.word	13108226
	.word	6554370
	.type	asv_voltage_s, %object
	.size	asv_voltage_s, 60
asv_voltage_s:
	.word	1300000
	.word	1300000
	.word	1300000
	.word	1250000
	.word	1200000
	.word	1175000
	.word	1100000
	.word	1050000
	.word	1025000
	.word	1000000
	.word	1000000
	.word	1000000
	.word	950000
	.word	950000
	.space	4
	.type	asv_voltage_4212, %object
	.size	asv_voltage_4212, 720
asv_voltage_4212:
	.word	0
	.word	1300000
	.word	1300000
	.word	1275000
	.word	1300000
	.word	1287500
	.word	1275000
	.word	1250000
	.word	1237500
	.word	1225000
	.word	1225000
	.word	1212500
	.word	0
	.word	1300000
	.word	1300000
	.word	1275000
	.word	1300000
	.word	1287500
	.word	1275000
	.word	1250000
	.word	1237500
	.word	1225000
	.word	1225000
	.word	1212500
	.word	1300000
	.word	1287500
	.word	1250000
	.word	1225000
	.word	1237500
	.word	1237500
	.word	1225000
	.word	1200000
	.word	1187500
	.word	1175000
	.word	1175000
	.word	1162500
	.word	1237500
	.word	1225000
	.word	1200000
	.word	1175000
	.word	1187500
	.word	1187500
	.word	1162500
	.word	1150000
	.word	1137500
	.word	1125000
	.word	1125000
	.word	1112500
	.word	1187500
	.word	1175000
	.word	1150000
	.word	1137500
	.word	1150000
	.word	1137500
	.word	1125000
	.word	1100000
	.word	1087500
	.word	1075000
	.word	1075000
	.word	1062500
	.word	1137500
	.word	1125000
	.word	1112500
	.word	1087500
	.word	1112500
	.word	1112500
	.word	1075000
	.word	1062500
	.word	1050000
	.word	1025000
	.word	1025000
	.word	1012500
	.word	1100000
	.word	1087500
	.word	1075000
	.word	1050000
	.word	1075000
	.word	1062500
	.word	1037500
	.word	1025000
	.word	1012500
	.word	1000000
	.word	987500
	.word	975000
	.word	1050000
	.word	1037500
	.word	1025000
	.word	1000000
	.word	1025000
	.word	1025000
	.word	987500
	.word	975000
	.word	962500
	.word	950000
	.word	937500
	.word	925000
	.word	1012500
	.word	1000000
	.word	987500
	.word	962500
	.word	987500
	.word	975000
	.word	962500
	.word	937500
	.word	925000
	.word	912500
	.word	912500
	.word	900000
	.word	962500
	.word	950000
	.word	937500
	.word	912500
	.word	937500
	.word	937500
	.word	925000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	925000
	.word	912500
	.word	912500
	.word	900000
	.word	912500
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	912500
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	912500
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	912500
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	912500
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.type	asv_voltage_step_12_5_rev2, %object
	.size	asv_voltage_step_12_5_rev2, 780
asv_voltage_step_12_5_rev2:
	.word	1312500
	.word	1312500
	.word	1312500
	.word	1312500
	.word	1300000
	.word	1287500
	.word	1275000
	.word	1262500
	.word	1250000
	.word	1237500
	.word	1212500
	.word	1200000
	.word	1187500
	.word	1275000
	.word	1262500
	.word	1262500
	.word	1262500
	.word	1250000
	.word	1237500
	.word	1225000
	.word	1212500
	.word	1200000
	.word	1187500
	.word	1162500
	.word	1150000
	.word	1137500
	.word	1237500
	.word	1225000
	.word	1225000
	.word	1225000
	.word	1212500
	.word	1200000
	.word	1187500
	.word	1175000
	.word	1162500
	.word	1150000
	.word	1125000
	.word	1112500
	.word	1100000
	.word	1187500
	.word	1175000
	.word	1175000
	.word	1175000
	.word	1162500
	.word	1150000
	.word	1137500
	.word	1125000
	.word	1112500
	.word	1100000
	.word	1075000
	.word	1062500
	.word	1050000
	.word	1150000
	.word	1137500
	.word	1137500
	.word	1137500
	.word	1125000
	.word	1112500
	.word	1100000
	.word	1087500
	.word	1075000
	.word	1062500
	.word	1037500
	.word	1025000
	.word	1012500
	.word	1112500
	.word	1100000
	.word	1100000
	.word	1100000
	.word	1087500
	.word	1075000
	.word	1062500
	.word	1050000
	.word	1037500
	.word	1025000
	.word	1000000
	.word	987500
	.word	975000
	.word	1087500
	.word	1075000
	.word	1075000
	.word	1075000
	.word	1062500
	.word	1050000
	.word	1037500
	.word	1025000
	.word	1012500
	.word	1000000
	.word	975000
	.word	962500
	.word	950000
	.word	1062500
	.word	1050000
	.word	1050000
	.word	1050000
	.word	1037500
	.word	1025000
	.word	1012500
	.word	1000000
	.word	987500
	.word	975000
	.word	950000
	.word	937500
	.word	925000
	.word	1025000
	.word	1012500
	.word	1012500
	.word	1012500
	.word	1000000
	.word	987500
	.word	975000
	.word	962500
	.word	950000
	.word	937500
	.word	912500
	.word	900000
	.word	887500
	.word	1000000
	.word	987500
	.word	987500
	.word	987500
	.word	975000
	.word	962500
	.word	950000
	.word	937500
	.word	925000
	.word	912500
	.word	887500
	.word	887500
	.word	887500
	.word	975000
	.word	962500
	.word	962500
	.word	962500
	.word	950000
	.word	937500
	.word	925000
	.word	912500
	.word	900000
	.word	887500
	.word	875000
	.word	875000
	.word	875000
	.word	962500
	.word	950000
	.word	950000
	.word	950000
	.word	937500
	.word	925000
	.word	912500
	.word	900000
	.word	887500
	.word	887500
	.word	875000
	.word	875000
	.word	875000
	.word	950000
	.word	937500
	.word	937500
	.word	937500
	.word	925000
	.word	912500
	.word	900000
	.word	887500
	.word	887500
	.word	887500
	.word	875000
	.word	875000
	.word	875000
	.word	937500
	.word	925000
	.word	925000
	.word	925000
	.word	912500
	.word	900000
	.word	887500
	.word	887500
	.word	887500
	.word	887500
	.word	875000
	.word	875000
	.word	875000
	.word	925000
	.word	912500
	.word	912500
	.word	912500
	.word	900000
	.word	887500
	.word	887500
	.word	887500
	.word	887500
	.word	887500
	.word	875000
	.word	875000
	.word	875000
	.type	asv_voltage_step_1ghz, %object
	.size	asv_voltage_step_1ghz, 720
asv_voltage_step_1ghz:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1200000
	.word	1200000
	.word	1200000
	.word	1200000
	.word	1125000
	.word	1125000
	.word	1125000
	.word	1075000
	.word	1075000
	.word	1075000
	.word	1075000
	.word	1037500
	.word	1150000
	.word	1150000
	.word	1150000
	.word	1150000
	.word	1075000
	.word	1075000
	.word	1075000
	.word	1037500
	.word	1037500
	.word	1037500
	.word	1037500
	.word	1000000
	.word	1100000
	.word	1100000
	.word	1100000
	.word	1100000
	.word	1025000
	.word	1025000
	.word	1025000
	.word	987500
	.word	987500
	.word	987500
	.word	987500
	.word	975000
	.word	1050000
	.word	1050000
	.word	1050000
	.word	1050000
	.word	1000000
	.word	1000000
	.word	1000000
	.word	987500
	.word	987500
	.word	987500
	.word	987500
	.word	962500
	.word	1025000
	.word	1025000
	.word	1025000
	.word	1025000
	.word	987500
	.word	987500
	.word	987500
	.word	975000
	.word	975000
	.word	975000
	.word	975000
	.word	950000
	.word	1000000
	.word	1000000
	.word	1000000
	.word	1000000
	.word	975000
	.word	975000
	.word	975000
	.word	962500
	.word	962500
	.word	962500
	.word	962500
	.word	925000
	.word	1000000
	.word	1000000
	.word	1000000
	.word	1000000
	.word	975000
	.word	975000
	.word	975000
	.word	950000
	.word	950000
	.word	950000
	.word	950000
	.word	912500
	.word	975000
	.word	975000
	.word	975000
	.word	975000
	.word	950000
	.word	950000
	.word	950000
	.word	925000
	.word	925000
	.word	925000
	.word	925000
	.word	887500
	.word	975000
	.word	975000
	.word	975000
	.word	975000
	.word	937500
	.word	937500
	.word	937500
	.word	925000
	.word	925000
	.word	925000
	.word	925000
	.word	887500
	.type	asv_voltage_step_12_5, %object
	.size	asv_voltage_step_12_5, 720
asv_voltage_step_12_5:
	.word	1425000
	.word	1425000
	.word	1425000
	.word	1425000
	.word	1425000
	.word	1400000
	.word	1400000
	.word	1400000
	.word	1400000
	.word	1387500
	.word	1375000
	.word	1362500
	.word	1400000
	.word	1400000
	.word	1400000
	.word	1400000
	.word	1387500
	.word	1387500
	.word	1375000
	.word	1362500
	.word	1350000
	.word	1337500
	.word	1325000
	.word	1312500
	.word	1325000
	.word	1312500
	.word	1300000
	.word	1287500
	.word	1300000
	.word	1287500
	.word	1275000
	.word	1250000
	.word	1250000
	.word	1237500
	.word	1225000
	.word	1212500
	.word	1300000
	.word	1275000
	.word	1237500
	.word	1237500
	.word	1250000
	.word	1250000
	.word	1237500
	.word	1212500
	.word	1200000
	.word	1200000
	.word	1187500
	.word	1175000
	.word	1225000
	.word	1212500
	.word	1200000
	.word	1187500
	.word	1200000
	.word	1187500
	.word	1175000
	.word	1150000
	.word	1137500
	.word	1125000
	.word	1125000
	.word	1112500
	.word	1175000
	.word	1162500
	.word	1150000
	.word	1137500
	.word	1150000
	.word	1137500
	.word	1125000
	.word	1100000
	.word	1100000
	.word	1075000
	.word	1075000
	.word	1062500
	.word	1125000
	.word	1112500
	.word	1100000
	.word	1087500
	.word	1100000
	.word	1087500
	.word	1075000
	.word	1050000
	.word	1037500
	.word	1025000
	.word	1025000
	.word	1012500
	.word	1075000
	.word	1062500
	.word	1050000
	.word	1050000
	.word	1050000
	.word	1037500
	.word	1025000
	.word	1012500
	.word	1000000
	.word	987500
	.word	987500
	.word	975000
	.word	1037500
	.word	1025000
	.word	1000000
	.word	1000000
	.word	1000000
	.word	987500
	.word	975000
	.word	962500
	.word	962500
	.word	962500
	.word	962500
	.word	950000
	.word	1012500
	.word	1000000
	.word	975000
	.word	975000
	.word	975000
	.word	975000
	.word	962500
	.word	962500
	.word	950000
	.word	950000
	.word	950000
	.word	937500
	.word	1000000
	.word	987500
	.word	962500
	.word	962500
	.word	962500
	.word	962500
	.word	950000
	.word	950000
	.word	937500
	.word	937500
	.word	937500
	.word	925000
	.word	987500
	.word	975000
	.word	950000
	.word	937500
	.word	950000
	.word	937500
	.word	937500
	.word	937500
	.word	912500
	.word	912500
	.word	912500
	.word	900000
	.word	975000
	.word	962500
	.word	950000
	.word	925000
	.word	950000
	.word	925000
	.word	925000
	.word	925000
	.word	900000
	.word	900000
	.word	900000
	.word	887500
	.word	950000
	.word	937500
	.word	925000
	.word	900000
	.word	925000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	887500
	.word	875000
	.word	862500
	.word	925000
	.word	912500
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	887500
	.word	875000
	.word	875000
	.word	862500
	.type	__func__.13816, %object
	.size	__func__.13816, 15
__func__.13816:
	.ascii	"set_volt_table\000"
	.space	1
	.type	clkdiv_cpu0_4212, %object
	.size	clkdiv_cpu0_4212, 480
clkdiv_cpu0_4212:
	.word	0
	.word	3
	.word	7
	.word	0
	.word	6
	.word	1
	.word	2
	.word	0
	.word	0
	.word	3
	.word	7
	.word	0
	.word	6
	.word	1
	.word	2
	.word	0
	.word	0
	.word	3
	.word	7
	.word	0
	.word	6
	.word	1
	.word	2
	.word	0
	.word	0
	.word	3
	.word	7
	.word	0
	.word	5
	.word	1
	.word	2
	.word	0
	.word	0
	.word	3
	.word	7
	.word	0
	.word	5
	.word	1
	.word	2
	.word	0
	.word	0
	.word	3
	.word	6
	.word	0
	.word	4
	.word	1
	.word	2
	.word	0
	.word	0
	.word	2
	.word	5
	.word	0
	.word	4
	.word	1
	.word	1
	.word	0
	.word	0
	.word	2
	.word	5
	.word	0
	.word	3
	.word	1
	.word	1
	.word	0
	.word	0
	.word	2
	.word	5
	.word	0
	.word	3
	.word	1
	.word	1
	.word	0
	.word	0
	.word	2
	.word	4
	.word	0
	.word	3
	.word	1
	.word	1
	.word	0
	.word	0
	.word	2
	.word	4
	.word	0
	.word	3
	.word	1
	.word	1
	.word	0
	.word	0
	.word	2
	.word	4
	.word	0
	.word	3
	.word	1
	.word	1
	.word	0
	.word	0
	.word	2
	.word	4
	.word	0
	.word	3
	.word	1
	.word	1
	.word	0
	.word	0
	.word	2
	.word	4
	.word	0
	.word	2
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	3
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.type	clkdiv_cpu1_4212, %object
	.size	clkdiv_cpu1_4212, 120
clkdiv_cpu1_4212:
	.word	6
	.word	0
	.word	6
	.word	0
	.word	6
	.word	0
	.word	5
	.word	0
	.word	5
	.word	0
	.word	4
	.word	0
	.word	4
	.word	0
	.word	3
	.word	0
	.word	3
	.word	0
	.word	3
	.word	0
	.word	3
	.word	0
	.word	3
	.word	0
	.word	3
	.word	0
	.word	3
	.word	0
	.word	3
	.word	0
	.type	clkdiv_cpu0_4412, %object
	.size	clkdiv_cpu0_4412, 480
clkdiv_cpu0_4412:
	.word	0
	.word	4
	.word	7
	.word	0
	.word	7
	.word	1
	.word	7
	.word	0
	.word	0
	.word	3
	.word	7
	.word	0
	.word	6
	.word	1
	.word	7
	.word	0
	.word	0
	.word	3
	.word	7
	.word	0
	.word	6
	.word	1
	.word	6
	.word	0
	.word	0
	.word	3
	.word	7
	.word	0
	.word	5
	.word	1
	.word	6
	.word	0
	.word	0
	.word	3
	.word	7
	.word	0
	.word	5
	.word	1
	.word	5
	.word	0
	.word	0
	.word	3
	.word	6
	.word	0
	.word	4
	.word	1
	.word	5
	.word	0
	.word	0
	.word	2
	.word	5
	.word	0
	.word	4
	.word	1
	.word	4
	.word	0
	.word	0
	.word	2
	.word	5
	.word	0
	.word	3
	.word	1
	.word	4
	.word	0
	.word	0
	.word	2
	.word	5
	.word	0
	.word	3
	.word	1
	.word	3
	.word	0
	.word	0
	.word	2
	.word	4
	.word	0
	.word	3
	.word	1
	.word	3
	.word	0
	.word	0
	.word	2
	.word	4
	.word	0
	.word	3
	.word	1
	.word	2
	.word	0
	.word	0
	.word	2
	.word	4
	.word	0
	.word	3
	.word	1
	.word	2
	.word	0
	.word	0
	.word	2
	.word	4
	.word	0
	.word	3
	.word	1
	.word	1
	.word	0
	.word	0
	.word	2
	.word	4
	.word	0
	.word	2
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	3
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.type	clkdiv_cpu1_4412, %object
	.size	clkdiv_cpu1_4412, 180
clkdiv_cpu1_4412:
	.word	7
	.word	0
	.word	7
	.word	6
	.word	0
	.word	7
	.word	6
	.word	0
	.word	6
	.word	5
	.word	0
	.word	6
	.word	5
	.word	0
	.word	5
	.word	4
	.word	0
	.word	5
	.word	4
	.word	0
	.word	4
	.word	3
	.word	0
	.word	4
	.word	3
	.word	0
	.word	3
	.word	3
	.word	0
	.word	3
	.word	3
	.word	0
	.word	2
	.word	3
	.word	0
	.word	2
	.word	3
	.word	0
	.word	1
	.word	3
	.word	0
	.word	1
	.word	3
	.word	0
	.word	0
	.section	___ksymtab+exynos4x12_cpufreq_init,"a",%progbits
	.align	2
	.type	__ksymtab_exynos4x12_cpufreq_init, %object
	.size	__ksymtab_exynos4x12_cpufreq_init, 8
__ksymtab_exynos4x12_cpufreq_init:
	.word	exynos4x12_cpufreq_init
	.word	__kstrtab_exynos4x12_cpufreq_init
	.section	__ksymtab_strings,"a",%progbits
	.type	__kstrtab_exynos4x12_cpufreq_init, %object
	.size	__kstrtab_exynos4x12_cpufreq_init, 24
__kstrtab_exynos4x12_cpufreq_init:
	.ascii	"exynos4x12_cpufreq_init\000"
	.data
	.align	2
	.set	.LANCHOR3,. + 0
	.type	exynos4x12_freq_table, %object
	.size	exynos4x12_freq_table, 128
exynos4x12_freq_table:
	.word	0
	.word	1704000
	.word	1
	.word	1600000
	.word	2
	.word	1400000
	.word	3
	.word	1300000
	.word	4
	.word	1200000
	.word	5
	.word	1100000
	.word	6
	.word	1000000
	.word	7
	.word	900000
	.word	8
	.word	800000
	.word	9
	.word	700000
	.word	10
	.word	600000
	.word	11
	.word	500000
	.word	12
	.word	400000
	.word	13
	.word	300000
	.word	14
	.word	200000
	.word	0
	.word	-2
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>Unable to set parent %s of clock %s.\012\000"
	.space	3
.LC1:
	.ascii	"<6>DVFS : VDD_ARM Voltage table set with %d Group\012"
	.ascii	"\000"
	.space	1
.LC2:
	.ascii	"<3>%s: Can't find SoC type \012\000"
	.space	3
.LC3:
	.ascii	"<6>%s : special flag[%d]\012\000"
	.space	2
.LC4:
	.ascii	"<6>ARM voltage locking at L%d\012\000"
	.space	1
.LC5:
	.ascii	"<6>CPUFREQ: L%d : %d\012\000"
	.space	2
.LC6:
	.ascii	"<6>%s: Dynamic EMA is enabled\012\000"
	.space	1
.LC7:
	.ascii	"armclk\000"
	.space	1
.LC8:
	.ascii	"moutcore\000"
	.space	3
.LC9:
	.ascii	"mout_mpll\000"
	.space	2
.LC10:
	.ascii	"mout_apll\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	exynos4x12_clkdiv_table, %object
	.size	exynos4x12_clkdiv_table, 180
exynos4x12_clkdiv_table:
	.space	180
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
	.type	exynos4x12_volt_table, %object
	.size	exynos4x12_volt_table, 60
exynos4x12_volt_table:
	.space	60
	.type	need_dynamic_ema, %object
	.size	need_dynamic_ema, 1
need_dynamic_ema:
	.space	1
	.space	3
	.type	cpu_clk, %object
	.size	cpu_clk, 4
cpu_clk:
	.space	4
	.type	max_support_idx, %object
	.size	max_support_idx, 4
max_support_idx:
	.space	4
	.ident	"GCC: (GNU) 4.8"
