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
	.file	"dma.c"
	.text
	.align	2
	.type	exynos_dma_init, %function
exynos_dma_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:samsung_cpu_id
	movt	r3, #:upper16:samsung_cpu_id
	mov	r2, #0
	movt	r2, 17186
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmp	r3, r2
	beq	.L2
	cmn	r3, #465567744
	beq	.L2
.L3:
	movw	r3, #:lower16:platform_add_devices
	mov	r1, #3
	movt	r3, #:upper16:platform_add_devices
	ldr	r0, .L5
	blx	r3
	ldmfd	sp!, {r3, pc}
.L2:
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	add	r1, r3, #360
	add	r2, r3, #848
	str	r1, [r3, #92]
	str	r2, [r3, #580]
	b	.L3
.L6:
	.align	2
.L5:
	.word	.LANCHOR0+976
	.fnend
	.size	exynos_dma_init, .-exynos_dma_init
	.global	exynos_device_pdma1
	.global	exynos_device_pdma0
	.global	exynos_device_mdma
	.global	exynos_mdma_pdata
	.section	.initcall3.init,"aw",%progbits
	.align	2
	.type	__initcall_exynos_dma_init3, %object
	.size	__initcall_exynos_dma_init3, 4
__initcall_exynos_dma_init3:
	.word	exynos_dma_init
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	exynos_device_pdma0, %object
	.size	exynos_device_pdma0, 360
exynos_device_pdma0:
	.word	.LC0
	.word	1
	.space	252
	.word	dma_dmamask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	exynos_pdma0_resource
	.space	8
	.type	exynos4212_pdma0_pdata, %object
	.size	exynos4212_pdma0_pdata, 128
exynos4212_pdma0_pdata:
	.word	37
	.word	36
	.word	41
	.word	40
	.word	60
	.word	61
	.word	22
	.word	23
	.word	26
	.word	27
	.word	17
	.word	15
	.word	16
	.word	20
	.word	21
	.word	0
	.word	1
	.word	4
	.word	5
	.word	8
	.word	9
	.word	46
	.word	47
	.word	52
	.word	53
	.word	56
	.word	57
	.word	28
	.word	29
	.word	30
	.word	64
	.word	65
	.type	exynos_device_pdma1, %object
	.size	exynos_device_pdma1, 360
exynos_device_pdma1:
	.word	.LC0
	.word	2
	.space	252
	.word	dma_dmamask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	exynos_pdma1_resource
	.space	8
	.type	exynos4212_pdma1_pdata, %object
	.size	exynos4212_pdma1_pdata, 128
exynos4212_pdma1_pdata:
	.word	37
	.word	36
	.word	39
	.word	38
	.word	62
	.word	63
	.word	24
	.word	25
	.word	17
	.word	15
	.word	16
	.word	18
	.word	19
	.word	0
	.word	1
	.word	2
	.word	3
	.word	6
	.word	7
	.word	50
	.word	51
	.word	54
	.word	55
	.word	58
	.word	59
	.word	48
	.word	49
	.word	33
	.word	66
	.word	67
	.word	77
	.word	77
	.type	exynos_dmacs, %object
	.size	exynos_dmacs, 12
exynos_dmacs:
	.word	exynos_device_mdma
	.word	exynos_device_pdma0
	.word	exynos_device_pdma1
	.type	exynos_pdma1_resource, %object
	.size	exynos_pdma1_resource, 56
exynos_pdma1_resource:
	.word	308871168
	.word	308875264
	.space	4
	.word	512
	.space	12
	.word	100
	.word	100
	.space	4
	.word	1024
	.space	12
	.type	exynos_pdma0_resource, %object
	.size	exynos_pdma0_resource, 56
exynos_pdma0_resource:
	.word	308805632
	.word	308809728
	.space	4
	.word	512
	.space	12
	.word	99
	.word	99
	.space	4
	.word	1024
	.space	12
	.space	4
	.type	exynos_device_mdma, %object
	.size	exynos_device_mdma, 360
exynos_device_mdma:
	.word	.LC0
	.word	0
	.space	84
	.word	exynos_mdma_pdata
	.space	164
	.word	dma_dmamask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	exynos_mdma_resource
	.space	8
	.type	exynos_mdma_pdata, %object
	.size	exynos_mdma_pdata, 128
exynos_mdma_pdata:
	.word	69
	.word	70
	.word	71
	.word	72
	.word	73
	.word	74
	.word	75
	.word	76
	.word	77
	.word	77
	.word	77
	.word	77
	.word	77
	.word	77
	.word	77
	.word	77
	.word	77
	.word	77
	.word	77
	.word	77
	.word	77
	.word	77
	.word	77
	.word	77
	.word	77
	.word	77
	.word	77
	.word	77
	.word	77
	.word	77
	.word	77
	.word	77
	.type	exynos_mdma_resource, %object
	.size	exynos_mdma_resource, 56
exynos_mdma_resource:
	.word	310706176
	.word	310710272
	.space	4
	.word	512
	.space	12
	.word	98
	.word	98
	.space	4
	.word	1024
	.space	12
	.type	dma_dmamask, %object
	.size	dma_dmamask, 8
dma_dmamask:
	.word	-1
	.word	0
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"s3c-pl330\000"
	.ident	"GCC: (GNU) 4.8"
