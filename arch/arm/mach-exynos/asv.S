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
	.file	"asv.c"
	.text
	.align	2
	.type	exynos4_asv_init, %function
exynos4_asv_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:kmalloc_caches
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r3, #:upper16:kmalloc_caches
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L2
	movw	r3, #:lower16:kmem_cache_alloc_trace
	movw	r1, #32976
	movt	r3, #:upper16:kmem_cache_alloc_trace
	mov	r2, #44
	blx	r3
	movw	r4, #:lower16:.LANCHOR0
	cmp	r0, #0
	movt	r4, #:upper16:.LANCHOR0
	str	r0, [r4]
	beq	.L16
.L15:
	movw	r3, #:lower16:samsung_cpu_id
	movt	r3, #:upper16:samsung_cpu_id
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmn	r3, #465567744
	beq	.L4
	mov	r2, #0
	movt	r2, 17186
	cmp	r3, r2
	bne	.L5
.L4:
	movw	r3, #:lower16:exynos4x12_asv_init
	movt	r3, #:upper16:exynos4x12_asv_init
	blx	r3
	subs	r6, r0, #0
	bne	.L32
	ldr	r0, [r4]
	movw	r5, #:lower16:.LANCHOR0
	movt	r5, #:upper16:.LANCHOR0
	ldr	r3, [r0, #20]
	cmp	r3, #0
	beq	.L8
	blx	r3
	cmp	r0, #0
	bne	.L9
	ldr	r0, [r5]
.L8:
	ldr	r3, [r0, #36]
	cmp	r3, #0
	beq	.L10
	blx	r3
	cmp	r0, #0
	bne	.L10
	ldr	r0, [r4]
	movw	r5, #:lower16:.LANCHOR0
	movt	r5, #:upper16:.LANCHOR0
	ldr	r3, [r0, #32]
	cmp	r3, #0
	beq	.L12
	blx	r3
	cmp	r0, #0
	bne	.L12
	ldr	r0, [r5]
	ldr	r3, [r0, #40]
	cmp	r3, #0
	beq	.L14
	blx	r3
	cmp	r0, #0
	ldmeqfd	sp!, {r4, r5, r6, pc}
	movw	r0, #:lower16:.LC4
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC4
	movt	r3, #:upper16:printk
	blx	r3
.L7:
	movw	r3, #:lower16:kfree
	ldr	r0, [r4]
	movt	r3, #:upper16:kfree
	blx	r3
	mov	r0, r6
	ldmfd	sp!, {r4, r5, r6, pc}
.L2:
	movw	r4, #:lower16:.LANCHOR0
	mov	r3, #16
	movt	r4, #:upper16:.LANCHOR0
	mov	r0, r3
	str	r3, [r4]
	b	.L15
.L32:
	movw	r3, #:lower16:kfree
	ldr	r0, [r4]
	movt	r3, #:upper16:kfree
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
.L16:
	mvn	r0, #11
	ldmfd	sp!, {r4, r5, r6, pc}
.L12:
	movw	r0, #:lower16:.LC3
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC3
	blx	r3
	b	.L7
.L10:
	movw	r0, #:lower16:.LC2
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC2
	blx	r3
	b	.L7
.L5:
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC0
	movt	r3, #:upper16:printk
	blx	r3
	mvn	r6, #21
	b	.L7
.L14:
	movw	r0, #:lower16:.LC5
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC5
	blx	r3
	b	.L7
.L9:
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC1
	blx	r3
	b	.L7
	.fnend
	.size	exynos4_asv_init, .-exynos4_asv_init
	.global	exynos_dynamic_ema
	.global	exynos_special_flag
	.global	exynos_result_of_asv
	.section	.initcall6s.init,"aw",%progbits
	.align	2
	.type	__initcall_exynos4_asv_init6s, %object
	.size	__initcall_exynos4_asv_init6s, 4
__initcall_exynos4_asv_init6s:
	.word	exynos4_asv_init
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<6>EXYNOS: There is no type for ASV\012\000"
	.space	3
.LC1:
	.ascii	"<6>EXYNOS: It is wrong vdd_arm\012\000"
.LC2:
	.ascii	"<6>EXYNOS: Fail to get HPM Value\012\000"
	.space	2
.LC3:
	.ascii	"<6>EXYNOS: Fail to get IDS Value\012\000"
	.space	2
.LC4:
	.ascii	"<6>EXYNOS: Can not success to store result\012\000"
.LC5:
	.ascii	"<6>EXYNOS: No store_result function\012\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	exynos_asv, %object
	.size	exynos_asv, 4
exynos_asv:
	.space	4
	.type	exynos_dynamic_ema, %object
	.size	exynos_dynamic_ema, 1
exynos_dynamic_ema:
	.space	1
	.space	3
	.type	exynos_special_flag, %object
	.size	exynos_special_flag, 4
exynos_special_flag:
	.space	4
	.type	exynos_result_of_asv, %object
	.size	exynos_result_of_asv, 4
exynos_result_of_asv:
	.space	4
	.ident	"GCC: (GNU) 4.8"
