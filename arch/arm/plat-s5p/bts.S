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
	.file	"bts.c"
	.text
	.align	2
	.type	bts_set_master_priority, %function
bts_set_master_priority:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #1
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r5, r0
	beq	.L4
	movw	r3, #4095
	cmp	r1, #2
	movt	r3, 3
	movw	r4, #2184
	moveq	r4, r3
.L2:
@ 130 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/bts.c" 1
	dsb
@ 0 "" 2
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L3
	blx	r3
.L3:
	str	r4, [r5, #8]
	ldmfd	sp!, {r3, r4, r5, pc}
.L4:
	movw	r4, #2184
	movt	r4, 1
	b	.L2
	.fnend
	.size	bts_set_master_priority, .-bts_set_master_priority
	.align	2
	.type	bts_set_deblocking, %function
bts_set_deblocking:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	ands	r4, r1, #2
	movne	r4, #17
	tst	r1, #4
	orrne	r4, r4, #33
	tst	r1, #8
	orrne	r4, r4, #4352
	tst	r1, #16
	orrne	r4, r4, #8448
	tst	r1, #32
	orrne	r4, r4, #1114112
	tst	r1, #64
	mov	r5, r0
	orrne	r4, r4, #2162688
@ 164 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/bts.c" 1
	dsb
@ 0 "" 2
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L17
	blx	r3
.L17:
	str	r4, [r5, #80]
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	bts_set_deblocking, .-bts_set_deblocking
	.align	2
	.type	find_fbm_group, %function
find_fbm_group:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r1, #:lower16:.LANCHOR0
	mov	r2, r0
	movt	r1, #:upper16:.LANCHOR0
	mov	r0, #0
	ldr	r3, [r1]
	cmp	r1, r3
	sub	r3, r3, #12
	bne	.L41
	b	.L47
.L39:
	cmp	r2, #2
	beq	.L44
.L40:
	ldr	r3, [r3, #12]
	cmp	r1, r3
	sub	r3, r3, #12
	beq	.L45
.L41:
	cmp	r2, #1
	bne	.L39
	ldr	ip, [r3, #4]
	cmp	ip, #2
	bne	.L40
	ldr	ip, [r3]
	orr	r0, r0, ip
.L46:
	ldr	r3, [r3, #12]
	cmp	r1, r3
	sub	r3, r3, #12
	bne	.L41
.L45:
	bx	lr
.L44:
	ldr	ip, [r3, #4]
	sub	ip, ip, #1
	cmp	ip, #1
	bhi	.L40
	ldr	ip, [r3]
	orr	r0, r0, ip
	b	.L46
.L47:
	bx	lr
	.fnend
	.size	find_fbm_group, .-find_fbm_group
	.align	2
	.type	bts_init, %function
bts_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:platform_driver_register
	movt	r3, #:upper16:platform_driver_register
	ldr	r0, .L49
	blx	r3
	ldmfd	sp!, {r3, pc}
.L50:
	.align	2
.L49:
	.word	.LANCHOR0+8
	.fnend
	.size	bts_init, .-bts_init
	.align	2
	.type	bts_remove, %function
bts_remove:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r6, [r0, #92]
	ldr	r3, [r6, #24]
	ldr	r5, [r6, #12]
	cmp	r3, #0
	beq	.L60
	movw	r7, #:lower16:__arm_iounmap
	mov	r4, #0
	movt	r7, #:upper16:__arm_iounmap
.L54:
	ldr	r0, [r5, #16]
	add	r4, r4, #1
	blx	r7
	ldr	r3, [r6, #24]
	add	r5, r5, #12
	cmp	r4, r3
	bcc	.L54
	ldr	r0, [r6, #12]
.L52:
	movw	r8, #:lower16:kfree
	mov	r10, #256
	movt	r8, #:upper16:kfree
	mov	r9, #512
	blx	r8
	ldr	r3, [r6, #4]
	movw	r5, #:lower16:.LANCHOR0
	ldr	r2, [r6]
	movt	r5, #:upper16:.LANCHOR0
	mov	r0, r6
	str	r3, [r2, #4]
	str	r2, [r3]
	str	r10, [r6]
	str	r9, [r6, #4]
	blx	r8
	ldr	r2, [r5, #88]
	add	r3, r5, #88
	cmp	r2, r3
	beq	.L55
.L58:
	ldr	r0, [r6, #16]
	cmp	r0, #0
	beq	.L57
	movw	r3, #:lower16:clk_put
	movt	r3, #:upper16:clk_put
	blx	r3
.L57:
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L55:
	ldr	r4, [r5]
	cmp	r5, r4
	sub	r4, r4, #12
	beq	.L58
	movw	r7, #:lower16:__arm_iounmap
	movt	r7, #:upper16:__arm_iounmap
.L59:
	ldr	r0, [r4, #8]
	blx	r7
	mov	r0, r4
	blx	r8
	ldr	r3, [r4, #16]
	cmp	r5, #256
	ldr	r2, [r4, #12]
	str	r3, [r2, #4]
	str	r2, [r3]
	str	r10, [r4, #12]
	str	r9, [r4, #16]
	mov	r4, #244
	bne	.L59
	b	.L58
.L60:
	mov	r0, r5
	b	.L52
	.fnend
	.size	bts_remove, .-bts_remove
	.align	2
	.type	bts_set_besteffort_shaping, %function
bts_set_besteffort_shaping:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #1
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	beq	.L83
	cmp	r1, #2
	ldmnefd	sp!, {r3, r4, r5, pc}
@ 141 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/bts.c" 1
	dsb
@ 0 "" 2
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L70
	blx	r3
.L70:
	mov	r3, #3
	str	r3, [r4, #12]
	ldmfd	sp!, {r3, r4, r5, pc}
.L83:
@ 137 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/bts.c" 1
	dsb
@ 0 "" 2
	movw	r5, #:lower16:outer_cache
	movt	r5, #:upper16:outer_cache
	ldr	r3, [r5, #28]
	cmp	r3, #0
	beq	.L66
	blx	r3
.L66:
	mov	r3, #16
	bfi	r3, r3, #16, #16
	str	r3, [r4, #4]
@ 138 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/bts.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r5, #28]
	cmp	r3, #0
	beq	.L67
	blx	r3
.L67:
	movw	r3, #1023
	str	r3, [r4, #68]
@ 139 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/bts.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r5, #28]
	cmp	r3, #0
	beq	.L68
	blx	r3
.L68:
	mov	r3, #512
	str	r3, [r4, #12]
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	bts_set_besteffort_shaping, .-bts_set_besteffort_shaping
	.align	2
	.type	fbm_init_config, %function
fbm_init_config:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #1
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r5, r0
	beq	.L103
	cmp	r1, #2
	ldmnefd	sp!, {r3, r4, r5, pc}
@ 192 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/bts.c" 1
	dsb
@ 0 "" 2
	movw	r4, #:lower16:outer_cache
	movt	r4, #:upper16:outer_cache
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L89
	blx	r3
.L89:
	mov	r3, #2
	str	r3, [r5]
@ 193 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/bts.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L90
	blx	r3
.L90:
	mov	r3, #3
	str	r3, [r5, #64]
	ldmfd	sp!, {r3, r4, r5, pc}
.L103:
@ 189 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/bts.c" 1
	dsb
@ 0 "" 2
	movw	r4, #:lower16:outer_cache
	movt	r4, #:upper16:outer_cache
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L86
	blx	r3
.L86:
	mov	r3, #0
	str	r3, [r5]
@ 190 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/bts.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L87
	blx	r3
.L87:
	mov	r3, #4
	str	r3, [r5, #64]
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	fbm_init_config, .-fbm_init_config
	.align	2
	.type	bts_init_config, %function
bts_init_config:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #1
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r1
	mov	r5, r0
	beq	.L115
	cmp	r1, #2
	ldmnefd	sp!, {r3, r4, r5, pc}
	bl	bts_set_besteffort_shaping
	mov	r0, r5
	mov	r1, r4
	bl	bts_set_master_priority
@ 113 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/bts.c" 1
	dsb
@ 0 "" 2
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L108
	blx	r3
.L108:
	mov	r3, #1
	str	r3, [r5]
	ldmfd	sp!, {r3, r4, r5, pc}
.L115:
	bl	bts_set_besteffort_shaping
	mov	r0, r4
	bl	find_fbm_group
	mov	r1, r0
	mov	r0, r5
	bl	bts_set_deblocking
	mov	r0, r5
	mov	r1, r4
	bl	bts_set_master_priority
@ 113 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/bts.c" 1
	dsb
@ 0 "" 2
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L106
	blx	r3
.L106:
	mov	r3, #133
	str	r3, [r5]
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	bts_init_config, .-bts_init_config
	.align	2
	.type	bts_probe, %function
bts_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r6, #:lower16:.LANCHOR0
	movt	r6, #:upper16:.LANCHOR0
	ldr	r5, [r0, #92]
	.pad #12
	sub	sp, sp, #12
	mov	r9, r0
	ldr	r3, [r6]
	ldr	r2, [r5, #16]
	cmp	r3, r6
	ldr	r3, [r2]
	beq	.L117
.L120:
	movw	r3, #:lower16:platform_get_resource
	mov	r0, r9
	movt	r3, #:upper16:platform_get_resource
	mov	r1, #512
	mov	r2, #0
	blx	r3
	subs	r4, r0, #0
	beq	.L139
	ldr	r1, [r5, #12]
	cmp	r1, #0
	beq	.L133
	movw	r3, #:lower16:clk_get
	ldr	r0, [r9, #8]
	movt	r3, #:upper16:clk_get
	blx	r3
	cmn	r0, #4096
	str	r0, [sp]
	bhi	.L134
	movw	r3, #:lower16:clk_enable
	movt	r3, #:upper16:clk_enable
	blx	r3
.L124:
	movw	r3, #:lower16:kmalloc_caches
	movt	r3, #:upper16:kmalloc_caches
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L125
	movw	r3, #:lower16:kmem_cache_alloc_trace
	movw	r1, #32976
	movt	r3, #:upper16:kmem_cache_alloc_trace
	mov	r2, #28
	blx	r3
	ldr	r3, [r5, #20]
	mov	r7, r0
	str	r3, [r0, #24]
	add	r3, r3, r3, asl #1
	mov	r0, r3, asl #2
.L130:
	movw	r3, #:lower16:__kmalloc
	movw	r1, #32976
	movt	r3, #:upper16:__kmalloc
	blx	r3
	ldr	r3, [r7, #24]
	str	r0, [sp, #4]
	cmp	r3, #0
	beq	.L128
	ldr	r3, [sp, #4]
	movw	r8, #:lower16:__arm_ioremap
	add	r10, r4, #28
	movt	r8, #:upper16:__arm_ioremap
	mov	r4, #0
	add	fp, r3, #12
	b	.L129
.L140:
	bl	bts_init_config
	ldr	r2, [r7, #24]
	add	fp, fp, #12
	cmp	r4, r2
	bcs	.L128
.L129:
	ldr	r1, [r5]
	mov	r2, #0
	add	r4, r4, #1
	add	r10, r10, #28
	str	r1, [fp, #-12]
	ldr	r1, [r10, #-52]
	ldr	r0, [r10, #-56]
	add	r1, r1, #1
	rsb	r1, r0, r1
	blx	r8
	str	r0, [fp, #-8]
	cmp	r0, #0
	ldr	r2, [r5, #4]
	mov	r1, r2
	str	r2, [fp, #-4]
	bne	.L140
	mvn	r4, #5
.L127:
	ldr	r3, [r5, #12]
	cmp	r3, #0
	moveq	r0, r4
	beq	.L138
	movw	r3, #:lower16:clk_disable
	ldr	r0, [sp]
	movt	r3, #:upper16:clk_disable
	blx	r3
	mov	r0, r4
.L138:
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L128:
	ldr	r3, [sp, #4]
	add	r1, r9, #8
	ldr	r2, .L142
	mov	r4, #0
	str	r3, [r7, #12]
	ldr	r0, [r5, #8]
	ldr	r3, [r6, #92]
	str	r1, [r7, #8]
	str	r0, [r7, #20]
	ldr	r0, [sp]
	str	r7, [r6, #92]
	stmia	r7, {r2, r3}
	str	r0, [r7, #16]
	str	r7, [r3]
	str	r7, [r9, #92]
	b	.L127
.L117:
	ldr	r2, [r2, #4]
	cmp	r2, #0
	ble	.L120
	movw	r0, #:lower16:kmem_cache_alloc_trace
	movw	r8, #:lower16:__arm_ioremap
	movw	r10, #:lower16:kmalloc_caches
	movt	r0, #:upper16:kmem_cache_alloc_trace
	add	fp, r3, #12
	movt	r8, #:upper16:__arm_ioremap
	movt	r10, #:upper16:kmalloc_caches
	str	r0, [sp]
	mov	r4, #0
	b	.L123
.L141:
	ldr	r1, [fp, #-8]
	bl	fbm_init_config
	ldr	ip, [r10, #24]
	movw	r1, #32976
	mov	r2, #20
	subs	r0, ip, #0
	moveq	r0, #16
	beq	.L122
	ldr	r3, [sp]
	blx	r3
.L122:
	str	r7, [r0, #8]
	add	r1, r0, #12
	ldr	r2, [fp, #-12]
	add	r4, r4, #1
	add	fp, fp, #12
	str	r2, [r0]
	ldr	r2, [fp, #-20]
	str	r6, [r0, #12]
	str	r2, [r0, #4]
	ldr	r2, [r6, #4]
	str	r1, [r6, #4]
	str	r2, [r0, #16]
	str	r1, [r2]
	ldr	r2, [r5, #16]
	ldr	r2, [r2, #4]
	cmp	r2, r4
	ble	.L120
.L123:
	ldr	r0, [fp, #-4]
	mov	r1, #64
	mov	r2, #0
	blx	r8
	subs	r7, r0, #0
	bne	.L141
	mvn	r0, #18
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L125:
	ldr	r3, [r5, #20]
	mov	r7, #16
	str	r3, [r0, #40]
	add	r3, r3, r3, asl #1
	mov	r0, r3, asl #2
	b	.L130
.L133:
	str	r1, [sp]
	b	.L124
.L139:
	movw	r1, #:lower16:.LC0
	movw	r3, #:lower16:dev_err
	add	r0, r9, #8
	movt	r1, #:upper16:.LC0
	movt	r3, #:upper16:dev_err
	blx	r3
	mvn	r0, #18
	b	.L138
.L134:
	mvn	r0, #21
	b	.L138
.L143:
	.align	2
.L142:
	.word	.LANCHOR0+88
	.fnend
	.size	bts_probe, .-bts_probe
	.align	2
	.global	exynos_bts_set_priority
	.type	exynos_bts_set_priority, %function
exynos_bts_set_priority:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movw	r8, #:lower16:.LANCHOR0
	movt	r8, #:upper16:.LANCHOR0
	mov	r7, r0
	ldr	r6, [r8, #88]!
	cmp	r6, r8
	ldmeqfd	sp!, {r4, r5, r6, r7, r8, pc}
.L146:
	ldr	r1, [r6, #24]
	cmp	r1, #0
	beq	.L149
	mov	r4, #0
	b	.L150
.L147:
	cmp	r4, r1
	bcs	.L149
.L150:
	ldr	r5, [r6, #12]
	add	r4, r4, #1
	ldr	r3, [r5]
	cmp	r3, #0
	cmpne	r3, #19
	movne	r2, #0
	moveq	r2, #1
	cmp	r3, #10
	movne	r3, r2
	orreq	r3, r2, #1
	cmp	r3, #0
	beq	.L147
	mov	r0, r7
	bl	find_fbm_group
	mov	r1, r0
	ldr	r0, [r5, #4]
	bl	bts_set_deblocking
	ldr	r1, [r6, #24]
	cmp	r4, r1
	bcc	.L150
.L149:
	ldr	r6, [r6]
	cmp	r6, r8
	bne	.L146
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
	.fnend
	.size	exynos_bts_set_priority, .-exynos_bts_set_priority
	.align	2
	.global	exynos_bts_enable
	.type	exynos_bts_enable, %function
exynos_bts_enable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #12
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r5, #:lower16:.LANCHOR0
	mov	r7, r0
	movt	r5, #:upper16:.LANCHOR0
	beq	.L158
.L161:
	ldr	r4, [r5, #88]
	ldr	r8, .L176
	cmp	r4, r8
	ldmeqfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
	movw	r9, #:lower16:clk_disable
	movw	r10, #:lower16:clk_enable
	movt	r9, #:upper16:clk_disable
	movt	r10, #:upper16:clk_enable
	b	.L171
.L164:
	ldr	r4, [r4]
	cmp	r4, r8
	beq	.L175
.L171:
	ldr	r3, [r4, #20]
	cmp	r3, r7
	bne	.L164
	ldr	r0, [r4, #16]
	cmp	r0, #0
	beq	.L165
	blx	r10
.L165:
	ldr	r3, [r4, #24]
	ldr	r5, [r4, #12]
	cmp	r3, #0
	addne	r5, r5, #12
	movne	r6, #0
	beq	.L169
.L170:
	ldr	r0, [r5, #-8]
	add	r6, r6, #1
	ldr	r1, [r5, #-4]
	add	r5, r5, #12
	bl	bts_init_config
	ldr	r3, [r4, #24]
	cmp	r6, r3
	bcc	.L170
.L169:
	ldr	r0, [r4, #16]
	cmp	r0, #0
	beq	.L164
	blx	r9
	ldr	r4, [r4]
	cmp	r4, r8
	bne	.L171
.L175:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L158:
	ldr	r4, [r5]
	cmp	r5, r4
	sub	r4, r4, #12
	beq	.L161
.L162:
	ldr	r0, [r4, #8]
	ldr	r1, [r4, #4]
	bl	fbm_init_config
	ldr	r4, [r4, #12]
	cmp	r5, r4
	sub	r4, r4, #12
	bne	.L162
	b	.L161
.L177:
	.align	2
.L176:
	.word	.LANCHOR0+88
	.fnend
	.size	exynos_bts_enable, .-exynos_bts_enable
	.section	.initcall3.init,"aw",%progbits
	.align	2
	.type	__initcall_bts_init3, %object
	.size	__initcall_bts_init3, 4
__initcall_bts_init3:
	.word	bts_init
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	fbm_list, %object
	.size	fbm_list, 8
fbm_list:
	.word	fbm_list
	.word	fbm_list
	.type	bts_driver, %object
	.size	bts_driver, 80
bts_driver:
	.word	bts_probe
	.word	bts_remove
	.space	12
	.word	.LC1
	.space	4
	.word	0
	.space	44
	.space	4
	.type	bts_list, %object
	.size	bts_list, 8
bts_list:
	.word	bts_list
	.word	bts_list
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"can't get resource!\012\000"
	.space	3
.LC1:
	.ascii	"exynos-bts\000"
	.ident	"GCC: (GNU) 4.8"
