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
	.file	"setup-fimc-is.c"
	.text
	.align	2
	.global	exynos_fimc_is_cfg_gpio
	.type	exynos_fimc_is_cfg_gpio, %function
exynos_fimc_is_cfg_gpio:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r1, #:lower16:.LC0
	movw	r7, #:lower16:gpio_request
	movt	r1, #:upper16:.LC0
	movt	r7, #:upper16:gpio_request
	movw	r0, #283
	blx	r7
	cmp	r0, #0
	bne	.L11
.L2:
	movw	r6, #:lower16:s3c_gpio_cfgpin
	mov	r1, #512
	movw	r0, #283
	movt	r6, #:upper16:s3c_gpio_cfgpin
	movw	r5, #:lower16:s3c_gpio_setpull
	movw	r4, #:lower16:gpio_free
	blx	r6
	movt	r5, #:upper16:s3c_gpio_setpull
	mov	r1, #0
	movw	r0, #283
	movt	r4, #:upper16:gpio_free
	blx	r5
	movw	r0, #283
	blx	r4
	movw	r1, #:lower16:.LC0
	mov	r0, #284
	movt	r1, #:upper16:.LC0
	blx	r7
	cmp	r0, #0
	bne	.L12
.L3:
	mov	r1, #8192
	mov	r0, #284
	blx	r6
	mov	r1, #0
	mov	r0, #284
	blx	r5
	mov	r0, #284
	blx	r4
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L11:
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC1
	blx	r3
	b	.L2
.L12:
	movw	r0, #:lower16:.LC2
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC2
	blx	r3
	b	.L3
	.fnend
	.size	exynos_fimc_is_cfg_gpio, .-exynos_fimc_is_cfg_gpio
	.align	2
	.global	exynos_fimc_is_clk_get
	.type	exynos_fimc_is_clk_get, %function
exynos_fimc_is_clk_get:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r1, #:lower16:.LC3
	mov	r3, r0
	add	r5, r0, #8
	movw	r6, #:lower16:clk_get
	mov	r0, r5
	ldr	r4, [r3, #92]
	movt	r1, #:upper16:.LC3
	movt	r6, #:upper16:clk_get
	blx	r6
	cmn	r0, #4096
	str	r0, [r4, #4]
	bhi	.L49
	movw	r1, #:lower16:.LC5
	mov	r0, r5
	movt	r1, #:upper16:.LC5
	blx	r6
	cmn	r0, #4096
	str	r0, [r4, #8]
	bhi	.L50
	movw	r1, #:lower16:.LC7
	mov	r0, r5
	movt	r1, #:upper16:.LC7
	blx	r6
	cmn	r0, #4096
	str	r0, [r4, #12]
	bhi	.L51
	movw	r1, #:lower16:.LC9
	mov	r0, r5
	movt	r1, #:upper16:.LC9
	blx	r6
	cmn	r0, #4096
	str	r0, [r4, #16]
	bhi	.L52
	movw	r1, #:lower16:.LC11
	mov	r0, r5
	movt	r1, #:upper16:.LC11
	blx	r6
	cmn	r0, #4096
	str	r0, [r4, #20]
	bhi	.L53
	movw	r1, #:lower16:.LC13
	mov	r0, r5
	movt	r1, #:upper16:.LC13
	blx	r6
	cmn	r0, #4096
	str	r0, [r4, #24]
	bhi	.L54
	movw	r1, #:lower16:.LC15
	mov	r0, r5
	movt	r1, #:upper16:.LC15
	blx	r6
	cmn	r0, #4096
	str	r0, [r4, #28]
	bhi	.L55
	movw	r1, #:lower16:.LC17
	mov	r0, r5
	movt	r1, #:upper16:.LC17
	blx	r6
	cmn	r0, #4096
	str	r0, [r4, #32]
	bhi	.L56
	movw	r1, #:lower16:.LC19
	mov	r0, r5
	movt	r1, #:upper16:.LC19
	blx	r6
	cmn	r0, #4096
	str	r0, [r4, #36]
	bhi	.L57
	movw	r1, #:lower16:.LC21
	mov	r0, r5
	movt	r1, #:upper16:.LC21
	blx	r6
	cmn	r0, #4096
	str	r0, [r4, #40]
	bhi	.L58
	movw	r1, #:lower16:.LC23
	mov	r0, r5
	movt	r1, #:upper16:.LC23
	movw	r7, #:lower16:clk_get
	blx	r6
	cmn	r0, #4096
	str	r0, [r4, #44]
	movt	r7, #:upper16:clk_get
	bhi	.L59
	movw	r1, #:lower16:.LC25
	mov	r0, r5
	movt	r1, #:upper16:.LC25
	blx	r7
	cmn	r0, #4096
	str	r0, [r4, #48]
	bhi	.L60
	movw	r1, #:lower16:.LC27
	mov	r0, r5
	movt	r1, #:upper16:.LC27
	blx	r7
	cmn	r0, #4096
	str	r0, [r4, #52]
	bhi	.L61
	movw	r1, #:lower16:.LC29
	mov	r0, r5
	movt	r1, #:upper16:.LC29
	blx	r7
	cmn	r0, #4096
	str	r0, [r4, #56]
	bhi	.L62
	movw	r1, #:lower16:.LC31
	mov	r0, r5
	movt	r1, #:upper16:.LC31
	blx	r7
	cmn	r0, #4096
	str	r0, [r4, #60]
	bhi	.L63
	movw	r1, #:lower16:.LC33
	mov	r0, r5
	movt	r1, #:upper16:.LC33
	blx	r7
	cmn	r0, #4096
	str	r0, [r4, #64]
	bhi	.L64
	movw	r1, #:lower16:.LC35
	mov	r0, r5
	movt	r1, #:upper16:.LC35
	blx	r7
	cmn	r0, #4096
	str	r0, [r4, #68]
	bhi	.L65
	movw	r1, #:lower16:.LC37
	mov	r0, r5
	movt	r1, #:upper16:.LC37
	blx	r7
	cmn	r0, #4096
	str	r0, [r4, #72]
	bhi	.L66
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L49:
	movw	r0, #:lower16:.LC4
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC4
	blx	r3
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L66:
	movw	r0, #:lower16:.LC38
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC38
	movt	r3, #:upper16:printk
	movw	r5, #:lower16:clk_put
	blx	r3
	movt	r5, #:upper16:clk_put
	ldr	r0, [r4, #68]
	blx	r5
.L47:
	ldr	r0, [r4, #64]
	blx	r5
.L45:
	ldr	r0, [r4, #60]
	blx	r5
.L43:
	ldr	r0, [r4, #56]
	blx	r5
.L41:
	ldr	r0, [r4, #52]
	blx	r5
.L39:
	ldr	r0, [r4, #48]
	blx	r5
.L37:
	ldr	r0, [r4, #44]
	blx	r5
.L35:
	ldr	r0, [r4, #40]
	blx	r5
.L33:
	ldr	r0, [r4, #36]
	blx	r5
.L31:
	ldr	r0, [r4, #32]
	blx	r5
.L29:
	ldr	r0, [r4, #28]
	blx	r5
.L27:
	ldr	r0, [r4, #24]
	blx	r5
.L25:
	ldr	r0, [r4, #20]
	blx	r5
.L23:
	ldr	r0, [r4, #16]
	blx	r5
.L21:
	ldr	r0, [r4, #12]
	blx	r5
.L19:
	ldr	r0, [r4, #8]
	blx	r5
.L17:
	ldr	r0, [r4, #4]
	blx	r5
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L65:
	movw	r0, #:lower16:.LC36
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC36
	movt	r3, #:upper16:printk
	movw	r5, #:lower16:clk_put
	blx	r3
	movt	r5, #:upper16:clk_put
	b	.L47
.L64:
	movw	r0, #:lower16:.LC34
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC34
	movt	r3, #:upper16:printk
	movw	r5, #:lower16:clk_put
	blx	r3
	movt	r5, #:upper16:clk_put
	b	.L45
.L63:
	movw	r0, #:lower16:.LC32
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC32
	movt	r3, #:upper16:printk
	movw	r5, #:lower16:clk_put
	blx	r3
	movt	r5, #:upper16:clk_put
	b	.L43
.L62:
	movw	r0, #:lower16:.LC30
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC30
	movt	r3, #:upper16:printk
	movw	r5, #:lower16:clk_put
	blx	r3
	movt	r5, #:upper16:clk_put
	b	.L41
.L61:
	movw	r0, #:lower16:.LC28
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC28
	movt	r3, #:upper16:printk
	movw	r5, #:lower16:clk_put
	blx	r3
	movt	r5, #:upper16:clk_put
	b	.L39
.L60:
	movw	r0, #:lower16:.LC26
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC26
	movt	r3, #:upper16:printk
	movw	r5, #:lower16:clk_put
	blx	r3
	movt	r5, #:upper16:clk_put
	b	.L37
.L59:
	movw	r0, #:lower16:.LC24
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC24
	movt	r3, #:upper16:printk
	movw	r5, #:lower16:clk_put
	blx	r3
	movt	r5, #:upper16:clk_put
	b	.L35
.L58:
	movw	r0, #:lower16:.LC22
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC22
	movt	r3, #:upper16:printk
	movw	r5, #:lower16:clk_put
	blx	r3
	movt	r5, #:upper16:clk_put
	b	.L33
.L57:
	movw	r0, #:lower16:.LC20
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC20
	movt	r3, #:upper16:printk
	movw	r5, #:lower16:clk_put
	blx	r3
	movt	r5, #:upper16:clk_put
	b	.L31
.L56:
	movw	r0, #:lower16:.LC18
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC18
	movt	r3, #:upper16:printk
	movw	r5, #:lower16:clk_put
	blx	r3
	movt	r5, #:upper16:clk_put
	b	.L29
.L55:
	movw	r0, #:lower16:.LC16
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC16
	movt	r3, #:upper16:printk
	movw	r5, #:lower16:clk_put
	blx	r3
	movt	r5, #:upper16:clk_put
	b	.L27
.L54:
	movw	r0, #:lower16:.LC14
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC14
	movt	r3, #:upper16:printk
	movw	r5, #:lower16:clk_put
	blx	r3
	movt	r5, #:upper16:clk_put
	b	.L25
.L53:
	movw	r0, #:lower16:.LC12
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC12
	movt	r3, #:upper16:printk
	movw	r5, #:lower16:clk_put
	blx	r3
	movt	r5, #:upper16:clk_put
	b	.L23
.L52:
	movw	r0, #:lower16:.LC10
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC10
	movt	r3, #:upper16:printk
	movw	r5, #:lower16:clk_put
	blx	r3
	movt	r5, #:upper16:clk_put
	b	.L21
.L51:
	movw	r0, #:lower16:.LC8
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC8
	movt	r3, #:upper16:printk
	movw	r5, #:lower16:clk_put
	blx	r3
	movt	r5, #:upper16:clk_put
	b	.L19
.L50:
	movw	r0, #:lower16:.LC6
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC6
	movt	r3, #:upper16:printk
	movw	r5, #:lower16:clk_put
	blx	r3
	movt	r5, #:upper16:clk_put
	b	.L17
	.fnend
	.size	exynos_fimc_is_clk_get, .-exynos_fimc_is_clk_get
	.align	2
	.global	exynos_fimc_is_cfg_clk
	.type	exynos_fimc_is_cfg_clk, %function
exynos_fimc_is_cfg_clk:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #32768
	mov	r2, #49152
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movt	r2, 65040
	mov	lr, #17
	mov	ip, #48
	movt	r1, 65041
	movw	r3, #:lower16:clk_set_parent
	ldr	r4, [r0, #92]
	movt	r3, #:upper16:clk_set_parent
	str	lr, [r1, #768]
	str	ip, [r1, #772]
	ldr	r1, [r2, #532]
	orr	r1, r1, #17825792
	str	r1, [r2, #532]
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	blx	r3
	movw	r1, #61568
	movw	r3, #:lower16:clk_set_rate
	ldr	r0, [r4, #8]
	movt	r1, 762
	movt	r3, #:upper16:clk_set_rate
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	exynos_fimc_is_cfg_clk, .-exynos_fimc_is_cfg_clk
	.align	2
	.global	exynos_fimc_is_clk_on
	.type	exynos_fimc_is_clk_on, %function
exynos_fimc_is_clk_on:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movw	r7, #:lower16:clk_enable
	ldr	r8, [r0, #92]
	movt	r7, #:upper16:clk_enable
	mov	r6, #12
	mov	r5, r8
.L70:
	ldr	r0, [r5, #12]
	movw	r4, #:lower16:clk_enable
	blx	r7
	subs	r6, r6, #1
	add	r5, r5, #4
	movt	r4, #:upper16:clk_enable
	bne	.L70
	ldr	r0, [r8, #60]
	movw	r7, #:lower16:clk_disable
	blx	r4
	ldr	r0, [r8, #64]
	movt	r7, #:upper16:clk_disable
	blx	r4
	ldr	r0, [r8, #68]
	mov	r6, r8
	blx	r4
	ldr	r0, [r8, #72]
	mov	r5, #12
	blx	r4
.L72:
	ldr	r0, [r6, #12]
	movw	r4, #:lower16:clk_disable
	blx	r7
	subs	r5, r5, #1
	add	r6, r6, #4
	movt	r4, #:upper16:clk_disable
	bne	.L72
	ldr	r0, [r8, #60]
	blx	r4
	ldr	r0, [r8, #64]
	blx	r4
	ldr	r0, [r8, #68]
	blx	r4
	ldr	r0, [r8, #72]
	blx	r4
	mov	r0, r5
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
	.fnend
	.size	exynos_fimc_is_clk_on, .-exynos_fimc_is_clk_on
	.align	2
	.global	exynos_fimc_is_clk_off
	.type	exynos_fimc_is_clk_off, %function
exynos_fimc_is_clk_off:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	exynos_fimc_is_clk_off, .-exynos_fimc_is_clk_off
	.align	2
	.global	exynos_fimc_is_clk_put
	.type	exynos_fimc_is_clk_put, %function
exynos_fimc_is_clk_put:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r6, #:lower16:clk_put
	ldr	r7, [r0, #92]
	movt	r6, #:upper16:clk_put
	mov	r4, #16
	ldr	r0, [r7, #4]
	mov	r5, r7
	blx	r6
	ldr	r0, [r7, #8]
	blx	r6
.L76:
	ldr	r0, [r5, #12]
	add	r5, r5, #4
	blx	r6
	subs	r4, r4, #1
	bne	.L76
	mov	r0, r4
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
	.fnend
	.size	exynos_fimc_is_clk_put, .-exynos_fimc_is_clk_put
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"GPM4\000"
	.space	3
.LC1:
	.ascii	"<3>#### failed to request GPM4_2 ####\012\000"
	.space	1
.LC2:
	.ascii	"<3>#### failed to request GPM4_3 ####\012\000"
	.space	1
.LC3:
	.ascii	"mout_mpll_user\000"
	.space	1
.LC4:
	.ascii	"<3>failed to get mout_mpll_user\012\000"
	.space	3
.LC5:
	.ascii	"sclk_uart_isp\000"
	.space	2
.LC6:
	.ascii	"<3>failed to get sclk_uart_isp\012\000"
.LC7:
	.ascii	"mtcadc\000"
	.space	1
.LC8:
	.ascii	"<3>failed to get mtcadc\012\000"
	.space	3
.LC9:
	.ascii	"mpwm_isp\000"
	.space	3
.LC10:
	.ascii	"<3>failed to get mpwm_isp\012\000"
	.space	1
.LC11:
	.ascii	"ppmuisp\000"
.LC12:
	.ascii	"<3>failed to get ppmuisp\012\000"
	.space	2
.LC13:
	.ascii	"qelite1\000"
.LC14:
	.ascii	"<3>failed to get qelite1\012\000"
	.space	2
.LC15:
	.ascii	"qelite0\000"
.LC16:
	.ascii	"<3>failed to get qelite0\012\000"
	.space	2
.LC17:
	.ascii	"qefd\000"
	.space	3
.LC18:
	.ascii	"<3>failed to get qefd\012\000"
	.space	1
.LC19:
	.ascii	"qedrc\000"
	.space	2
.LC20:
	.ascii	"<3>failed to get qedrc\012\000"
.LC21:
	.ascii	"qeisp\000"
	.space	2
.LC22:
	.ascii	"<3>failed to get qeisp\012\000"
.LC23:
	.ascii	"sysmmu_lite1\000"
	.space	3
.LC24:
	.ascii	"<3>failed to get sysmmu_lite1\012\000"
	.space	1
.LC25:
	.ascii	"sysmmu_lite0\000"
	.space	3
.LC26:
	.ascii	"<3>failed to get sysmmu_lite0\012\000"
	.space	1
.LC27:
	.ascii	"spi1_isp\000"
	.space	3
.LC28:
	.ascii	"<3>failed to get spi1_isp\012\000"
	.space	1
.LC29:
	.ascii	"spi0_isp\000"
	.space	3
.LC30:
	.ascii	"<3>failed to get spi0_isp\012\000"
	.space	1
.LC31:
	.ascii	"sysmmu_fd\000"
	.space	2
.LC32:
	.ascii	"<3>failed to get sysmmu_fd\012\000"
.LC33:
	.ascii	"sysmmu_drc\000"
	.space	1
.LC34:
	.ascii	"<3>failed to get sysmmu_drc\012\000"
	.space	3
.LC35:
	.ascii	"sysmmu_isp\000"
	.space	1
.LC36:
	.ascii	"<3>failed to get sysmmu_isp\012\000"
	.space	3
.LC37:
	.ascii	"sysmmu_ispcx\000"
	.space	3
.LC38:
	.ascii	"<3>failed to get sysmmu_ispcx\012\000"
	.ident	"GCC: (GNU) 4.8"
