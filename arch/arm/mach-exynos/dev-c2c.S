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
	.file	"dev-c2c.c"
	.text
	.align	2
	.global	exynos_c2c_set_platdata
	.type	exynos_c2c_set_platdata, %function
exynos_c2c_set_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	mov	r2, #0
	ldr	r3, [r0]
	movt	r2, 17186
	mov	r4, r0
	cmp	r3, #0
	movweq	r3, #:lower16:exynos_c2c_cfg_gpio
	movteq	r3, #:upper16:exynos_c2c_cfg_gpio
	streq	r3, [r0]
	ldr	r3, [r0, #4]
	cmp	r3, #0
	movweq	r3, #:lower16:exynos_c2c_set_cprst
	movteq	r3, #:upper16:exynos_c2c_set_cprst
	streq	r3, [r0, #4]
	ldr	r3, [r0, #8]
	cmp	r3, #0
	movweq	r3, #:lower16:exynos_c2c_clear_cprst
	movteq	r3, #:upper16:exynos_c2c_clear_cprst
	streq	r3, [r0, #8]
	movw	r3, #:lower16:samsung_cpu_id
	movt	r3, #:upper16:samsung_cpu_id
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmp	r3, r2
	beq	.L5
	cmn	r3, #465567744
	beq	.L5
.L6:
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	str	r4, [r3, #92]
	ldmfd	sp!, {r4, pc}
.L5:
@ 74 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/dev-c2c.c" 1
	dsb
@ 0 "" 2
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L7
	blx	r3
.L7:
	mov	r2, #0
	mov	r1, #1
	movt	r2, 65048
	movw	r3, #:lower16:samsung_rev
	movt	r3, #:upper16:samsung_rev
	str	r1, [r2, #36]
	blx	r3
	cmp	r0, #15
	movls	r3, #268
	movtls	r3, 64528
	strls	r3, [r4, #56]
	b	.L6
	.fnend
	.size	exynos_c2c_set_platdata, .-exynos_c2c_set_platdata
	.global	exynos_device_c2c
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	exynos_device_c2c, %object
	.size	exynos_device_c2c, 360
exynos_device_c2c:
	.word	.LC0
	.word	-1
	.space	252
	.word	exynos_c2c_dma_mask
	.word	-1
	.word	0
	.space	72
	.word	4
	.word	exynos_c2c_resource
	.space	8
	.type	exynos_c2c_dma_mask, %object
	.size	exynos_c2c_dma_mask, 8
exynos_c2c_dma_mask:
	.word	-1
	.word	0
	.type	exynos_c2c_resource, %object
	.size	exynos_c2c_resource, 112
exynos_c2c_resource:
	.word	273940480
	.word	274006015
	.space	4
	.word	512
	.space	12
	.word	274202624
	.word	274268159
	.space	4
	.word	512
	.space	12
	.word	97
	.word	97
	.space	4
	.word	1024
	.space	12
	.word	180
	.word	180
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"samsung-c2c\000"
	.ident	"GCC: (GNU) 4.8"
