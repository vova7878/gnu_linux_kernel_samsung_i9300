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
	.file	"dev-fimc-is.c"
	.text
	.align	2
	.global	exynos4_fimc_is_set_platdata
	.type	exynos4_fimc_is_set_platdata, %function
exynos4_fimc_is_set_platdata:
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
	mov	r1, #100
	mov	r2, #208
	blx	r3
	cmp	r0, #0
	beq	.L13
	ldr	r3, [r0, #76]
	cmp	r3, #0
	movweq	r3, #:lower16:exynos_fimc_is_cfg_gpio
	movteq	r3, #:upper16:exynos_fimc_is_cfg_gpio
	streq	r3, [r0, #76]
	ldr	r3, [r0, #88]
	cmp	r3, #0
	movweq	r3, #:lower16:exynos_fimc_is_cfg_clk
	movteq	r3, #:upper16:exynos_fimc_is_cfg_clk
	streq	r3, [r0, #88]
	ldr	r3, [r0, #92]
	cmp	r3, #0
	movweq	r3, #:lower16:exynos_fimc_is_clk_on
	movteq	r3, #:upper16:exynos_fimc_is_clk_on
	streq	r3, [r0, #92]
	ldr	r3, [r0, #96]
	cmp	r3, #0
	movweq	r3, #:lower16:exynos_fimc_is_clk_off
	movteq	r3, #:upper16:exynos_fimc_is_clk_off
	streq	r3, [r0, #96]
	ldr	r3, [r0, #80]
	cmp	r3, #0
	movweq	r3, #:lower16:exynos_fimc_is_clk_get
	movteq	r3, #:upper16:exynos_fimc_is_clk_get
	streq	r3, [r0, #80]
	ldr	r3, [r0, #84]
	cmp	r3, #0
	movweq	r3, #:lower16:exynos_fimc_is_clk_put
	movteq	r3, #:upper16:exynos_fimc_is_clk_put
	streq	r3, [r0, #84]
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	str	r0, [r3, #196]
	ldmfd	sp!, {r3, pc}
.L13:
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LANCHOR1
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR1
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_fimc_is_set_platdata, .-exynos4_fimc_is_set_platdata
	.global	exynos4_fimc_is_default_data
	.global	exynos4_device_fimc_is
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.17356, %object
	.size	__func__.17356, 29
__func__.17356:
	.ascii	"exynos4_fimc_is_set_platdata\000"
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	exynos4_fimc_is_default_data, %object
	.size	exynos4_fimc_is_default_data, 100
exynos4_fimc_is_default_data:
	.word	15
	.space	96
	.space	4
	.type	exynos4_device_fimc_is, %object
	.size	exynos4_device_fimc_is, 360
exynos4_device_fimc_is:
	.word	.LC1
	.word	-1
	.space	336
	.word	3
	.word	exynos4_fimc_is_resource
	.space	8
	.type	exynos4_fimc_is_resource, %object
	.size	exynos4_fimc_is_resource, 84
exynos4_fimc_is_resource:
	.word	301989888
	.word	304480255
	.space	4
	.word	512
	.space	12
	.word	154
	.word	154
	.space	4
	.word	1024
	.space	12
	.word	159
	.word	159
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>%s: no memory for platform data\012\000"
.LC1:
	.ascii	"exynos4-fimc-is\000"
	.ident	"GCC: (GNU) 4.8"
