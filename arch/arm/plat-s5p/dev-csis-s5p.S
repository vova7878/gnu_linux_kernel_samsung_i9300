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
	.file	"dev-csis-s5p.c"
	.text
	.align	2
	.global	fimc_clk_rate
	.type	fimc_clk_rate, %function
fimc_clk_rate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:samsung_rev
	movt	r3, #:upper16:samsung_rev
	blx	r3
	movw	r2, #26416
	mov	r3, #38144
	cmp	r0, #31
	movt	r2, 2544
	movt	r3, 2746
	movls	r0, r2
	movhi	r0, r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	fimc_clk_rate, .-fimc_clk_rate
	.align	2
	.global	s3c_csis0_set_platdata
	.type	s3c_csis0_set_platdata, %function
s3c_csis0_set_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	subs	r2, r0, #0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	beq	.L13
.L5:
	movw	r3, #:lower16:kmemdup
	mov	r0, r2
	movt	r3, #:upper16:kmemdup
	mov	r1, #28
	mov	r2, #208
	blx	r3
	cmp	r0, #0
	beq	.L14
	movw	r3, #:lower16:samsung_cpu_id
	mov	r2, #0
	movt	r3, #:upper16:samsung_cpu_id
	movt	r2, 17186
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmp	r3, r2
	beq	.L9
	cmn	r3, #465567744
	beq	.L9
.L10:
	movw	r4, #:lower16:s3c_csis0_cfg_gpio
	movw	ip, #:lower16:s3c_csis0_cfg_phy_global
	movw	r1, #:lower16:s3c_csis_clk_on
	movw	r2, #:lower16:s3c_csis_clk_off
	movw	r3, #:lower16:.LANCHOR0
	movt	r4, #:upper16:s3c_csis0_cfg_gpio
	movt	ip, #:upper16:s3c_csis0_cfg_phy_global
	movt	r1, #:upper16:s3c_csis_clk_on
	movt	r2, #:upper16:s3c_csis_clk_off
	movt	r3, #:upper16:.LANCHOR0
	str	r4, [r0, #12]
	str	ip, [r0, #16]
	str	r1, [r0, #20]
	str	r2, [r0, #24]
	str	r0, [r3, #124]
	ldmfd	sp!, {r4, pc}
.L9:
	movw	r3, #:lower16:.LC1
	movt	r3, #:upper16:.LC1
	str	r3, [r0]
	b	.L10
.L13:
	movw	r3, #:lower16:samsung_rev
	movt	r3, #:upper16:samsung_rev
	blx	r3
	movw	ip, #26416
	mov	r1, #38144
	cmp	r0, #31
	movw	r3, #:lower16:.LANCHOR0
	movt	ip, 2544
	movt	r1, 2746
	movt	r3, #:upper16:.LANCHOR0
	movls	r0, ip
	movhi	r0, r1
	mov	r2, r3
	str	r0, [r3, #8]
	b	.L5
.L14:
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LANCHOR1
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR1
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	s3c_csis0_set_platdata, .-s3c_csis0_set_platdata
	.align	2
	.global	s3c_csis1_set_platdata
	.type	s3c_csis1_set_platdata, %function
s3c_csis1_set_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	subs	r2, r0, #0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	beq	.L23
.L16:
	movw	r3, #:lower16:kmemdup
	mov	r0, r2
	movt	r3, #:upper16:kmemdup
	mov	r1, #28
	mov	r2, #208
	blx	r3
	cmp	r0, #0
	beq	.L24
	movw	r3, #:lower16:samsung_cpu_id
	mov	r2, #0
	movt	r3, #:upper16:samsung_cpu_id
	movt	r2, 17186
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmp	r3, r2
	beq	.L20
	cmn	r3, #465567744
	beq	.L20
.L21:
	movw	r4, #:lower16:s3c_csis1_cfg_gpio
	movw	ip, #:lower16:s3c_csis1_cfg_phy_global
	movw	r1, #:lower16:s3c_csis_clk_on
	movw	r2, #:lower16:s3c_csis_clk_off
	movw	r3, #:lower16:.LANCHOR0
	movt	r4, #:upper16:s3c_csis1_cfg_gpio
	movt	ip, #:upper16:s3c_csis1_cfg_phy_global
	movt	r1, #:upper16:s3c_csis_clk_on
	movt	r2, #:upper16:s3c_csis_clk_off
	movt	r3, #:upper16:.LANCHOR0
	str	r4, [r0, #12]
	str	ip, [r0, #16]
	str	r1, [r0, #20]
	str	r2, [r0, #24]
	str	r0, [r3, #516]
	ldmfd	sp!, {r4, pc}
.L20:
	movw	r3, #:lower16:.LC1
	movt	r3, #:upper16:.LC1
	str	r3, [r0]
	b	.L21
.L23:
	movw	r3, #:lower16:samsung_rev
	movt	r3, #:upper16:samsung_rev
	blx	r3
	movw	ip, #26416
	mov	r1, #38144
	cmp	r0, #31
	movw	r3, #:lower16:.LANCHOR0
	movt	ip, 2544
	movt	r1, 2746
	movt	r3, #:upper16:.LANCHOR0
	movls	r0, ip
	movhi	r0, r1
	add	r2, r3, #392
	str	r0, [r3, #400]
	b	.L16
.L24:
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L25
	movt	r0, #:upper16:.LC0
	blx	r3
	ldmfd	sp!, {r4, pc}
.L26:
	.align	2
.L25:
	.word	.LANCHOR1+24
	.fnend
	.size	s3c_csis1_set_platdata, .-s3c_csis1_set_platdata
	.global	s3c_device_csis1
	.global	s3c_device_csis0
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.13221, %object
	.size	__func__.13221, 23
__func__.13221:
	.ascii	"s3c_csis0_set_platdata\000"
	.space	1
	.type	__func__.13232, %object
	.size	__func__.13232, 23
__func__.13232:
	.ascii	"s3c_csis1_set_platdata\000"
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	default_csis0_data, %object
	.size	default_csis0_data, 28
default_csis0_data:
	.word	.LC2
	.word	.LC3
	.word	166000000
	.space	16
	.space	4
	.type	s3c_device_csis0, %object
	.size	s3c_device_csis0, 360
s3c_device_csis0:
	.word	.LC4
	.word	0
	.space	336
	.word	2
	.word	s3c_csis0_resource
	.space	8
	.type	default_csis1_data, %object
	.size	default_csis1_data, 28
default_csis1_data:
	.word	.LC2
	.word	.LC3
	.word	166000000
	.space	16
	.space	4
	.type	s3c_device_csis1, %object
	.size	s3c_device_csis1, 360
s3c_device_csis1:
	.word	.LC4
	.word	1
	.space	336
	.word	2
	.word	s3c_csis1_resource
	.space	8
	.type	s3c_csis1_resource, %object
	.size	s3c_csis1_resource, 56
s3c_csis1_resource:
	.word	294191104
	.word	294207487
	.space	4
	.word	512
	.space	12
	.word	144
	.word	144
	.space	4
	.word	1024
	.space	12
	.type	s3c_csis0_resource, %object
	.size	s3c_csis0_resource, 56
s3c_csis0_resource:
	.word	294125568
	.word	294141951
	.space	4
	.word	512
	.space	12
	.word	142
	.word	142
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>%s: no memory for platform data\012\000"
.LC1:
	.ascii	"mout_mpll_user\000"
	.space	1
.LC2:
	.ascii	"mout_mpll\000"
	.space	2
.LC3:
	.ascii	"sclk_csis\000"
	.space	2
.LC4:
	.ascii	"s3c-csis\000"
	.ident	"GCC: (GNU) 4.8"
