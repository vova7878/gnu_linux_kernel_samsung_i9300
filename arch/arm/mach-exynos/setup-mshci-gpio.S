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
	.file	"setup-mshci-gpio.c"
	.text
	.align	2
	.global	exynos4_setup_mshci_cfg_gpio
	.type	exynos4_setup_mshci_cfg_gpio, %function
exynos4_setup_mshci_cfg_gpio:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r6, #:lower16:s3c_gpio_cfgpin
	ldr	r7, [r0, #92]
	movt	r6, #:upper16:s3c_gpio_cfgpin
	mov	r4, r1
	mov	r0, #81
	mvn	r1, #12
	movw	r5, #:lower16:s3c_gpio_setpull
	blx	r6
	movt	r5, #:upper16:s3c_gpio_setpull
	mov	r1, #0
	mov	r0, #81
	blx	r5
	mvn	r1, #12
	mov	r0, #82
	blx	r6
	mov	r0, #82
	mov	r1, #0
	blx	r5
	ldr	r3, [r7, #12]
	cmp	r3, #4
	beq	.L2
	mvn	r1, #12
	mov	r0, #83
	blx	r6
	mov	r0, #83
	mov	r1, #0
	blx	r5
.L2:
	cmp	r4, #4
	beq	.L4
	cmp	r4, #8
	beq	.L5
	cmp	r4, #1
	ldmnefd	sp!, {r3, r4, r5, r6, r7, pc}
	mvn	r1, #12
	mov	r0, #84
	blx	r6
	mov	r0, #84
	mov	r1, #0
	blx	r5
	mov	r3, #0
	mov	r2, #170
	movt	r3, 65060
	str	r2, [r3, #76]
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L5:
	mov	r4, #92
.L8:
	mov	r0, r4
	mvn	r1, #11
	blx	r6
	mov	r0, r4
	mov	r1, #0
	add	r4, r4, #1
	blx	r5
	cmp	r4, #96
	bne	.L8
	mov	r3, #0
	movw	r2, #10922
	movt	r3, 65060
	str	r2, [r3, #108]
.L4:
	mov	r4, #84
.L10:
	mov	r0, r4
	mvn	r1, #12
	blx	r6
	mov	r0, r4
	mov	r1, #0
	add	r4, r4, #1
	blx	r5
	cmp	r4, #88
	bne	.L10
	mov	r3, #0
	movw	r2, #10922
	movt	r3, 65060
	str	r2, [r3, #76]
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
	.fnend
	.size	exynos4_setup_mshci_cfg_gpio, .-exynos4_setup_mshci_cfg_gpio
	.align	2
	.global	exynos4_setup_mshci_cfg_ddr
	.type	exynos4_setup_mshci_cfg_ddr, %function
exynos4_setup_mshci_cfg_ddr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:samsung_cpu_id
	movt	r3, #:upper16:samsung_cpu_id
	cmp	r1, #0
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	beq	.L19
	cmn	r3, #465567744
	beq	.L20
	mov	r2, #0
	movt	r2, 17186
	cmp	r3, r2
	beq	.L20
.L21:
	mov	r3, #49152
	mov	r2, #5
	movt	r3, 65040
	str	r2, [r3, #1356]
	ldmfd	sp!, {r3, pc}
.L19:
	cmn	r3, #465567744
	beq	.L23
	mov	r2, #0
	movt	r2, 17186
	cmp	r3, r2
	beq	.L23
.L24:
	mov	r3, #49152
	mov	r2, #11
	movt	r3, 65040
	str	r2, [r3, #1356]
	ldmfd	sp!, {r3, pc}
.L20:
	movw	r3, #:lower16:samsung_rev
	movt	r3, #:upper16:samsung_rev
	blx	r3
	cmp	r0, #15
	bls	.L21
	mov	r3, #49152
	mov	r2, #1
	movt	r3, 65040
	str	r2, [r3, #1356]
	ldmfd	sp!, {r3, pc}
.L23:
	movw	r3, #:lower16:samsung_rev
	movt	r3, #:upper16:samsung_rev
	blx	r3
	cmp	r0, #15
	bls	.L24
	mov	r3, #49152
	mov	r2, #3
	movt	r3, 65040
	str	r2, [r3, #1356]
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_setup_mshci_cfg_ddr, .-exynos4_setup_mshci_cfg_ddr
	.align	2
	.global	exynos4_setup_mshci_init_card
	.type	exynos4_setup_mshci_init_card, %function
exynos4_setup_mshci_init_card:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r5, #:lower16:__const_udelay
	mov	r3, #0
	mov	r6, r0
	movt	r5, #:upper16:__const_udelay
	mov	r4, #100
	movt	r3, 65060
	mov	r2, #0
	mov	r1, #256
	str	r1, [r3, #64]
	str	r2, [r3, #68]
	str	r2, [r3, #72]
	str	r2, [r3, #96]
	str	r2, [r3, #100]
	str	r2, [r3, #104]
.L33:
	movw	r0, #12560
	movt	r0, 4915
	blx	r5
	subs	r4, r4, #1
	bne	.L33
	mov	r0, r6
	mov	r1, #8
	bl	exynos4_setup_mshci_cfg_gpio
	movw	r3, #:lower16:__gpio_set_value
	mov	r0, #83
	movt	r3, #:upper16:__gpio_set_value
	mov	r1, #1
	mov	r4, #10
	blx	r3
.L35:
	movw	r0, #12560
	movt	r0, 4915
	blx	r5
	subs	r4, r4, #1
	bne	.L35
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	exynos4_setup_mshci_init_card, .-exynos4_setup_mshci_init_card
	.align	2
	.global	exynos4_setup_mshci_set_power
	.type	exynos4_setup_mshci_set_power, %function
exynos4_setup_mshci_set_power:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	ldr	r7, [r0, #92]
	ldr	r0, [r7, #28]
	cmp	r0, #0
	ldmeqfd	sp!, {r3, r4, r5, r6, r7, pc}
	cmp	r1, #0
	beq	.L39
	movw	r6, #:lower16:s3c_gpio_cfgpin
	mvn	r1, #12
	movt	r6, #:upper16:s3c_gpio_cfgpin
	mov	r0, #81
	movw	r5, #:lower16:s3c_gpio_setpull
	mov	r4, #84
	blx	r6
	movt	r5, #:upper16:s3c_gpio_setpull
	mov	r1, #0
	mov	r0, #81
	blx	r5
	mvn	r1, #12
	mov	r0, #82
	blx	r6
	mov	r0, #82
	mov	r1, #0
	blx	r5
.L41:
	mov	r0, r4
	mvn	r1, #12
	blx	r6
	mov	r0, r4
	mov	r1, #0
	add	r4, r4, #1
	blx	r5
	cmp	r4, #88
	bne	.L41
	mov	r4, #92
.L43:
	mov	r0, r4
	mvn	r1, #11
	blx	r6
	mov	r0, r4
	mov	r1, #0
	add	r4, r4, #1
	blx	r5
	cmp	r4, #96
	bne	.L43
	movw	r3, #:lower16:__gpio_set_value
	ldr	r0, [r7, #28]
	movt	r3, #:upper16:__gpio_set_value
	mov	r1, #1
	blx	r3
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LANCHOR0
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR0
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L39:
	movw	r3, #:lower16:__gpio_set_value
	movw	r6, #:lower16:s3c_gpio_cfgpin
	movt	r3, #:upper16:__gpio_set_value
	movt	r6, #:upper16:s3c_gpio_cfgpin
	blx	r3
	movw	r5, #:lower16:s3c_gpio_setpull
	mvn	r1, #15
	mov	r0, #81
	movt	r5, #:upper16:s3c_gpio_setpull
	blx	r6
	mov	r1, #1
	mov	r0, #81
	blx	r5
	mvn	r1, #15
	mov	r0, #82
	blx	r6
	mov	r0, #82
	mov	r1, #1
	mov	r4, #84
	blx	r5
.L45:
	mov	r0, r4
	mvn	r1, #15
	blx	r6
	mov	r0, r4
	mov	r1, #1
	add	r4, r4, #1
	blx	r5
	cmp	r4, #88
	bne	.L45
	mov	r4, #92
.L47:
	mov	r0, r4
	mvn	r1, #15
	blx	r6
	mov	r0, r4
	mov	r1, #1
	add	r4, r4, #1
	blx	r5
	cmp	r4, #96
	bne	.L47
	movw	r0, #:lower16:.LC1
	movw	r1, #:lower16:.LANCHOR0
	movw	r3, #:lower16:printk
	movw	r5, #:lower16:__const_udelay
	movt	r0, #:upper16:.LC1
	movt	r1, #:upper16:.LANCHOR0
	movt	r3, #:upper16:printk
	movt	r5, #:upper16:__const_udelay
	mov	r4, #50
	blx	r3
.L49:
	movw	r0, #12560
	movt	r0, 4915
	blx	r5
	subs	r4, r4, #1
	bne	.L49
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
	.fnend
	.size	exynos4_setup_mshci_set_power, .-exynos4_setup_mshci_set_power
	.align	2
	.global	exynos4_setup_mshci_shutdown
	.type	exynos4_setup_mshci_shutdown, %function
exynos4_setup_mshci_shutdown:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r5, #:lower16:__const_udelay
	mov	r3, #0
	movt	r5, #:upper16:__const_udelay
	mov	r4, #10
	movt	r3, 65060
	mov	r2, #0
	mov	r1, #256
	str	r1, [r3, #64]
	str	r2, [r3, #68]
	str	r2, [r3, #72]
	str	r2, [r3, #96]
	str	r2, [r3, #100]
	str	r2, [r3, #104]
.L55:
	movw	r0, #12560
	movt	r0, 4915
	blx	r5
	subs	r4, r4, #1
	bne	.L55
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	exynos4_setup_mshci_shutdown, .-exynos4_setup_mshci_shutdown
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.17977, %object
	.size	__func__.17977, 30
__func__.17977:
	.ascii	"exynos4_setup_mshci_set_power\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<6>%s : internal MMC Card ON samsung-mshc.\012\000"
.LC1:
	.ascii	"<6>%s : internal MMC Card OFF samsung-mshc.\012\000"
	.ident	"GCC: (GNU) 4.8"
