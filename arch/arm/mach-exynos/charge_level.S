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
	.file	"charge_level.c"
	.text
	.align	2
	.global	charge_level_init
	.type	charge_level_init, %function
charge_level_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r2, #:lower16:kernel_kobj
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movt	r2, #:upper16:kernel_kobj
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:kobject_create_and_add
	movt	r0, #:upper16:.LC0
	ldr	r1, [r2]
	movt	r3, #:upper16:kobject_create_and_add
	blx	r3
	movw	r4, #:lower16:.LANCHOR0
	cmp	r0, #0
	movt	r4, #:upper16:.LANCHOR0
	str	r0, [r4]
	beq	.L6
	movw	r1, #:lower16:.LANCHOR1
	movw	r3, #:lower16:sysfs_create_group
	movt	r1, #:upper16:.LANCHOR1
	movt	r3, #:upper16:sysfs_create_group
	blx	r3
	subs	r5, r0, #0
	bne	.L7
	movw	r0, #:lower16:.LC3
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC3
	blx	r3
	mov	r0, r5
	ldmfd	sp!, {r3, r4, r5, pc}
.L7:
	movw	r3, #:lower16:kobject_put
	ldr	r0, [r4]
	movt	r3, #:upper16:kobject_put
	blx	r3
	movw	r0, #:lower16:.LC2
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC2
	blx	r3
	mov	r0, r5
	ldmfd	sp!, {r3, r4, r5, pc}
.L6:
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC1
	blx	r3
	mvn	r0, #11
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	charge_level_init, .-charge_level_init
	.align	2
	.type	ignore_safety_margin_show, %function
ignore_safety_margin_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:ignore_safety_margin
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movt	ip, #:upper16:ignore_safety_margin
	movw	r1, #:lower16:.LC4
	movw	r3, #:lower16:sprintf
	mov	r0, r2
	movt	r1, #:upper16:.LC4
	ldr	r2, [ip]
	movt	r3, #:upper16:sprintf
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	ignore_safety_margin_show, .-ignore_safety_margin_show
	.align	2
	.type	ignore_unstable_power_show, %function
ignore_unstable_power_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:ignore_unstable_power
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movt	ip, #:upper16:ignore_unstable_power
	movw	r1, #:lower16:.LC4
	movw	r3, #:lower16:sprintf
	mov	r0, r2
	movt	r1, #:upper16:.LC4
	ldr	r2, [ip]
	movt	r3, #:upper16:sprintf
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	ignore_unstable_power_show, .-ignore_unstable_power_show
	.align	2
	.type	charge_level_wireless_show, %function
charge_level_wireless_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:wireless_level
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movt	ip, #:upper16:wireless_level
	movw	r1, #:lower16:.LC5
	movw	r3, #:lower16:sprintf
	mov	r0, r2
	movt	r1, #:upper16:.LC5
	ldr	r2, [ip]
	movt	r3, #:upper16:sprintf
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	charge_level_wireless_show, .-charge_level_wireless_show
	.align	2
	.type	charge_level_usb_show, %function
charge_level_usb_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:usb_level
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movt	ip, #:upper16:usb_level
	movw	r1, #:lower16:.LC5
	movw	r3, #:lower16:sprintf
	mov	r0, r2
	movt	r1, #:upper16:.LC5
	ldr	r2, [ip]
	movt	r3, #:upper16:sprintf
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	charge_level_usb_show, .-charge_level_usb_show
	.align	2
	.type	charge_level_ac_show, %function
charge_level_ac_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:ac_level
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movt	ip, #:upper16:ac_level
	movw	r1, #:lower16:.LC5
	movw	r3, #:lower16:sprintf
	mov	r0, r2
	movt	r1, #:upper16:.LC5
	ldr	r2, [ip]
	movt	r3, #:upper16:sprintf
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	charge_level_ac_show, .-charge_level_ac_show
	.align	2
	.type	ignore_safety_margin_store, %function
ignore_safety_margin_store:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movw	r1, #:lower16:.LC4
	.pad #8
	sub	sp, sp, #8
	movw	ip, #:lower16:sscanf
	mov	r0, r2
	movt	r1, #:upper16:.LC4
	movt	ip, #:upper16:sscanf
	add	r2, sp, #4
	mov	r4, r3
	blx	ip
	cmp	r0, #1
	bne	.L16
	ldr	r2, [sp, #4]
	mov	r0, r4
	cmp	r2, #1
	movwls	r3, #:lower16:ignore_safety_margin
	movtls	r3, #:upper16:ignore_safety_margin
	strls	r2, [r3]
.L14:
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, pc}
.L16:
	mvn	r0, #21
	b	.L14
	.fnend
	.size	ignore_safety_margin_store, .-ignore_safety_margin_store
	.align	2
	.type	ignore_unstable_power_store, %function
ignore_unstable_power_store:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movw	r1, #:lower16:.LC4
	.pad #8
	sub	sp, sp, #8
	movw	ip, #:lower16:sscanf
	mov	r0, r2
	movt	r1, #:upper16:.LC4
	movt	ip, #:upper16:sscanf
	add	r2, sp, #4
	mov	r4, r3
	blx	ip
	cmp	r0, #1
	bne	.L20
	ldr	r2, [sp, #4]
	mov	r0, r4
	cmp	r2, #1
	movwls	r3, #:lower16:ignore_unstable_power
	movtls	r3, #:upper16:ignore_unstable_power
	strls	r2, [r3]
.L18:
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, pc}
.L20:
	mvn	r0, #21
	b	.L18
	.fnend
	.size	ignore_unstable_power_store, .-ignore_unstable_power_store
	.align	2
	.type	charge_level_wireless_store, %function
charge_level_wireless_store:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movw	r1, #:lower16:.LC4
	.pad #8
	sub	sp, sp, #8
	movw	ip, #:lower16:sscanf
	mov	r0, r2
	movt	r1, #:upper16:.LC4
	movt	ip, #:upper16:sscanf
	add	r2, sp, #4
	mov	r4, r3
	blx	ip
	cmp	r0, #1
	bne	.L23
	ldr	r3, [sp, #4]
	movw	r2, #:lower16:wireless_level
	mov	r0, r4
	movt	r2, #:upper16:wireless_level
	bic	r3, r3, r3, asr #31
	cmp	r3, #2000
	movge	r3, #2000
	str	r3, [r2]
.L22:
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, pc}
.L23:
	mvn	r0, #21
	b	.L22
	.fnend
	.size	charge_level_wireless_store, .-charge_level_wireless_store
	.align	2
	.type	charge_level_usb_store, %function
charge_level_usb_store:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movw	r1, #:lower16:.LC4
	.pad #8
	sub	sp, sp, #8
	movw	ip, #:lower16:sscanf
	mov	r0, r2
	movt	r1, #:upper16:.LC4
	movt	ip, #:upper16:sscanf
	add	r2, sp, #4
	mov	r4, r3
	blx	ip
	cmp	r0, #1
	bne	.L26
	ldr	r3, [sp, #4]
	movw	r2, #:lower16:usb_level
	mov	r0, r4
	movt	r2, #:upper16:usb_level
	bic	r3, r3, r3, asr #31
	cmp	r3, #2000
	movge	r3, #2000
	str	r3, [r2]
.L25:
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, pc}
.L26:
	mvn	r0, #21
	b	.L25
	.fnend
	.size	charge_level_usb_store, .-charge_level_usb_store
	.align	2
	.type	charge_level_ac_store, %function
charge_level_ac_store:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movw	r1, #:lower16:.LC4
	.pad #8
	sub	sp, sp, #8
	movw	ip, #:lower16:sscanf
	mov	r0, r2
	movt	r1, #:upper16:.LC4
	movt	ip, #:upper16:sscanf
	add	r2, sp, #4
	mov	r4, r3
	blx	ip
	cmp	r0, #1
	bne	.L29
	ldr	r3, [sp, #4]
	movw	r2, #:lower16:ac_level
	mov	r0, r4
	movt	r2, #:upper16:ac_level
	bic	r3, r3, r3, asr #31
	cmp	r3, #2000
	movge	r3, #2000
	str	r3, [r2]
.L28:
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, pc}
.L29:
	mvn	r0, #21
	b	.L28
	.fnend
	.size	charge_level_ac_store, .-charge_level_ac_store
	.align	2
	.type	charge_info_show, %function
charge_info_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:charge_info_level
	movt	r3, #:upper16:charge_info_level
	mov	r0, r2
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L33
	movw	r1, #:lower16:.LC7
	movw	r2, #:lower16:charge_info_text
	movw	r3, #:lower16:sprintf
	movt	r1, #:upper16:.LC7
	movt	r2, #:upper16:charge_info_text
	movt	r3, #:upper16:sprintf
	blx	r3
	ldmfd	sp!, {r3, pc}
.L33:
	movw	r1, #:lower16:.LC6
	movw	r2, #:lower16:charge_info_text
	movw	ip, #:lower16:sprintf
	movt	r1, #:upper16:.LC6
	movt	r2, #:upper16:charge_info_text
	movt	ip, #:upper16:sprintf
	blx	ip
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	charge_info_show, .-charge_info_show
	.align	2
	.global	charge_level_exit
	.type	charge_level_exit, %function
charge_level_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r2, #:lower16:.LANCHOR0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movt	r2, #:upper16:.LANCHOR0
	movw	r3, #:lower16:kobject_put
	movt	r3, #:upper16:kobject_put
	ldr	r0, [r2]
	blx	r3
	movw	r0, #:lower16:.LC8
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC8
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	charge_level_exit, .-charge_level_exit
	.section	.initcall6.init,"aw",%progbits
	.align	2
	.type	__initcall_charge_level_init6, %object
	.size	__initcall_charge_level_init6, 4
__initcall_charge_level_init6:
	.word	charge_level_init
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	charge_level_attr_group, %object
	.size	charge_level_attr_group, 12
charge_level_attr_group:
	.space	8
	.word	charge_level_attrs
	.type	charge_level_attrs, %object
	.size	charge_level_attrs, 28
charge_level_attrs:
	.word	charge_level_ac_attribute
	.word	charge_level_usb_attribute
	.word	charge_level_wireless_attribute
	.word	ignore_unstable_power_attribute
	.word	ignore_safety_margin_attribute
	.word	charge_info_attribute
	.word	0
	.type	charge_info_attribute, %object
	.size	charge_info_attribute, 16
charge_info_attribute:
	.word	.LC9
	.short	438
	.space	2
	.word	charge_info_show
	.word	0
	.type	ignore_safety_margin_attribute, %object
	.size	ignore_safety_margin_attribute, 16
ignore_safety_margin_attribute:
	.word	.LC10
	.short	438
	.space	2
	.word	ignore_safety_margin_show
	.word	ignore_safety_margin_store
	.type	ignore_unstable_power_attribute, %object
	.size	ignore_unstable_power_attribute, 16
ignore_unstable_power_attribute:
	.word	.LC11
	.short	438
	.space	2
	.word	ignore_unstable_power_show
	.word	ignore_unstable_power_store
	.type	charge_level_wireless_attribute, %object
	.size	charge_level_wireless_attribute, 16
charge_level_wireless_attribute:
	.word	.LC12
	.short	438
	.space	2
	.word	charge_level_wireless_show
	.word	charge_level_wireless_store
	.type	charge_level_usb_attribute, %object
	.size	charge_level_usb_attribute, 16
charge_level_usb_attribute:
	.word	.LC13
	.short	438
	.space	2
	.word	charge_level_usb_show
	.word	charge_level_usb_store
	.type	charge_level_ac_attribute, %object
	.size	charge_level_ac_attribute, 16
charge_level_ac_attribute:
	.word	.LC14
	.short	438
	.space	2
	.word	charge_level_ac_show
	.word	charge_level_ac_store
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"charge_levels\000"
	.space	2
.LC1:
	.ascii	"Boeffla-Kernel: failed to create kernel object for "
	.ascii	"charge level interface.\012\000"
.LC2:
	.ascii	"Boeffla-Kernel: failed to create fs object for char"
	.ascii	"ge level interface.\012\000"
.LC3:
	.ascii	"Boeffla-Kernel: charge level interface started.\012"
	.ascii	"\000"
	.space	3
.LC4:
	.ascii	"%d\000"
	.space	1
.LC5:
	.ascii	"%d mA\000"
	.space	2
.LC6:
	.ascii	"%s / %d mA\000"
	.space	1
.LC7:
	.ascii	"%s\000"
	.space	1
.LC8:
	.ascii	"Boeffla-Kernel: charge level interface stopped.\012"
	.ascii	"\000"
	.space	3
.LC9:
	.ascii	"charge_info\000"
.LC10:
	.ascii	"ignore_safety_margin\000"
	.space	3
.LC11:
	.ascii	"ignore_unstable_power\000"
	.space	2
.LC12:
	.ascii	"charge_level_wireless\000"
	.space	2
.LC13:
	.ascii	"charge_level_usb\000"
	.space	3
.LC14:
	.ascii	"charge_level_ac\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	charge_level_kobj, %object
	.size	charge_level_kobj, 4
charge_level_kobj:
	.space	4
	.ident	"GCC: (GNU) 4.8"
