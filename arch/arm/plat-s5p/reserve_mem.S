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
	.file	"reserve_mem.c"
	.text
	.align	2
	.global	s5p_cma_region_reserve
	.type	s5p_cma_region_reserve, %function
s5p_cma_region_reserve:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #20
	sub	sp, sp, #20
	str	r1, [sp, #4]
	mov	r10, r2
	ldr	r1, [r0, #8]
	str	r3, [sp, #8]
	cmp	r1, #0
	beq	.L34
	movw	r2, #:lower16:memblock_free
	movw	r7, #:lower16:printk
	movw	r9, #:lower16:cma_early_region_register
	movw	r6, #:lower16:memblock_reserve
	movt	r2, #:upper16:memblock_free
	add	r4, r0, #44
	movt	r7, #:upper16:printk
	movt	r9, #:upper16:cma_early_region_register
	str	r2, [sp, #12]
	movt	r6, #:upper16:memblock_reserve
	mvn	r8, #0
	b	.L15
.L61:
	ubfx	r3, r2, #0, #12
	cmp	r3, #0
	bne	.L59
	ldr	r0, [r4, #-40]
	cmp	r0, #0
	beq	.L8
.L62:
	movw	r3, #:lower16:memblock_is_region_reserved
	ldr	r1, [r4, #-36]
	movt	r3, #:upper16:memblock_is_region_reserved
	blx	r3
	cmp	r0, #0
	bne	.L57
	ldr	r0, [r4, #-40]
	ldr	r1, [r4, #-36]
	blx	r6
	cmp	r0, #0
	bne	.L57
	ldrb	r3, [r5, #40]	@ zero_extendqisi2
	orr	r3, r3, #4
	strb	r3, [r5, #40]
	ldr	fp, [r4, #-40]
.L10:
	cmp	fp, #0
	beq	.L11
	mov	r0, fp
	ldr	r1, [r4, #-36]
	blx	r6
	cmp	r0, #0
	beq	.L12
.L57:
	movw	r0, #:lower16:.LC2
	ldr	r1, [r4, #-44]
	movt	r0, #:upper16:.LC2
	blx	r7
.L5:
	add	r4, r4, #44
	ldr	r1, [r4, #-36]
	cmp	r1, #0
	beq	.L2
.L15:
	ubfx	r3, r1, #0, #12
	sub	r5, r4, #44
	cmp	r3, #0
	addne	r1, r1, #4080
	addne	r1, r1, #15
	bicne	r1, r1, #4080
	bicne	r1, r1, #15
	strne	r1, [r4, #-36]
	ldrb	r3, [r5, #40]	@ zero_extendqisi2
	tst	r3, #4
	bne	.L60
	ldr	r2, [r4, #-32]
	cmp	r2, #0
	bne	.L61
	ldr	r0, [r4, #-40]
	mov	r3, #4096
	str	r3, [r4, #-32]
	cmp	r0, #0
	bne	.L62
.L8:
	movw	ip, #:lower16:memblock_find_in_range
	mov	r1, r0
	movt	ip, #:upper16:memblock_find_in_range
	ldr	r2, [r4, #-36]
	ldr	r3, [r4, #-32]
	blx	ip
	mov	fp, r0
	b	.L10
.L12:
	str	fp, [r4, #-40]
	movw	r0, #:lower16:.LC3
	ldrb	r3, [r5, #40]	@ zero_extendqisi2
	movt	r0, #:upper16:.LC3
	mov	r1, fp
	orr	r3, r3, #4
	strb	r3, [r5, #40]
	ldr	r2, [r4, #-36]
	ldr	r3, [r4, #-44]
	blx	r7
.L13:
	mov	r0, r5
	blx	r9
	cmp	r0, #0
	bne	.L63
	add	r4, r4, #44
	ldr	r1, [r4, #-36]
	cmp	r8, fp
	movcs	r8, fp
	cmp	r1, #0
	bne	.L15
.L2:
	ldr	r2, [sp, #4]
	cmp	r2, #0
	beq	.L17
	ldr	r3, [r2, #8]
	cmp	r3, #0
	beq	.L17
	mov	r5, r2
	mov	r4, #0
	b	.L20
.L64:
	mov	r5, r6
.L20:
	add	r6, r5, #44
	add	r4, r4, r3
	ldr	r3, [r6, #8]
	cmp	r3, #0
	bne	.L64
	cmp	r10, #0
	bne	.L21
	mov	r3, #1
	add	r10, r4, #1
	mov	r10, r10, lsr r3
	sub	r2, r4, #1
	sub	r10, r10, #1
	mov	r10, r10, lsr #12
@ 268 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/bitops.h" 1
	clz	r10, r10
@ 0 "" 2
	rsb	r10, r10, #44
	mov	r10, r3, asl r10
	rsb	r2, r10, r2
	mov	r1, r2, lsr #12
@ 268 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/bitops.h" 1
	clz	r1, r1
@ 0 "" 2
	rsb	r1, r1, #44
	cmp	r1, #19
	subhi	r1, r1, #3
	movls	r1, #0
	movhi	r3, r3, asl r1
	movls	r3, #131072
	movtls	r1, 65534
	rsbhi	r1, r3, #0
	add	r3, r3, r2
	and	r3, r3, r1
	add	r3, r3, r10
	subs	r2, r3, r4
	ldrne	r1, [r6, #-36]
	movne	r4, r3
	addne	r2, r1, r2
	strne	r2, [r6, #-36]
.L23:
	movw	r0, #:lower16:.LC6
	movw	r7, #:lower16:printk
	movt	r0, #:upper16:.LC6
	movt	r7, #:upper16:printk
	mov	r1, r4
	mov	r2, r10
	blx	r7
	movw	r3, #:lower16:memblock
	movt	r3, #:upper16:memblock
	ldr	r3, [r3]
	cmp	r8, r3
	bcs	.L65
	rsb	r8, r4, r8
	rsb	r3, r10, #0
	and	r8, r3, r8
.L25:
	cmp	r8, #0
	beq	.L26
	movw	r6, #:lower16:memblock_reserve
	movt	r6, #:upper16:memblock_reserve
	b	.L27
.L28:
	rsb	r8, r10, r8
.L27:
	mov	r0, r8
	mov	r1, r4
	blx	r6
	cmp	r0, #0
	bne	.L28
	movw	r6, #:lower16:cma_early_region_register
	movw	r9, #:lower16:printk
	movw	fp, #:lower16:memblock_free
	sub	r5, r5, #44
	movt	r6, #:upper16:cma_early_region_register
	movt	r9, #:upper16:printk
	movt	fp, #:upper16:memblock_free
.L32:
	ldrb	r3, [r5, #84]	@ zero_extendqisi2
	movw	r0, #:lower16:.LC3
	ldr	ip, [r5, #52]
	mov	r1, r8
	str	r8, [r5, #48]
	add	r10, r5, #44
	orr	r3, r3, #4
	movt	r0, #:upper16:.LC3
	strb	r3, [r5, #84]
	mov	r2, ip
	ldr	r3, [r5, #44]
	add	r8, ip, r8
	blx	r7
	mov	r0, r10
	blx	r6
	cmp	r0, #0
	bne	.L66
	ldr	r3, [r5, #52]
	rsb	r4, r3, r4
.L30:
	ldr	r2, [sp, #4]
	sub	r5, r5, #44
	add	r3, r5, #88
	cmp	r2, r3
	bne	.L32
	cmp	r4, #0
	bne	.L67
.L17:
	ldr	r3, [sp, #8]
	cmp	r3, #0
	beq	.L1
	movw	r3, #:lower16:cma_set_defaults
	ldr	r1, [sp, #8]
	movt	r3, #:upper16:cma_set_defaults
	mov	r0, #0
	blx	r3
.L1:
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L67:
	movw	r3, #:lower16:memblock_free
	mov	r0, r8
	mov	r1, r4
	movt	r3, #:upper16:memblock_free
	blx	r3
	b	.L17
.L26:
	movw	r0, #:lower16:.LC8
	movt	r0, #:upper16:.LC8
	blx	r7
	b	.L17
.L65:
	mov	r0, #0
	movw	ip, #:lower16:memblock_find_in_range
	ldr	r3, [r6, #-32]
	mov	r1, r0
	movt	ip, #:upper16:memblock_find_in_range
	mov	r2, r4
	blx	ip
	mov	r8, r0
	b	.L25
.L34:
	mvn	r8, #0
	b	.L2
.L11:
	movw	r0, #:lower16:.LC4
	ldr	r1, [r4, #-44]
	movt	r0, #:upper16:.LC4
	blx	r7
	b	.L13
.L63:
	movw	r0, #:lower16:.LC5
	ldr	r1, [r4, #-44]
	movt	r0, #:upper16:.LC5
	blx	r7
	ldr	r0, [r4, #-40]
	ldr	r1, [r4, #-36]
	ldr	r3, [sp, #12]
	blx	r3
	b	.L5
.L60:
	movw	r0, #:lower16:.LC0
	ldr	r1, [r4, #-44]
	movt	r0, #:upper16:.LC0
	blx	r7
	b	.L5
.L59:
	movw	r0, #:lower16:.LC1
	ldr	r1, [r4, #-44]
	movt	r0, #:upper16:.LC1
	blx	r7
	b	.L5
.L21:
	sub	r2, r10, #1
	rsb	r3, r10, #0
	add	r4, r2, r4
	and	r4, r4, r3
	b	.L23
.L66:
	ldr	r1, [r5, #52]
	ldr	r0, [r5, #48]
	blx	fp
	movw	r0, #:lower16:.LC7
	ldr	r1, [r5, #44]
	movt	r0, #:upper16:.LC7
	blx	r9
	b	.L30
	.fnend
	.size	s5p_cma_region_reserve, .-s5p_cma_region_reserve
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>S5P/CMA: '%s' already reserved\012\000"
	.space	1
.LC1:
	.ascii	"<3>S5P/CMA: Failed to reserve '%s': incorrect align"
	.ascii	"ment 0x%08x.\012\000"
	.space	3
.LC2:
	.ascii	"<3>S5P/CMA: Failed to reserve '%s'\012\000"
.LC3:
	.ascii	"<6>S5P/CMA: Reserved 0x%08x/0x%08x for '%s'\012\000"
	.space	3
.LC4:
	.ascii	"<3>S5P/CMA: No free space in memory for '%s'\012\000"
	.space	2
.LC5:
	.ascii	"<3>S5P/CMA: Failed to register '%s'\012\000"
	.space	3
.LC6:
	.ascii	"<6>S5P/CMA: Reserving %#x for secure region aligned"
	.ascii	" by %#x.\012\000"
	.space	3
.LC7:
	.ascii	"<3>S5P/CMA: Failed to register secure region '%s'\012"
	.ascii	"\000"
	.space	1
.LC8:
	.ascii	"<3>S5P/CMA: Failed to reserve secure regions\012\000"
	.ident	"GCC: (GNU) 4.8"
