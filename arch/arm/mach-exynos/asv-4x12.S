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
	.file	"asv-4x12.c"
	.text
	.align	2
	.type	exynos4x12_get_hpm, %function
exynos4x12_get_hpm:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r0
	mov	r0, #0
	ldr	r2, [r3]
	ubfx	r2, r2, #12, #5
	str	r2, [r3, #12]
	bx	lr
	.fnend
	.size	exynos4x12_get_hpm, .-exynos4x12_get_hpm
	.align	2
	.type	exynos4x12_get_ids, %function
exynos4x12_get_ids:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r0
	mov	r0, #0
	ldrb	r2, [r3, #3]	@ zero_extendqisi2
	str	r2, [r3, #16]
	bx	lr
	.fnend
	.size	exynos4x12_get_ids, .-exynos4x12_get_ids
	.align	2
	.type	exynos4x12_pre_set_abb, %function
exynos4x12_pre_set_abb:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:samsung_rev
	movt	r3, #:upper16:samsung_rev
	blx	r3
	movw	r3, #:lower16:exynos_result_of_asv
	cmp	r0, #31
	movt	r3, #:upper16:exynos_result_of_asv
	ldr	r3, [r3]
	bls	.L4
	cmp	r3, #12
	ldrls	pc, [pc, r3, asl #2]
	b	.L12
.L7:
	.word	.L6
	.word	.L6
	.word	.L8
	.word	.L9
	.word	.L9
	.word	.L9
	.word	.L9
	.word	.L9
	.word	.L10
	.word	.L10
	.word	.L10
	.word	.L10
	.word	.L10
.L4:
	cmp	r3, #7
	ldrls	pc, [pc, r3, asl #2]
	b	.L12
.L14:
	.word	.L13
	.word	.L13
	.word	.L13
	.word	.L13
	.word	.L12
	.word	.L12
	.word	.L12
	.word	.L12
.L12:
	mov	r3, #0
	mov	r2, #142
.L16:
	movt	r3, 65048
	movt	r2, 32768
	str	r2, [r3, #1920]
	str	r2, [r3, #1924]
	str	r2, [r3, #1928]
	str	r2, [r3, #1932]
	ldmfd	sp!, {r3, pc}
.L13:
	mov	r3, #0
	mov	r2, #136
	b	.L16
.L6:
	mov	r3, #0
	mov	r1, #131
	mov	r2, #136
	movt	r3, 65048
	movt	r2, 32768
	movt	r1, 32768
	str	r1, [r3, #1932]
	str	r2, [r3, #1920]
	str	r2, [r3, #1924]
	str	r2, [r3, #1928]
	ldmfd	sp!, {r3, pc}
.L8:
	mov	r3, #0
	mov	r2, #136
.L17:
	mov	r1, #144
	movt	r3, 65048
	movt	r2, 32768
	movt	r1, 32768
	str	r2, [r3, #1932]
	str	r2, [r3, #1920]
	str	r1, [r3, #1924]
	str	r2, [r3, #1928]
	ldmfd	sp!, {r3, pc}
.L9:
	mov	r3, #0
	mov	r2, #142
	mov	r0, #144
	mov	r1, #136
	movt	r3, 65048
	movt	r2, 32768
	movt	r0, 32768
	movt	r1, 32768
	str	r2, [r3, #1932]
	str	r2, [r3, #1920]
	str	r0, [r3, #1924]
	str	r1, [r3, #1928]
	ldmfd	sp!, {r3, pc}
.L10:
	mov	r3, #0
	mov	r2, #142
	b	.L17
	.fnend
	.size	exynos4x12_pre_set_abb, .-exynos4x12_pre_set_abb
	.align	2
	.type	exynos4x12_asv_store_result, %function
exynos4x12_asv_store_result:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r3, #:lower16:samsung_cpu_id
	movt	r3, #:upper16:samsung_cpu_id
	mov	r4, r0
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmn	r3, #465567744
	beq	.L45
	ldr	r0, .L46
	mov	r3, #0
	ldr	lr, [r4, #16]
	mov	r2, r3
	mov	r5, r0
.L34:
	add	r1, r0, r3
	ldr	r1, [r1, #4]
	cmp	r1, lr
	bcs	.L32
	ldr	r1, [r3, r5]
	add	r3, r3, #8
	ldr	ip, [r4, #12]
	cmp	ip, r1
	bls	.L32
	add	r2, r2, #1
	cmp	r2, #12
	bne	.L34
.L44:
	movw	r3, #:lower16:exynos_result_of_asv
	movt	r3, #:upper16:exynos_result_of_asv
	ldr	r1, [r3]
.L23:
	cmp	r1, #0
	moveq	r2, #1
	streq	r2, [r3]
	bl	exynos4x12_pre_set_abb
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, pc}
.L32:
	movw	r3, #:lower16:exynos_result_of_asv
	mov	r1, r2
	movt	r3, #:upper16:exynos_result_of_asv
	str	r2, [r3]
	b	.L23
.L45:
	movw	r3, #:lower16:samsung_rev
	movt	r3, #:upper16:samsung_rev
	blx	r3
	cmp	r0, #31
	bls	.L21
	movw	ip, #:lower16:.LANCHOR0
	ldr	lr, [r4, #16]
	movt	ip, #:upper16:.LANCHOR0
	mov	r3, #0
	mov	r5, ip
	mov	r2, r3
.L26:
	add	r1, ip, r3
	ldr	r1, [r1, #4]
	cmp	lr, r1
	bls	.L32
	ldr	r1, [r3, r5]
	add	r3, r3, #8
	ldr	r0, [r4, #12]
	cmp	r0, r1
	bls	.L32
	add	r2, r2, #1
	cmp	r2, #13
	bne	.L26
	b	.L44
.L21:
	ldr	ip, .L46+4
	mov	r3, #0
	ldr	lr, [r4, #16]
	mov	r2, r3
	mov	r5, ip
.L30:
	add	r1, ip, r3
	ldr	r1, [r1, #4]
	cmp	lr, r1
	bls	.L32
	ldr	r1, [r3, r5]
	add	r3, r3, #8
	ldr	r0, [r4, #12]
	cmp	r0, r1
	bls	.L32
	add	r2, r2, #1
	cmp	r2, #12
	bne	.L30
	b	.L44
.L47:
	.align	2
.L46:
	.word	.LANCHOR0+200
	.word	.LANCHOR0+104
	.fnend
	.size	exynos4x12_asv_store_result, .-exynos4x12_asv_store_result
	.align	2
	.global	exynos4x12_asv_init
	.type	exynos4x12_asv_init, %function
exynos4x12_asv_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r7, r0
	movw	r8, #:lower16:exynos_result_of_asv
	movw	r5, #:lower16:exynos_special_flag
	movw	r6, #:lower16:exynos_dynamic_ema
	movw	r0, #:lower16:.LC0
	movw	r9, #:lower16:printk
	mov	r3, #0
	movt	r8, #:upper16:exynos_result_of_asv
	movt	r5, #:upper16:exynos_special_flag
	movt	r6, #:upper16:exynos_dynamic_ema
	movt	r0, #:upper16:.LC0
	movt	r9, #:upper16:printk
	str	r3, [r8]
	str	r3, [r5]
	strb	r3, [r6]
	blx	r9
	mov	r2, #-33554432
	movw	r3, #:lower16:samsung_rev
	ldr	r4, [r2, #4]
	movt	r3, #:upper16:samsung_rev
	str	r4, [r7]
	blx	r3
	cmp	r0, #31
	bhi	.L49
	and	r3, r4, #7
	cmp	r3, #2
	movw	r3, #:lower16:.LANCHOR1
	movweq	r2, #16960
	movwne	r2, #23744
	movteq	r3, #:upper16:.LANCHOR1
	movteq	r2, 15
	movtne	r3, #:upper16:.LANCHOR1
	movtne	r2, 21
	str	r2, [r3]
.L49:
	ands	r3, r4, #64
	movne	r3, #1
	ands	r0, r4, #8
	strb	r3, [r6]
	bne	.L67
	movw	r1, #:lower16:exynos4x12_get_ids
	movw	r2, #:lower16:exynos4x12_get_hpm
	movw	r3, #:lower16:exynos4x12_asv_store_result
	ubfx	r4, r4, #7, #5
	movt	r1, #:upper16:exynos4x12_get_ids
	movt	r2, #:upper16:exynos4x12_get_hpm
	movt	r3, #:upper16:exynos4x12_asv_store_result
	str	r4, [r5]
	str	r1, [r7, #32]
	str	r2, [r7, #36]
	str	r3, [r7, #40]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L67:
	ubfx	r6, r4, #17, #4
	ubfx	r7, r4, #21, #3
	cmp	r6, #0
	rsb	r3, r7, r6
	beq	.L68
	cmp	r3, #0
	movle	r3, #1
	str	r3, [r8]
.L57:
	movw	r0, #:lower16:.LC2
	mov	r1, r6
	mov	r2, r7
	ldr	r3, [r8]
	movt	r0, #:upper16:.LC2
	ubfx	r4, r4, #7, #5
	blx	r9
	str	r4, [r5]
	bl	exynos4x12_pre_set_abb
	mvn	r0, #16
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L68:
	movw	r0, #:lower16:.LC1
	movt	r0, #:upper16:.LC1
	blx	r9
	mov	r3, #1
	str	r3, [r8]
	b	.L57
	.fnend
	.size	exynos4x12_asv_init, .-exynos4x12_asv_init
	.global	exynos4212_limit
	.global	exynos4x12_limit_rev2
	.global	exynos4x12_limit
	.global	exynos_armclk_max
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	exynos4x12_limit_rev2, %object
	.size	exynos4x12_limit_rev2, 104
exynos4x12_limit_rev2:
	.word	0
	.word	0
	.word	15
	.word	8
	.word	16
	.word	11
	.word	18
	.word	14
	.word	19
	.word	18
	.word	20
	.word	22
	.word	21
	.word	26
	.word	22
	.word	29
	.word	23
	.word	36
	.word	24
	.word	40
	.word	25
	.word	45
	.word	26
	.word	50
	.word	999
	.word	999
	.type	exynos4x12_limit, %object
	.size	exynos4x12_limit, 96
exynos4x12_limit:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	14
	.word	9
	.word	16
	.word	14
	.word	18
	.word	17
	.word	20
	.word	20
	.word	21
	.word	24
	.word	22
	.word	30
	.word	23
	.word	34
	.word	24
	.word	39
	.word	100
	.word	100
	.word	999
	.word	999
	.type	exynos4212_limit, %object
	.size	exynos4212_limit, 96
exynos4212_limit:
	.word	0
	.word	0
	.word	17
	.word	12
	.word	18
	.word	13
	.word	20
	.word	14
	.word	22
	.word	18
	.word	24
	.word	22
	.word	25
	.word	29
	.word	26
	.word	31
	.word	27
	.word	35
	.word	28
	.word	39
	.word	100
	.word	100
	.word	999
	.word	999
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<6>EXYNOS4X12: Adaptive Support Voltage init\012\000"
	.space	2
.LC1:
	.ascii	"<6>EXYNOS4X12: No Origin speed Group\012\000"
	.space	2
.LC2:
	.ascii	"<6>EXYNOS4X12(SG):  ORIG : %d MOD : %d RESULT : %d\012"
	.ascii	"\000"
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	exynos_armclk_max, %object
	.size	exynos_armclk_max, 4
exynos_armclk_max:
	.space	4
	.ident	"GCC: (GNU) 4.8"
