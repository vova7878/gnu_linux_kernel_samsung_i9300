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
	.file	"dev-tmu.c"
	.text
	.align	2
	.global	s5p_tmu_get_irqno
	.type	s5p_tmu_get_irqno, %function
s5p_tmu_get_irqno:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	mov	r1, r0
	movw	r3, #:lower16:platform_get_irq
	movw	r0, #:lower16:.LANCHOR0
	movt	r3, #:upper16:platform_get_irq
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	s5p_tmu_get_irqno, .-s5p_tmu_get_irqno
	.align	2
	.global	s5p_tmu_get_platdata
	.type	s5p_tmu_get_platdata, %function
s5p_tmu_get_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:dev_get_drvdata
	movt	r3, #:upper16:dev_get_drvdata
	ldr	r0, .L3
	blx	r3
	ldmfd	sp!, {r3, pc}
.L4:
	.align	2
.L3:
	.word	.LANCHOR0+8
	.fnend
	.size	s5p_tmu_get_platdata, .-s5p_tmu_get_platdata
	.align	2
	.global	s5p_tmu_set_platdata
	.type	s5p_tmu_set_platdata, %function
s5p_tmu_set_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:kmalloc_caches
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movt	r3, #:upper16:kmalloc_caches
	mov	r4, r0
	ldr	r0, [r3, #28]
	cmp	r0, #0
	beq	.L15
	movw	r3, #:lower16:kmem_cache_alloc_trace
	mov	r1, #208
	movt	r3, #:upper16:kmem_cache_alloc_trace
	mov	r2, #80
	blx	r3
	subs	ip, r0, #0
	beq	.L22
.L6:
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L8
	ldr	r7, .L24
	mov	r6, ip
	add	r8, r7, #32
.L9:
	mov	r5, r7
	add	r6, r6, #16
	ldmia	r5!, {r0, r1, r2, r3}
	add	r7, r7, #16
	cmp	r5, r8
	str	r0, [r6, #-16]	@ unaligned
	str	r1, [r6, #-12]	@ unaligned
	str	r2, [r6, #-8]	@ unaligned
	str	r3, [r6, #-4]	@ unaligned
	bne	.L9
	ldmia	r7!, {r0, r1}
	str	r0, [r6]	@ unaligned
	str	r1, [r6, #4]	@ unaligned
.L10:
	ldr	r3, [r4, #40]
	cmp	r3, #0
	ldreq	r3, .L24+4
	movne	r3, r4
	ldrne	r2, [r3, #40]!	@ unaligned
	ldmeqia	r3!, {r0, r1}
	ldrne	r3, [r3, #4]	@ unaligned
	strne	r2, [ip, #40]	@ unaligned
	streq	r0, [ip, #40]	@ unaligned
	streq	r1, [ip, #44]	@ unaligned
	strne	r3, [ip, #44]	@ unaligned
	ldr	r3, [r4, #48]
	cmp	r3, #0
	bne	.L23
.L14:
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	str	ip, [r3, #92]
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L8:
	mov	r3, r4
	mov	r2, ip
	add	r1, r4, #32
.L11:
	ldr	r7, [r3]	@ unaligned
	add	r3, r3, #16
	ldr	r6, [r3, #-12]	@ unaligned
	add	r2, r2, #16
	ldr	r5, [r3, #-8]	@ unaligned
	ldr	r0, [r3, #-4]	@ unaligned
	cmp	r3, r1
	str	r7, [r2, #-16]	@ unaligned
	str	r6, [r2, #-12]	@ unaligned
	str	r5, [r2, #-8]	@ unaligned
	str	r0, [r2, #-4]	@ unaligned
	bne	.L11
	ldr	r1, [r3]	@ unaligned
	ldr	r3, [r3, #4]	@ unaligned
	str	r1, [r2]	@ unaligned
	str	r3, [r2, #4]	@ unaligned
	b	.L10
.L15:
	mov	ip, #16
	b	.L6
.L23:
	ldr	r0, [r4, #48]!	@ unaligned
	ldr	r1, [r4, #4]	@ unaligned
	ldr	r2, [r4, #8]	@ unaligned
	str	r0, [ip, #48]	@ unaligned
	str	r1, [ip, #52]	@ unaligned
	str	r2, [ip, #56]	@ unaligned
	b	.L14
.L22:
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LANCHOR1
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR1
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L25:
	.align	2
.L24:
	.word	.LANCHOR0+360
	.word	.LANCHOR0+400
	.fnend
	.size	s5p_tmu_set_platdata, .-s5p_tmu_set_platdata
	.global	s5p_device_tmu
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.13380, %object
	.size	__func__.13380, 21
__func__.13380:
	.ascii	"s5p_tmu_set_platdata\000"
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	s5p_device_tmu, %object
	.size	s5p_device_tmu, 360
s5p_device_tmu:
	.word	.LC1
	.word	-1
	.space	336
	.word	2
	.word	s5p_tmu_resource
	.space	8
	.type	default_tmu_data, %object
	.size	default_tmu_data, 80
default_tmu_data:
	.word	78
	.word	80
	.word	87
	.word	103
	.word	110
	.word	120
	.word	80
	.word	85
	.space	8
	.word	800000
	.word	200000
	.space	12
	.word	24000000
	.word	3900
	.byte	1
	.byte	80
	.space	2
	.word	1000
	.word	10000
	.type	s5p_tmu_resource, %object
	.size	s5p_tmu_resource, 56
s5p_tmu_resource:
	.word	269221888
	.word	269287422
	.space	4
	.word	512
	.space	12
	.word	212
	.word	212
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>%s: no memory for platform data\012\000"
.LC1:
	.ascii	"s5p-tmu\000"
	.ident	"GCC: (GNU) 4.8"
