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
	.file	"dev-fimc-s5p.c"
	.text
	.align	2
	.global	s3c_fimc0_set_platdata
	.type	s3c_fimc0_set_platdata, %function
s3c_fimc0_set_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r2, #:lower16:.LANCHOR0
	cmp	r0, #0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movt	r2, #:upper16:.LANCHOR0
	movw	r3, #:lower16:kmemdup
	moveq	r0, r2
	movt	r3, #:upper16:kmemdup
	mov	r1, #52
	mov	r2, #208
	blx	r3
	cmp	r0, #0
	beq	.L10
	ldr	r3, [r0, #40]
	mov	r1, #81
	mov	r2, #1
	str	r1, [r0, #32]
	strb	r2, [r0, #36]
	cmp	r3, #0
	movweq	r3, #:lower16:s3c_fimc0_cfg_gpio
	movteq	r3, #:upper16:s3c_fimc0_cfg_gpio
	streq	r3, [r0, #40]
	ldr	r3, [r0, #44]
	cmp	r3, #0
	movweq	r3, #:lower16:s3c_fimc_clk_on
	movteq	r3, #:upper16:s3c_fimc_clk_on
	streq	r3, [r0, #44]
	ldr	r3, [r0, #48]
	cmp	r3, #0
	movweq	r3, #:lower16:s3c_fimc_clk_off
	movteq	r3, #:upper16:s3c_fimc_clk_off
	streq	r3, [r0, #48]
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	str	r0, [r3, #148]
	ldmfd	sp!, {r3, pc}
.L10:
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LANCHOR1
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR1
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	s3c_fimc0_set_platdata, .-s3c_fimc0_set_platdata
	.align	2
	.global	s3c_fimc1_set_platdata
	.type	s3c_fimc1_set_platdata, %function
s3c_fimc1_set_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L20
	cmp	r0, #0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:kmemdup
	movt	r3, #:upper16:kmemdup
	mov	r1, #52
	moveq	r0, ip
	mov	r2, #208
	blx	r3
	cmp	r0, #0
	beq	.L19
	ldr	r3, [r0, #40]
	mov	r1, #81
	mov	r2, #0
	str	r1, [r0, #32]
	strb	r2, [r0, #36]
	cmp	r3, #0
	movweq	r3, #:lower16:s3c_fimc1_cfg_gpio
	movteq	r3, #:upper16:s3c_fimc1_cfg_gpio
	streq	r3, [r0, #40]
	ldr	r3, [r0, #44]
	cmp	r3, #0
	movweq	r3, #:lower16:s3c_fimc_clk_on
	movteq	r3, #:upper16:s3c_fimc_clk_on
	streq	r3, [r0, #44]
	ldr	r3, [r0, #48]
	cmp	r3, #0
	movweq	r3, #:lower16:s3c_fimc_clk_off
	movteq	r3, #:upper16:s3c_fimc_clk_off
	streq	r3, [r0, #48]
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	str	r0, [r3, #564]
	ldmfd	sp!, {r3, pc}
.L19:
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L20+4
	movt	r0, #:upper16:.LC0
	blx	r3
	ldmfd	sp!, {r3, pc}
.L21:
	.align	2
.L20:
	.word	.LANCHOR0+416
	.word	.LANCHOR1+24
	.fnend
	.size	s3c_fimc1_set_platdata, .-s3c_fimc1_set_platdata
	.align	2
	.global	s3c_fimc2_set_platdata
	.type	s3c_fimc2_set_platdata, %function
s3c_fimc2_set_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L31
	cmp	r0, #0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:kmemdup
	movt	r3, #:upper16:kmemdup
	mov	r1, #52
	moveq	r0, ip
	mov	r2, #208
	blx	r3
	cmp	r0, #0
	beq	.L30
	ldr	r3, [r0, #40]
	mov	r1, #81
	mov	r2, #0
	str	r1, [r0, #32]
	strb	r2, [r0, #36]
	cmp	r3, #0
	movweq	r3, #:lower16:s3c_fimc2_cfg_gpio
	movteq	r3, #:upper16:s3c_fimc2_cfg_gpio
	streq	r3, [r0, #40]
	ldr	r3, [r0, #44]
	cmp	r3, #0
	movweq	r3, #:lower16:s3c_fimc_clk_on
	movteq	r3, #:upper16:s3c_fimc_clk_on
	streq	r3, [r0, #44]
	ldr	r3, [r0, #48]
	cmp	r3, #0
	movweq	r3, #:lower16:s3c_fimc_clk_off
	movteq	r3, #:upper16:s3c_fimc_clk_off
	streq	r3, [r0, #48]
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	str	r0, [r3, #980]
	ldmfd	sp!, {r3, pc}
.L30:
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L31+4
	movt	r0, #:upper16:.LC0
	blx	r3
	ldmfd	sp!, {r3, pc}
.L32:
	.align	2
.L31:
	.word	.LANCHOR0+832
	.word	.LANCHOR1+48
	.fnend
	.size	s3c_fimc2_set_platdata, .-s3c_fimc2_set_platdata
	.align	2
	.global	s3c_fimc3_set_platdata
	.type	s3c_fimc3_set_platdata, %function
s3c_fimc3_set_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L42
	cmp	r0, #0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:kmemdup
	movt	r3, #:upper16:kmemdup
	mov	r1, #52
	moveq	r0, ip
	mov	r2, #208
	blx	r3
	cmp	r0, #0
	beq	.L41
	ldr	r3, [r0, #40]
	mov	r1, #81
	mov	r2, #0
	str	r1, [r0, #32]
	strb	r2, [r0, #36]
	cmp	r3, #0
	movweq	r3, #:lower16:s3c_fimc3_cfg_gpio
	movteq	r3, #:upper16:s3c_fimc3_cfg_gpio
	streq	r3, [r0, #40]
	ldr	r3, [r0, #44]
	cmp	r3, #0
	movweq	r3, #:lower16:s3c_fimc_clk_on
	movteq	r3, #:upper16:s3c_fimc_clk_on
	streq	r3, [r0, #44]
	ldr	r3, [r0, #48]
	cmp	r3, #0
	movweq	r3, #:lower16:s3c_fimc_clk_off
	movteq	r3, #:upper16:s3c_fimc_clk_off
	streq	r3, [r0, #48]
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	str	r0, [r3, #1396]
	ldmfd	sp!, {r3, pc}
.L41:
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L42+4
	movt	r0, #:upper16:.LC0
	blx	r3
	ldmfd	sp!, {r3, pc}
.L43:
	.align	2
.L42:
	.word	.LANCHOR0+1248
	.word	.LANCHOR1+72
	.fnend
	.size	s3c_fimc3_set_platdata, .-s3c_fimc3_set_platdata
	.global	s3c_device_fimc3
	.global	s3c_device_fimc2
	.global	s3c_device_fimc1
	.global	s3c_device_fimc0
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.17112, %object
	.size	__func__.17112, 23
__func__.17112:
	.ascii	"s3c_fimc0_set_platdata\000"
	.space	1
	.type	__func__.17123, %object
	.size	__func__.17123, 23
__func__.17123:
	.ascii	"s3c_fimc1_set_platdata\000"
	.space	1
	.type	__func__.17134, %object
	.size	__func__.17134, 23
__func__.17134:
	.ascii	"s3c_fimc2_set_platdata\000"
	.space	1
	.type	__func__.17145, %object
	.size	__func__.17145, 23
__func__.17145:
	.ascii	"s3c_fimc3_set_platdata\000"
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	default_fimc0_data, %object
	.size	default_fimc0_data, 52
default_fimc0_data:
	.word	0
	.space	28
	.word	81
	.space	16
	.space	4
	.type	s3c_device_fimc0, %object
	.size	s3c_device_fimc0, 360
s3c_device_fimc0:
	.word	.LC1
	.word	0
	.space	336
	.word	2
	.word	s3c_fimc0_resource
	.space	8
	.type	default_fimc1_data, %object
	.size	default_fimc1_data, 52
default_fimc1_data:
	.word	0
	.space	28
	.word	81
	.space	16
	.space	4
	.type	s3c_device_fimc1, %object
	.size	s3c_device_fimc1, 360
s3c_device_fimc1:
	.word	.LC1
	.word	1
	.space	336
	.word	2
	.word	s3c_fimc1_resource
	.space	8
	.type	default_fimc2_data, %object
	.size	default_fimc2_data, 52
default_fimc2_data:
	.word	0
	.space	28
	.word	81
	.space	16
	.space	4
	.type	s3c_device_fimc2, %object
	.size	s3c_device_fimc2, 360
s3c_device_fimc2:
	.word	.LC1
	.word	2
	.space	336
	.word	2
	.word	s3c_fimc2_resource
	.space	8
	.type	default_fimc3_data, %object
	.size	default_fimc3_data, 52
default_fimc3_data:
	.word	0
	.space	28
	.word	81
	.space	16
	.space	4
	.type	s3c_device_fimc3, %object
	.size	s3c_device_fimc3, 360
s3c_device_fimc3:
	.word	.LC1
	.word	3
	.space	336
	.word	2
	.word	s3c_fimc3_resource
	.space	8
	.type	s3c_fimc3_resource, %object
	.size	s3c_fimc3_resource, 56
s3c_fimc3_resource:
	.word	293797888
	.word	293801983
	.space	4
	.word	512
	.space	12
	.word	151
	.word	151
	.space	4
	.word	1024
	.space	12
	.type	s3c_fimc2_resource, %object
	.size	s3c_fimc2_resource, 56
s3c_fimc2_resource:
	.word	293732352
	.word	293736447
	.space	4
	.word	512
	.space	12
	.word	150
	.word	150
	.space	4
	.word	1024
	.space	12
	.type	s3c_fimc1_resource, %object
	.size	s3c_fimc1_resource, 56
s3c_fimc1_resource:
	.word	293666816
	.word	293670911
	.space	4
	.word	512
	.space	12
	.word	149
	.word	149
	.space	4
	.word	1024
	.space	12
	.type	s3c_fimc0_resource, %object
	.size	s3c_fimc0_resource, 56
s3c_fimc0_resource:
	.word	293601280
	.word	293605375
	.space	4
	.word	512
	.space	12
	.word	148
	.word	148
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>%s: no memory for platform data\012\000"
.LC1:
	.ascii	"s3c-fimc\000"
	.ident	"GCC: (GNU) 4.8"
