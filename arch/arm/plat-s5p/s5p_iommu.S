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
	.file	"s5p_iommu.c"
	.text
	.align	2
	.type	s5p_iommu_iova_to_phys, %function
s5p_iommu_iova_to_phys:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0]
	mov	r2, r1, lsr #20
	ldr	r3, [r3, #4]
	ldr	r3, [r3, r2, asl #2]
	and	r2, r3, #3
	cmp	r2, #0
	cmpne	r2, #3
	beq	.L5
	mov	r2, #3
	ubfx	r0, r1, #0, #20
	movt	r2, 4
	and	r2, r3, r2
	cmp	r2, #2
	beq	.L8
	mov	r0, r0, lsr #12
	bic	r3, r3, #1020
	bic	r3, r3, #3
@ 182 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	sub	r3, r3, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	ldr	r2, [r3, r0, asl #2]
	ands	r0, r2, #2
	bne	.L9
	and	r3, r2, #3
	cmp	r3, #1
	moveq	r2, r2, lsr #16
	uxtheq	r1, r1
	addeq	r0, r1, r2, asl #16
	bx	lr
.L5:
	mov	r0, #0
	bx	lr
.L8:
	mov	r3, r3, lsr #20
	add	r0, r0, r3, asl #20
	bx	lr
.L9:
	bic	r0, r2, #4080
	ubfx	r1, r1, #0, #12
	bic	r0, r0, #15
	add	r0, r0, r1
	bx	lr
	.fnend
	.size	s5p_iommu_iova_to_phys, .-s5p_iommu_iova_to_phys
	.align	2
	.type	s5p_iommu_domain_has_cap, %function
s5p_iommu_domain_has_cap:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	s5p_iommu_domain_has_cap, .-s5p_iommu_domain_has_cap
	.align	2
	.type	s5p_iommu_init, %function
s5p_iommu_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	mov	r1, #1024
	mov	r4, #0
	.pad #8
	sub	sp, sp, #8
	movw	r0, #:lower16:.LC0
	movw	ip, #:lower16:kmem_cache_create
	mov	r2, r1
	str	r4, [sp]
	mov	r3, r4
	movt	r0, #:upper16:.LC0
	movt	ip, #:upper16:kmem_cache_create
	blx	ip
	movw	r2, #:lower16:.LANCHOR0
	cmp	r0, r4
	movt	r2, #:upper16:.LANCHOR0
	str	r0, [r2]
	beq	.L13
	movw	r0, #:lower16:.LANCHOR1
	movw	r3, #:lower16:register_iommu
	movt	r0, #:upper16:.LANCHOR1
	movt	r3, #:upper16:register_iommu
	blx	r3
	mov	r0, r4
.L12:
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, pc}
.L13:
	mvn	r0, #11
	b	.L12
	.fnend
	.size	s5p_iommu_init, .-s5p_iommu_init
	.align	2
	.type	s5p_iommu_unmap, %function
s5p_iommu_unmap:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r7, r1
	ldr	r4, [r0]
	mov	r6, r2
	ldr	r3, [r4, #4]
	cmp	r3, #0
	beq	.L41
	add	r5, r4, #8
	movw	r3, #:lower16:mutex_lock
	movt	r3, #:upper16:mutex_lock
	mov	r0, r5
	blx	r3
	ldr	r3, [r4, #4]
	mov	r2, r7, lsr #20
	cmp	r6, #7
	add	lr, r3, r2, asl #2
	ble	.L16
	sub	r6, r6, #8
	mov	ip, #1
	mov	ip, ip, asl r6
	cmp	ip, #0
	sub	ip, ip, #1
	movne	r2, #0
	bne	.L26
.L25:
	movw	r3, #:lower16:mutex_unlock
	mov	r0, r5
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L19
	movw	r3, #:lower16:s5p_sysmmu_tlb_invalidate
	movt	r3, #:upper16:s5p_sysmmu_tlb_invalidate
	blx	r3
.L19:
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L44:
	bic	r3, r1, #1020
	bic	r3, r3, #3
@ 182 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	sub	r3, r3, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	add	r1, r3, #1024
.L24:
	str	r2, [r3], #4
	cmp	r3, r1
	bne	.L24
.L21:
	subs	ip, ip, #1
	bcc	.L25
.L26:
	ldr	r1, [lr], #4
	mov	r3, #3
	movt	r3, 4
	and	r3, r1, r3
	cmp	r3, #2
	streq	r2, [lr, #-4]
	beq	.L21
	and	r3, r1, #3
	cmp	r3, #1
	bne	.L21
	b	.L44
.L16:
	ldr	r3, [r3, r2, asl #2]
	ubfx	r1, r7, #12, #8
	bic	r3, r3, #1020
	bic	r3, r3, #3
@ 182 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	sub	r3, r3, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	ldr	r2, [r3, r1, asl #2]
	add	r1, r3, r1, asl #2
	and	r3, r2, #3
	cmp	r3, #1
	beq	.L43
.L27:
	mov	r3, #1
	mov	r3, r3, asl r6
	cmp	r3, #0
	sub	r3, r3, #1
	beq	.L25
	mov	r2, #0
.L28:
	sub	r3, r3, #1
	str	r2, [r1], #4
	cmn	r3, #1
	bne	.L28
	b	.L25
.L43:
	cmp	r6, #3
	bgt	.L27
@ 522 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/s5p_iommu.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/s5p_iommu.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 523, 0
.popsection
@ 0 "" 2
.L41:
@ 496 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/s5p_iommu.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/s5p_iommu.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 496, 0
.popsection
@ 0 "" 2
	.fnend
	.size	s5p_iommu_unmap, .-s5p_iommu_unmap
	.align	2
	.type	s5p_iommu_map, %function
s5p_iommu_map:
	.fnstart
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, r3
	ldr	r5, [r0]
	.pad #20
	sub	sp, sp, #20
	mov	fp, r0
	mov	r6, r1
	mov	r4, r2
	ldr	r3, [r5, #4]
	cmp	r3, #0
	beq	.L109
	add	r3, r5, #8
	mov	r8, r6, lsr #20
	str	r3, [sp, #12]
	movw	r3, #:lower16:mutex_lock
	ldr	r0, [sp, #12]
	movt	r3, #:upper16:mutex_lock
	blx	r3
	ldr	r7, [r5, #4]
	cmp	r9, #7
	add	r5, r7, r8, asl #2
	ble	.L47
	orr	r3, r6, r4
	ubfx	r3, r3, #0, #20
	cmp	r3, #0
	bne	.L110
	sub	r9, r9, #8
	mov	r3, #4
	add	r9, r5, r3, asl r9
	cmp	r5, r9
	moveq	r7, r5
	beq	.L50
	ldr	r2, [r7, r8, asl #2]
	mov	r3, #3
	movt	r3, 4
	ldr	lr, [fp]
	and	r3, r2, r3
	cmp	r3, #2
	beq	.L91
	movw	r8, #:lower16:.LANCHOR0
	movw	r6, #:lower16:kmem_cache_free
	movt	r8, #:upper16:.LANCHOR0
	movt	r6, #:upper16:kmem_cache_free
	mov	r10, r5
	b	.L59
.L60:
.L53:
	orr	r3, r4, #2
	add	r4, r4, #1048576
	str	r3, [r10], #4
	cmp	r9, r10
	mov	r7, r10
	beq	.L50
	ldr	r2, [r10]
	mov	r3, #3
	movt	r3, 4
	ldr	lr, [fp]
	and	r3, r2, r3
	cmp	r3, #2
	beq	.L58
.L59:
	and	r3, r2, #3
	mov	r7, r10
	cmp	r3, #1
	bne	.L53
	bic	r2, r2, #1020
	bic	r0, r2, #3
@ 182 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	sub	r3, r0, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	ldr	r2, [r3]
	tst	r2, #3
	bne	.L55
	add	r1, r3, #1020
	b	.L56
.L57:
	ldr	r2, [r3, #4]!
	tst	r2, #3
	bne	.L55
.L56:
	cmp	r3, r1
	bne	.L57
@ 182 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	sub	r1, r0, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	ldr	r0, [r8]
	blx	r6
	b	.L53
.L47:
	ldr	r3, [r7, r8, asl #2]
	and	r2, r3, #3
	cmp	r2, #0
	cmpne	r2, #3
	beq	.L111
.L61:
	bic	r3, r3, #1020
	ubfx	r2, r6, #12, #8
	bic	r3, r3, #3
	cmp	r9, #3
@ 182 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	sub	r3, r3, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	add	r5, r3, r2, asl #2
	mov	r1, #4
	add	r9, r5, r1, asl r9
	ble	.L112
	orr	r3, r6, r4
	uxth	r3, r3
	cmp	r3, #0
	bne	.L68
	cmp	r5, r9
	movne	ip, r5
	beq	.L93
	mov	r7, ip
	ldr	r3, [r7], #64
	tst	r3, #3
	bne	.L71
.L113:
	orr	r0, r4, #1
	add	r3, ip, #4
	b	.L72
.L75:
	ldr	r1, [r2]
	add	r3, r3, #4
	tst	r1, #3
	bne	.L74
.L72:
	cmp	r3, r7
	str	r0, [r3, #-4]
	mov	r2, r3
	bne	.L75
	cmp	r9, r3
	add	r4, r4, #65536
	beq	.L89
	mov	ip, r3
	mov	r7, ip
	ldr	r3, [r7], #64
	tst	r3, #3
	beq	.L113
.L71:
	movw	r0, #:lower16:.LC3
	movw	r1, #:lower16:.LANCHOR2
	movw	r3, #:lower16:printk
	mov	r2, r6
	movt	r0, #:upper16:.LC3
	movt	r1, #:upper16:.LANCHOR2
	movt	r3, #:upper16:printk
	sub	r7, ip, #64
	mvn	r4, #97
	blx	r3
	b	.L73
.L112:
	cmp	r5, r9
	beq	.L93
	ldr	r3, [r3, r2, asl #2]
	tst	r3, #3
	movne	r7, r5
	bne	.L67
	add	r3, r5, #4
	b	.L78
.L114:
	ldr	r2, [r3]
	add	r3, r3, #4
	tst	r2, #3
	bne	.L67
.L78:
	cmp	r9, r3
	orr	r2, r4, #3
	str	r2, [r3, #-4]
	add	r4, r4, #4096
	mov	r7, r3
	bne	.L114
.L89:
	movw	r3, #:lower16:cpu_cache
	mov	r0, r5
	movt	r3, #:upper16:cpu_cache
	mov	r1, r7
	ldr	r3, [r3, #40]
	blx	r3
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r4, [r3, #8]
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	r0, r5, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	r1, r7, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	cmp	r4, #0
	beq	.L73
	blx	r4
	mov	r4, #0
.L73:
	cmp	r7, r9
	beq	.L83
.L90:
	cmp	r5, r7
	movne	r3, r7
	movne	r2, #0
	beq	.L81
.L82:
	str	r2, [r3, #-4]!
	cmp	r5, r3
	bne	.L82
.L81:
	movw	r3, #:lower16:cpu_cache
	mov	r0, r5
	movt	r3, #:upper16:cpu_cache
	mov	r1, r7
	ldr	r3, [r3, #40]
	blx	r3
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #8]
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	r0, r5, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	r1, r7, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	cmp	r3, #0
	beq	.L108
	blx	r3
.L108:
	mvn	r4, #97
.L83:
	movw	r3, #:lower16:mutex_unlock
	ldr	r0, [sp, #12]
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	mov	r0, r4
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L50:
	movw	r3, #:lower16:cpu_cache
	mov	r0, r5
	movt	r3, #:upper16:cpu_cache
	mov	r1, r7
	ldr	r3, [r3, #40]
	blx	r3
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r4, [r3, #8]
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	r0, r5, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	r1, r7, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	cmp	r4, #0
	beq	.L83
	blx	r4
	mov	r4, #0
	b	.L83
.L74:
	cmp	ip, r2
	beq	.L71
	mov	r3, r2
	mov	r2, #0
.L87:
	str	r2, [r3, #-4]!
	cmp	ip, r3
	bne	.L87
	b	.L71
.L93:
	mov	r7, r5
	b	.L89
.L111:
	movw	r2, #:lower16:.LANCHOR0
	movw	r3, #:lower16:kmem_cache_alloc
	movt	r2, #:upper16:.LANCHOR0
	movt	r3, #:upper16:kmem_cache_alloc
	ldr	r0, [r2]
	movw	r1, #32976
	blx	r3
	subs	r10, r0, #0
	beq	.L92
	movw	r3, #:lower16:cpu_cache
	add	r1, r10, #1024
	movt	r3, #:upper16:cpu_cache
	movw	fp, #:lower16:outer_cache
	ldr	ip, [r3, #40]
	movt	fp, #:upper16:outer_cache
	str	r1, [sp, #8]
	str	r3, [sp, #4]
	blx	ip
	ldr	ip, [fp, #8]
	ldr	r2, [sp, #8]
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	r0, r10, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	cmp	ip, #0
	ldr	r3, [sp, #4]
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	r1, r2, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	beq	.L62
	blx	ip
	ldr	r3, [sp, #4]
.L62:
	add	ip, r5, #4
	mov	r0, r5
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	r2, r10, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	orr	r2, r2, #1
	mov	r1, ip
	str	r2, [r7, r8, asl #2]
	ldr	r3, [r3, #40]
	str	ip, [sp, #8]
	blx	r3
	ldr	r3, [fp, #8]
	ldr	ip, [sp, #8]
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	r0, r5, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	cmp	r3, #0
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	r1, ip, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	beq	.L107
	blx	r3
.L107:
	ldr	r3, [r7, r8, asl #2]
	b	.L61
.L67:
	movw	r0, #:lower16:.LC4
	movw	r1, #:lower16:.LANCHOR2
	movw	r3, #:lower16:printk
	mov	r2, r6
	movt	r1, #:upper16:.LANCHOR2
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC4
	blx	r3
	b	.L90
.L55:
	movw	r0, #:lower16:.LC2
	movw	r3, #:lower16:printk
	ldr	r1, [lr, #4]
	movt	r3, #:upper16:printk
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	r1, r1, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	movt	r0, #:upper16:.LC2
	blx	r3
	b	.L90
.L109:
@ 294 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/s5p_iommu.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/s5p_iommu.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 294, 0
.popsection
@ 0 "" 2
.L110:
@ 301 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/s5p_iommu.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/s5p_iommu.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 301, 0
.popsection
@ 0 "" 2
.L91:
	mov	r7, r5
.L58:
	ldr	r1, [lr, #4]
	movw	r0, #:lower16:.LC1
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	r2, r1, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC1
	rsb	r1, r1, r7
	movt	r3, #:upper16:printk
	mov	r1, r1, asr #2
	mov	r1, r1, asl #20
	blx	r3
	b	.L90
.L68:
@ 348 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/s5p_iommu.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/s5p_iommu.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 348, 0
.popsection
@ 0 "" 2
.L92:
	mvn	r4, #11
	b	.L83
	.fnend
	.size	s5p_iommu_map, .-s5p_iommu_map
	.align	2
	.type	s5p_iommu_detach_device, %function
s5p_iommu_detach_device:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r3, #:lower16:mutex_lock
	ldr	r4, [r0]
	movt	r3, #:upper16:mutex_lock
	mov	r6, r1
	add	r5, r4, #8
	mov	r0, r5
	blx	r3
	ldr	r3, [r4]
	mov	r0, r5
	cmp	r3, r6
	movw	r3, #:lower16:mutex_unlock
	movt	r3, #:upper16:mutex_unlock
	beq	.L118
	blx	r3
	ldmfd	sp!, {r4, r5, r6, pc}
.L118:
	blx	r3
	movw	r3, #:lower16:s5p_sysmmu_disable
	ldr	r0, [r4]
	movt	r3, #:upper16:s5p_sysmmu_disable
	blx	r3
	mov	r3, #0
	str	r3, [r4]
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	s5p_iommu_detach_device, .-s5p_iommu_detach_device
	.align	2
	.type	s5p_iommu_domain_destroy, %function
s5p_iommu_domain_destroy:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movw	r3, #:lower16:free_pages
	ldr	r2, [r0]
	mov	r4, r0
	movt	r3, #:upper16:free_pages
	mov	r1, #2
	ldr	r0, [r2, #4]
	blx	r3
	movw	r3, #:lower16:kfree
	ldr	r0, [r4]
	movt	r3, #:upper16:kfree
	blx	r3
	mov	r3, #0
	str	r3, [r4]
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	s5p_iommu_domain_destroy, .-s5p_iommu_domain_destroy
	.align	2
	.type	s5p_iommu_domain_init, %function
s5p_iommu_domain_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r3, #:lower16:kmalloc_caches
	movt	r3, #:upper16:kmalloc_caches
	mov	r6, r0
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L125
	movw	r3, #:lower16:kmem_cache_alloc_trace
	movw	r1, #32976
	movt	r3, #:upper16:kmem_cache_alloc_trace
	mov	r2, #32
	blx	r3
	subs	r4, r0, #0
	beq	.L130
.L121:
	movw	r3, #:lower16:__get_free_pages
	mov	r0, #208
	movt	r3, #:upper16:__get_free_pages
	mov	r1, #2
	blx	r3
	cmp	r0, #0
	str	r0, [r4, #4]
	beq	.L131
	movw	r3, #:lower16:__memzero
	mov	r1, #16384
	movt	r3, #:upper16:__memzero
	blx	r3
	ldr	r5, [r4, #4]
	movw	r3, #:lower16:cpu_cache
	movt	r3, #:upper16:cpu_cache
	ldr	r3, [r3, #40]
	add	r7, r5, #16384
	mov	r0, r5
	mov	r1, r7
	blx	r3
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #8]
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	r1, r7, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	r0, r5, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	cmp	r3, #0
	beq	.L124
	blx	r3
.L124:
	movw	r1, #:lower16:.LC5
	movw	r3, #:lower16:__mutex_init
	add	r0, r4, #8
	movt	r1, #:upper16:.LC5
	movt	r3, #:upper16:__mutex_init
	ldr	r2, .L132
	blx	r3
	str	r4, [r6]
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L125:
	mov	r4, #16
	b	.L121
.L130:
	mvn	r0, #11
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L131:
	movw	r3, #:lower16:kfree
	mov	r0, r4
	movt	r3, #:upper16:kfree
	blx	r3
	mvn	r0, #11
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L133:
	.align	2
.L132:
	.word	.LANCHOR0+4
	.fnend
	.size	s5p_iommu_domain_init, .-s5p_iommu_domain_init
	.align	2
	.type	s5p_iommu_attach_device, %function
s5p_iommu_attach_device:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r5, r1
	ldr	r4, [r0]
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L135
	cmp	r3, r1
	bne	.L139
	mvn	r0, #15
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L135:
	movw	r3, #:lower16:s5p_sysmmu_enable
	ldr	r1, [r4, #4]
	movt	r3, #:upper16:s5p_sysmmu_enable
	mov	r0, r5
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	r1, r1, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	blx	r3
	subs	r6, r0, #0
	beq	.L140
	mov	r0, r6
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L140:
	add	r7, r4, #8
	movw	r3, #:lower16:mutex_lock
	mov	r0, r7
	movt	r3, #:upper16:mutex_lock
	blx	r3
	movw	r3, #:lower16:mutex_unlock
	mov	r0, r7
	str	r5, [r4]
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	mov	r0, r6
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L139:
@ 186 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/s5p_iommu.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/s5p_iommu.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 186, 0
.popsection
@ 0 "" 2
	.fnend
	.size	s5p_iommu_attach_device, .-s5p_iommu_attach_device
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	__func__.15876, %object
	.size	__func__.15876, 14
__func__.15876:
	.ascii	"s5p_iommu_map\000"
	.section	.initcall3.init,"aw",%progbits
	.align	2
	.type	__initcall_s5p_iommu_init3, %object
	.size	__initcall_s5p_iommu_init3, 4
__initcall_s5p_iommu_init3:
	.word	s5p_iommu_init
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	s5p_iommu_ops, %object
	.size	s5p_iommu_ops, 32
s5p_iommu_ops:
	.word	s5p_iommu_domain_init
	.word	s5p_iommu_domain_destroy
	.word	s5p_iommu_attach_device
	.word	s5p_iommu_detach_device
	.word	s5p_iommu_map
	.word	s5p_iommu_unmap
	.word	s5p_iommu_iova_to_phys
	.word	s5p_iommu_domain_has_cap
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"SysMMU Lv2 Tables\000"
	.space	2
.LC1:
	.ascii	"<3>1MB entry alread exists at %#x // pgtable %#lx\012"
	.ascii	"\000"
	.space	1
.LC2:
	.ascii	"<3>Failed to free L2 page table forsection mapping."
	.ascii	" // pgtalle %#lx\012\000"
	.space	3
.LC3:
	.ascii	"<3>%s: Failed to allocate large pagefor IOVA %#lx e"
	.ascii	"ntry.\012\000"
	.space	2
.LC4:
	.ascii	"<3>%s: Failed to allocate small page entry for IOVA"
	.ascii	" %#lx.\012\000"
	.space	1
.LC5:
	.ascii	"&priv->lock\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	l2table_cachep, %object
	.size	l2table_cachep, 4
l2table_cachep:
	.space	4
	.type	__key.15815, %object
	.size	__key.15815, 0
__key.15815:
	.ident	"GCC: (GNU) 4.8"
