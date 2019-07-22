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
	.file	"board-gps-bcm475x.c"
	.text
	.align	2
	.type	gps_bcm475x_init, %function
gps_bcm475x_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	movw	r7, #:lower16:sec_class
	movt	r7, #:upper16:sec_class
	.pad #12
	sub	sp, sp, #12
	ldr	r0, [r7]
	cmp	r0, #0
	beq	.L10
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
	beq	.L11
	movw	r4, #:lower16:s3c_gpio_cfgpin
	mvn	r1, #13
	movt	r4, #:upper16:s3c_gpio_cfgpin
	mov	r0, #4
	movw	r5, #:lower16:s3c_gpio_setpull
	movw	r8, #:lower16:gpio_request
	blx	r4
	movt	r5, #:upper16:s3c_gpio_setpull
	mov	r1, #3
	mov	r0, #4
	movt	r8, #:upper16:gpio_request
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
	mov	r0, #127
	movt	r1, #:upper16:.LC1
	blx	r8
	cmp	r0, #0
	bne	.L12
	movw	r9, #:lower16:.LANCHOR1
	movw	r3, #:lower16:device_create_file
	movt	r9, #:upper16:.LANCHOR1
	movt	r3, #:upper16:device_create_file
	mov	r1, r9
	ldr	r0, [r6]
	blx	r3
	cmp	r0, #0
	blt	.L13
.L6:
	mov	r1, #3
	mov	r0, #127
	blx	r5
	mvn	r1, #14
	movw	r5, #:lower16:gpio_direction_output
	mov	r0, #127
	movt	r5, #:upper16:gpio_direction_output
	blx	r4
	mov	r1, #1
	mov	r0, #127
	blx	r5
	movw	r1, #:lower16:.LC5
	mov	r0, #128
	movt	r1, #:upper16:.LC5
	movw	r9, #:lower16:s3c_gpio_setpull
	blx	r8
	subs	r4, r0, #0
	movw	r8, #:lower16:s3c_gpio_cfgpin
	movt	r9, #:upper16:s3c_gpio_setpull
	movt	r8, #:upper16:s3c_gpio_cfgpin
	beq	.L7
	movw	r0, #:lower16:.LC2
	movw	r2, #:lower16:.LC6
	movw	r3, #:lower16:warn_slowpath_fmt
	movt	r0, #:upper16:.LC2
	movt	r2, #:upper16:.LC6
	movt	r3, #:upper16:warn_slowpath_fmt
	mov	r1, #61
.L8:
	blx	r3
	ldr	r2, [r6]
	movw	r3, #:lower16:device_destroy
	ldr	r0, [r7]
	movt	r3, #:upper16:device_destroy
	mov	r4, #1
	ldr	r1, [r2, #284]
	blx	r3
.L5:
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L12:
	movw	r0, #:lower16:.LC2
	movw	r2, #:lower16:.LC3
	movw	r3, #:lower16:warn_slowpath_fmt
	movt	r0, #:upper16:.LC2
	movt	r2, #:upper16:.LC3
	movt	r3, #:upper16:warn_slowpath_fmt
	mov	r1, #46
	b	.L8
.L11:
@ 27 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/board-gps-bcm475x.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/board-gps-bcm475x.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 27, 0
.popsection
@ 0 "" 2
.L10:
@ 25 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/board-gps-bcm475x.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/board-gps-bcm475x.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 25, 0
.popsection
@ 0 "" 2
.L7:
	mov	r1, r4
	mov	r0, #128
	blx	r9
	mvn	r1, #14
	mov	r0, #128
	blx	r8
	movw	r7, #:lower16:gpio_export
	mov	r1, r4
	mov	r0, #128
	movt	r7, #:upper16:gpio_export
	blx	r5
	mov	r1, #1
	mov	r0, #127
	blx	r7
	mov	r1, #1
	mov	r0, #128
	blx	r7
	movw	r5, #:lower16:gpio_export_link
	movw	r1, #:lower16:.LC1
	movt	r5, #:upper16:gpio_export_link
	movt	r1, #:upper16:.LC1
	ldr	r0, [r6]
	mov	r2, #127
	blx	r5
	movw	r1, #:lower16:.LC5
	ldr	r0, [r6]
	movt	r1, #:upper16:.LC5
	mov	r2, #128
	blx	r5
	movw	r2, #:lower16:system_rev
	movw	r0, #:lower16:.LC7
	movt	r2, #:upper16:system_rev
	movw	r1, #:lower16:.LANCHOR2
	movw	r3, #:lower16:printk
	ldr	r2, [r2]
	movt	r1, #:upper16:.LANCHOR2
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC7
	blx	r3
	b	.L5
.L13:
	movw	r0, #:lower16:.LC4
	movw	r3, #:lower16:printk
	ldr	r1, [r9]
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC4
	blx	r3
	b	.L6
	.fnend
	.size	gps_bcm475x_init, .-gps_bcm475x_init
	.align	2
	.type	hwrev_show, %function
hwrev_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:system_rev
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movt	ip, #:upper16:system_rev
	movw	r1, #:lower16:.LC8
	movw	r3, #:lower16:sprintf
	mov	r0, r2
	movt	r1, #:upper16:.LC8
	ldr	r2, [ip]
	movt	r3, #:upper16:sprintf
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	hwrev_show, .-hwrev_show
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	__func__.13311, %object
	.size	__func__.13311, 17
__func__.13311:
	.ascii	"gps_bcm475x_init\000"
	.section	.initcall6.init,"aw",%progbits
	.align	2
	.type	__initcall_gps_bcm475x_init6, %object
	.size	__initcall_gps_bcm475x_init6, 4
__initcall_gps_bcm475x_init6:
	.word	gps_bcm475x_init
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	dev_attr_hwrev, %object
	.size	dev_attr_hwrev, 16
dev_attr_hwrev:
	.word	.LC9
	.short	292
	.space	2
	.word	hwrev_show
	.word	0
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"gps\000"
.LC1:
	.ascii	"GPS_nRST\000"
	.space	3
.LC2:
	.ascii	"/media/system1/root/CM14/kernel/samsung/smdk4412/ar"
	.ascii	"ch/arm/mach-exynos/board-gps-bcm475x.c\000"
	.space	2
.LC3:
	.ascii	"fail to request gpio (GPS_nRST)\012\000"
	.space	3
.LC4:
	.ascii	"<3>Failed to create device file(%s)!\012\000"
	.space	2
.LC5:
	.ascii	"GPS_PWR_EN\000"
	.space	1
.LC6:
	.ascii	"fail to request gpio (GPS_PWR_EN)\012\000"
	.space	1
.LC7:
	.ascii	"<7>%s - system_rev : %x\012\000"
	.space	3
.LC8:
	.ascii	"%x\012\000"
.LC9:
	.ascii	"hwrev\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	gps_dev, %object
	.size	gps_dev, 4
gps_dev:
	.space	4
	.ident	"GCC: (GNU) 4.8"
