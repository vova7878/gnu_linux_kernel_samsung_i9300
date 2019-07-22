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
	.file	"sysreg.c"
	.text
	.align	2
	.type	exynos4_register_sysreg_pm, %function
exynos4_register_sysreg_pm:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:register_syscore_ops
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:register_syscore_ops
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_register_sysreg_pm, .-exynos4_register_sysreg_pm
	.align	2
	.type	exynos4_sysreg_resume, %function
exynos4_sysreg_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:samsung_cpu_id
	movt	r3, #:upper16:samsung_cpu_id
	mov	r2, #0
	movt	r2, 17186
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmp	r3, r2
	beq	.L3
	cmn	r3, #465567744
	ldmnefd	sp!, {r3, pc}
.L3:
	movw	r3, #:lower16:s3c_pm_do_restore_core
	ldr	r0, .L6
	movt	r3, #:upper16:s3c_pm_do_restore_core
	mov	r1, #10
	blx	r3
	ldmfd	sp!, {r3, pc}
.L7:
	.align	2
.L6:
	.word	.LANCHOR0+20
	.fnend
	.size	exynos4_sysreg_resume, .-exynos4_sysreg_resume
	.align	2
	.type	exynos4_sysreg_suspend, %function
exynos4_sysreg_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:samsung_cpu_id
	movt	r3, #:upper16:samsung_cpu_id
	mov	r2, #0
	movt	r2, 17186
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmp	r3, r2
	beq	.L9
	cmn	r3, #465567744
	beq	.L9
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
.L9:
	movw	r3, #:lower16:s3c_pm_do_save
	ldr	r0, .L11
	movt	r3, #:upper16:s3c_pm_do_save
	mov	r1, #10
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
.L12:
	.align	2
.L11:
	.word	.LANCHOR0+20
	.fnend
	.size	exynos4_sysreg_suspend, .-exynos4_sysreg_suspend
	.section	.initcall3.init,"aw",%progbits
	.align	2
	.type	__initcall_exynos4_register_sysreg_pm3, %object
	.size	__initcall_exynos4_register_sysreg_pm3, 4
__initcall_exynos4_register_sysreg_pm3:
	.word	exynos4_register_sysreg_pm
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	exynos4_syscore_ops, %object
	.size	exynos4_syscore_ops, 20
exynos4_syscore_ops:
	.space	8
	.word	exynos4_sysreg_suspend
	.word	exynos4_sysreg_resume
	.space	4
	.type	exynos4x12_sysreg_save, %object
	.size	exynos4x12_sysreg_save, 80
exynos4x12_sysreg_save:
	.word	-66060020
	.space	4
	.word	-66060016
	.space	4
	.word	-66060012
	.space	4
	.word	-66059764
	.space	4
	.word	-66059760
	.space	4
	.word	-66059756
	.space	4
	.word	-66059752
	.space	4
	.word	-66059748
	.space	4
	.word	-66059488
	.space	4
	.word	-66059472
	.space	4
	.ident	"GCC: (GNU) 4.8"
