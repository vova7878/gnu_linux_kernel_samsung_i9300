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
	.file	"sec-common.c"
	.text
	.align	2
	.type	midas_class_create, %function
midas_class_create:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	movw	r1, #:lower16:.LC0
	movw	r3, #:lower16:__class_create
	mov	r2, r4
	movt	r1, #:upper16:.LC0
	movt	r3, #:upper16:__class_create
	mov	r0, #0
	blx	r3
	cmn	r0, #4096
	str	r0, [r4]
	bhi	.L5
	mov	r0, #0
	ldmfd	sp!, {r4, pc}
.L5:
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC1
	blx	r3
	ldr	r0, [r4]
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	midas_class_create, .-midas_class_create
	.global	sec_class
	.section	.initcall4.init,"aw",%progbits
	.align	2
	.type	__initcall_midas_class_create4, %object
	.size	__initcall_midas_class_create4, 4
__initcall_midas_class_create4:
	.word	midas_class_create
	.section	__ksymtab_strings,"a",%progbits
	.type	__kstrtab_sec_class, %object
	.size	__kstrtab_sec_class, 10
__kstrtab_sec_class:
	.ascii	"sec_class\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"sec\000"
.LC1:
	.ascii	"<3>Failed to create class(sec)!\012\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__key.12549, %object
	.size	__key.12549, 0
__key.12549:
	.type	sec_class, %object
	.size	sec_class, 4
sec_class:
	.space	4
	.section	___ksymtab+sec_class,"a",%progbits
	.align	2
	.type	__ksymtab_sec_class, %object
	.size	__ksymtab_sec_class, 8
__ksymtab_sec_class:
	.word	sec_class
	.word	__kstrtab_sec_class
	.ident	"GCC: (GNU) 4.8"
