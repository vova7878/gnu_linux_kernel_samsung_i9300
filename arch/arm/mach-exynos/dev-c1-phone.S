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
	.file	"dev-c1-phone.c"
	.text
	.align	2
	.type	c1_init_phone_interface, %function
c1_init_phone_interface:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	c1_init_phone_interface, .-c1_init_phone_interface
	.align	2
	.type	setup_bootmode, %function
setup_bootmode:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r1, #:lower16:.LANCHOR0
	mov	r6, r0
	movw	r5, #:lower16:printk
	movw	r0, #:lower16:.LC0
	mov	r2, r6
	movt	r0, #:upper16:.LC0
	movt	r1, #:upper16:.LANCHOR0
	movt	r5, #:upper16:printk
	movw	r4, #:lower16:.LANCHOR1
	blx	r5
	cmp	r6, #0
	movt	r4, #:upper16:.LANCHOR1
	mov	r3, #0
	str	r3, [r4]
	beq	.L4
	ldrb	r1, [r6]	@ zero_extendqisi2
	cmp	r1, #50
	cmpne	r1, #52
	movne	r1, #0
	moveq	r1, #1
	moveq	r1, #1
	streq	r1, [r4]
.L3:
	movw	r0, #:lower16:.LC1
	movt	r0, #:upper16:.LC1
	blx	r5
	ldr	r0, [r4]
	ldmfd	sp!, {r4, r5, r6, pc}
.L4:
	mov	r1, r6
	b	.L3
	.fnend
	.size	setup_bootmode, .-setup_bootmode
	.global	sec_device_dpram_recovery
	.global	sec_device_dpram
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.18350, %object
	.size	__func__.18350, 15
__func__.18350:
	.ascii	"setup_bootmode\000"
	.type	__setup_str_setup_bootmode, %object
	.size	__setup_str_setup_bootmode, 10
__setup_str_setup_bootmode:
	.ascii	"bootmode=\000"
	.section	.initcall6.init,"aw",%progbits
	.align	2
	.type	__initcall_c1_init_phone_interface6, %object
	.size	__initcall_c1_init_phone_interface6, 4
__initcall_c1_init_phone_interface6:
	.word	c1_init_phone_interface
	.data
	.align	3
	.type	sec_device_dpram_recovery, %object
	.size	sec_device_dpram_recovery, 360
sec_device_dpram_recovery:
	.word	.LC2
	.word	-1
	.space	352
	.type	sec_device_dpram, %object
	.size	sec_device_dpram, 360
sec_device_dpram:
	.word	.LC3
	.word	-1
	.space	352
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<6>%s : %s\012\000"
.LC1:
	.ascii	"<6>c1_is_bootmode_recovery = %d\012\000"
	.space	3
.LC2:
	.ascii	"dpram-recovery\000"
	.space	1
.LC3:
	.ascii	"dpram-device\000"
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	c1_is_bootmode_recovery, %object
	.size	c1_is_bootmode_recovery, 4
c1_is_bootmode_recovery:
	.space	4
	.section	.init.setup,"aw",%progbits
	.align	2
	.type	__setup_setup_bootmode, %object
	.size	__setup_setup_bootmode, 12
__setup_setup_bootmode:
	.word	__setup_str_setup_bootmode
	.word	setup_bootmode
	.word	0
	.ident	"GCC: (GNU) 4.8"
