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
	.file	"clock-domain.c"
	.text
	.align	2
	.global	clock_domain_enabled
	.type	clock_domain_enabled, %function
clock_domain_enabled:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r1, #:lower16:.LANCHOR0
	str	lr, [sp, #-4]!
	.save {lr}
	movt	r1, #:upper16:.LANCHOR0
	.pad #12
	sub	sp, sp, #12
	ldr	r3, [r1]
	str	r3, [sp, #4]
	ldr	r3, [sp, #4]
	cmp	r3, r1
	bne	.L6
	b	.L7
.L14:
	ldr	r3, [r3]
	str	r3, [sp, #4]
	ldr	r3, [sp, #4]
	cmp	r3, r1
	beq	.L7
.L6:
	ldr	r2, [r3, #8]
	tst	r0, r2
	beq	.L14
	cmn	r3, #4096
	bhi	.L7
	ldr	r2, [r3, #12]!
	str	r2, [sp, #4]
	ldr	r2, [sp, #4]
	cmp	r2, r3
	bne	.L8
	b	.L12
.L10:
	ldr	r2, [r2]
	str	r2, [sp, #4]
	ldr	r2, [sp, #4]
	cmp	r2, r3
	beq	.L12
.L8:
	ldr	r1, [r2, #8]
	ldr	r1, [r1, #28]
	cmp	r1, #0
	beq	.L10
	mvn	r0, #21
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
.L7:
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	mvn	r0, #21
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
.L12:
	mov	r0, #0
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
	.fnend
	.size	clock_domain_enabled, .-clock_domain_enabled
	.align	2
	.global	clock_add_domain
	.type	clock_add_domain, %function
clock_add_domain:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movw	r7, #:lower16:kmalloc_caches
	movt	r7, #:upper16:kmalloc_caches
	mov	r5, r0
	.pad #8
	sub	sp, sp, #8
	mov	r8, r1
	ldr	r0, [r7, #24]
	cmp	r0, #0
	beq	.L27
	movw	r3, #:lower16:kmem_cache_alloc_trace
	movw	r1, #32976
	movt	r3, #:upper16:kmem_cache_alloc_trace
	mov	r2, #12
	blx	r3
	subs	r6, r0, #0
	beq	.L30
.L16:
	movw	r4, #:lower16:.LANCHOR0
	movw	r3, #:lower16:mutex_lock
	movt	r4, #:upper16:.LANCHOR0
	movt	r3, #:upper16:mutex_lock
	add	r0, r4, #8
	blx	r3
	ldr	r1, [r4]
	str	r1, [sp, #4]
	ldr	r3, [sp, #4]
	cmp	r3, r4
	bne	.L23
	b	.L24
.L31:
	ldr	r3, [r3]
	str	r3, [sp, #4]
	ldr	r3, [sp, #4]
	cmp	r3, r4
	beq	.L24
.L23:
	ldr	r2, [r3, #8]
	tst	r5, r2
	beq	.L31
	cmn	r3, #4096
	bhi	.L24
	add	r2, r3, #12
.L25:
	str	r8, [r6, #8]
	ldr	r1, [r3, #12]
	stmia	r6, {r1, r2}
@ 38 "/media/system1/root/CM14/kernel/samsung/smdk4412/include/linux/rculist.h" 1
	dmb
@ 0 "" 2
	movw	r2, #:lower16:mutex_unlock
	str	r6, [r3, #12]
	ldr	r0, .L33
	movt	r2, #:upper16:mutex_unlock
	str	r6, [r1, #4]
	blx	r2
	mov	r0, #0
.L17:
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L24:
	ldr	r0, [r7, #24]
	cmp	r0, #0
	beq	.L32
	movw	r3, #:lower16:kmem_cache_alloc_trace
	movw	r1, #32976
	movt	r3, #:upper16:kmem_cache_alloc_trace
	mov	r2, #20
	blx	r3
	subs	r3, r0, #0
	beq	.L26
	ldr	r1, [r4]
	b	.L19
.L27:
	mov	r6, #16
	b	.L16
.L32:
	mov	r3, #16
.L19:
	add	r2, r3, #12
	stmia	r3, {r1, r4, r5}
	str	r2, [r3, #12]
	str	r2, [r3, #16]
@ 38 "/media/system1/root/CM14/kernel/samsung/smdk4412/include/linux/rculist.h" 1
	dmb
@ 0 "" 2
	movw	r0, #:lower16:.LANCHOR0
	str	r3, [r1, #4]
	movt	r0, #:upper16:.LANCHOR0
	str	r3, [r0]
	b	.L25
.L30:
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC1
	movt	r3, #:upper16:printk
	blx	r3
	mvn	r0, #11
	b	.L17
.L26:
	movw	r3, #:lower16:mutex_unlock
	ldr	r0, .L33
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	movw	r3, #:lower16:kfree
	mov	r0, r6
	movt	r3, #:upper16:kfree
	blx	r3
	movw	r0, #:lower16:.LC2
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC2
	movt	r3, #:upper16:printk
	blx	r3
	mvn	r0, #11
	b	.L17
.L34:
	.align	2
.L33:
	.word	.LANCHOR0+8
	.fnend
	.size	clock_add_domain, .-clock_add_domain
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	clock_domain_list, %object
	.size	clock_domain_list, 8
clock_domain_list:
	.word	clock_domain_list
	.word	clock_domain_list
	.type	clock_domain_list_lock, %object
	.size	clock_domain_list_lock, 24
clock_domain_list_lock:
	.word	1
	.word	0
	.space	4
	.word	clock_domain_list_lock+12
	.word	clock_domain_list_lock+12
	.space	4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>Unable to find Clock Domain\012\000"
.LC1:
	.ascii	"<3>Unable to create new Clock node\012\000"
.LC2:
	.ascii	"<3>Unable to create Clock Domain structure\012\000"
	.ident	"GCC: (GNU) 4.8"
