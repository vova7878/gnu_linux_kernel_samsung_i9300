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
	.file	"secmem-allocdev.c"

	.text
	.align	2
	.global	secmem_crypto_register
	.type	secmem_crypto_register, %function
secmem_crypto_register:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	str	r0, [r3]
	bx	lr
	.fnend
	.size	secmem_crypto_register, .-secmem_crypto_register
	.align	2
	.global	secmem_crypto_deregister
	.type	secmem_crypto_deregister, %function
secmem_crypto_deregister:
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
	.size	secmem_crypto_deregister, .-secmem_crypto_deregister
	.align	2
	.type	secmem_mmap, %function
secmem_mmap:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r0, r1
	ldr	r1, [r1, #4]
	.pad #8
	sub	sp, sp, #8
	ldr	r2, [r0, #72]
	ubfx	r3, r1, #0, #12
	ldr	ip, [r0, #8]
	cmp	r3, #0
	mov	r5, r2, asl #12
	rsb	r3, r1, ip
	bne	.L14
	ubfx	ip, ip, #0, #12
	cmp	ip, #0
	bne	.L15
	movw	r4, #:lower16:.LANCHOR0
	ldr	lr, [r0, #24]
	movt	r4, #:upper16:.LANCHOR0
	ldr	r6, [r0, #20]
	ldr	ip, [r4, #4]!
	orr	lr, lr, #524288
	bic	r6, r6, #60
	str	lr, [r0, #24]
	cmp	ip, r4
	str	r6, [r0, #20]
	bne	.L9
	b	.L6
.L7:
	ldr	ip, [ip]
	cmp	ip, r4
	beq	.L6
.L9:
	ldr	lr, [ip, #8]
	cmp	r5, lr
	bne	.L7
	ldr	lr, [ip, #12]
	cmp	r3, lr
	bhi	.L7
	movw	ip, #:lower16:remap_pfn_range
	str	r6, [sp]
	movt	ip, #:upper16:remap_pfn_range
	blx	ip
	cmp	r0, #0
	bne	.L11
.L12:
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, pc}
.L6:
	movw	r0, #:lower16:.LC1
	movw	r1, #:lower16:.LANCHOR1
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR1
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC1
	blx	r3
	mvn	r0, #10
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, pc}
.L14:
@ 163 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/secmem-allocdev.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/secmem-allocdev.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 163, 0
.popsection
@ 0 "" 2
.L11:
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LANCHOR1
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC0
	movt	r1, #:upper16:.LANCHOR1
	movt	r3, #:upper16:printk
	blx	r3
	mvn	r0, #10
	b	.L12
.L15:
@ 164 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/secmem-allocdev.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/secmem-allocdev.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 164, 0
.popsection
@ 0 "" 2
	.fnend
	.size	secmem_mmap, .-secmem_mmap
	.align	2
	.type	secmem_ioctl, %function
secmem_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #21254
	stmfd	sp!, {r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	movt	r3, 49156
	.pad #36
	sub	sp, sp, #36
	cmp	r1, r3
	mov	r4, r2
	beq	.L18
	bls	.L101
	movw	r3, #21257
	movt	r3, 49156
	cmp	r1, r3
	beq	.L25
	bls	.L102
	movw	r3, #21249
	movt	r3, 49164
	cmp	r1, r3
	beq	.L28
	movw	r3, #21258
	movt	r3, 49164
	cmp	r1, r3
	bne	.L80
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	ldr	r1, [r3, #44]
	cmp	r1, #0
	beq	.L76
	movw	r2, #:lower16:.LC11
	movw	r3, #:lower16:__cma_info
	movt	r2, #:upper16:.LC11
	movt	r3, #:upper16:__cma_info
	add	r0, sp, #12
	blx	r3
	cmp	r0, #0
	bne	.L76
	mov	r2, sp
	ldr	r1, [sp, #12]
	bic	r3, r2, #8128
	ldr	r2, [sp, #20]
	bic	r3, r3, #63
	ldr	r3, [r3, #8]
	stmib	sp, {r1, r2}
@ 448 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/uaccess.h" 1
	adds r2, r4, #12; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	cmp	r3, #0
	bne	.L98
	movw	r3, #:lower16:__copy_to_user
	mov	r0, r4
	movt	r3, #:upper16:__copy_to_user
	mov	r1, sp
	mov	r2, #12
	blx	r3
	cmp	r0, #0
	beq	.L94
	b	.L98
.L101:
	movw	r3, #21253
	movt	r3, 32772
	cmp	r1, r3
	beq	.L20
	bls	.L103
	movw	r3, #21250
	movt	r3, 49156
	cmp	r1, r3
	beq	.L23
	movw	r3, #21251
	movt	r3, 49156
	cmp	r1, r3
	bne	.L80
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r3, [r3, #8]
@ 448 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/uaccess.h" 1
	adds r2, r4, #4; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	cmp	r3, #0
	beq	.L40
.L98:
	mvn	r0, #13
.L94:
	add	sp, sp, #36
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L28:
	movw	r6, #:lower16:.LANCHOR2
	movt	r6, #:upper16:.LANCHOR2
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L82
	mov	r3, r6
	mov	r5, #0
.L32:
	ldr	r2, [r3, #4]!
	add	r5, r5, #1
	cmp	r2, #0
	bne	.L32
	cmp	r5, #0
	beq	.L82
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r3, [r3, #8]
@ 439 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/uaccess.h" 1
	adds r2, r4, #12; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	cmp	r3, #0
	bne	.L33
	movw	r3, #:lower16:__copy_from_user
	mov	r0, sp
	movt	r3, #:upper16:__copy_from_user
	mov	r1, r4
	mov	r2, #12
	blx	r3
	cmp	r0, #0
	bne	.L98
	ldr	r3, [sp]
	cmp	r3, #0
	blt	.L76
	cmp	r3, r5
	mvnge	r3, #0
	strge	r3, [sp]
	bge	.L37
	movw	r1, #:lower16:.LANCHOR0
	ldr	r2, [r6, r3, asl #2]
	movt	r1, #:upper16:.LANCHOR0
	ldr	r1, [r1, #44]
	cmp	r1, #0
	beq	.L76
	movw	r3, #:lower16:__cma_info
	add	r0, sp, #12
	movt	r3, #:upper16:__cma_info
	blx	r3
	cmp	r0, #0
	bne	.L76
	ldr	r2, [sp, #12]
	ldr	r3, [sp, #20]
	stmib	sp, {r2, r3}
.L37:
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r3, [r3, #8]
@ 448 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/uaccess.h" 1
	adds r2, r4, #12; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	cmp	r3, #0
	movweq	r3, #:lower16:__copy_to_user
	moveq	r0, r4
	moveq	r1, sp
	bne	.L98
.L100:
	movt	r3, #:upper16:__copy_to_user
	mov	r2, #12
	blx	r3
	cmp	r0, #0
	beq	.L94
	b	.L98
.L23:
	mov	r2, sp
	bic	r3, r2, #8128
	mov	r2, #0
	bic	r3, r3, #63
	str	r2, [sp, #12]
	ldr	r3, [r3, #8]
@ 439 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/uaccess.h" 1
	adds r2, r4, #4; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	cmp	r3, #0
	bne	.L42
	movw	r3, #:lower16:__copy_from_user
	mov	r1, r4
	movt	r3, #:upper16:__copy_from_user
	add	r0, sp, #12
	mov	r2, #4
	blx	r3
	cmp	r0, #0
	bne	.L98
	ldr	r2, [sp, #12]
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	cmp	r2, #0
	beq	.L45
	ldrb	r2, [r3, #56]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L46
	ldr	r1, [r3, #44]
	mov	r0, #1
	movw	r2, #:lower16:pm_runtime_forbid
	strb	r0, [r3, #56]
	movt	r2, #:upper16:pm_runtime_forbid
	ldr	r0, [r1]
	blx	r2
	b	.L99
.L102:
	movw	r3, #21255
	movt	r3, 49156
	cmp	r1, r3
	bne	.L80
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r3, [r3, #8]
@ 439 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/uaccess.h" 1
	adds r2, r4, #12; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	cmp	r3, #0
	bne	.L64
	movw	r3, #:lower16:__copy_from_user
	mov	r1, r4
	movt	r3, #:upper16:__copy_from_user
	add	r0, sp, #12
	mov	r2, #12
	blx	r3
	cmp	r0, #0
	bne	.L98
	ldr	r1, [sp, #12]
	cmp	r1, #0
	beq	.L104
	movw	r0, #:lower16:.LC9
	movw	r4, #:lower16:printk
	ldr	r1, [sp, #20]
	movt	r0, #:upper16:.LC9
	movt	r4, #:upper16:printk
	blx	r4
	movw	r1, #:lower16:.LANCHOR0
	ldr	r0, [sp, #16]
	movt	r1, #:upper16:.LANCHOR0
	ldr	ip, [sp, #20]
	ldr	r3, [r1, #4]!
	cmp	r3, r1
	bne	.L71
	b	.L68
.L69:
	ldr	r3, [r3]
	cmp	r3, r1
	beq	.L68
.L71:
	ldr	r2, [r3, #8]
	cmp	r0, r2
	bne	.L69
	ldr	r2, [r3, #12]
	cmp	ip, r2
	bhi	.L69
	ldr	r1, [r3]
	mov	r0, r3
	ldr	r2, [r3, #4]
	movw	r4, #:lower16:kfree
	movt	r4, #:upper16:kfree
	str	r1, [r2]
	ldmia	r3, {r2, r3}
	str	r3, [r2, #4]
	blx	r4
	ldr	r0, [sp, #12]
	blx	r4
	b	.L99
.L103:
	movw	r3, #21252
	movt	r3, 32772
	cmp	r1, r3
	bne	.L80
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	ldr	r3, [r4]
	cmp	r3, #0
	movwne	r5, #:lower16:printk
	movne	r6, #100
	movtne	r5, #:upper16:printk
	beq	.L99
.L51:
	ldr	r3, [r3]
	blx	r3
	subs	r7, r0, #0
	bne	.L105
.L99:
	mov	r0, #0
	add	sp, sp, #36
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L20:
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L99
	ldr	r3, [r3, #4]
	blx	r3
	b	.L94
.L18:
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r3, [r3, #8]
@ 439 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/uaccess.h" 1
	adds r2, r4, #12; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	cmp	r3, #0
	bne	.L64
	movw	r3, #:lower16:__copy_from_user
	add	r0, sp, #12
	movt	r3, #:upper16:__copy_from_user
	mov	r1, r4
	mov	r2, #12
	blx	r3
	cmp	r0, #0
	bne	.L98
	ldr	r1, [sp, #20]
	cmp	r1, #0
	beq	.L106
	movw	r0, #:lower16:.LC6
	movw	r5, #:lower16:printk
	movt	r0, #:upper16:.LC6
	movt	r5, #:upper16:printk
	blx	r5
	movw	r3, #:lower16:__kmalloc
	ldr	r0, [sp, #20]
	movt	r3, #:upper16:__kmalloc
	mov	r1, #209
	blx	r3
	cmp	r0, #0
	str	r0, [sp, #12]
	beq	.L107
	cmn	r0, #1073741825
	ldr	r2, [sp, #20]
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	r5, r0, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	str	r5, [sp, #16]
	bls	.L57
	movw	r3, #:lower16:high_memory
	movt	r3, #:upper16:high_memory
	ldr	r1, [r3]
	cmp	r0, r1
	bcs	.L57
	sub	r3, r2, #1
	add	r3, r0, r3
	cmn	r3, #1073741825
	bls	.L59
	cmp	r1, r3
	bls	.L59
	movw	r1, #:lower16:__pv_phys_offset
	movw	r3, #:lower16:mem_map
	movt	r1, #:upper16:__pv_phys_offset
	movt	r3, #:upper16:mem_map
	ldr	lr, [r1]
	ubfx	r1, r0, #0, #12
	ldr	r6, [r3]
	movw	ip, #:lower16:___dma_page_cpu_to_dev
	mov	r3, #1
	movt	ip, #:upper16:___dma_page_cpu_to_dev
	mov	lr, lr, lsr #12
	rsb	lr, lr, r5, lsr #12
	add	r0, lr, lr, asl #3
	add	r0, r6, r0, asl #2
	blx	ip
	movw	r3, #:lower16:kmalloc_caches
	ldr	r6, [sp, #16]
	movt	r3, #:upper16:kmalloc_caches
	ldr	r5, [sp, #20]
	ldr	r0, [r3, #24]
	cmp	r0, #0
	moveq	r0, #16
	beq	.L61
	movw	r3, #:lower16:kmem_cache_alloc_trace
	movw	r1, #32976
	movt	r3, #:upper16:kmem_cache_alloc_trace
	mov	r2, #16
	blx	r3
.L61:
	movw	r2, #:lower16:.LANCHOR0
	mov	r3, sp
	movt	r2, #:upper16:.LANCHOR0
	bic	ip, r3, #8128
	mov	r3, r2
	bic	ip, ip, #63
	ldr	r1, [r3, #4]!
	str	r6, [r0, #8]
	str	r5, [r0, #12]
	str	r0, [r1, #4]
	stmia	r0, {r1, r3}
	str	r0, [r2, #4]
	ldr	r3, [ip, #8]
@ 448 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/uaccess.h" 1
	adds r2, r4, #12; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	cmp	r3, #0
	bne	.L98
	movw	r3, #:lower16:__copy_to_user
	mov	r0, r4
	add	r1, sp, #12
	b	.L100
.L64:
	movw	r3, #:lower16:__memzero
	add	r0, sp, #12
	movt	r3, #:upper16:__memzero
	mov	r1, #12
	blx	r3
	b	.L98
.L25:
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	ldr	r1, [r3, #44]
	cmp	r1, #0
	beq	.L76
	movw	r2, #:lower16:.LC10
	movw	r3, #:lower16:__cma_info
	movt	r2, #:upper16:.LC10
	movt	r3, #:upper16:__cma_info
	add	r0, sp, #12
	blx	r3
	cmp	r0, #0
	bne	.L76
	movw	r4, #48918
	movw	ip, #13122
	movw	r1, #62709
	movw	r2, #21271
	movt	r4, 5069
	movt	ip, 35712
	movt	r1, 24199
	movt	r2, 15312
	ldr	r3, [sp, #12]
@ 182 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	sub	r3, r3, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	stmia	r3, {r4, ip}
	str	r1, [r3, #8]
	str	r2, [r3, #12]
	b	.L94
.L80:
	mvn	r0, #24
	add	sp, sp, #36
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L76:
	mvn	r0, #21
	b	.L94
.L68:
	movw	r0, #:lower16:.LC12
	ldr	r1, .L109
	movt	r0, #:upper16:.LC12
	blx	r4
	b	.L98
.L42:
	movw	r3, #:lower16:__memzero
	add	r0, sp, #12
	movt	r3, #:upper16:__memzero
	mov	r1, #4
	blx	r3
	b	.L98
.L45:
	ldrb	r1, [r3, #56]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L48
	ldr	r0, [r3, #44]
	movw	r1, #:lower16:pm_runtime_allow
	strb	r2, [r3, #56]
	movt	r1, #:upper16:pm_runtime_allow
	ldr	r0, [r0]
	blx	r1
	b	.L99
.L33:
	movw	r3, #:lower16:__memzero
	mov	r0, sp
	movt	r3, #:upper16:__memzero
	mov	r1, #12
	blx	r3
	b	.L98
.L82:
	mvn	r0, #11
	b	.L94
.L40:
	movw	r3, #:lower16:__copy_to_user
	mov	r0, r4
	movt	r3, #:upper16:__copy_to_user
	ldr	r1, .L109+4
	mov	r2, #4
	blx	r3
	cmp	r0, #0
	beq	.L94
	b	.L98
.L106:
	movw	r0, #:lower16:.LC5
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC5
	blx	r3
	b	.L98
.L105:
	movw	r0, #:lower16:.LC4
	ldr	r1, .L109
	movt	r0, #:upper16:.LC4
	blx	r5
	subs	r6, r6, #1
	bne	.L108
	mov	r0, r7
	b	.L94
.L57:
@ 339 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/dma-mapping.h" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/dma-mapping.h"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 339, 0
.popsection
@ 0 "" 2
.L107:
	movw	r0, #:lower16:.LC7
	ldr	r1, .L109
	ldr	r2, [sp, #20]
	movt	r0, #:upper16:.LC7
	blx	r5
	b	.L98
.L108:
	ldr	r3, [r4]
	b	.L51
.L48:
	movw	r0, #:lower16:.LC3
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L109
	movt	r0, #:upper16:.LC3
	blx	r3
	b	.L99
.L104:
	movw	r0, #:lower16:.LC8
	movw	r3, #:lower16:panic
	movt	r0, #:upper16:.LC8
	movt	r3, #:upper16:panic
	blx	r3
.L46:
	movw	r0, #:lower16:.LC2
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L109
	movt	r0, #:upper16:.LC2
	blx	r3
	b	.L99
.L59:
@ 340 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/dma-mapping.h" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/dma-mapping.h"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 340, 0
.popsection
@ 0 "" 2
.L110:
	.align	2
.L109:
	.word	.LANCHOR1+12
	.word	.LANCHOR0+56
	.fnend
	.size	secmem_ioctl, .-secmem_ioctl
	.align	2
	.type	secmem_init, %function
secmem_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r4, #:lower16:.LANCHOR0
	ldr	r1, .L113
	movt	r4, #:upper16:.LANCHOR0
	movw	r2, #:lower16:.LC13
	movw	r3, #:lower16:misc_register
	mov	ip, #255
	movt	r2, #:upper16:.LC13
	add	r0, r4, #20
	movt	r3, #:upper16:misc_register
	str	ip, [r4, #20]
	str	r2, [r4, #24]
	str	r1, [r4, #28]
	blx	r3
	subs	r5, r0, #0
	bne	.L112
	movw	r2, #:lower16:pm_runtime_enable
	mov	r3, r4
	ldr	r0, [r4, #44]
	movt	r2, #:upper16:pm_runtime_enable
	str	r5, [r3], #4
	str	r5, [r4, #12]
	str	r5, [r4, #16]
	str	r3, [r4, #4]
	str	r3, [r4, #8]
	blx	r2
.L112:
	mov	r0, r5
	ldmfd	sp!, {r3, r4, r5, pc}
.L114:
	.align	2
.L113:
	.word	.LANCHOR2+24
	.fnend
	.size	secmem_init, .-secmem_init
	.global	g_fd_head
	.global	crypto_driver
	.global	secmem
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.20583, %object
	.size	__func__.20583, 12
__func__.20583:
	.ascii	"secmem_mmap\000"
	.type	__func__.20601, %object
	.size	__func__.20601, 13
__func__.20601:
	.ascii	"secmem_ioctl\000"
	.section	___ksymtab+secmem_crypto_deregister,"a",%progbits
	.align	2
	.type	__ksymtab_secmem_crypto_deregister, %object
	.size	__ksymtab_secmem_crypto_deregister, 8
__ksymtab_secmem_crypto_deregister:
	.word	secmem_crypto_deregister
	.word	__kstrtab_secmem_crypto_deregister
	.section	___ksymtab+secmem_crypto_register,"a",%progbits
	.align	2
	.type	__ksymtab_secmem_crypto_register, %object
	.size	__ksymtab_secmem_crypto_register, 8
__ksymtab_secmem_crypto_register:
	.word	secmem_crypto_register
	.word	__kstrtab_secmem_crypto_register
	.section	.initcall6.init,"aw",%progbits
	.align	2
	.type	__initcall_secmem_init6, %object
	.size	__initcall_secmem_init6, 4
__initcall_secmem_init6:
	.word	secmem_init
	.data
	.align	2
	.set	.LANCHOR2,. + 0
	.type	secmem_info, %object
	.size	secmem_info, 24
secmem_info:
	.word	.LC14
	.word	.LC15
	.word	.LC10
	.word	.LC16
	.word	.LC17
	.word	0
	.type	secmem_fops, %object
	.size	secmem_fops, 104
secmem_fops:
	.space	32
	.word	secmem_ioctl
	.space	4
	.word	secmem_mmap
	.space	60
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>%s : remap_pfn_range() failed!\012\000"
	.space	1
.LC1:
	.ascii	"<3>%s : Fail mmap due to Invalid address\012\000"
	.space	2
.LC2:
	.ascii	"<3>%s: DRM is already on\012\000"
	.space	2
.LC3:
	.ascii	"<3>%s: DRM is already off\012\000"
	.space	1
.LC4:
	.ascii	"<3>%s : Retry to get sync lock.\012\000"
	.space	3
.LC5:
	.ascii	"<3>Get secmem address size error. [size : %ld]\012\000"
.LC6:
	.ascii	"<6>SECMEM_IOC_GET_ADDR: size:%lu\012\000"
	.space	2
.LC7:
	.ascii	"<3>%s: Get memory address failed.  [size : %ld]\012"
	.ascii	"\000"
	.space	3
.LC8:
	.ascii	"SECMEM_IOC_RELEASE_ADDR: Get secmem address error ["
	.ascii	"address : %x]\012\000"
	.space	2
.LC9:
	.ascii	"<6>SECMEM_IOC_RELEASE_ADDR: size:%lu\012\000"
	.space	2
.LC10:
	.ascii	"mfc-shm\000"
.LC11:
	.ascii	"fimc0\000"
	.space	2
.LC12:
	.ascii	"<3>%s: Release memory failed.\012\000"
	.space	1
.LC13:
	.ascii	"s5p-smem\000"
	.space	3
.LC14:
	.ascii	"mfc\000"
.LC15:
	.ascii	"fimc\000"
	.space	3
.LC16:
	.ascii	"sectbl\000"
	.space	1
.LC17:
	.ascii	"fimd\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	crypto_driver, %object
	.size	crypto_driver, 4
crypto_driver:
	.space	4
	.type	g_fd_head, %object
	.size	g_fd_head, 16
g_fd_head:
	.space	16
	.type	secmem, %object
	.size	secmem, 36
secmem:
	.space	36
	.type	drm_onoff, %object
	.size	drm_onoff, 1
drm_onoff:
	.space	1
	.section	__ksymtab_strings,"a",%progbits
	.type	__kstrtab_secmem_crypto_deregister, %object
	.size	__kstrtab_secmem_crypto_deregister, 25
__kstrtab_secmem_crypto_deregister:
	.ascii	"secmem_crypto_deregister\000"
	.type	__kstrtab_secmem_crypto_register, %object
	.size	__kstrtab_secmem_crypto_register, 23
__kstrtab_secmem_crypto_register:
	.ascii	"secmem_crypto_register\000"
	.ident	"GCC: (GNU) 4.8"
