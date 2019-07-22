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
	.file	"irq-sgi.c"
	.text
	.align	2
	.type	exynos_irq_sgi_mask, %function
exynos_irq_sgi_mask:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	exynos_irq_sgi_mask, .-exynos_irq_sgi_mask
	.align	2
	.type	exynos_irq_sgi_unmask, %function
exynos_irq_sgi_unmask:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	exynos_irq_sgi_unmask, .-exynos_irq_sgi_unmask
	.align	2
	.type	exynos_irq_sgi_eoi, %function
exynos_irq_sgi_eoi:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	ldr	r4, [r0]
	sub	r4, r4, #32
@ 37 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/irq-sgi.c" 1
	dsb
@ 0 "" 2
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L4
	blx	r3
.L4:
	mov	r3, #0
	movt	r3, 65153
	str	r4, [r3, #16]
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	exynos_irq_sgi_eoi, .-exynos_irq_sgi_eoi
	.align	2
	.type	exynos_irq_sgi_set_type, %function
exynos_irq_sgi_set_type:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	exynos_irq_sgi_set_type, .-exynos_irq_sgi_set_type
	.align	2
	.global	exynos_init_irq_sgi
	.type	exynos_init_irq_sgi, %function
exynos_init_irq_sgi:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r6, #:lower16:irq_set_chip_and_handler_name
	movw	r5, #:lower16:set_irq_flags
	movt	r6, #:upper16:irq_set_chip_and_handler_name
	movt	r5, #:upper16:set_irq_flags
	mov	r4, #40
.L12:
	movw	r1, #:lower16:.LANCHOR0
	movw	r2, #:lower16:handle_fasteoi_irq
	mov	r0, r4
	movt	r1, #:upper16:.LANCHOR0
	movt	r2, #:upper16:handle_fasteoi_irq
	mov	r3, #0
	blx	r6
	mov	r0, r4
	mov	r1, #1
	add	r4, r4, #1
	blx	r5
	cmp	r4, #48
	bne	.L12
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	exynos_init_irq_sgi, .-exynos_init_irq_sgi
	.section	.initcall3.init,"aw",%progbits
	.align	2
	.type	__initcall_exynos_init_irq_sgi3, %object
	.size	__initcall_exynos_init_irq_sgi3, 4
__initcall_exynos_init_irq_sgi3:
	.word	exynos_init_irq_sgi
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	exynos_irq_sgi, %object
	.size	exynos_irq_sgi, 92
exynos_irq_sgi:
	.word	.LC0
	.space	20
	.word	exynos_irq_sgi_mask
	.space	4
	.word	exynos_irq_sgi_unmask
	.word	exynos_irq_sgi_eoi
	.space	8
	.word	exynos_irq_sgi_set_type
	.space	40
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"exynos_sgi\000"
	.ident	"GCC: (GNU) 4.8"
