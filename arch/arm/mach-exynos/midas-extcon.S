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
	.file	"midas-extcon.c"
	.text
	.align	2
	.type	midas_extcon_init, %function
midas_extcon_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r0, #:lower16:.LC0
	movw	r4, #:lower16:.LANCHOR0
	movw	r1, #:lower16:.LC1
	movw	r3, #:lower16:printk
	movt	r4, #:upper16:.LANCHOR0
	mov	r5, #0
	movt	r1, #:upper16:.LC1
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	str	r5, [r4]
	blx	r3
	str	r5, [r4]
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	midas_extcon_init, .-midas_extcon_init
	.section	.initcall7.init,"aw",%progbits
	.align	2
	.type	__initcall_midas_extcon_init7, %object
	.size	__initcall_midas_extcon_init7, 4
__initcall_midas_extcon_init7:
	.word	midas_extcon_init
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>Failed to get extcon device of %s\012\000"
	.space	2
.LC1:
	.ascii	"max77693-muic\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	midas_extcon, %object
	.size	midas_extcon, 4
midas_extcon:
	.space	4
	.ident	"GCC: (GNU) 4.8"
