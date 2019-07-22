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
	.file	"board-smdk5250-spi.c"
	.text
	.align	2
	.global	exynos5_smdk5250_spi_init
	.type	exynos5_smdk5250_spi_init, %function
exynos5_smdk5250_spi_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r1, #:lower16:.LC0
	movw	r5, #:lower16:clk_get
	movt	r1, #:upper16:.LC0
	movt	r5, #:upper16:clk_get
	ldr	r0, .L35
	blx	r5
	cmn	r0, #4096
	mov	r6, r0
	bhi	.L24
.L2:
	movw	r1, #:lower16:.LC2
	ldr	r0, .L35
	movt	r1, #:upper16:.LC2
	blx	r5
	cmn	r0, #4096
	mov	r10, r0
	bhi	.L25
.L3:
	movw	r9, #:lower16:clk_set_parent
	mov	r0, r6
	movt	r9, #:upper16:clk_set_parent
	mov	r1, r10
	blx	r9
	cmp	r0, #0
	bne	.L26
.L4:
	mov	r1, #2048
	movw	r8, #:lower16:clk_set_rate
	movt	r1, 12207
	mov	r0, r6
	movt	r8, #:upper16:clk_set_rate
	movw	r4, #:lower16:clk_put
	blx	r8
	movt	r4, #:upper16:clk_put
	mov	r0, r6
	blx	r4
	mov	r0, r10
	movw	r7, #:lower16:gpio_request
	blx	r4
	movw	r1, #:lower16:.LC5
	movt	r7, #:upper16:gpio_request
	movt	r1, #:upper16:.LC5
	mov	r0, #17
	blx	r7
	subs	r6, r0, #0
	beq	.L27
.L5:
	movw	r0, #:lower16:.LANCHOR0
	movw	r6, #:lower16:spi_register_board_info
	mov	r1, #1
	movt	r0, #:upper16:.LANCHOR0
	movt	r6, #:upper16:spi_register_board_info
	blx	r6
	movw	r1, #:lower16:.LC6
	ldr	r0, .L35+4
	movt	r1, #:upper16:.LC6
	blx	r5
	cmn	r0, #4096
	mov	r10, r0
	bhi	.L28
.L6:
	movw	r1, #:lower16:.LC2
	ldr	r0, .L35+4
	movt	r1, #:upper16:.LC2
	blx	r5
	cmn	r0, #4096
	mov	fp, r0
	bhi	.L29
.L7:
	mov	r0, r10
	mov	r1, fp
	blx	r9
	cmp	r0, #0
	bne	.L30
.L8:
	mov	r1, #2048
	mov	r0, r10
	movt	r1, 12207
	blx	r8
	mov	r0, r10
	blx	r4
	mov	r0, fp
	blx	r4
	movw	r1, #:lower16:.LC8
	mov	r0, #21
	movt	r1, #:upper16:.LC8
	blx	r7
	subs	r10, r0, #0
	beq	.L31
.L9:
	mov	r1, #1
	ldr	r0, .L35+8
	blx	r6
	movw	r1, #:lower16:.LC9
	ldr	r0, .L35+12
	movt	r1, #:upper16:.LC9
	blx	r5
	cmn	r0, #4096
	mov	r10, r0
	bhi	.L32
.L10:
	movw	r1, #:lower16:.LC2
	ldr	r0, .L35+12
	movt	r1, #:upper16:.LC2
	blx	r5
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L33
.L11:
	mov	r0, r10
	mov	r1, r5
	blx	r9
	cmp	r0, #0
	bne	.L34
.L12:
	mov	r1, #2048
	mov	r0, r10
	movt	r1, 12207
	blx	r8
	mov	r0, r10
	blx	r4
	mov	r0, r5
	blx	r4
	movw	r1, #:lower16:.LC11
	mov	r0, #33
	movt	r1, #:upper16:.LC11
	blx	r7
	subs	r4, r0, #0
	bne	.L13
	movw	r3, #:lower16:gpio_direction_output
	mov	r1, #1
	movt	r3, #:upper16:gpio_direction_output
	mov	r0, #33
	blx	r3
	movw	r3, #:lower16:s3c_gpio_cfgpin
	mvn	r1, #14
	movt	r3, #:upper16:s3c_gpio_cfgpin
	mov	r0, #33
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r1, #3
	movt	r3, #:upper16:s3c_gpio_setpull
	mov	r0, #33
	blx	r3
	movw	r3, #:lower16:exynos_spi_set_info
	mov	r1, r4
	movt	r3, #:upper16:exynos_spi_set_info
	mov	r0, #2
	mov	r2, #1
	blx	r3
.L13:
	mov	r1, #1
	ldr	r0, .L35+16
	blx	r6
	movw	r3, #:lower16:platform_add_devices
	mov	r1, #3
	movt	r3, #:upper16:platform_add_devices
	ldr	r0, .L35+20
	blx	r3
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L31:
	movw	r3, #:lower16:gpio_direction_output
	mov	r1, #1
	movt	r3, #:upper16:gpio_direction_output
	mov	r0, #21
	blx	r3
	movw	r3, #:lower16:s3c_gpio_cfgpin
	mvn	r1, #14
	movt	r3, #:upper16:s3c_gpio_cfgpin
	mov	r0, #21
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r1, #3
	movt	r3, #:upper16:s3c_gpio_setpull
	mov	r0, #21
	blx	r3
	mov	r0, #1
	movw	r3, #:lower16:exynos_spi_set_info
	mov	r1, r10
	mov	r2, r0
	movt	r3, #:upper16:exynos_spi_set_info
	blx	r3
	b	.L9
.L27:
	movw	r3, #:lower16:gpio_direction_output
	mov	r1, #1
	movt	r3, #:upper16:gpio_direction_output
	mov	r0, #17
	blx	r3
	movw	r3, #:lower16:s3c_gpio_cfgpin
	mvn	r1, #14
	movt	r3, #:upper16:s3c_gpio_cfgpin
	mov	r0, #17
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r1, #3
	movt	r3, #:upper16:s3c_gpio_setpull
	mov	r0, #17
	blx	r3
	movw	r3, #:lower16:exynos_spi_set_info
	mov	r0, r6
	mov	r1, r6
	mov	r2, #1
	movt	r3, #:upper16:exynos_spi_set_info
	blx	r3
	b	.L5
.L26:
	movw	r0, #:lower16:.LC4
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, [r10, #16]
	ldr	r2, [r6, #16]
	movt	r0, #:upper16:.LC4
	blx	r3
	b	.L4
.L33:
	movw	r1, #:lower16:.LC3
	movw	r3, #:lower16:dev_err
	movt	r1, #:upper16:.LC3
	movt	r3, #:upper16:dev_err
	ldr	r0, .L35+12
	blx	r3
	b	.L11
.L32:
	movw	r1, #:lower16:.LC10
	movw	r3, #:lower16:dev_err
	movt	r1, #:upper16:.LC10
	movt	r3, #:upper16:dev_err
	ldr	r0, .L35+12
	blx	r3
	b	.L10
.L25:
	movw	r1, #:lower16:.LC3
	movw	r3, #:lower16:dev_err
	movt	r1, #:upper16:.LC3
	movt	r3, #:upper16:dev_err
	ldr	r0, .L35
	blx	r3
	b	.L3
.L24:
	movw	r1, #:lower16:.LC1
	movw	r3, #:lower16:dev_err
	movt	r1, #:upper16:.LC1
	movt	r3, #:upper16:dev_err
	ldr	r0, .L35
	blx	r3
	b	.L2
.L34:
	movw	r0, #:lower16:.LC4
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, [r5, #16]
	ldr	r2, [r10, #16]
	movt	r0, #:upper16:.LC4
	blx	r3
	b	.L12
.L30:
	movw	r0, #:lower16:.LC4
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, [fp, #16]
	ldr	r2, [r10, #16]
	movt	r0, #:upper16:.LC4
	blx	r3
	b	.L8
.L29:
	movw	r1, #:lower16:.LC3
	movw	r3, #:lower16:dev_err
	movt	r1, #:upper16:.LC3
	movt	r3, #:upper16:dev_err
	ldr	r0, .L35+4
	blx	r3
	b	.L7
.L28:
	movw	r1, #:lower16:.LC7
	movw	r3, #:lower16:dev_err
	movt	r1, #:upper16:.LC7
	movt	r3, #:upper16:dev_err
	ldr	r0, .L35+4
	blx	r3
	b	.L6
.L36:
	.align	2
.L35:
	.word	exynos_device_spi0+8
	.word	exynos_device_spi1+8
	.word	.LANCHOR0+56
	.word	exynos_device_spi2+8
	.word	.LANCHOR0+112
	.word	.LANCHOR0+168
	.fnend
	.size	exynos5_smdk5250_spi_init, .-exynos5_smdk5250_spi_init
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	spi0_board_info, %object
	.size	spi0_board_info, 56
spi0_board_info:
	.ascii	"spidev\000"
	.space	25
	.word	0
	.word	spi0_csi
	.space	4
	.word	10000000
	.short	0
	.short	0
	.byte	0
	.space	3
	.type	spi1_board_info, %object
	.size	spi1_board_info, 56
spi1_board_info:
	.ascii	"spidev\000"
	.space	25
	.word	0
	.word	spi1_csi
	.space	4
	.word	10000000
	.short	1
	.short	0
	.byte	0
	.space	3
	.type	spi2_board_info, %object
	.size	spi2_board_info, 56
spi2_board_info:
	.ascii	"spidev\000"
	.space	25
	.word	0
	.word	spi2_csi
	.space	4
	.word	10000000
	.short	2
	.short	0
	.byte	0
	.space	3
	.type	smdk5250_spi_devices, %object
	.size	smdk5250_spi_devices, 12
smdk5250_spi_devices:
	.word	exynos_device_spi0
	.word	exynos_device_spi1
	.word	exynos_device_spi2
	.type	spi2_csi, %object
	.size	spi2_csi, 12
spi2_csi:
	.byte	2
	.space	3
	.word	33
	.word	__gpio_set_value
	.type	spi1_csi, %object
	.size	spi1_csi, 12
spi1_csi:
	.byte	2
	.space	3
	.word	21
	.word	__gpio_set_value
	.type	spi0_csi, %object
	.size	spi0_csi, 12
spi0_csi:
	.byte	2
	.space	3
	.word	17
	.word	__gpio_set_value
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"sclk_spi0\000"
	.space	2
.LC1:
	.ascii	"failed to get sclk for SPI-0\012\000"
	.space	2
.LC2:
	.ascii	"mout_mpll_user\000"
	.space	1
.LC3:
	.ascii	"failed to get prnt\012\000"
.LC4:
	.ascii	"<3>Unable to set parent %s of clock %s.\012\000"
	.space	3
.LC5:
	.ascii	"SPI_CS0\000"
.LC6:
	.ascii	"sclk_spi1\000"
	.space	2
.LC7:
	.ascii	"failed to get sclk for SPI-1\012\000"
	.space	2
.LC8:
	.ascii	"SPI_CS1\000"
.LC9:
	.ascii	"sclk_spi2\000"
	.space	2
.LC10:
	.ascii	"failed to get sclk for SPI-2\012\000"
	.space	2
.LC11:
	.ascii	"SPI_CS2\000"
	.ident	"GCC: (GNU) 4.8"
