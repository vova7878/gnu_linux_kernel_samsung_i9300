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
	.file	"dev.c"
	.text
	.align	2
	.type	find_device_domain, %function
find_device_domain:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	movw	r3, #:lower16:mutex_lock
	mov	r5, r0
	movt	r3, #:upper16:mutex_lock
	mov	r0, r4
	blx	r3
	mov	r2, r4
	ldr	r4, [r2, #24]!
	cmp	r4, r2
	bne	.L4
	b	.L5
.L7:
	ldr	r4, [r4]
	cmp	r4, r2
	beq	.L5
.L4:
	ldr	r3, [r4, #8]
	cmp	r3, r5
	bne	.L7
.L2:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:mutex_unlock
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	mov	r0, r4
	ldmfd	sp!, {r3, r4, r5, pc}
.L5:
	mvn	r4, #18
	b	.L2
	.fnend
	.size	find_device_domain, .-find_device_domain
	.align	2
	.global	dev_add
	.type	dev_add, %function
dev_add:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #0
	cmpne	r0, #0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r4, r0
	mov	r6, r1
	movne	r7, #0
	moveq	r7, #1
	beq	.L10
	movw	r5, #:lower16:.LANCHOR0
	movw	r3, #:lower16:mutex_lock
	movt	r5, #:upper16:.LANCHOR0
	movt	r3, #:upper16:mutex_lock
	mov	r0, r5
	blx	r3
	mov	r2, r5
	add	ip, r4, #12
	ldr	r1, [r2, #24]!
	movw	r3, #:lower16:mutex_unlock
	str	r6, [r4, #8]
	mov	r0, r5
	str	ip, [r4, #12]
	movt	r3, #:upper16:mutex_unlock
	str	ip, [r4, #16]
	str	r4, [r1, #4]
	stmia	r4, {r1, r2}
	str	r4, [r5, #24]
	blx	r3
	mov	r0, r7
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L10:
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
	.fnend
	.size	dev_add, .-dev_add
	.align	2
	.global	dev_get
	.type	dev_get, %function
dev_get:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	movw	r2, #:lower16:mutex_lock
	mov	r5, r3
	mov	r7, r0
	movt	r2, #:upper16:mutex_lock
	mov	r0, r3
	blx	r2
	ldr	r4, [r5, #24]!
	cmp	r4, r5
	beq	.L12
	movw	r6, #:lower16:strcmp
	movt	r6, #:upper16:strcmp
	b	.L15
.L17:
	ldr	r4, [r4]
	cmp	r4, r5
	beq	.L12
.L15:
	ldr	r3, [r4, #8]
	mov	r0, r7
	ldr	r1, [r3, #44]
	cmp	r1, #0
	ldreq	r1, [r3, #8]
	blx	r6
	cmp	r0, #0
	bne	.L17
.L14:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:mutex_unlock
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	ldr	r0, [r4, #8]
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L12:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:mutex_unlock
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	mvn	r0, #18
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
	.fnend
	.size	dev_get, .-dev_get
	.align	2
	.global	dev_put
	.type	dev_put, %function
dev_put:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	dev_put, .-dev_put
	.align	2
	.global	dev_lock
	.type	dev_lock, %function
dev_lock:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r1
	mov	r7, r2
	mov	r8, r0
	bl	find_device_domain
	cmn	r0, #4096
	mov	r6, r0
	bhi	.L30
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:mutex_lock
	movt	r3, #:upper16:mutex_lock
	mov	r4, r6
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	ldr	r3, [r4, #12]!
	cmp	r3, r4
	beq	.L22
	ldr	r2, [r3, #12]
	cmp	r2, r5
	bne	.L25
	b	.L23
.L27:
	ldr	ip, [r3, #12]
	cmp	ip, r5
	beq	.L23
.L25:
	ldr	r3, [r3]
	cmp	r3, r4
	bne	.L27
.L22:
	movw	r3, #:lower16:kmalloc_caches
	movt	r3, #:upper16:kmalloc_caches
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L29
	movw	r3, #:lower16:kmem_cache_alloc_trace
	movw	r1, #32976
	movt	r3, #:upper16:kmem_cache_alloc_trace
	mov	r2, #20
	blx	r3
	cmp	r0, #0
	beq	.L31
.L28:
	str	r5, [r0, #12]
	mov	r5, #0
	str	r7, [r0, #16]
	ldr	r2, [r6, #12]
	str	r0, [r2, #4]
	stmia	r0, {r2, r4}
	str	r0, [r6, #12]
.L26:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:mutex_unlock
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	movw	r3, #:lower16:exynos_request_apply
	mov	r0, r7
	movt	r3, #:upper16:exynos_request_apply
	blx	r3
	mov	r0, r5
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L23:
	str	r7, [r3, #16]
	mov	r5, #0
	b	.L26
.L29:
	mov	r0, #16
	b	.L28
.L31:
	movw	r1, #:lower16:.LC1
	movw	r3, #:lower16:dev_err
	mov	r0, r8
	movt	r1, #:upper16:.LC1
	movt	r3, #:upper16:dev_err
	mvn	r5, #11
	blx	r3
	b	.L26
.L30:
	movw	r1, #:lower16:.LC0
	movw	r3, #:lower16:dev_err
	mov	r0, r5
	movt	r1, #:upper16:.LC0
	movt	r3, #:upper16:dev_err
	blx	r3
	mvn	r0, #21
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
	.fnend
	.size	dev_lock, .-dev_lock
	.align	2
	.global	dev_unlock
	.type	dev_unlock, %function
dev_unlock:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r1
	bl	find_device_domain
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L41
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:mutex_lock
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:mutex_lock
	blx	r3
	mov	r0, r5
	ldr	r3, [r0, #12]!
	cmp	r3, r0
	bne	.L39
	b	.L35
.L38:
	ldr	r3, [r3]
	cmp	r3, r0
	beq	.L35
.L39:
	ldr	r2, [r3, #12]
	cmp	r2, r4
	bne	.L38
	ldr	r1, [r3, #4]
	mov	r4, #256
	ldr	ip, [r3]
	mov	lr, #512
	movw	r2, #:lower16:kfree
	mov	r0, r3
	movt	r2, #:upper16:kfree
	str	r1, [ip, #4]
	str	ip, [r1]
	stmia	r3, {r4, lr}
	blx	r2
.L35:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:mutex_unlock
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, pc}
.L41:
	movw	r1, #:lower16:.LC0
	movw	r3, #:lower16:dev_err
	mov	r0, r4
	movt	r1, #:upper16:.LC0
	movt	r3, #:upper16:dev_err
	blx	r3
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	dev_unlock, .-dev_unlock
	.align	2
	.global	dev_max_freq
	.type	dev_max_freq, %function
dev_max_freq:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	bl	find_device_domain
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L46
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:mutex_lock
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:mutex_lock
	blx	r3
	mov	r0, r4
	mov	r4, #0
	ldr	r3, [r0, #12]!
	cmp	r3, r0
	beq	.L44
.L45:
	ldr	r2, [r3, #16]
	ldr	r3, [r3]
	cmp	r4, r2
	movcc	r4, r2
	cmp	r3, r0
	bne	.L45
.L44:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:mutex_unlock
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:mutex_unlock
	blx	r3
.L43:
	mov	r0, r4
	ldmfd	sp!, {r4, pc}
.L46:
	mov	r4, #0
	b	.L43
	.fnend
	.size	dev_max_freq, .-dev_max_freq
	.align	2
	.global	dev_lock_list
	.type	dev_lock_list, %function
dev_lock_list:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r6, r1
	bl	find_device_domain
	cmn	r0, #4096
	mov	r7, r0
	bhi	.L53
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:mutex_lock
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:mutex_lock
	blx	r3
	movw	r3, #:lower16:.LC2
	movt	r3, #:upper16:.LC2
	ldmia	r3!, {r0, r1}
	ldrh	r2, [r3]	@ unaligned
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	str	r0, [r6]	@ unaligned
	str	r1, [r6, #4]	@ unaligned
	strh	r2, [r6, #8]	@ unaligned
	strb	r3, [r6, #10]
	ldr	r4, [r7, #12]!
	cmp	r4, r7
	beq	.L54
	movw	r8, #:lower16:sprintf
	mov	r5, #10
	movt	r8, #:upper16:sprintf
.L52:
	ldr	r3, [r4, #12]
	movw	r1, #:lower16:.LC3
	add	r0, r6, r5
	movt	r1, #:upper16:.LC3
	ldr	r2, [r3, #44]
	cmp	r2, #0
	ldreq	r2, [r3, #8]
	ldr	r3, [r4, #16]
	blx	r8
	ldr	r4, [r4]
	add	r5, r5, r0
	cmp	r4, r7
	bne	.L52
.L50:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:mutex_unlock
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	mov	r0, r5
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L54:
	mov	r5, #10
	b	.L50
.L53:
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
	.fnend
	.size	dev_lock_list, .-dev_lock_list
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	domains_mutex, %object
	.size	domains_mutex, 24
domains_mutex:
	.word	1
	.word	0
	.space	4
	.word	domains_mutex+12
	.word	domains_mutex+12
	.space	4
	.type	domains_list, %object
	.size	domains_list, 8
domains_list:
	.word	domains_list
	.word	domains_list
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Can't find device domain.\012\000"
	.space	1
.LC1:
	.ascii	"Unable to create domain_lock\000"
	.space	3
.LC2:
	.ascii	"Lock List\012\000"
	.space	1
.LC3:
	.ascii	"%s : %lu\012\000"
	.ident	"GCC: (GNU) 4.8"
