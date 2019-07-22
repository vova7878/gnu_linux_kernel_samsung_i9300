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
	.file	"dev-spi.c"
	.text
	.align	2
	.type	exynos_spi_cfg_gpio, %function
exynos_spi_cfg_gpio:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	ldr	r3, [r0, #4]
	cmp	r3, #1
	beq	.L3
	cmp	r3, #2
	beq	.L4
	cmp	r3, #0
	beq	.L20
	movw	r1, #:lower16:.LC0
	movw	r3, #:lower16:dev_err
	movt	r1, #:upper16:.LC0
	movt	r3, #:upper16:dev_err
	add	r0, r0, #8
	blx	r3
	mvn	r0, #21
	ldmfd	sp!, {r4, r5, r6, pc}
.L20:
	movw	r4, #:lower16:s3c_gpio_cfgpin
	mvn	r1, #13
	movt	r4, #:upper16:s3c_gpio_cfgpin
	mov	r0, #16
	blx	r4
	mvn	r1, #13
	mov	r0, #18
	blx	r4
	movw	r6, #:lower16:s3c_gpio_setpull
	mvn	r1, #13
	mov	r0, #19
	movt	r6, #:upper16:s3c_gpio_setpull
	blx	r4
	mov	r1, #3
	mov	r0, #16
	blx	r6
	mov	r1, #3
	mov	r0, #18
	blx	r6
	movw	r4, #:lower16:s5p_gpio_set_drvstr
	mov	r0, #19
	mov	r1, #3
	movt	r4, #:upper16:s5p_gpio_set_drvstr
	mov	r5, #16
	blx	r6
.L8:
	mov	r1, #1
	mov	r0, r5
	add	r5, r5, r1
	blx	r4
	cmp	r5, #20
	bne	.L8
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
.L4:
	movw	r4, #:lower16:s3c_gpio_cfgpin
	mvn	r1, #10
	movt	r4, #:upper16:s3c_gpio_cfgpin
	mov	r0, #32
	blx	r4
	mvn	r1, #10
	mov	r0, #34
	blx	r4
	movw	r6, #:lower16:s3c_gpio_setpull
	mvn	r1, #10
	mov	r0, #35
	movt	r6, #:upper16:s3c_gpio_setpull
	blx	r4
	mov	r1, #3
	mov	r0, #32
	blx	r6
	mov	r1, #3
	mov	r0, #34
	blx	r6
	movw	r4, #:lower16:s5p_gpio_set_drvstr
	mov	r0, #35
	mov	r1, #3
	movt	r4, #:upper16:s5p_gpio_set_drvstr
	mov	r5, #32
	blx	r6
.L11:
	mov	r1, #1
	mov	r0, r5
	add	r5, r5, r1
	blx	r4
	cmp	r5, #36
	bne	.L11
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
.L3:
	movw	r4, #:lower16:s3c_gpio_cfgpin
	mvn	r1, #13
	movt	r4, #:upper16:s3c_gpio_cfgpin
	mov	r0, #20
	blx	r4
	mvn	r1, #13
	mov	r0, #22
	blx	r4
	movw	r6, #:lower16:s3c_gpio_setpull
	mvn	r1, #13
	mov	r0, #23
	movt	r6, #:upper16:s3c_gpio_setpull
	blx	r4
	mov	r1, #3
	mov	r0, #20
	blx	r6
	mov	r1, #3
	mov	r0, #22
	blx	r6
	movw	r4, #:lower16:s5p_gpio_set_drvstr
	mov	r0, #23
	mov	r1, #3
	movt	r4, #:upper16:s5p_gpio_set_drvstr
	mov	r5, #20
	blx	r6
.L10:
	mov	r1, #1
	mov	r0, r5
	add	r5, r5, r1
	blx	r4
	cmp	r5, #24
	bne	.L10
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	exynos_spi_cfg_gpio, .-exynos_spi_cfg_gpio
	.align	2
	.global	exynos_spi_set_info
	.type	exynos_spi_set_info, %function
exynos_spi_set_info:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	subs	ip, r2, #0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	mov	r2, r0
	beq	.L22
	cmp	r1, #0
	bne	.L22
	cmp	r0, #1
	beq	.L29
	cmp	r0, #2
	beq	.L27
	cmp	r0, #0
	beq	.L34
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LANCHOR1
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR1
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC2
	blx	r3
	ldmfd	sp!, {r3, pc}
.L27:
	ldr	r3, .L35
.L26:
	movw	r1, #:lower16:.LC3
	mov	r2, #0
	movt	r1, #:upper16:.LC3
	str	ip, [r3, #12]
	str	r1, [r3, #4]
	str	r2, [r3]
	ldmfd	sp!, {r3, pc}
.L34:
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	b	.L26
.L29:
	ldr	r3, .L35+4
	b	.L26
.L22:
	movw	r0, #:lower16:.LC1
	movw	r1, #:lower16:.LANCHOR1
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR1
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC1
	blx	r3
	ldmfd	sp!, {r3, pc}
.L36:
	.align	2
.L35:
	.word	.LANCHOR0+72
	.word	.LANCHOR0+36
	.fnend
	.size	exynos_spi_set_info, .-exynos_spi_set_info
	.global	exynos_device_spi2
	.global	exynos_device_spi1
	.global	exynos_device_spi0
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.16568, %object
	.size	__func__.16568, 20
__func__.16568:
	.ascii	"exynos_spi_set_info\000"
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	exynos_spi0_pdata, %object
	.size	exynos_spi0_pdata, 36
exynos_spi0_pdata:
	.space	8
	.byte	1
	.space	7
	.word	exynos_spi_cfg_gpio
	.word	511
	.word	15
	.word	1
	.word	25
	.type	exynos_spi1_pdata, %object
	.size	exynos_spi1_pdata, 36
exynos_spi1_pdata:
	.space	8
	.byte	1
	.space	7
	.word	exynos_spi_cfg_gpio
	.word	127
	.word	15
	.word	1
	.word	25
	.type	exynos_spi2_pdata, %object
	.size	exynos_spi2_pdata, 36
exynos_spi2_pdata:
	.space	8
	.byte	1
	.space	7
	.word	exynos_spi_cfg_gpio
	.word	127
	.word	15
	.word	1
	.word	25
	.space	4
	.type	exynos_device_spi2, %object
	.size	exynos_device_spi2, 360
exynos_device_spi2:
	.word	.LC4
	.word	2
	.space	84
	.word	exynos_spi2_pdata
	.space	164
	.word	spi_dmamask
	.word	-1
	.word	0
	.space	72
	.word	4
	.word	exynos_spi2_resource
	.space	8
	.type	exynos_spi2_resource, %object
	.size	exynos_spi2_resource, 112
exynos_spi2_resource:
	.word	328466432
	.word	328466687
	.space	4
	.word	512
	.space	12
	.word	27
	.word	27
	.space	4
	.word	2048
	.space	12
	.word	26
	.word	26
	.space	4
	.word	2048
	.space	12
	.word	132
	.word	132
	.space	4
	.word	1024
	.space	12
	.type	exynos_device_spi1, %object
	.size	exynos_device_spi1, 360
exynos_device_spi1:
	.word	.LC4
	.word	1
	.space	84
	.word	exynos_spi1_pdata
	.space	164
	.word	spi_dmamask
	.word	-1
	.word	0
	.space	72
	.word	4
	.word	exynos_spi1_resource
	.space	8
	.type	exynos_spi1_resource, %object
	.size	exynos_spi1_resource, 112
exynos_spi1_resource:
	.word	328400896
	.word	328401151
	.space	4
	.word	512
	.space	12
	.word	25
	.word	25
	.space	4
	.word	2048
	.space	12
	.word	24
	.word	24
	.space	4
	.word	2048
	.space	12
	.word	131
	.word	131
	.space	4
	.word	1024
	.space	12
	.type	exynos_device_spi0, %object
	.size	exynos_device_spi0, 360
exynos_device_spi0:
	.word	.LC4
	.word	0
	.space	84
	.word	exynos_spi0_pdata
	.space	164
	.word	spi_dmamask
	.word	-1
	.word	0
	.space	72
	.word	4
	.word	exynos_spi0_resource
	.space	8
	.type	spi_dmamask, %object
	.size	spi_dmamask, 8
spi_dmamask:
	.word	-1
	.word	0
	.type	exynos_spi0_resource, %object
	.size	exynos_spi0_resource, 112
exynos_spi0_resource:
	.word	328335360
	.word	328335615
	.space	4
	.word	512
	.space	12
	.word	23
	.word	23
	.space	4
	.word	2048
	.space	12
	.word	22
	.word	22
	.space	4
	.word	2048
	.space	12
	.word	130
	.word	130
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Invalid SPI Controller number!\000"
	.space	1
.LC1:
	.ascii	"<3>%s: Invalid SPI configuration\012\000"
	.space	2
.LC2:
	.ascii	"<3>%s: Invalid SPI controller(%d)\012\000"
	.space	1
.LC3:
	.ascii	"sclk_spi\000"
	.space	3
.LC4:
	.ascii	"s3c64xx-spi\000"
	.ident	"GCC: (GNU) 4.8"
