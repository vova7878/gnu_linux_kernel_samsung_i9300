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
	.file	"sec-switch_max8997.c"

	.text
	.align	2
	.type	u1_switch_store_vbus, %function
u1_switch_store_vbus:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r0, #:lower16:.LC0
	mov	r6, r2
	movw	r1, #:lower16:.LC1
	movw	r2, #:lower16:.LANCHOR0
	movw	r4, #:lower16:printk
	movt	r0, #:upper16:.LC0
	movt	r1, #:upper16:.LC1
	movt	r2, #:upper16:.LANCHOR0
	movt	r4, #:upper16:printk
	mov	r5, r3
	blx	r4
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #48
	beq	.L2
	cmp	r3, #49
	beq	.L3
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LC2
	movt	r1, #:upper16:.LANCHOR0
	blx	r4
.L13:
	mov	r0, r5
	ldmfd	sp!, {r4, r5, r6, pc}
.L2:
	movw	r0, #:lower16:.LC4
	movw	r1, #:lower16:.LANCHOR0
	mov	r2, #0
	movt	r1, #:upper16:.LANCHOR0
	movt	r0, #:upper16:.LC4
	blx	r4
	movw	r0, #:lower16:.LC5
	movw	r1, #:lower16:.LANCHOR0
	movt	r1, #:upper16:.LANCHOR0
	movt	r0, #:upper16:.LC5
	blx	r4
	movw	r1, #:lower16:.LC6
	movw	r3, #:lower16:regulator_get
	movt	r1, #:upper16:.LC6
	movt	r3, #:upper16:regulator_get
	mov	r0, #0
	blx	r3
	cmn	r0, #4096
	mov	r6, r0
	bhi	.L7
	movw	r3, #:lower16:regulator_is_enabled
	movt	r3, #:upper16:regulator_is_enabled
	blx	r3
	cmp	r0, #0
	beq	.L16
.L6:
	movw	r3, #:lower16:regulator_put
	mov	r0, r6
	movt	r3, #:upper16:regulator_put
	blx	r3
	b	.L13
.L3:
	movw	r0, #:lower16:.LC4
	movw	r1, #:lower16:.LANCHOR0
	mov	r2, #1
	movt	r1, #:upper16:.LANCHOR0
	movt	r0, #:upper16:.LC4
	blx	r4
	movw	r0, #:lower16:.LC5
	movw	r1, #:lower16:.LANCHOR0
	movt	r1, #:upper16:.LANCHOR0
	movt	r0, #:upper16:.LC5
	blx	r4
	movw	r1, #:lower16:.LC6
	movw	r3, #:lower16:regulator_get
	movt	r1, #:upper16:.LC6
	movt	r3, #:upper16:regulator_get
	mov	r0, #0
	blx	r3
	cmn	r0, #4096
	mov	r6, r0
	bhi	.L7
	movw	r4, #:lower16:regulator_is_enabled
	movt	r4, #:upper16:regulator_is_enabled
	blx	r4
	cmp	r0, #0
	beq	.L5
	movw	r3, #:lower16:regulator_force_disable
	mov	r0, r6
	movt	r3, #:upper16:regulator_force_disable
	blx	r3
.L5:
	mov	r0, r6
	blx	r4
	cmp	r0, #0
	bne	.L6
.L16:
	movw	r3, #:lower16:regulator_enable
	mov	r0, r6
	movt	r3, #:upper16:regulator_enable
	blx	r3
	b	.L6
.L7:
	movw	r0, #:lower16:.LC3
	movw	r1, #:lower16:.LANCHOR0
	movt	r1, #:upper16:.LANCHOR0
	movt	r0, #:upper16:.LC3
	blx	r4
	b	.L13
	.fnend
	.size	u1_switch_store_vbus, .-u1_switch_store_vbus
	.align	2
	.type	u1_sec_switch_init, %function
u1_sec_switch_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r2, #:lower16:sec_class
	movw	r3, #:lower16:.LC7
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r1, #0
	.pad #8
	sub	sp, sp, #8
	movt	r2, #:upper16:sec_class
	movt	r3, #:upper16:.LC7
	movw	ip, #:lower16:device_create
	ldr	r0, [r2]
	movt	ip, #:upper16:device_create
	str	r3, [sp]
	mov	r2, r1
	mov	r3, r1
	movw	r4, #:lower16:.LANCHOR1
	blx	ip
	cmn	r0, #4096
	movt	r4, #:upper16:.LANCHOR1
	movwls	r6, #:lower16:printk
	str	r0, [r4]
	movtls	r6, #:upper16:printk
	bhi	.L27
.L19:
	movw	r1, #:lower16:.LANCHOR2
	movw	r3, #:lower16:device_create_file
	movt	r1, #:upper16:.LANCHOR2
	movt	r3, #:upper16:device_create_file
	blx	r3
	cmp	r0, #0
	bne	.L28
.L20:
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LC1
	movt	r1, #:upper16:.LC1
	ldr	r2, .L30
	movt	r0, #:upper16:.LC0
	movw	r5, #:lower16:printk
	blx	r6
	movw	r1, #:lower16:.LC10
	movw	r3, #:lower16:gpio_request
	movt	r1, #:upper16:.LC10
	movt	r3, #:upper16:gpio_request
	mov	r0, #68
	movt	r5, #:upper16:printk
	blx	r3
	cmp	r0, #0
	blt	.L29
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r1, #0
	movt	r3, #:upper16:s3c_gpio_setpull
	mov	r0, #68
	blx	r3
	movw	r3, #:lower16:__gpio_get_value
	mov	r0, #68
	movt	r3, #:upper16:__gpio_get_value
	blx	r3
	movw	r1, #:lower16:.LC1
	mov	r6, r0
	movw	r0, #:lower16:.LC13
	mov	r3, r6
	movt	r1, #:upper16:.LC1
	ldr	r2, .L30
	movt	r0, #:upper16:.LC13
	blx	r5
	movw	r2, #:lower16:gpio_direction_output
	mov	r1, r6
	movt	r2, #:upper16:gpio_direction_output
	mov	r0, #68
	blx	r2
	movw	r3, #:lower16:gpio_export
	mov	r1, #1
	movt	r3, #:upper16:gpio_export
	mov	r0, #68
	blx	r3
	movw	r1, #:lower16:.LC14
	movw	r3, #:lower16:gpio_export_link
	ldr	r0, [r4]
	movt	r1, #:upper16:.LC14
	movt	r3, #:upper16:gpio_export_link
	mov	r2, #68
	blx	r3
.L22:
	mov	r0, #0
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, pc}
.L29:
	movw	r0, #:lower16:.LC11
	movt	r0, #:upper16:.LC11
	blx	r5
	movw	r0, #:lower16:.LC12
	movt	r0, #:upper16:.LC12
	blx	r5
	b	.L22
.L28:
	movw	r0, #:lower16:.LC9
	movt	r0, #:upper16:.LC9
	blx	r6
	b	.L20
.L27:
	movw	r0, #:lower16:.LC8
	movw	r6, #:lower16:printk
	movt	r0, #:upper16:.LC8
	movt	r6, #:upper16:printk
	blx	r6
	ldr	r0, [r4]
	b	.L19
.L31:
	.align	2
.L30:
	.word	.LANCHOR0+24
	.fnend
	.size	u1_sec_switch_init, .-u1_sec_switch_init
	.align	2
	.type	u1_switch_show_vbus, %function
u1_switch_show_vbus:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r1, #:lower16:.LC6
	movw	r3, #:lower16:regulator_get
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r1, #:upper16:.LC6
	movt	r3, #:upper16:regulator_get
	mov	r0, #0
	mov	r4, r2
	blx	r3
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L37
	movw	r3, #:lower16:regulator_is_enabled
	movt	r3, #:upper16:regulator_is_enabled
	blx	r3
	cmp	r0, #0
	bne	.L38
	movw	ip, #:lower16:.LC17
	mov	r6, #17
	movt	ip, #:upper16:.LC17
	ldmia	ip!, {r0, r1, r2, r3}
	ldrh	ip, [ip]	@ unaligned
	str	r0, [r4]	@ unaligned
	str	r1, [r4, #4]	@ unaligned
	strh	ip, [r4, #16]	@ unaligned
	str	r2, [r4, #8]	@ unaligned
	str	r3, [r4, #12]	@ unaligned
.L36:
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LC1
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LC1
	movt	r3, #:upper16:printk
	ldr	r2, .L39
	movt	r0, #:upper16:.LC0
	blx	r3
	movw	r3, #:lower16:regulator_put
	mov	r0, r5
	movt	r3, #:upper16:regulator_put
	blx	r3
	mov	r3, r6
.L34:
	mov	r0, r3
	ldmfd	sp!, {r4, r5, r6, pc}
.L38:
	movw	ip, #:lower16:.LC16
	mov	r6, #16
	movt	ip, #:upper16:.LC16
	ldmia	ip!, {r0, r1, r2, r3}
	ldrb	ip, [ip]	@ zero_extendqisi2
	str	r0, [r4]	@ unaligned
	str	r1, [r4, #4]	@ unaligned
	strb	ip, [r4, #16]
	str	r2, [r4, #8]	@ unaligned
	str	r3, [r4, #12]	@ unaligned
	b	.L36
.L37:
	movw	r0, #:lower16:.LC3
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L39
	movt	r0, #:upper16:.LC3
	blx	r3
	movw	r2, #:lower16:.LC15
	mov	r3, #8
	movt	r2, #:upper16:.LC15
	ldmia	r2!, {r0, r1}
	ldrb	r2, [r2]	@ zero_extendqisi2
	str	r0, [r4]	@ unaligned
	str	r1, [r4, #4]	@ unaligned
	strb	r2, [r4, #8]
	b	.L34
.L40:
	.align	2
.L39:
	.word	.LANCHOR0+44
	.fnend
	.size	u1_switch_show_vbus, .-u1_switch_show_vbus
	.global	dev_attr_disable_vbus
	.global	switch_dev
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.28401, %object
	.size	__func__.28401, 21
__func__.28401:
	.ascii	"u1_switch_store_vbus\000"
	.space	3
	.type	__func__.28412, %object
	.size	__func__.28412, 17
__func__.28412:
	.ascii	"uart_switch_init\000"
	.space	3
	.type	__func__.28390, %object
	.size	__func__.28390, 20
__func__.28390:
	.ascii	"u1_switch_show_vbus\000"
	.section	.initcall6.init,"aw",%progbits
	.align	2
	.type	__initcall_u1_sec_switch_init6, %object
	.size	__initcall_u1_sec_switch_init6, 4
__initcall_u1_sec_switch_init6:
	.word	u1_sec_switch_init
	.data
	.align	2
	.set	.LANCHOR2,. + 0
	.type	dev_attr_disable_vbus, %object
	.size	dev_attr_disable_vbus, 16
dev_attr_disable_vbus:
	.word	.LC18
	.short	436
	.space	2
	.word	u1_switch_show_vbus
	.word	u1_switch_store_vbus
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<6>MUIC:[%s] func:%s\012\000"
	.space	2
.LC1:
	.ascii	"/media/system1/root/CM14/kernel/samsung/smdk4412/ar"
	.ascii	"ch/arm/mach-exynos/sec-switch_max8997.c\000"
	.space	1
.LC2:
	.ascii	"<4>%s: Wrong command\012\000"
	.space	2
.LC3:
	.ascii	"<4>%s: fail to get regulator\012\000"
	.space	2
.LC4:
	.ascii	"<6>%s: disable=%d\012\000"
	.space	1
.LC5:
	.ascii	"<3>%s: fail to change mode!!!\012\000"
	.space	1
.LC6:
	.ascii	"safeout1\000"
	.space	3
.LC7:
	.ascii	"switch\000"
	.space	1
.LC8:
	.ascii	"<3>Failed to create device(switch)!\012\000"
	.space	3
.LC9:
	.ascii	"<3>Failed to create device file(disable_vbus)!\012\000"
.LC10:
	.ascii	"UART_SEL\000"
	.space	3
.LC11:
	.ascii	"<3>Failed to request GPIO_UART_SEL!\012\000"
	.space	3
.LC12:
	.ascii	"<3>Failed to create uart_switch\012\000"
	.space	3
.LC13:
	.ascii	"<6>##MUIC [ %s ]- func : %s !! val:-%d-\012\000"
	.space	3
.LC14:
	.ascii	"uart_sel\000"
	.space	3
.LC15:
	.ascii	"UNKNOWN\012\000"
	.space	3
.LC16:
	.ascii	"VBUS is enabled\012\000"
	.space	3
.LC17:
	.ascii	"VBUS is disabled\012\000"
	.space	2
.LC18:
	.ascii	"disable_vbus\000"
	.section	___ksymtab+switch_dev,"a",%progbits
	.align	2
	.type	__ksymtab_switch_dev, %object
	.size	__ksymtab_switch_dev, 8
__ksymtab_switch_dev:
	.word	switch_dev
	.word	__kstrtab_switch_dev
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	switch_dev, %object
	.size	switch_dev, 4
switch_dev:
	.space	4
	.section	__ksymtab_strings,"a",%progbits
	.type	__kstrtab_switch_dev, %object
	.size	__kstrtab_switch_dev, 11
__kstrtab_switch_dev:
	.ascii	"switch_dev\000"
	.ident	"GCC: (GNU) 4.8"
