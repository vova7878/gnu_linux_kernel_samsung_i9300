	.cpu cortex-a9
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"cpu.c"
	.text
	.align	2
	.global	samsung_rev
	.syntax unified
	.arm
	.fpu softvfp
	.type	samsung_rev, %function
samsung_rev:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	ldr	r0, [r3]
	bx	lr
	.fnend
	.size	samsung_rev, .-samsung_rev
	.align	2
	.global	s3c24xx_init_cpu
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c24xx_init_cpu, %function
s3c24xx_init_cpu:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	mov	r2, #0
	movt	r3, #:upper16:.LANCHOR0
	str	r2, [r3]
	bx	lr
	.fnend
	.size	s3c24xx_init_cpu, .-s3c24xx_init_cpu
	.align	2
	.global	s3c64xx_init_cpu
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c64xx_init_cpu, %function
s3c64xx_init_cpu:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	movw	r3, #:lower16:.LANCHOR0
	movt	r2, 64528
	movt	r3, #:upper16:.LANCHOR0
	ldr	r1, [r2, #280]
	cmp	r1, #0
	str	r1, [r3, #4]
	streq	r1, [r2, #2588]
	ldreq	r2, [r2, #2588]
	streq	r2, [r3, #4]
	mov	r2, #0
	str	r2, [r3]
	bx	lr
	.fnend
	.size	s3c64xx_init_cpu, .-s3c64xx_init_cpu
	.align	2
	.global	s5p_init_cpu
	.syntax unified
	.arm
	.fpu softvfp
	.type	s5p_init_cpu, %function
s5p_init_cpu:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0]
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	str	r2, [r3, #4]
	uxtb	r2, r2
	str	r2, [r3]
	bx	lr
	.fnend
	.size	s5p_init_cpu, .-s5p_init_cpu
	.global	samsung_cpu_id
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	samsung_cpu_rev, %object
	.size	samsung_cpu_rev, 4
samsung_cpu_rev:
	.space	4
	.type	samsung_cpu_id, %object
	.size	samsung_cpu_id, 4
samsung_cpu_id:
	.space	4
	.section	___ksymtab+samsung_rev,"a",%progbits
	.align	2
	.type	__ksymtab_samsung_rev, %object
	.size	__ksymtab_samsung_rev, 8
__ksymtab_samsung_rev:
	.word	samsung_rev
	.word	__kstrtab_samsung_rev
	.section	__ksymtab_strings,"a",%progbits
	.type	__kstrtab_samsung_rev, %object
	.size	__kstrtab_samsung_rev, 12
__kstrtab_samsung_rev:
	.ascii	"samsung_rev\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
