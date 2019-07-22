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
	.file	"board-gps-bcm4752.c"
	.text
	.align	2
	.type	gps_bcm4752_init, %function
gps_bcm4752_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:sec_class
	stmfd	sp!, {r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	movt	r3, #:upper16:sec_class
	.pad #12
	sub	sp, sp, #12
	ldr	r0, [r3]
	cmp	r0, #0
	beq	.L7
	movw	r3, #:lower16:.LC0
	mov	r1, #0
	movt	r3, #:upper16:.LC0
	movw	ip, #:lower16:device_create
	str	r3, [sp]
	mov	r2, r1
	mov	r3, r1
	movt	ip, #:upper16:device_create
	blx	ip
	movw	r6, #:lower16:.LANCHOR0
	cmp	r0, #0
	movt	r6, #:upper16:.LANCHOR0
	str	r0, [r6]
	beq	.L8
	movw	r4, #:lower16:s3c_gpio_cfgpin
	mvn	r1, #13
	movt	r4, #:upper16:s3c_gpio_cfgpin
	mov	r0, #4
	movw	r5, #:lower16:s3c_gpio_setpull
	blx	r4
	movt	r5, #:upper16:s3c_gpio_setpull
	mov	r1, #3
	mov	r0, #4
	blx	r5
	mvn	r1, #13
	mov	r0, #5
	blx	r4
	mov	r1, #0
	mov	r0, #5
	blx	r5
	mvn	r1, #13
	mov	r0, #6
	blx	r4
	mov	r1, #0
	mov	r0, #6
	blx	r5
	mvn	r1, #13
	mov	r0, #7
	blx	r4
	mov	r1, #0
	mov	r0, #7
	blx	r5
	movw	r1, #:lower16:.LC1
	movw	r3, #:lower16:gpio_request
	movt	r1, #:upper16:.LC1
	movt	r3, #:upper16:gpio_request
	mov	r0, #128
	blx	r3
	subs	r7, r0, #0
	bne	.L9
	mov	r1, r7
	mov	r0, #128
	blx	r5
	mvn	r1, #14
	mov	r0, #128
	blx	r4
	movw	r3, #:lower16:gpio_direction_output
	mov	r1, r7
	movt	r3, #:upper16:gpio_direction_output
	mov	r0, #128
	blx	r3
	movw	r3, #:lower16:gpio_export
	mov	r1, #1
	movt	r3, #:upper16:gpio_export
	mov	r0, #128
	blx	r3
	movw	r1, #:lower16:.LC1
	movw	r3, #:lower16:gpio_export_link
	ldr	r0, [r6]
	movt	r1, #:upper16:.LC1
	movt	r3, #:upper16:gpio_export_link
	mov	r2, #128
	blx	r3
	mov	r0, r7
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L9:
	movw	r0, #:lower16:.LC2
	movw	r2, #:lower16:.LC3
	movw	r3, #:lower16:warn_slowpath_fmt
	movt	r2, #:upper16:.LC3
	mov	r1, #27
	movt	r0, #:upper16:.LC2
	movt	r3, #:upper16:warn_slowpath_fmt
	mov	r7, #1
	blx	r3
	movw	r3, #:lower16:gpio_free
	mov	r0, #128
	movt	r3, #:upper16:gpio_free
	blx	r3
	mov	r0, r7
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L8:
@ 15 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/board-gps-bcm4752.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/board-gps-bcm4752.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 15, 0
.popsection
@ 0 "" 2
.L7:
@ 13 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/board-gps-bcm4752.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/board-gps-bcm4752.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 13, 0
.popsection
@ 0 "" 2
	.fnend
	.size	gps_bcm4752_init, .-gps_bcm4752_init
	.section	.initcall6.init,"aw",%progbits
	.align	2
	.type	__initcall_gps_bcm4752_init6, %object
	.size	__initcall_gps_bcm4752_init6, 4
__initcall_gps_bcm4752_init6:
	.word	gps_bcm4752_init
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"gps\000"
.LC1:
	.ascii	"GPS_PWR_EN\000"
	.space	1
.LC2:
	.ascii	"/media/system1/root/CM14/kernel/samsung/smdk4412/ar"
	.ascii	"ch/arm/mach-exynos/board-gps-bcm4752.c\000"
	.space	2
.LC3:
	.ascii	"fail to request gpio (GPS_PWR_EN)\012\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	gps_dev, %object
	.size	gps_dev, 4
gps_dev:
	.space	4
	.ident	"GCC: (GNU) 4.8"
