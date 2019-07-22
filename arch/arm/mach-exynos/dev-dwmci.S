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
	.file	"dev-dwmci.c"
	.text
	.align	2
	.type	exynos_dwmci_get_bus_wd, %function
exynos_dwmci_get_bus_wd:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #4
	bx	lr
	.fnend
	.size	exynos_dwmci_get_bus_wd, .-exynos_dwmci_get_bus_wd
	.align	2
	.type	exynos_dwmci_init, %function
exynos_dwmci_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:samsung_cpu_id
	mov	r1, #0
	movt	r3, #:upper16:samsung_cpu_id
	movt	r1, 17186
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmp	r3, r1
	beq	.L3
	cmn	r3, #465567744
	beq	.L3
	mov	r0, #0
	bx	lr
.L3:
	ldr	r0, [r2, #204]
	mov	r3, #1
	bfi	r3, r3, #16, #16
	mov	r1, #2
	movt	r1, 1
	str	r3, [r0, #68]
	mov	r0, #0
	ldr	r3, [r2, #204]
	str	r1, [r3, #72]
	bx	lr
	.fnend
	.size	exynos_dwmci_init, .-exynos_dwmci_init
	.align	2
	.type	exynos_dwmci_set_io_timing, %function
exynos_dwmci_set_io_timing:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #204]
	cmp	r1, #5
	ldr	r3, [r0, #8]
	ldreq	r2, [r2, #72]
	ldrne	r2, [r2, #68]
	str	r2, [r3, #156]
	bx	lr
	.fnend
	.size	exynos_dwmci_set_io_timing, .-exynos_dwmci_set_io_timing
	.align	2
	.global	exynos_dwmci_set_platdata
	.type	exynos_dwmci_set_platdata, %function
exynos_dwmci_set_platdata:
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
	beq	.L10
	cmn	r3, #465567744
	bne	.L11
.L10:
	movw	r2, #:lower16:.LANCHOR0
	movw	r3, #:lower16:s3c_set_platdata
	movt	r2, #:upper16:.LANCHOR0
	movt	r3, #:upper16:s3c_set_platdata
	mov	r1, #112
	blx	r3
	cmp	r0, #0
	ldmeqfd	sp!, {r3, pc}
	ldr	r3, [r0, #40]
	cmp	r3, #0
	movweq	r3, #:lower16:exynos_dwmci_init
	movteq	r3, #:upper16:exynos_dwmci_init
	streq	r3, [r0, #40]
	ldr	r3, [r0, #56]
	cmp	r3, #0
	movweq	r3, #:lower16:exynos_dwmci_get_bus_wd
	movteq	r3, #:upper16:exynos_dwmci_get_bus_wd
	streq	r3, [r0, #56]
	ldr	r3, [r0, #64]
	cmp	r3, #0
	movweq	r3, #:lower16:exynos_dwmci_set_io_timing
	movteq	r3, #:upper16:exynos_dwmci_set_io_timing
	streq	r3, [r0, #64]
	ldmfd	sp!, {r3, pc}
.L11:
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos_dwmci_set_platdata, .-exynos_dwmci_set_platdata
	.global	exynos_device_dwmci3
	.global	exynos_device_dwmci2
	.global	exynos_device_dwmci1
	.global	exynos_device_dwmci0
	.global	exynos_dwmci3_def_platdata
	.global	exynos_dwmci2_def_platdata
	.global	exynos_dwmci1_def_platdata
	.global	exynos_dwmci0_def_platdata
	.global	exynos_device_dwmci
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	exynos_device_dwmci, %object
	.size	exynos_device_dwmci, 360
exynos_device_dwmci:
	.word	.LC1
	.word	-1
	.space	84
	.word	exynos_dwmci_def_platdata
	.space	164
	.word	exynos_dwmci_dmamask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	exynos_dwmci_resource
	.space	8
	.type	exynos_device_dwmci3, %object
	.size	exynos_device_dwmci3, 360
exynos_device_dwmci3:
	.word	.LC1
	.word	3
	.space	84
	.word	exynos_dwmci3_def_platdata
	.space	164
	.word	exynos_dwmci_dmamask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	exynos5_dwmci3_resource
	.space	8
	.type	exynos_device_dwmci2, %object
	.size	exynos_device_dwmci2, 360
exynos_device_dwmci2:
	.word	.LC1
	.word	2
	.space	84
	.word	exynos_dwmci2_def_platdata
	.space	164
	.word	exynos_dwmci_dmamask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	exynos5_dwmci2_resource
	.space	8
	.type	exynos_device_dwmci1, %object
	.size	exynos_device_dwmci1, 360
exynos_device_dwmci1:
	.word	.LC1
	.word	1
	.space	84
	.word	exynos_dwmci1_def_platdata
	.space	164
	.word	exynos_dwmci_dmamask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	exynos5_dwmci1_resource
	.space	8
	.type	exynos_device_dwmci0, %object
	.size	exynos_device_dwmci0, 360
exynos_device_dwmci0:
	.word	.LC1
	.word	0
	.space	84
	.word	exynos_dwmci0_def_platdata
	.space	164
	.word	exynos_dwmci_dmamask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	exynos5_dwmci0_resource
	.space	8
	.type	exynos_dwmci3_def_platdata, %object
	.size	exynos_dwmci3_def_platdata, 112
exynos_dwmci3_def_platdata:
	.word	1
	.word	8
	.word	200000000
	.space	16
	.word	200
	.space	8
	.word	exynos_dwmci_init
	.space	12
	.word	exynos_dwmci_get_bus_wd
	.space	4
	.word	exynos_dwmci_set_io_timing
	.space	8
	.word	0
	.space	32
	.type	exynos_dwmci2_def_platdata, %object
	.size	exynos_dwmci2_def_platdata, 112
exynos_dwmci2_def_platdata:
	.word	1
	.word	8
	.word	200000000
	.space	16
	.word	200
	.space	8
	.word	exynos_dwmci_init
	.space	12
	.word	exynos_dwmci_get_bus_wd
	.space	4
	.word	exynos_dwmci_set_io_timing
	.space	8
	.word	0
	.space	32
	.type	exynos_dwmci1_def_platdata, %object
	.size	exynos_dwmci1_def_platdata, 112
exynos_dwmci1_def_platdata:
	.word	1
	.word	8
	.word	200000000
	.space	16
	.word	200
	.space	8
	.word	exynos_dwmci_init
	.space	12
	.word	exynos_dwmci_get_bus_wd
	.space	4
	.word	exynos_dwmci_set_io_timing
	.space	8
	.word	0
	.space	32
	.type	exynos_dwmci0_def_platdata, %object
	.size	exynos_dwmci0_def_platdata, 112
exynos_dwmci0_def_platdata:
	.word	1
	.word	8
	.word	200000000
	.space	16
	.word	200
	.space	8
	.word	exynos_dwmci_init
	.space	12
	.word	exynos_dwmci_get_bus_wd
	.space	4
	.word	exynos_dwmci_set_io_timing
	.space	8
	.word	0
	.space	32
	.type	exynos5_dwmci3_resource, %object
	.size	exynos5_dwmci3_resource, 56
exynos5_dwmci3_resource:
	.word	307494912
	.word	307499007
	.space	4
	.word	512
	.space	12
	.word	140
	.word	140
	.space	4
	.word	1024
	.space	12
	.type	exynos5_dwmci2_resource, %object
	.size	exynos5_dwmci2_resource, 56
exynos5_dwmci2_resource:
	.word	307429376
	.word	307433471
	.space	4
	.word	512
	.space	12
	.word	139
	.word	139
	.space	4
	.word	1024
	.space	12
	.type	exynos5_dwmci1_resource, %object
	.size	exynos5_dwmci1_resource, 56
exynos5_dwmci1_resource:
	.word	307363840
	.word	307367935
	.space	4
	.word	512
	.space	12
	.word	138
	.word	138
	.space	4
	.word	1024
	.space	12
	.type	exynos5_dwmci0_resource, %object
	.size	exynos5_dwmci0_resource, 56
exynos5_dwmci0_resource:
	.word	307298304
	.word	307302399
	.space	4
	.word	512
	.space	12
	.word	137
	.word	137
	.space	4
	.word	1024
	.space	12
	.type	exynos_dwmci_dmamask, %object
	.size	exynos_dwmci_dmamask, 8
exynos_dwmci_dmamask:
	.word	-1
	.word	0
	.type	exynos_dwmci_def_platdata, %object
	.size	exynos_dwmci_def_platdata, 112
exynos_dwmci_def_platdata:
	.word	1
	.word	8
	.word	80000000
	.space	16
	.word	200
	.space	8
	.word	exynos_dwmci_init
	.space	12
	.word	exynos_dwmci_get_bus_wd
	.space	4
	.word	exynos_dwmci_set_io_timing
	.space	44
	.type	exynos_dwmci_resource, %object
	.size	exynos_dwmci_resource, 56
exynos_dwmci_resource:
	.word	307560448
	.word	307564543
	.space	4
	.word	512
	.space	12
	.word	141
	.word	141
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"dwmci platform data support only exynos4/5!\012\000"
	.space	3
.LC1:
	.ascii	"dw_mmc\000"
	.ident	"GCC: (GNU) 4.8"
