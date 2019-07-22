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
	.file	"s5p-sysmmu.c"
	.text
	.align	2
	.type	__sysmmu_disable, %function
__sysmmu_disable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r3, #:lower16:_raw_write_lock_irqsave
	add	r5, r0, #28
	mov	r4, r0
	movt	r3, #:upper16:_raw_write_lock_irqsave
	mov	r0, r5
	blx	r3
	ldr	r3, [r4, #24]
	mov	r7, r0
	cmp	r3, #0
	beq	.L8
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #24]
	bne	.L9
	ldr	r2, [r4, #16]
	str	r3, [r2]
	ldr	r0, [r4, #20]
	cmp	r0, #0
	moveq	r6, #1
	beq	.L3
	movw	r3, #:lower16:clk_disable
	mov	r6, #1
	movt	r3, #:upper16:clk_disable
	blx	r3
.L3:
	movw	r3, #:lower16:_raw_write_unlock_irqrestore
	mov	r0, r5
	mov	r1, r7
	movt	r3, #:upper16:_raw_write_unlock_irqrestore
	blx	r3
	movw	r3, #:lower16:__pm_runtime_idle
	ldr	r0, [r4, #8]
	movt	r3, #:upper16:__pm_runtime_idle
	mov	r1, #4
	blx	r3
	mov	r0, r6
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L9:
	mov	r6, #0
	b	.L3
.L8:
	movw	r0, #:lower16:.LC0
	movw	r2, #:lower16:warn_slowpath_null
	movt	r0, #:upper16:.LC0
	movt	r2, #:upper16:warn_slowpath_null
	mov	r1, #112
	mov	r6, r3
	blx	r2
	b	.L3
	.fnend
	.size	__sysmmu_disable, .-__sysmmu_disable
	.align	2
	.type	s5p_sysmmu_init, %function
s5p_sysmmu_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:platform_driver_register
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:platform_driver_register
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	s5p_sysmmu_init, .-s5p_sysmmu_init
	.align	2
	.type	default_fault_handler, %function
default_fault_handler:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:.LANCHOR1
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	cmp	r0, #8
	movcc	r3, r0
	movcs	r3, #8
	mov	r7, r1
	movt	ip, #:upper16:.LANCHOR1
	movw	r0, #:lower16:.LC1
	movw	r4, #:lower16:printk
	movw	r6, #:lower16:__pv_phys_offset
	ldr	r1, [ip, r3, asl #2]
	movt	r0, #:upper16:.LC1
	mov	r3, r7
	movt	r4, #:upper16:printk
	movt	r6, #:upper16:__pv_phys_offset
	mov	r10, r2
	blx	r4
	ldr	r3, [r6]
	mov	r2, r10, lsr #20
	movw	r5, #:lower16:mem_map
	add	r2, r7, r2, asl #2
	movt	r5, #:upper16:mem_map
	ldr	r0, [r5]
	movw	r7, #:lower16:page_address
	mov	r3, r3, lsr #12
	ubfx	r9, r2, #2, #10
	movt	r7, #:upper16:page_address
	rsb	r3, r3, r2, lsr #12
	add	r3, r3, r3, asl #3
	add	r0, r0, r3, asl #2
	blx	r7
	add	r3, r0, r9, asl #2
	mov	r8, r0
	cmp	r3, #0
	beq	.L13
	movw	r0, #:lower16:.LC2
	ldr	r1, [r8, r9, asl #2]
	movt	r0, #:upper16:.LC2
	blx	r4
	ldr	r8, [r8, r9, asl #2]
	and	r3, r8, #3
	cmp	r3, #1
	beq	.L18
.L13:
	movw	r0, #:lower16:.LC4
	movt	r0, #:upper16:.LC4
	blx	r4
@ 265 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/s5p-sysmmu.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/s5p-sysmmu.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 265, 0
.popsection
@ 0 "" 2
.L18:
	ldr	r2, [r6]
	mov	r0, #36
	ldr	r3, [r5]
	mov	r2, r2, lsr #12
	rsb	r2, r2, r8, lsr #12
	mla	r0, r0, r2, r3
	blx	r7
	cmp	r0, #0
	beq	.L13
	and	r8, r8, #3072
	ubfx	r10, r10, #12, #8
	add	r8, r0, r8
	movw	r0, #:lower16:.LC3
	ldr	r1, [r8, r10, asl #2]
	movt	r0, #:upper16:.LC3
	blx	r4
	b	.L13
	.fnend
	.size	default_fault_handler, .-default_fault_handler
	.align	2
	.type	s5p_sysmmu_irq, %function
s5p_sysmmu_irq:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movw	r3, #:lower16:_raw_read_lock
	add	r7, r1, #28
	mov	r4, r1
	movt	r3, #:upper16:_raw_read_lock
	mov	r0, r7
	blx	r3
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L31
.L30:
	ldr	r3, [r4, #16]
	ldr	r2, [r3, #24]
	rsb	r5, r2, #0
	and	r5, r5, r2
@ 268 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/bitops.h" 1
	clz	r5, r5
@ 0 "" 2
	rsb	r5, r5, #31
	cmp	r5, #7
	bhi	.L32
	ldr	ip, [r4, #36]
	cmp	ip, #0
	beq	.L22
	movw	r6, #:lower16:.LANCHOR1
	ldr	r1, [r4, #40]
	movt	r6, #:upper16:.LANCHOR1
	ldr	r8, [r3, #20]
	add	r2, r6, r5, asl #1
	cmp	r1, #3
	ldrh	r2, [r2, #36]
	ldr	r2, [r3, r2]
	beq	.L33
.L23:
	mov	r0, r5
	mov	r1, r8
	blx	ip
	cmp	r0, #0
	beq	.L25
.L24:
	ldr	r2, [r4, #16]
	mov	r0, #1
	mov	r0, r0, asl r5
	mov	r1, #5
	movw	r3, #:lower16:_raw_read_unlock
	str	r0, [r2, #28]
	movt	r3, #:upper16:_raw_read_unlock
	ldr	r2, [r4, #16]
	mov	r0, r7
	str	r1, [r2]
	blx	r3
	cmp	r8, #0
	beq	.L27
	mov	r0, #1
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L33:
	sub	r1, r5, #1
	cmp	r1, #1
	movls	r2, #1
	strls	r2, [r3, #12]
	bhi	.L23
	b	.L24
.L25:
	ldr	r2, [r4, #16]
	mov	r0, #1
	mov	r0, r0, asl r5
	mov	r1, #5
	movw	r3, #:lower16:_raw_read_unlock
	str	r0, [r2, #28]
	movt	r3, #:upper16:_raw_read_unlock
	ldr	r2, [r4, #16]
	mov	r0, r7
	str	r1, [r2]
	blx	r3
.L27:
	movw	r1, #:lower16:.LC5
	movw	r3, #:lower16:dev_notice
	ldr	r0, [r4, #8]
	movt	r1, #:upper16:.LC5
	ldr	r2, [r6, r5, asl #2]
	movt	r3, #:upper16:dev_notice
	blx	r3
	mov	r0, #1
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L22:
	mov	r1, #5
	movw	r2, #:lower16:_raw_read_unlock
	mov	r0, r7
	str	r1, [r3]
	movt	r2, #:upper16:_raw_read_unlock
	movw	r6, #:lower16:.LANCHOR1
	blx	r2
	movt	r6, #:upper16:.LANCHOR1
	b	.L27
.L31:
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:warn_slowpath_null
	movt	r0, #:upper16:.LC0
	movt	r3, #:upper16:warn_slowpath_null
	movw	r1, #279
	blx	r3
	b	.L30
.L32:
@ 284 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/s5p-sysmmu.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/s5p-sysmmu.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 284, 0
.popsection
@ 0 "" 2
	.fnend
	.size	s5p_sysmmu_irq, .-s5p_sysmmu_irq
	.align	2
	.type	s5p_sysmmu_probe, %function
s5p_sysmmu_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, r0
	ldr	r2, [r0, #92]
	.pad #8
	sub	sp, sp, #8
	add	r6, r0, #8
	cmp	r2, #0
	beq	.L52
	movw	r3, #:lower16:kmalloc_caches
	movt	r3, #:upper16:kmalloc_caches
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L53
	movw	r3, #:lower16:kmem_cache_alloc_trace
	movw	r1, #32976
	movt	r3, #:upper16:kmem_cache_alloc_trace
	mov	r2, #44
	blx	r3
	subs	r4, r0, #0
	beq	.L37
	ldr	r2, [r5, #92]
.L36:
	movw	r3, #:lower16:dev_set_drvdata
	str	r2, [r4, #12]
	movt	r3, #:upper16:dev_set_drvdata
	mov	r0, r6
	mov	r1, r4
	blx	r3
	subs	r8, r0, #0
	bne	.L58
	movw	r3, #:lower16:platform_get_resource
	mov	r0, r5
	movt	r3, #:upper16:platform_get_resource
	mov	r1, #512
	mov	r2, r8
	blx	r3
	subs	r7, r0, #0
	beq	.L59
	ldmia	r7, {r1, r2}
	mov	r10, #0
	ldr	r3, [r5, #52]
	movw	r0, #:lower16:iomem_resource
	movw	ip, #:lower16:__request_region
	movt	r0, #:upper16:iomem_resource
	add	r2, r2, #1
	movt	ip, #:upper16:__request_region
	cmp	r3, #0
	rsb	r2, r1, r2
	ldreq	r3, [r5, #16]
	str	r10, [sp]
	blx	ip
	subs	r9, r0, #0
	movweq	r1, #:lower16:.LC9
	movweq	r5, #:lower16:dev_err
	movteq	r1, #:upper16:.LC9
	beq	.L57
	ldr	r1, [r7, #4]
	movw	r3, #:lower16:__arm_ioremap
	ldr	r0, [r7]
	movt	r3, #:upper16:__arm_ioremap
	mov	r2, r10
	add	r1, r1, #1
	rsb	r1, r0, r1
	blx	r3
	subs	r7, r0, #0
	beq	.L60
	movw	r3, #:lower16:platform_get_irq
	mov	r1, r10
	movt	r3, #:upper16:platform_get_irq
	mov	r0, r5
	blx	r3
	subs	r8, r0, #0
	ble	.L61
	ldr	r3, [r5, #52]
	mov	r2, #0
	movw	r1, #:lower16:s5p_sysmmu_irq
	movw	ip, #:lower16:request_threaded_irq
	mov	r0, r8
	movt	r1, #:upper16:s5p_sysmmu_irq
	cmp	r3, #0
	movt	ip, #:upper16:request_threaded_irq
	ldreq	r3, [r5, #16]
	stmia	sp, {r3, r4}
	mov	r3, r2
	blx	ip
	subs	r8, r0, #0
	bne	.L62
	movw	r1, #:lower16:.LC13
	movw	r3, #:lower16:clk_get
	movt	r1, #:upper16:.LC13
	movt	r3, #:upper16:clk_get
	mov	r0, r6
	add	r9, r4, #28
	blx	r3
	cmn	r0, #4096
	movw	r3, #:lower16:_raw_write_lock_irqsave
	movhi	r0, #0
	movt	r3, #:upper16:_raw_write_lock_irqsave
	str	r0, [r4, #20]
	mov	r0, r9
	str	r6, [r4, #8]
	str	r7, [r4, #16]
	str	r8, [r4, #28]
	str	r8, [r4, #32]
	str	r4, [r4]
	str	r4, [r4, #4]
	blx	r3
	movw	r2, #:lower16:default_fault_handler
	movw	r3, #:lower16:_raw_write_unlock_irqrestore
	movt	r2, #:upper16:default_fault_handler
	mov	r1, r0
	str	r2, [r4, #36]
	movt	r3, #:upper16:_raw_write_unlock_irqrestore
	mov	r0, r9
	blx	r3
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	mov	r2, r3
	ldr	r1, [r2, #80]!
	str	r4, [r1, #4]
	stmia	r4, {r1, r2}
	ldr	r2, [r5, #8]
	str	r4, [r3, #80]
	cmp	r2, #0
	beq	.L50
	movw	r3, #:lower16:pm_runtime_enable
	mov	r0, r6
	movt	r3, #:upper16:pm_runtime_enable
	blx	r3
.L50:
	ldr	r2, [r4, #12]
	ldr	r3, [r2, #-4]
	cmn	r3, #1
	beq	.L63
	movw	r1, #:lower16:.LC15
	movw	ip, #:lower16:_dev_info
	mov	r0, r6
	ldr	r2, [r2, #-8]
	movt	r1, #:upper16:.LC15
	movt	ip, #:upper16:_dev_info
	blx	ip
	mov	r0, #0
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L58:
	movw	r1, #:lower16:.LC7
	movw	r5, #:lower16:dev_err
	movt	r1, #:upper16:.LC7
.L57:
	movw	r7, #:lower16:kfree
	movt	r5, #:upper16:dev_err
	movt	r7, #:upper16:kfree
	mov	r0, r6
	blx	r5
.L39:
	mov	r0, r4
	blx	r7
	movw	r1, #:lower16:.LC16
	mov	r0, r6
	movt	r1, #:upper16:.LC16
	blx	r5
	mov	r0, r8
.L35:
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L53:
	mov	r4, #16
	b	.L36
.L62:
	movw	r1, #:lower16:.LC12
	movw	r5, #:lower16:dev_err
	movt	r1, #:upper16:.LC12
	movt	r5, #:upper16:dev_err
	mov	r0, r6
	blx	r5
.L46:
	movw	r3, #:lower16:__arm_iounmap
	mov	r0, r7
	movt	r3, #:upper16:__arm_iounmap
	blx	r3
.L44:
	movw	r3, #:lower16:release_resource
	mov	r0, r9
	movt	r3, #:upper16:release_resource
	movw	r7, #:lower16:kfree
	blx	r3
	movt	r7, #:upper16:kfree
	mov	r0, r9
	blx	r7
	b	.L39
.L60:
	movw	r1, #:lower16:.LC10
	movw	r5, #:lower16:dev_err
	movt	r1, #:upper16:.LC10
	movt	r5, #:upper16:dev_err
	mov	r0, r6
	mvn	r8, #1
	blx	r5
	b	.L44
.L61:
	movw	r1, #:lower16:.LC11
	movw	r5, #:lower16:dev_err
	movt	r1, #:upper16:.LC11
	movt	r5, #:upper16:dev_err
	mov	r0, r6
	blx	r5
	b	.L46
.L63:
	movw	r1, #:lower16:.LC14
	movw	r3, #:lower16:_dev_info
	mov	r0, r6
	ldr	r2, [r2, #-8]
	movt	r1, #:upper16:.LC14
	movt	r3, #:upper16:_dev_info
	blx	r3
	mov	r0, #0
	b	.L35
.L59:
	movw	r1, #:lower16:.LC8
	movw	r5, #:lower16:dev_err
	movt	r1, #:upper16:.LC8
	b	.L57
.L52:
	mvn	r0, #18
	b	.L35
.L37:
	movw	r1, #:lower16:.LC6
	movw	r3, #:lower16:dev_err
	mov	r0, r6
	movt	r1, #:upper16:.LC6
	movt	r3, #:upper16:dev_err
	blx	r3
	mvn	r0, #11
	b	.L35
	.fnend
	.size	s5p_sysmmu_probe, .-s5p_sysmmu_probe
	.align	2
	.global	get_sysmmu_data
	.type	get_sysmmu_data, %function
get_sysmmu_data:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, #0
	beq	.L65
	ldr	r3, [r1]
	ldr	ip, .L82
	cmp	r3, ip
	bne	.L68
	b	.L72
.L80:
	ldr	r3, [r3]
	cmp	r3, ip
	beq	.L72
.L68:
	ldr	r2, [r3, #12]
	cmp	r2, r0
	bne	.L80
.L74:
	mov	r0, r3
	bx	lr
.L72:
	mov	r0, #0
	bx	lr
.L65:
	movw	ip, #:lower16:.LANCHOR0
	movt	ip, #:upper16:.LANCHOR0
	ldr	r3, [ip, #80]!
	cmp	r3, ip
	bne	.L71
	b	.L72
.L81:
	ldr	r3, [r3]
	cmp	r3, ip
	beq	.L72
.L71:
	ldr	r2, [r3, #12]
	cmp	r0, r2
	bne	.L81
	b	.L74
.L83:
	.align	2
.L82:
	.word	.LANCHOR0+80
	.fnend
	.size	get_sysmmu_data, .-get_sysmmu_data
	.align	2
	.global	get_sysmmu_list
	.type	get_sysmmu_list, %function
get_sysmmu_list:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L85
	bx	lr
.L86:
	.align	2
.L85:
	.word	.LANCHOR0+80
	.fnend
	.size	get_sysmmu_list, .-get_sysmmu_list
	.align	2
	.global	s5p_sysmmu_set_prefbuf
	.type	s5p_sysmmu_set_prefbuf, %function
s5p_sysmmu_set_prefbuf:
	.fnstart
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, r2
	.pad #20
	sub	sp, sp, #20
	sub	r2, r1, #1
	mov	r8, r0
	mov	r4, r3
	str	r2, [sp, #8]
	add	r2, r2, r9
	cmp	r1, r2
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r5, [sp, #56]
	bcs	.L99
	sub	r3, r3, #1
	add	r3, r3, r5
	cmp	r4, r3
	bcs	.L89
	movw	r3, #:lower16:warn_slowpath_null
	movw	r7, #:lower16:_raw_read_lock_irqsave
	movw	r6, #:lower16:_raw_read_unlock_irqrestore
	movt	r3, #:upper16:warn_slowpath_null
	movt	r7, #:upper16:_raw_read_lock_irqsave
	movt	r6, #:upper16:_raw_read_unlock_irqrestore
	str	r3, [sp, #12]
	mov	fp, #0
	b	.L90
.L102:
	mov	r4, r9, lsr #1
	ldr	r2, [sp]
	add	r4, r4, #65280
	add	r4, r4, #255
	mov	r4, r4, lsr #16
	mov	r4, r4, asl #16
	rsb	r5, r4, r9
	mov	r9, r4
	add	r4, r4, r2
	ldr	r2, [sp, #8]
	add	r2, r2, r9
	str	r2, [sp, #4]
.L93:
	ldr	r3, [fp, #16]
	add	r2, r4, r5
	ldr	r0, [sp]
	sub	r2, r2, #1
	str	r0, [r3, #76]
	ldr	r0, [sp, #4]
	str	r0, [r3, #80]
	ldr	r3, [fp, #16]
	str	r4, [r3, #84]
	str	r2, [r3, #88]
	mov	r2, #5
	ldr	r3, [fp, #16]
	str	r2, [r3]
.L96:
	mov	r0, r10
	blx	r6
.L90:
	mov	r1, fp
	mov	r0, r8
	bl	get_sysmmu_data
	subs	fp, r0, #0
	beq	.L100
	ldr	r3, [fp, #40]
	cmp	r3, #3
	bne	.L101
	add	r10, fp, #28
	mov	r0, r10
	blx	r7
	ldr	r3, [fp, #24]
	mov	r1, r0
	cmp	r3, #0
	beq	.L96
	ldr	r3, [fp, #16]
	cmp	r5, #0
	mov	r0, #7
	str	r0, [r3]
	bne	.L93
	cmp	r9, #131072
	bhi	.L102
	mov	r5, r9
	ldr	r4, [sp]
	b	.L93
.L100:
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L101:
	movw	r0, #:lower16:.LC0
	mov	r1, #183
	movt	r0, #:upper16:.LC0
	ldr	r2, [sp, #12]
	blx	r2
	b	.L90
.L89:
@ 180 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/s5p-sysmmu.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/s5p-sysmmu.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 180, 0
.popsection
@ 0 "" 2
.L99:
@ 179 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/s5p-sysmmu.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/s5p-sysmmu.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 179, 0
.popsection
@ 0 "" 2
	.fnend
	.size	s5p_sysmmu_set_prefbuf, .-s5p_sysmmu_set_prefbuf
	.align	2
	.global	s5p_sysmmu_set_fault_handler
	.type	s5p_sysmmu_set_fault_handler, %function
s5p_sysmmu_set_fault_handler:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	movw	r7, #:lower16:_raw_write_lock_irqsave
	movw	r6, #:lower16:_raw_write_unlock_irqrestore
	mov	r8, r0
	mov	r9, r1
	movt	r7, #:upper16:_raw_write_lock_irqsave
	movt	r6, #:upper16:_raw_write_unlock_irqrestore
	mov	r4, #0
	b	.L104
.L105:
	blx	r7
	str	r9, [r4, #36]
	mov	r1, r0
	mov	r0, r5
	blx	r6
.L104:
	mov	r1, r4
	mov	r0, r8
	bl	get_sysmmu_data
	subs	r4, r0, #0
	add	r5, r4, #28
	mov	r0, r5
	bne	.L105
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
	.fnend
	.size	s5p_sysmmu_set_fault_handler, .-s5p_sysmmu_set_fault_handler
	.align	2
	.global	s5p_sysmmu_enable
	.type	s5p_sysmmu_enable, %function
s5p_sysmmu_enable:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:empty_zero_page
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movt	r3, #:upper16:empty_zero_page
	.pad #20
	sub	sp, sp, #20
	movw	r2, #:lower16:mem_map
	movw	r5, #:lower16:__pm_runtime_resume
	str	r3, [sp, #4]
	movw	r3, #:lower16:__pv_phys_offset
	movw	r6, #:lower16:_raw_write_lock_irqsave
	movw	r9, #:lower16:clk_enable
	movt	r2, #:upper16:mem_map
	movt	r3, #:upper16:__pv_phys_offset
	mov	r4, r0
	mov	r8, r1
	movt	r5, #:upper16:__pm_runtime_resume
	movt	r6, #:upper16:_raw_write_lock_irqsave
	str	r2, [sp, #8]
	movt	r9, #:upper16:clk_enable
	str	r3, [sp, #12]
	mvn	r7, #18
	mov	r10, #0
	b	.L107
.L109:
	movw	r3, #:lower16:_raw_write_unlock_irqrestore
	mov	r0, fp
	movt	r3, #:upper16:_raw_write_unlock_irqrestore
	mov	r7, #0
	blx	r3
.L107:
	mov	r1, r10
	mov	r0, r4
	bl	get_sysmmu_data
	subs	r10, r0, #0
	beq	.L126
	ldr	r0, [r10, #8]
	mov	r1, #4
	blx	r5
	cmp	r0, #0
	blt	.L108
	add	fp, r10, #28
	mov	r0, fp
	blx	r6
	ldr	r3, [r10, #24]
	mov	r1, r0
	add	r3, r3, #1
	cmp	r3, #1
	str	r3, [r10, #24]
	bne	.L109
	ldr	r0, [r10, #20]
	cmp	r0, #0
	beq	.L110
	str	r1, [sp]
	blx	r9
	ldr	r1, [sp]
.L110:
	ldr	r3, [r10, #16]
	cmp	r8, #0
	movne	r0, #0
	movne	r2, r8
	strne	r0, [r3, #4]
	beq	.L127
.L112:
	mov	r0, #1
	str	r2, [r3, #20]
	str	r0, [r3, #12]
	ldr	r3, [r10, #40]
	cmp	r3, #0
	bne	.L113
	ldr	r3, [r10, #16]
	ldr	r3, [r3, #52]
@ 395 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/s5p-sysmmu.c" 1
	dsb
@ 0 "" 2
	mov	r3, r3, lsr #28
	str	r3, [r10, #40]
.L113:
	cmp	r3, #3
	beq	.L128
.L114:
	ldr	r3, [r10, #16]
	mov	r2, #5
	str	r2, [r3]
	b	.L109
.L128:
	ldr	ip, [r10, #16]
	mov	r3, #4096
	movt	r3, 8192
	mov	r0, #0
	mvn	r2, #1
	str	r3, [ip, #4]
	ldr	r3, [r10, #16]
	str	r0, [r3, #76]
	str	r2, [r3, #80]
	ldr	r3, [r10, #16]
	str	r0, [r3, #84]
	str	r2, [r3, #88]
	b	.L114
.L126:
	and	r7, r7, r7, asr #31
.L122:
	mov	r0, r7
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L108:
	ldr	r5, .L129
	mov	r7, r0
.L120:
	ldr	r10, [r10, #4]
	cmp	r10, r5
	beq	.L122
	ldr	r3, [r10, #12]
	cmp	r4, r3
	bne	.L120
	mov	r0, r10
	bl	__sysmmu_disable
	b	.L120
.L127:
	ldr	r2, [sp, #4]
	mov	ip, #32
	ldr	lr, [sp, #8]
	str	ip, [r3, #4]
	ldr	r0, [r2]
	ldr	r2, [lr]
	ldr	lr, [sp, #12]
	rsb	r2, r2, r0
	mov	r2, r2, asr #2
	ldr	ip, [lr]
	rsb	r0, r2, r2, asl #3
	add	r0, r0, r0, asl #6
	add	r0, r2, r0, asl #3
	rsb	r0, r0, r0, asl #15
	add	r2, r2, r0, asl #3
	add	r2, r2, ip, lsr #12
	mov	r2, r2, asl #12
	b	.L112
.L130:
	.align	2
.L129:
	.word	.LANCHOR0+80
	.fnend
	.size	s5p_sysmmu_enable, .-s5p_sysmmu_enable
	.align	2
	.global	s5p_sysmmu_disable
	.type	s5p_sysmmu_disable, %function
s5p_sysmmu_disable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r5, r0
	mov	r4, #0
	b	.L132
.L133:
	bl	__sysmmu_disable
.L132:
	mov	r1, r4
	mov	r0, r5
	bl	get_sysmmu_data
	subs	r4, r0, #0
	bne	.L133
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	s5p_sysmmu_disable, .-s5p_sysmmu_disable
	.align	2
	.global	s5p_sysmmu_tlb_invalidate
	.type	s5p_sysmmu_tlb_invalidate, %function
s5p_sysmmu_tlb_invalidate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r7, #:lower16:_raw_read_lock_irqsave
	movw	r6, #:lower16:_raw_read_unlock_irqrestore
	mov	r8, r0
	movt	r7, #:upper16:_raw_read_lock_irqsave
	movt	r6, #:upper16:_raw_read_unlock_irqrestore
	mov	r4, #0
	mov	fp, #7
	mov	r10, #1
	mov	r9, #5
	b	.L135
.L137:
	blx	r7
	ldr	r3, [r4, #24]
	mov	r1, r0
	mov	r0, r5
	cmp	r3, #0
	beq	.L136
	ldr	r3, [r4, #16]
	str	fp, [r3]
	ldr	r3, [r4, #16]
	str	r10, [r3, #12]
	ldr	r3, [r4, #16]
	str	r9, [r3]
.L136:
	blx	r6
.L135:
	mov	r1, r4
	mov	r0, r8
	bl	get_sysmmu_data
	subs	r4, r0, #0
	add	r5, r4, #28
	mov	r0, r5
	bne	.L137
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.fnend
	.size	s5p_sysmmu_tlb_invalidate, .-s5p_sysmmu_tlb_invalidate
	.align	2
	.global	s5p_sysmmu_set_tablebase_pgd
	.type	s5p_sysmmu_set_tablebase_pgd, %function
s5p_sysmmu_set_tablebase_pgd:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:mem_map
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movt	r3, #:upper16:mem_map
	.pad #12
	sub	sp, sp, #12
	movw	r7, #:lower16:_raw_read_lock_irqsave
	movw	fp, #:lower16:empty_zero_page
	str	r3, [sp]
	movw	r3, #:lower16:__pv_phys_offset
	movt	r3, #:upper16:__pv_phys_offset
	movw	r6, #:lower16:_raw_read_unlock_irqrestore
	mov	r5, r1
	movt	r7, #:upper16:_raw_read_lock_irqsave
	movt	fp, #:upper16:empty_zero_page
	str	r3, [sp, #4]
	movt	r6, #:upper16:_raw_read_unlock_irqrestore
	mov	r8, r0
	mov	r4, #0
	mov	r9, #7
	bl	s5p_sysmmu_tlb_invalidate
	b	.L142
.L146:
	blx	r7
	ldr	r3, [r4, #24]
	mov	r1, r0
	mov	r0, #0
	mov	r2, r5
	cmp	r3, r0
	beq	.L143
	ldr	r3, [r4, #16]
	cmp	r5, r0
	str	r9, [r3]
	ldr	r3, [r4, #16]
	strne	r0, [r3, #4]
	beq	.L150
.L145:
	mov	ip, #1
	str	r2, [r3, #20]
	str	ip, [r3, #12]
	mov	r0, #5
	ldr	r3, [r4, #16]
	str	r0, [r3]
.L143:
	mov	r0, r10
	blx	r6
.L142:
	mov	r1, r4
	mov	r0, r8
	bl	get_sysmmu_data
	subs	r4, r0, #0
	add	r10, r4, #28
	mov	r0, r10
	bne	.L146
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L150:
	ldr	lr, [sp]
	mov	ip, #32
	ldr	r0, [fp]
	str	ip, [r3, #4]
	ldr	r2, [lr]
	ldr	lr, [sp, #4]
	rsb	r2, r2, r0
	mov	r2, r2, asr #2
	ldr	ip, [lr]
	rsb	r0, r2, r2, asl #3
	add	r0, r0, r0, asl #6
	add	r0, r2, r0, asl #3
	rsb	r0, r0, r0, asl #15
	add	r2, r2, r0, asl #3
	add	r2, r2, ip, lsr #12
	mov	r2, r2, asl #12
	b	.L145
	.fnend
	.size	s5p_sysmmu_set_tablebase_pgd, .-s5p_sysmmu_set_tablebase_pgd
	.align	2
	.global	s5p_sysmmu_tlb_invalidate_entry
	.type	s5p_sysmmu_tlb_invalidate_entry, %function
s5p_sysmmu_tlb_invalidate_entry:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	fp, #:lower16:_raw_read_lock_irqsave
	movw	ip, #:lower16:_raw_read_unlock_irqrestore
	mov	r9, r1
	mov	r8, r2
	mov	r5, r3
	movt	fp, #:upper16:_raw_read_lock_irqsave
	mov	r4, #0
	mov	r7, #7
	mov	r6, #5
	.pad #12
	sub	sp, sp, #12
	movt	ip, #:upper16:_raw_read_unlock_irqrestore
	str	r0, [sp, #4]
	str	ip, [sp]
.L152:
	mov	r1, r4
	ldr	r0, [sp, #4]
	bl	get_sysmmu_data
	subs	r4, r0, #0
	beq	.L164
	add	r10, r4, #28
	mov	r0, r10
	blx	fp
	ldr	r3, [r4, #24]
	mov	lr, r0
	cmp	r3, #0
	beq	.L153
	cmp	r8, #0
	beq	.L153
	mov	r3, r8
	mov	r2, r9
.L155:
	ldr	r1, [r4, #16]
	bic	r0, r2, #4080
	bic	r0, r0, #15
	subs	r3, r3, #1
	orr	r0, r0, #1
	add	r2, r2, r5
	str	r7, [r1]
	ldr	r1, [r4, #16]
	str	r0, [r1, #16]
	ldr	r1, [r4, #16]
	str	r6, [r1]
	bne	.L155
	sub	r8, r8, #1
	add	r9, r9, r5
	mla	r9, r5, r8, r9
	mov	r8, r3
.L153:
	mov	r0, r10
	mov	r1, lr
	ldr	ip, [sp]
	blx	ip
	b	.L152
.L164:
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.fnend
	.size	s5p_sysmmu_tlb_invalidate_entry, .-s5p_sysmmu_tlb_invalidate_entry
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	sysmmu_fault_name, %object
	.size	sysmmu_fault_name, 36
sysmmu_fault_name:
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.type	fault_reg_offset, %object
	.size	fault_reg_offset, 18
fault_reg_offset:
	.short	36
	.short	44
	.short	40
	.short	48
	.short	44
	.short	44
	.short	40
	.short	40
	.space	2
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	s5p_sysmmu_driver, %object
	.size	s5p_sysmmu_driver, 80
s5p_sysmmu_driver:
	.word	s5p_sysmmu_probe
	.space	16
	.word	.LC17
	.space	4
	.word	0
	.space	44
	.space	4
	.type	sysmmu_list, %object
	.size	sysmmu_list, 8
sysmmu_list:
	.word	sysmmu_list
	.word	sysmmu_list
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"/media/system1/root/CM14/kernel/samsung/smdk4412/ar"
	.ascii	"ch/arm/plat-s5p/s5p-sysmmu.c\000"
.LC1:
	.ascii	"<3>%s occured at 0x%lx(Page table base: 0x%lx)\012\000"
.LC2:
	.ascii	"<3>\011Lv1 entry: 0x%lx\012\000"
	.space	2
.LC3:
	.ascii	"<3>\011Lv2 entry: 0x%lx\012\000"
	.space	2
.LC4:
	.ascii	"<3>\011\011Generating Kernel OOPS... because it is "
	.ascii	"unrecoverable.\012\000"
	.space	3
.LC5:
	.ascii	"%s is not handled.\012\000"
.LC6:
	.ascii	"Not enough memory for private data.\012\000"
	.space	3
.LC7:
	.ascii	"Unable to set driver's private data.\012\000"
	.space	2
.LC8:
	.ascii	"Failed to get resource.\012\000"
	.space	3
.LC9:
	.ascii	"Failed to request memory region.\012\000"
	.space	2
.LC10:
	.ascii	"Failed to map IO area\012\000"
	.space	1
.LC11:
	.ascii	"Failed to get irq resource.\012\000"
	.space	3
.LC12:
	.ascii	"Failed to request irq.\012\000"
.LC13:
	.ascii	"sysmmu\000"
	.space	1
.LC14:
	.ascii	"Initialized for %s.\012\000"
	.space	3
.LC15:
	.ascii	"Initialized for %s.%d.\012\000"
.LC16:
	.ascii	"Probing system MMU failed!\000"
	.space	1
.LC17:
	.ascii	"s5p-sysmmu\000"
	.space	1
.LC18:
	.ascii	"PAGE FAULT\000"
	.space	1
.LC19:
	.ascii	"AR MULTI-HIT FAULT\000"
	.space	1
.LC20:
	.ascii	"AW MULTI-HIT FAULT\000"
	.space	1
.LC21:
	.ascii	"BUS ERROR\000"
	.space	2
.LC22:
	.ascii	"AR SECURITY PROTECTION FAULT\000"
	.space	3
.LC23:
	.ascii	"AR ACCESS PROTECTION FAULT\000"
	.space	1
.LC24:
	.ascii	"AW SECURITY PROTECTION FAULT\000"
	.space	3
.LC25:
	.ascii	"AW ACCESS PROTECTION FAULT\000"
	.space	1
.LC26:
	.ascii	"UNKNOWN FAULT\000"
	.section	.initcall4.init,"aw",%progbits
	.align	2
	.type	__initcall_s5p_sysmmu_init4, %object
	.size	__initcall_s5p_sysmmu_init4, 4
__initcall_s5p_sysmmu_init4:
	.word	s5p_sysmmu_init
	.ident	"GCC: (GNU) 4.8"
