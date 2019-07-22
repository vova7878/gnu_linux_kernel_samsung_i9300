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
	.file	"coresight.c"
	.text
	.align	2
	.type	max_clk_store, %function
max_clk_store:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movw	r1, #:lower16:.LC0
	.pad #8
	sub	sp, sp, #8
	movw	ip, #:lower16:sscanf
	mov	r0, r2
	movt	r1, #:upper16:.LC0
	add	r2, sp, #4
	movt	ip, #:upper16:sscanf
	mov	r4, r3
	blx	ip
	cmp	r0, #1
	ldreq	r3, [sp, #4]
	movweq	r2, #:lower16:.LANCHOR0
	movteq	r2, #:upper16:.LANCHOR0
	moveq	r0, r4
	mvnne	r0, #21
	streqb	r3, [r2, #4]
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	max_clk_store, .-max_clk_store
	.align	2
	.type	max_clk_show, %function
max_clk_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:.LANCHOR0
	mov	r0, r2
	movt	r3, #:upper16:.LANCHOR0
	movw	r2, #:lower16:.LC1
	movw	ip, #:lower16:scnprintf
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	movt	r2, #:upper16:.LC1
	movt	ip, #:upper16:scnprintf
	mov	r1, #4096
	blx	ip
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	max_clk_show, .-max_clk_show
	.align	2
	.type	coresight_init, %function
coresight_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r2, #:lower16:module_kset
	movw	r1, #:lower16:.LC2
	movt	r2, #:upper16:module_kset
	movw	r3, #:lower16:kset_find_obj
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r1, #:upper16:.LC2
	ldr	r0, [r2]
	movt	r3, #:upper16:kset_find_obj
	movw	r5, #:lower16:.LANCHOR0
	blx	r3
	cmp	r0, #0
	movt	r5, #:upper16:.LANCHOR0
	str	r0, [r5]
	beq	.L19
	movw	r1, #:lower16:.LANCHOR1
	movw	r3, #:lower16:sysfs_create_file
	movt	r1, #:upper16:.LANCHOR1
	movt	r3, #:upper16:sysfs_create_file
	blx	r3
	subs	r4, r0, #0
	bne	.L20
	movw	r3, #:lower16:etb_init
	movt	r3, #:upper16:etb_init
	blx	r3
	subs	r4, r0, #0
	bne	.L13
	movw	r3, #:lower16:tpiu_init
	movt	r3, #:upper16:tpiu_init
	blx	r3
	subs	r4, r0, #0
	bne	.L9
	movw	r3, #:lower16:funnel_init
	movt	r3, #:upper16:funnel_init
	blx	r3
	subs	r4, r0, #0
	bne	.L10
	movw	r3, #:lower16:etm_init
	movt	r3, #:upper16:etm_init
	blx	r3
	subs	r4, r0, #0
	beq	.L21
.L11:
	movw	r3, #:lower16:funnel_exit
	movt	r3, #:upper16:funnel_exit
	blx	r3
.L10:
	movw	r3, #:lower16:tpiu_exit
	movt	r3, #:upper16:tpiu_exit
	blx	r3
.L9:
	movw	r3, #:lower16:etb_exit
	movt	r3, #:upper16:etb_exit
	blx	r3
.L13:
	movw	r1, #:lower16:.LANCHOR1
	movw	r3, #:lower16:sysfs_remove_file
	movw	r6, #:lower16:printk
	ldr	r0, [r5]
	movt	r1, #:upper16:.LANCHOR1
	movt	r3, #:upper16:sysfs_remove_file
	movt	r6, #:upper16:printk
	blx	r3
.L14:
	movw	r0, #:lower16:.LC6
	movt	r0, #:upper16:.LC6
	blx	r6
	mov	r0, r4
	ldmfd	sp!, {r4, r5, r6, pc}
.L21:
	movw	r0, #:lower16:.LC5
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC5
	blx	r3
	mov	r0, r4
	ldmfd	sp!, {r4, r5, r6, pc}
.L20:
	movw	r0, #:lower16:.LC4
	movw	r6, #:lower16:printk
	movt	r6, #:upper16:printk
	movt	r0, #:upper16:.LC4
	blx	r6
	b	.L14
.L19:
	movw	r0, #:lower16:.LC3
	movw	r6, #:lower16:printk
	movt	r0, #:upper16:.LC3
	movt	r6, #:upper16:printk
	blx	r6
	mvn	r4, #1
	b	.L14
	.fnend
	.size	coresight_init, .-coresight_init
	.align	2
	.global	coresight_get_modulekobj
	.type	coresight_get_modulekobj, %function
coresight_get_modulekobj:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	ldr	r0, [r3]
	bx	lr
	.fnend
	.size	coresight_get_modulekobj, .-coresight_get_modulekobj
	.section	.initcall6.init,"aw",%progbits
	.align	2
	.type	__initcall_coresight_init6, %object
	.size	__initcall_coresight_init6, 4
__initcall_coresight_init6:
	.word	coresight_init
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	max_clk_attr, %object
	.size	max_clk_attr, 16
max_clk_attr:
	.word	.LC7
	.short	420
	.space	2
	.word	max_clk_show
	.word	max_clk_store
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%lx\000"
.LC1:
	.ascii	"%#lx\012\000"
	.space	2
.LC2:
	.ascii	"coresight\000"
	.space	2
.LC3:
	.ascii	"<3>failed to find CORESIGHT sysfs module kobject\012"
	.ascii	"\000"
	.space	2
.LC4:
	.ascii	"<3>failed to create CORESIGHT sysfs max_clk attribu"
	.ascii	"te\012\000"
	.space	1
.LC5:
	.ascii	"<6>CORESIGHT initialized\012\000"
	.space	2
.LC6:
	.ascii	"<3>CORESIGHT init failed\012\000"
	.space	2
.LC7:
	.ascii	"max_clk\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	coresight, %object
	.size	coresight, 8
coresight:
	.space	8
	.ident	"GCC: (GNU) 4.8"
