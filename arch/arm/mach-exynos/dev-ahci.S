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
	.file	"dev-ahci.c"
	.text
	.align	2
	.type	wait_for_phy_ready, %function
wait_for_phy_ready:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r3, #:lower16:msecs_to_jiffies
	mov	r4, r0
	movt	r3, #:upper16:msecs_to_jiffies
	movw	r0, #3000
	mov	r5, r1
	blx	r3
	movw	r2, #:lower16:jiffies
	movt	r2, #:upper16:jiffies
	ldr	r1, [r2]
	ldr	r3, [r4]
	add	r0, r0, r1
	tst	r3, r5
	beq	.L2
	b	.L6
.L9:
	ldr	r3, [r4]
	tst	r3, r5
	bne	.L6
.L2:
	ldr	r3, [r2]
	rsb	r3, r3, r0
	cmp	r3, #0
	bge	.L9
	mvn	r0, #0
	ldmfd	sp!, {r3, r4, r5, pc}
.L6:
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	wait_for_phy_ready, .-wait_for_phy_ready
	.align	2
	.type	exynos4_ahci_init, %function
exynos4_ahci_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r8, r0
	movw	r5, #:lower16:__arm_ioremap
	mov	r0, #0
	mov	r6, r1
	movt	r0, 4701
	movt	r5, #:upper16:__arm_ioremap
	mov	r1, #65536
	mov	r2, #0
	movw	r4, #:lower16:.LANCHOR0
	blx	r5
	cmp	r0, #0
	movt	r4, #:upper16:.LANCHOR0
	str	r0, [r4]
	beq	.L32
	mov	r0, #0
	mov	r1, #16
	movt	r0, 4715
	mov	r2, #0
	blx	r5
	cmp	r0, #0
	str	r0, [r4, #4]
	beq	.L33
	movw	r1, #:lower16:.LC2
	movw	r5, #:lower16:clk_get
	movt	r1, #:upper16:.LC2
	movt	r5, #:upper16:clk_get
	mov	r0, r8
	blx	r5
	cmn	r0, #4096
	mov	r9, r0
	bhi	.L34
	movw	r7, #:lower16:clk_enable
	movt	r7, #:upper16:clk_enable
	blx	r7
	movw	r1, #:lower16:.LC4
	mov	r0, r8
	movt	r1, #:upper16:.LC4
	blx	r5
	cmn	r0, #4096
	mov	r10, r0
	bhi	.L35
	blx	r7
	movw	r1, #:lower16:.LC6
	mov	r0, r8
	movt	r1, #:upper16:.LC6
	blx	r5
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L36
	blx	r7
	movw	r1, #22208
	movw	r3, #:lower16:clk_set_rate
	mov	r0, r5
	movt	r1, 1022
	movt	r3, #:upper16:clk_set_rate
	blx	r3
	mov	r2, #0
	mov	r3, #1
	movt	r2, 65048
	movw	r0, #:lower16:.LANCHOR1
	str	r3, [r2, #1824]
	mov	r1, #256
	ldr	ip, [r4]
	movt	r0, #:upper16:.LANCHOR1
	ldr	r5, [r4, #4]
	mov	r2, #0
	mov	lr, #480
	movt	r1, 7168
	str	lr, [r5, #4]
	str	r1, [r5]
	str	r3, [r6, #12]
.L21:
	mov	r3, r0
	ldrb	r1, [r3, r2]!	@ zero_extendqisi2
	add	r2, r2, #2
	cmp	r2, #44
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	strb	r3, [ip, r1, asl #2]
	bne	.L21
	ldr	lr, .L39
	mov	r2, #0
.L23:
	mov	r3, lr
	ldrb	r0, [r3, r2]!	@ zero_extendqisi2
	add	r2, r2, #2
	cmp	r2, #34
	ldrb	r1, [r3, #1]	@ zero_extendqisi2
	add	r3, r0, #512
	strb	r1, [ip, r3, asl #2]
	bne	.L23
	ldr	lr, .L39+4
	mov	r2, #0
.L25:
	mov	r3, lr
	ldrb	r0, [r3, r2]!	@ zero_extendqisi2
	add	r2, r2, #2
	cmp	r2, #110
	ldrb	r1, [r3, #1]	@ zero_extendqisi2
	add	r3, r0, #2560
	strb	r1, [ip, r3, asl #2]
	bne	.L25
	mov	r3, #7
	mov	r0, r5
	strb	r3, [ip]
	mov	r1, #262144
	ldr	r3, [r5]
	orr	r3, r3, #1024
	str	r3, [r0], #8
	bl	wait_for_phy_ready
	cmp	r0, #0
	blt	.L37
	ldr	r0, [r4, #4]
	mov	r3, #10240
	ldr	r2, [r4]
	mov	ip, #3
	mov	r1, #65536
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	strb	ip, [r2, r3]
	ldr	r3, [r0]
	orr	r3, r3, #512
	str	r3, [r0], #8
	bl	wait_for_phy_ready
	cmp	r0, #0
	blt	.L38
	ldr	r3, [r4, #4]
	mov	r0, #0
	ldr	r2, [r3]
	orr	r2, r2, #524288
	str	r2, [r3]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L33:
	movw	r6, #:lower16:__arm_iounmap
	movw	r1, #:lower16:.LC1
	movw	r3, #:lower16:dev_err
	movt	r6, #:upper16:__arm_iounmap
	mvn	r5, #11
	mov	r0, r8
	movt	r1, #:upper16:.LC1
	movt	r3, #:upper16:dev_err
	blx	r3
.L14:
	ldr	r0, [r4]
	blx	r6
	mov	r0, r5
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L32:
	movw	r1, #:lower16:.LC0
	movw	r3, #:lower16:dev_err
	mov	r0, r8
	movt	r1, #:upper16:.LC0
	movt	r3, #:upper16:dev_err
	blx	r3
	mvn	r0, #11
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L37:
	movw	r0, #:lower16:.LC8
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC8
	blx	r3
	mvn	r0, #15
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L36:
	movw	r1, #:lower16:.LC7
	movw	r3, #:lower16:dev_err
	movt	r1, #:upper16:.LC7
	movt	r3, #:upper16:dev_err
	mov	r0, r8
	movw	r7, #:lower16:clk_disable
	blx	r3
	movt	r7, #:upper16:clk_disable
	mov	r0, r10
	movw	r6, #:lower16:clk_put
	blx	r7
	movt	r6, #:upper16:clk_put
	mov	r0, r10
	blx	r6
.L18:
	mov	r0, r9
	blx	r7
	mov	r0, r9
	blx	r6
.L16:
	movw	r6, #:lower16:__arm_iounmap
	ldr	r0, [r4, #4]
	movt	r6, #:upper16:__arm_iounmap
	blx	r6
	b	.L14
.L35:
	movw	r1, #:lower16:.LC5
	movw	r3, #:lower16:dev_err
	mov	r0, r8
	movt	r1, #:upper16:.LC5
	movt	r3, #:upper16:dev_err
	movw	r7, #:lower16:clk_disable
	movw	r6, #:lower16:clk_put
	mov	r5, r10
	blx	r3
	movt	r7, #:upper16:clk_disable
	movt	r6, #:upper16:clk_put
	b	.L18
.L34:
	movw	r1, #:lower16:.LC3
	movw	r3, #:lower16:dev_err
	mov	r0, r8
	movt	r1, #:upper16:.LC3
	movt	r3, #:upper16:dev_err
	mov	r5, r9
	blx	r3
	b	.L16
.L38:
	movw	r0, #:lower16:.LC9
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC9
	blx	r3
	mvn	r0, #15
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L40:
	.align	2
.L39:
	.word	.LANCHOR1+44
	.word	.LANCHOR1+80
	.fnend
	.size	exynos4_ahci_init, .-exynos4_ahci_init
	.global	exynos4_device_ahci
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	exynos4_sataphy_cmu, %object
	.size	exynos4_sataphy_cmu, 44
exynos4_sataphy_cmu:
	.byte	0
	.byte	6
	.byte	2
	.byte	-128
	.byte	34
	.byte	-96
	.byte	35
	.byte	66
	.byte	46
	.byte	4
	.byte	47
	.byte	80
	.byte	48
	.byte	112
	.byte	49
	.byte	2
	.byte	50
	.byte	37
	.byte	51
	.byte	64
	.byte	52
	.byte	1
	.byte	53
	.byte	64
	.byte	97
	.byte	46
	.byte	99
	.byte	94
	.byte	101
	.byte	66
	.byte	102
	.byte	-47
	.byte	103
	.byte	32
	.byte	104
	.byte	40
	.byte	105
	.byte	120
	.byte	106
	.byte	4
	.byte	107
	.byte	-56
	.byte	108
	.byte	6
	.type	exynos4_sataphy_lane, %object
	.size	exynos4_sataphy_lane, 34
exynos4_sataphy_lane:
	.byte	0
	.byte	2
	.byte	5
	.byte	16
	.byte	6
	.byte	-124
	.byte	7
	.byte	4
	.byte	8
	.byte	-32
	.byte	16
	.byte	35
	.byte	19
	.byte	5
	.byte	20
	.byte	48
	.byte	21
	.byte	0
	.byte	23
	.byte	112
	.byte	24
	.byte	-14
	.byte	25
	.byte	30
	.byte	26
	.byte	24
	.byte	27
	.byte	13
	.byte	28
	.byte	8
	.byte	80
	.byte	96
	.byte	81
	.byte	15
	.space	2
	.type	exynos4_sataphy_comlane, %object
	.size	exynos4_sataphy_comlane, 110
exynos4_sataphy_comlane:
	.byte	1
	.byte	32
	.byte	3
	.byte	64
	.byte	4
	.byte	60
	.byte	5
	.byte	125
	.byte	6
	.byte	29
	.byte	7
	.byte	-49
	.byte	8
	.byte	5
	.byte	9
	.byte	99
	.byte	10
	.byte	41
	.byte	11
	.byte	-60
	.byte	12
	.byte	1
	.byte	13
	.byte	3
	.byte	14
	.byte	40
	.byte	15
	.byte	-104
	.byte	16
	.byte	25
	.byte	19
	.byte	-128
	.byte	20
	.byte	-16
	.byte	21
	.byte	-48
	.byte	57
	.byte	-96
	.byte	58
	.byte	-96
	.byte	59
	.byte	-96
	.byte	60
	.byte	-96
	.byte	61
	.byte	-96
	.byte	62
	.byte	-96
	.byte	63
	.byte	-96
	.byte	64
	.byte	66
	.byte	66
	.byte	-128
	.byte	67
	.byte	88
	.byte	69
	.byte	68
	.byte	70
	.byte	92
	.byte	71
	.byte	-122
	.byte	72
	.byte	-115
	.byte	73
	.byte	-48
	.byte	74
	.byte	9
	.byte	75
	.byte	-112
	.byte	76
	.byte	7
	.byte	77
	.byte	64
	.byte	81
	.byte	32
	.byte	82
	.byte	50
	.byte	127
	.byte	-40
	.byte	-128
	.byte	26
	.byte	-127
	.byte	-1
	.byte	-126
	.byte	17
	.byte	-125
	.byte	0
	.byte	-121
	.byte	-16
	.byte	-121
	.byte	-1
	.byte	-121
	.byte	-1
	.byte	-121
	.byte	-1
	.byte	-121
	.byte	-1
	.byte	-116
	.byte	28
	.byte	-115
	.byte	-62
	.byte	-114
	.byte	-61
	.byte	-113
	.byte	63
	.byte	-112
	.byte	10
	.byte	-106
	.byte	-8
	.data
	.align	3
	.type	exynos4_device_ahci, %object
	.size	exynos4_device_ahci, 360
exynos4_device_ahci:
	.word	.LC10
	.word	-1
	.space	84
	.word	exynos4_ahci_pdata
	.space	164
	.word	exynos4_ahci_dmamask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	exynos4_ahci_resource
	.space	8
	.type	exynos4_ahci_dmamask, %object
	.size	exynos4_ahci_dmamask, 8
exynos4_ahci_dmamask:
	.word	-1
	.word	0
	.type	exynos4_ahci_resource, %object
	.size	exynos4_ahci_resource, 56
exynos4_ahci_resource:
	.word	307625984
	.word	307691519
	.space	4
	.word	512
	.space	12
	.word	180
	.word	180
	.space	4
	.word	1024
	.space	12
	.type	exynos4_ahci_pdata, %object
	.size	exynos4_ahci_pdata, 28
exynos4_ahci_pdata:
	.word	exynos4_ahci_init
	.space	24
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"failed to allocate memory for SATA PHY\012\000"
.LC1:
	.ascii	"failed to allocate memory for SATA PHY CTRL\012\000"
	.space	3
.LC2:
	.ascii	"sata\000"
	.space	3
.LC3:
	.ascii	"failed to get sata clock\012\000"
	.space	2
.LC4:
	.ascii	"sataphy\000"
.LC5:
	.ascii	"failed to get sataphy clock\012\000"
	.space	3
.LC6:
	.ascii	"sclk_sata\000"
	.space	2
.LC7:
	.ascii	"failed to get sclk_sata\012\000"
	.space	3
.LC8:
	.ascii	"<3>PHY CMU not ready\012\000"
	.space	2
.LC9:
	.ascii	"<3>PHY LANE not ready\012\000"
	.space	1
.LC10:
	.ascii	"ahci\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	phy_base, %object
	.size	phy_base, 4
phy_base:
	.space	4
	.type	phy_ctrl, %object
	.size	phy_ctrl, 4
phy_ctrl:
	.space	4
	.ident	"GCC: (GNU) 4.8"
