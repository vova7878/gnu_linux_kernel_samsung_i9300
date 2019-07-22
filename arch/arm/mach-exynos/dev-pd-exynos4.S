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
	.file	"dev-pd-exynos4.c"
	.text
	.align	2
	.type	exynos_pd_restore, %function
exynos_pd_restore:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r4, #:lower16:.LANCHOR0
	ldr	r3, [r0, #-4]
	movt	r4, #:upper16:.LANCHOR0
	mov	r5, r0
	ldr	r6, [r0, #84]
	ldr	r2, [r4, r3, asl #2]
	cmp	r2, #7
	movne	r0, #0
	beq	.L5
.L2:
	ldr	r2, [r6, #20]
	mov	r1, #0
	str	r1, [r4, r3, asl #2]
	ldr	r3, [r2, #4]
	ldmfd	sp!, {r4, r5, r6, pc}
.L5:
	movw	r3, #:lower16:exynos_pd_enable
	movt	r3, #:upper16:exynos_pd_enable
	blx	r3
	ldr	r3, [r5, #-4]
	b	.L2
	.fnend
	.size	exynos_pd_restore, .-exynos_pd_restore
	.align	2
	.type	exynos_pd_save, %function
exynos_pd_save:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movw	r3, #:lower16:.LANCHOR0
	ldr	r4, [r0, #84]
	movt	r3, #:upper16:.LANCHOR0
	ldr	ip, [r0, #-4]
	ldr	r2, [r4, #20]
	ldr	r1, [r2, #4]
	and	r1, r1, #7
	cmp	r1, #7
	str	r1, [r3, ip, asl #2]
	movne	r0, #0
	beq	.L9
	ldr	r3, [r2, #4]
	ldmfd	sp!, {r4, pc}
.L9:
	movw	r3, #:lower16:exynos_pd_disable
	movt	r3, #:upper16:exynos_pd_disable
	blx	r3
	ldr	r2, [r4, #20]
	ldr	r3, [r2, #4]
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	exynos_pd_save, .-exynos_pd_save
	.global	exynos4_device_pd
	.data
	.align	3
	.type	exynos4_device_pd, %object
	.size	exynos4_device_pd, 3600
exynos4_device_pd:
	.word	.LC0
	.word	0
	.space	84
	.word	__compound_literal.1
	.space	248
	.space	16
	.word	.LC0
	.word	1
	.space	84
	.word	__compound_literal.3
	.space	248
	.space	16
	.word	.LC0
	.word	2
	.space	84
	.word	__compound_literal.5
	.space	248
	.space	16
	.word	.LC0
	.word	3
	.space	84
	.word	__compound_literal.7
	.space	248
	.space	16
	.word	.LC0
	.word	4
	.space	84
	.word	__compound_literal.9
	.space	248
	.space	16
	.word	.LC0
	.word	5
	.space	84
	.word	__compound_literal.11
	.space	248
	.space	16
	.word	.LC0
	.word	6
	.space	84
	.word	__compound_literal.13
	.space	248
	.space	16
	.word	.LC0
	.word	7
	.space	84
	.word	__compound_literal.15
	.space	248
	.space	16
	.word	.LC0
	.word	8
	.space	84
	.word	__compound_literal.17
	.space	248
	.space	16
	.word	.LC0
	.word	9
	.space	84
	.word	__compound_literal.19
	.space	248
	.space	16
	.type	__compound_literal.19, %object
	.size	__compound_literal.19, 32
__compound_literal.19:
	.word	exynos_pd_init
	.word	exynos_pd_enable
	.word	exynos_pd_disable
	.word	exynos_pd_save
	.word	exynos_pd_restore
	.word	-31966016
	.word	__compound_literal.18
	.space	4
	.type	__compound_literal.18, %object
	.size	__compound_literal.18, 16
__compound_literal.18:
	.word	-32454340
	.space	8
	.word	58785792
	.type	__compound_literal.17, %object
	.size	__compound_literal.17, 32
__compound_literal.17:
	.word	exynos_pd_init
	.word	exynos_pd_enable
	.word	exynos_pd_disable
	.word	exynos_pd_save
	.word	exynos_pd_restore
	.word	-31966048
	.word	__compound_literal.16
	.space	4
	.type	__compound_literal.16, %object
	.size	__compound_literal.16, 16
__compound_literal.16:
	.word	-32454344
	.space	8
	.word	301989888
	.type	__compound_literal.15, %object
	.size	__compound_literal.15, 32
__compound_literal.15:
	.word	exynos_pd_init
	.word	exynos_pd_enable
	.word	exynos_pd_disable
	.word	exynos_pd_save
	.word	exynos_pd_restore
	.word	-31965952
	.word	__compound_literal.14
	.space	4
	.type	__compound_literal.13, %object
	.size	__compound_literal.13, 32
__compound_literal.13:
	.word	exynos_pd_init
	.word	exynos_pd_enable
	.word	exynos_pd_disable
	.word	exynos_pd_save
	.word	exynos_pd_restore
	.word	-31965984
	.word	__compound_literal.12
	.space	4
	.type	__compound_literal.12, %object
	.size	__compound_literal.12, 16
__compound_literal.12:
	.word	-32454324
	.space	8
	.word	309329920
	.type	__compound_literal.11, %object
	.size	__compound_literal.11, 32
__compound_literal.11:
	.word	exynos_pd_init
	.word	exynos_pd_enable
	.word	exynos_pd_disable
	.word	exynos_pd_save
	.word	exynos_pd_restore
	.word	-31966208
	.word	__compound_literal.10
	.space	4
	.type	__compound_literal.10, %object
	.size	__compound_literal.10, 16
__compound_literal.10:
	.word	-32454368
	.space	8
	.word	293601280
	.type	__compound_literal.9, %object
	.size	__compound_literal.9, 32
__compound_literal.9:
	.word	exynos_pd_init
	.word	exynos_pd_enable
	.word	exynos_pd_disable
	.word	exynos_pd_save
	.word	exynos_pd_restore
	.word	-31966176
	.word	__compound_literal.8
	.space	4
	.type	__compound_literal.8, %object
	.size	__compound_literal.8, 16
__compound_literal.8:
	.word	-32454364
	.space	8
	.word	314572800
	.type	__compound_literal.7, %object
	.size	__compound_literal.7, 32
__compound_literal.7:
	.word	exynos_pd_init
	.word	exynos_pd_enable
	.word	exynos_pd_disable
	.word	exynos_pd_save
	.word	exynos_pd_restore
	.word	-31966048
	.word	__compound_literal.6
	.space	4
	.type	__compound_literal.6, %object
	.size	__compound_literal.6, 16
__compound_literal.6:
	.word	-32454344
	.space	8
	.word	301989888
	.type	__compound_literal.5, %object
	.size	__compound_literal.5, 32
__compound_literal.5:
	.word	exynos_pd_init
	.word	exynos_pd_enable
	.word	exynos_pd_disable
	.word	exynos_pd_save
	.word	exynos_pd_restore
	.word	-31966080
	.word	__compound_literal.4
	.space	4
	.type	__compound_literal.4, %object
	.size	__compound_literal.4, 16
__compound_literal.4:
	.word	-32454348
	.space	8
	.word	297795584
	.type	__compound_literal.3, %object
	.size	__compound_literal.3, 32
__compound_literal.3:
	.word	exynos_pd_init
	.word	exynos_pd_enable
	.word	exynos_pd_disable
	.word	exynos_pd_save
	.word	exynos_pd_restore
	.word	-31966112
	.word	__compound_literal.2
	.space	4
	.type	__compound_literal.2, %object
	.size	__compound_literal.2, 16
__compound_literal.2:
	.word	-32454356
	.space	8
	.word	318767104
	.type	__compound_literal.1, %object
	.size	__compound_literal.1, 32
__compound_literal.1:
	.word	exynos_pd_init
	.word	exynos_pd_enable
	.word	exynos_pd_disable
	.word	exynos_pd_save
	.word	exynos_pd_restore
	.word	-31966144
	.word	__compound_literal.0
	.space	4
	.type	__compound_literal.0, %object
	.size	__compound_literal.0, 16
__compound_literal.0:
	.word	-32454360
	.space	8
	.word	322961408
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"samsung-pd\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	exynos_pd_status, %object
	.size	exynos_pd_status, 32
exynos_pd_status:
	.space	32
	.type	__compound_literal.14, %object
	.size	__compound_literal.14, 16
__compound_literal.14:
	.space	16
	.ident	"GCC: (GNU) 4.8"
