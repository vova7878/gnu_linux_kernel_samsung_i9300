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
	.file	"s5p_iovmm.c"
	.text
	.align	2
	.type	s5p_iovmm_init, %function
s5p_iovmm_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	s5p_iovmm_init, .-s5p_iovmm_init
	.align	2
	.type	find_iovmm, %function
find_iovmm:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r5, r0
	movw	r3, #:lower16:_raw_read_lock
	movw	r0, #:lower16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_lock
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	movw	r1, #:lower16:.LANCHOR1
	movt	r1, #:upper16:.LANCHOR1
	ldr	r4, [r1]
	cmp	r4, r1
	beq	.L6
	ldr	r3, [r4, #12]
	cmp	r3, r5
	bne	.L4
	b	.L3
.L5:
	ldr	r2, [r3, #12]
	mov	r4, r3
	cmp	r2, r5
	beq	.L7
.L4:
	ldr	r3, [r4]
	cmp	r3, r1
	bne	.L5
.L3:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_unlock
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_unlock
	blx	r3
	mov	r0, r4
	ldmfd	sp!, {r3, r4, r5, pc}
.L7:
	mov	r4, r3
	b	.L3
.L6:
	mov	r4, #0
	b	.L3
	.fnend
	.size	find_iovmm, .-find_iovmm
	.align	2
	.global	iovmm_setup
	.type	iovmm_setup, %function
iovmm_setup:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:kmalloc_caches
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r3, #:upper16:kmalloc_caches
	mov	r5, r0
	.pad #8
	sub	sp, sp, #8
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L14
	movw	r3, #:lower16:kmem_cache_alloc_trace
	movw	r1, #32976
	movt	r3, #:upper16:kmem_cache_alloc_trace
	mov	r2, #56
	blx	r3
	subs	r4, r0, #0
	beq	.L18
.L10:
	movw	r3, #:lower16:gen_pool_create
	mov	r0, #12
	movt	r3, #:upper16:gen_pool_create
	mvn	r1, #0
	blx	r3
	cmp	r0, #0
	str	r0, [r4, #16]
	beq	.L16
	mvn	r2, #0
	movw	ip, #:lower16:gen_pool_add_virt
	str	r2, [sp]
	movt	ip, #:upper16:gen_pool_add_virt
	mov	r1, #-2147483648
	mov	r3, #1073741824
	blx	ip
	subs	r6, r0, #0
	beq	.L19
.L13:
	movw	r3, #:lower16:gen_pool_destroy
	ldr	r0, [r4, #16]
	movt	r3, #:upper16:gen_pool_destroy
	blx	r3
.L12:
	movw	r3, #:lower16:kfree
	mov	r0, r4
	movt	r3, #:upper16:kfree
	blx	r3
	mov	r0, r6
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, pc}
.L18:
	mvn	r0, #11
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, pc}
.L19:
	movw	r3, #:lower16:iommu_domain_alloc
	movt	r3, #:upper16:iommu_domain_alloc
	blx	r3
	cmp	r0, #0
	str	r0, [r4, #8]
	beq	.L17
	movw	r1, #:lower16:.LC0
	movw	r3, #:lower16:__mutex_init
	movt	r1, #:upper16:.LC0
	add	r0, r4, #32
	str	r5, [r4, #12]
	movt	r3, #:upper16:__mutex_init
	ldr	r2, .L20
	blx	r3
	add	r2, r4, #20
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_write_lock
	str	r2, [r4, #20]
	str	r2, [r4, #24]
	movt	r0, #:upper16:.LANCHOR0
	str	r4, [r4]
	movt	r3, #:upper16:_raw_write_lock
	str	r4, [r4, #4]
	blx	r3
	movw	r3, #:lower16:.LANCHOR1
	movw	r0, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR1
	movw	r2, #:lower16:_raw_write_unlock
	ldr	r1, [r3]
	movt	r0, #:upper16:.LANCHOR0
	movt	r2, #:upper16:_raw_write_unlock
	str	r4, [r1, #4]
	stmia	r4, {r1, r3}
	str	r4, [r3]
	blx	r2
	mov	r0, r6
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, pc}
.L14:
	mov	r4, #16
	b	.L10
.L17:
	mvn	r6, #11
	b	.L13
.L16:
	mvn	r6, #11
	b	.L12
.L21:
	.align	2
.L20:
	.word	.LANCHOR0+8
	.fnend
	.size	iovmm_setup, .-iovmm_setup
	.align	2
	.global	iovmm_cleanup
	.type	iovmm_cleanup, %function
iovmm_cleanup:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r4, r0
	bl	find_iovmm
	subs	r6, r0, #0
	beq	.L30
	ldrb	r3, [r6, #28]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L31
.L29:
	movw	r3, #:lower16:iommu_domain_free
	mov	r7, r6
	ldr	r0, [r6, #8]
	movt	r3, #:upper16:iommu_domain_free
	blx	r3
	ldr	r4, [r7, #20]!
	movw	r8, #:lower16:kfree
	cmp	r7, r4
	ldr	r5, [r4]
	movwne	r9, #:lower16:gen_pool_free
	movtne	r8, #:upper16:kfree
	movtne	r9, #:upper16:gen_pool_free
	beq	.L32
.L27:
	ldr	r1, [r4, #8]
	ldr	r2, [r4, #12]
	ldr	r0, [r6, #16]
	blx	r9
	mov	r0, r4
	mov	r4, r5
	blx	r8
	cmp	r7, r5
	ldr	r5, [r5]
	bne	.L27
.L26:
	movw	r3, #:lower16:gen_pool_destroy
	ldr	r0, [r6, #16]
	movt	r3, #:upper16:gen_pool_destroy
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_write_lock
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_write_lock
	blx	r3
	ldr	r2, [r6, #4]
	mov	lr, #256
	ldr	r1, [r6]
	mov	ip, #512
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_write_unlock
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_write_unlock
	str	r2, [r1, #4]
	str	r1, [r2]
	str	lr, [r6]
	str	ip, [r6, #4]
	blx	r3
	mov	r0, r6
	blx	r8
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L31:
	movw	r3, #:lower16:iommu_detach_device
	mov	r1, r4
	movt	r3, #:upper16:iommu_detach_device
	ldr	r0, [r6, #8]
	blx	r3
	b	.L29
.L32:
	movt	r8, #:upper16:kfree
	b	.L26
.L30:
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:warn_slowpath_null
	movt	r0, #:upper16:.LC1
	movt	r3, #:upper16:warn_slowpath_null
	movw	r1, #405
	blx	r3
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
	.fnend
	.size	iovmm_cleanup, .-iovmm_cleanup
	.align	2
	.global	iovmm_activate
	.type	iovmm_activate, %function
iovmm_activate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	bl	find_iovmm
	subs	r4, r0, #0
	beq	.L39
	add	r5, r4, #32
	movw	r3, #:lower16:mutex_lock
	mov	r0, r5
	movt	r3, #:upper16:mutex_lock
	blx	r3
	movw	r3, #:lower16:iommu_attach_device
	ldr	r1, [r4, #12]
	movt	r3, #:upper16:iommu_attach_device
	ldr	r0, [r4, #8]
	blx	r3
	subs	r6, r0, #0
	mov	r0, r5
	moveq	r3, #1
	streqb	r3, [r4, #28]
	movw	r3, #:lower16:mutex_unlock
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	mov	r0, r6
	ldmfd	sp!, {r4, r5, r6, pc}
.L39:
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:warn_slowpath_null
	movt	r0, #:upper16:.LC1
	movt	r3, #:upper16:warn_slowpath_null
	movw	r1, #443
	blx	r3
	mvn	r0, #21
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	iovmm_activate, .-iovmm_activate
	.align	2
	.global	iovmm_deactivate
	.type	iovmm_deactivate, %function
iovmm_deactivate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	bl	find_iovmm
	subs	r4, r0, #0
	beq	.L43
	movw	r3, #:lower16:iommu_detach_device
	ldr	r0, [r4, #8]
	movt	r3, #:upper16:iommu_detach_device
	ldr	r1, [r4, #12]
	blx	r3
	mov	r3, #0
	strb	r3, [r4, #28]
	ldmfd	sp!, {r4, pc}
.L43:
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:warn_slowpath_null
	movt	r0, #:upper16:.LC1
	movt	r3, #:upper16:warn_slowpath_null
	movw	r1, #462
	blx	r3
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	iovmm_deactivate, .-iovmm_deactivate
	.align	2
	.global	iovmm_map
	.type	iovmm_map, %function
iovmm_map:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	subs	r9, r1, #0
	.pad #44
	sub	sp, sp, #44
	mov	r5, r3
	str	r2, [sp, #8]
	beq	.L89
	bl	find_iovmm
	subs	r10, r0, #0
	beq	.L46
	ldr	r2, [r9, #8]
	ldr	r4, [sp, #8]
	cmp	r4, r2
	movwhi	r6, #:lower16:sg_next
	movhi	r0, r9
	movthi	r6, #:upper16:sg_next
	bls	.L48
.L51:
	rsb	r4, r2, r4
	blx	r6
	ldr	r2, [r0, #8]
	cmp	r2, r4
	bcc	.L51
	mov	r9, r0
	str	r4, [sp, #8]
.L48:
	add	r1, r10, #32
	movw	r3, #:lower16:mutex_lock
	mov	r0, r1
	movt	r3, #:upper16:mutex_lock
	str	r1, [sp, #24]
	add	r5, r5, #4080
	blx	r3
	ldr	r2, [r9, #4]
	add	r5, r5, #15
	movw	r1, #:lower16:__pv_phys_offset
	movw	r3, #:lower16:gen_pool_alloc_aligned
	movt	r1, #:upper16:__pv_phys_offset
	movt	r3, #:upper16:gen_pool_alloc_aligned
	add	r4, r2, r4
	movw	r2, #:lower16:mem_map
	ubfx	r4, r4, #0, #12
	movt	r2, #:upper16:mem_map
	add	r5, r5, r4
	str	r2, [sp, #20]
	bic	fp, r5, #4080
	str	r1, [sp, #16]
	bic	fp, fp, #15
	ldr	r0, [r10, #16]
	mov	r2, fp
	mov	r1, fp
	cmp	r2, #1048576
	movcs	r2, #1048576
	str	r4, [sp, #32]
@ 268 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/bitops.h" 1
	clz	r2, r2
@ 0 "" 2
	rsb	r2, r2, #31
	str	fp, [sp, #12]
	blx	r3
	subs	r4, r0, #0
	beq	.L52
	movw	r8, #:lower16:iommu_map
	movw	r2, #:lower16:sg_next
	mov	fp, #0
	movt	r8, #:upper16:iommu_map
	mov	r5, r4
	movt	r2, #:upper16:sg_next
	str	r2, [sp, #28]
	str	r4, [sp, #36]
.L62:
	ldr	r1, [sp, #8]
	ldr	r3, [r9]
	cmp	r1, #0
	ldr	r1, [sp, #20]
	bic	r3, r3, #3
	ldr	r2, [r1]
	ldr	r1, [sp, #16]
	rsb	r3, r2, r3
	mov	r3, r3, asr #2
	ldr	r0, [r1]
	ldr	r1, [r9, #4]
	rsb	r2, r3, r3, asl #3
	add	r2, r2, r2, asl #6
	add	r2, r3, r2, asl #3
	rsb	r2, r2, r2, asl #15
	add	r4, r3, r2, asl #3
	ldrgt	r3, [sp, #8]
	ldr	r2, [r9, #8]
	add	r4, r4, r0, lsr #12
	add	r4, r1, r4, asl #12
	rsbgt	r2, r3, r2
	movgt	r1, #0
	addgt	r4, r4, r3
	strgt	r1, [sp, #8]
	ubfx	r3, r4, #0, #12
	cmp	r3, #0
	addne	r2, r2, r3
	ldr	r3, [sp, #12]
	add	r2, r2, #4080
	bicne	r4, r4, #4080
	add	r2, r2, #15
	bicne	r4, r4, #15
	bic	r2, r2, #4080
	rsb	r6, fp, r3
	bic	r2, r2, #15
	cmp	r2, r6
	movcc	r6, r2
	cmp	r6, #0
	bne	.L59
	b	.L55
.L90:
	cmp	r7, r1
	movge	r7, r1
.L57:
	mov	r2, #0
	ldr	r0, [r10, #8]
	mov	r1, r5
	str	r2, [sp]
	sub	r3, r7, #12
	mov	r2, r4
	blx	r8
	cmp	r0, #0
	bne	.L87
	mov	r1, #1
	mov	r3, r1, asl r7
	subs	r6, r6, r3
	add	r5, r5, r3
	add	r4, r4, r3
	add	fp, fp, r3
	beq	.L55
.L59:
	rsb	r1, r4, #0
	rsb	r2, r5, #0
	and	r1, r1, r4
	and	r2, r2, r5
@ 268 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/bitops.h" 1
	clz	r1, r1
@ 0 "" 2
@ 268 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/bitops.h" 1
	clz	r2, r2
@ 0 "" 2
	rsb	r1, r1, #31
	rsb	r2, r2, #31
	cmp	r1, r2
@ 268 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/bitops.h" 1
	clz	r7, r6
@ 0 "" 2
	rsb	r7, r7, #31
	blt	.L90
	cmp	r7, r2
	movge	r7, r2
	b	.L57
.L87:
	ldr	r4, [sp, #36]
.L58:
	cmp	r4, r5
	bhi	.L66
	ldr	r8, [sp, #12]
	movw	r6, #:lower16:iommu_unmap
	mov	r7, #1
	movt	r6, #:upper16:iommu_unmap
.L69:
	cmp	r5, r4
	rsbne	r2, r4, r5
	moveq	r2, r8
	cmp	r2, #4096
	bcc	.L91
	rsb	r0, r4, #0
	mov	r1, r4
@ 268 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/bitops.h" 1
	clz	r3, r2
@ 0 "" 2
	and	r2, r0, r4
	rsb	r3, r3, #31
@ 268 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/bitops.h" 1
	clz	r2, r2
@ 0 "" 2
	rsb	r2, r2, #31
	ldr	r0, [r10, #8]
	cmp	r2, r3
	movge	r2, r3
	add	r4, r4, r7, asl r2
	sub	r2, r2, #12
	blx	r6
	cmp	r5, r4
	bcs	.L69
.L66:
	movw	r3, #:lower16:gen_pool_free
	ldr	r0, [r10, #16]
	mov	r1, r4
	ldr	r2, [sp, #12]
	movt	r3, #:upper16:gen_pool_free
	blx	r3
.L52:
	movw	r3, #:lower16:mutex_unlock
	ldr	r0, [sp, #24]
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	mov	r0, #0
.L86:
	add	sp, sp, #44
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L55:
	mov	r0, r9
	ldr	r2, [sp, #28]
	blx	r2
	subs	r9, r0, #0
	beq	.L60
	ldr	r3, [sp, #12]
	cmp	fp, r3
	bcc	.L62
	ldr	r2, [sp, #12]
	ldr	r4, [sp, #36]
	cmp	r2, fp
	bcc	.L70
.L71:
	movw	r3, #:lower16:kmalloc_caches
	movt	r3, #:upper16:kmalloc_caches
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L72
	movw	r3, #:lower16:kmem_cache_alloc_trace
	mov	r1, #208
	movt	r3, #:upper16:kmem_cache_alloc_trace
	mov	r2, #16
	blx	r3
	subs	r6, r0, #0
	beq	.L58
.L64:
	ldr	r2, [sp, #32]
	movw	r3, #:lower16:mutex_unlock
	ldr	r1, [sp, #12]
	movt	r3, #:upper16:mutex_unlock
	str	r6, [r6]
	add	r4, r2, r4
	mov	r2, r10
	str	r6, [r6, #4]
	str	r4, [r6, #8]
	str	r1, [r6, #12]
	ldr	r1, [r2, #20]!
	ldr	r0, [sp, #24]
	str	r6, [r1, #4]
	stmia	r6, {r1, r2}
	str	r6, [r10, #20]
	blx	r3
	ldr	r0, [r6, #8]
	b	.L86
.L60:
	ldr	r1, [sp, #12]
	ldr	r4, [sp, #36]
	cmp	r1, fp
	bcc	.L70
	bhi	.L58
	b	.L71
.L91:
@ 587 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/s5p_iovmm.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/s5p_iovmm.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 587, 0
.popsection
@ 0 "" 2
.L72:
	mov	r6, #16
	b	.L64
.L70:
@ 546 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/s5p_iovmm.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/s5p_iovmm.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 546, 0
.popsection
@ 0 "" 2
.L46:
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:warn_slowpath_null
	movt	r0, #:upper16:.LC1
	movt	r3, #:upper16:warn_slowpath_null
	movw	r1, #486
	blx	r3
	mov	r0, r10
	b	.L86
.L89:
@ 483 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/s5p_iovmm.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/s5p_iovmm.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 483, 0
.popsection
@ 0 "" 2
	.fnend
	.size	iovmm_map, .-iovmm_map
	.align	2
	.global	iovmm_unmap
	.type	iovmm_unmap, %function
iovmm_unmap:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r5, r1
	bl	find_iovmm
	subs	r6, r0, #0
	beq	.L104
	add	r9, r6, #32
	movw	r3, #:lower16:mutex_lock
	mov	r0, r9
	movt	r3, #:upper16:mutex_lock
	blx	r3
	mov	r2, r6
	ldr	r4, [r2, #20]!
	cmp	r4, r2
	bne	.L96
	b	.L97
.L105:
	ldr	r4, [r4]
	cmp	r4, r2
	beq	.L97
.L96:
	ldr	r3, [r4, #8]
	cmp	r5, r3
	bne	.L105
	ldr	r1, [r4, #8]
	movw	r3, #:lower16:gen_pool_free
	movt	r3, #:upper16:gen_pool_free
	ldr	r2, [r4, #12]
	bic	r1, r1, #4080
	bic	r1, r1, #15
	str	r1, [r4, #8]
	ldr	r0, [r6, #16]
	blx	r3
	ldr	r3, [r4, #4]
	mov	r0, #256
	ldr	r2, [r4]
	mov	r1, #512
	str	r3, [r2, #4]
	str	r2, [r3]
	ldr	r3, [r4, #12]
	stmia	r4, {r0, r1}
	cmp	r3, #0
	beq	.L99
	ldr	r2, [r4, #8]
	movw	r7, #:lower16:iommu_unmap
	movt	r7, #:upper16:iommu_unmap
	mov	r8, #1
.L103:
	rsb	r5, r2, #0
	mov	r1, r2
	and	r5, r5, r2
	ldr	r0, [r6, #8]
@ 268 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/bitops.h" 1
	clz	r3, r3
@ 0 "" 2
@ 268 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/bitops.h" 1
	clz	r5, r5
@ 0 "" 2
	rsb	r3, r3, #31
	rsb	r5, r5, #31
	cmp	r5, r3
	movge	r5, r3
	sub	r2, r5, #12
	mov	r5, r8, asl r5
	blx	r7
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #8]
	rsb	r3, r5, r3
	cmp	r3, #0
	add	r5, r5, r2
	mov	r2, r5
	str	r3, [r4, #12]
	str	r5, [r4, #8]
	bne	.L103
.L99:
	movw	r3, #:lower16:kfree
	mov	r0, r4
	movt	r3, #:upper16:kfree
	blx	r3
.L100:
	movw	r3, #:lower16:mutex_unlock
	mov	r0, r9
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L97:
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:warn_slowpath_null
	movt	r0, #:upper16:.LC1
	movt	r3, #:upper16:warn_slowpath_null
	movw	r1, #617
	blx	r3
	b	.L100
.L104:
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:warn_slowpath_null
	movt	r0, #:upper16:.LC1
	movt	r3, #:upper16:warn_slowpath_null
	movw	r1, #611
	blx	r3
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
	.fnend
	.size	iovmm_unmap, .-iovmm_unmap
	.section	.initcall3.init,"aw",%progbits
	.align	2
	.type	__initcall_s5p_iovmm_init3, %object
	.size	__initcall_s5p_iovmm_init3, 4
__initcall_s5p_iovmm_init3:
	.word	s5p_iovmm_init
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	s5p_iovmm_list, %object
	.size	s5p_iovmm_list, 8
s5p_iovmm_list:
	.word	s5p_iovmm_list
	.word	s5p_iovmm_list
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"&vmm->lock\000"
	.space	1
.LC1:
	.ascii	"/media/system1/root/CM14/kernel/samsung/smdk4412/ar"
	.ascii	"ch/arm/plat-s5p/s5p_iovmm.c\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	iovmm_list_lock, %object
	.size	iovmm_list_lock, 8
iovmm_list_lock:
	.space	8
	.type	__key.15561, %object
	.size	__key.15561, 0
__key.15561:
	.ident	"GCC: (GNU) 4.8"
