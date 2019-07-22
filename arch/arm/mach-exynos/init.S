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
	.file	"init.c"
	.text
	.align	2
	.global	exynos_common_init_uarts
	.type	exynos_common_init_uarts, %function
exynos_common_init_uarts:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	subs	r3, r1, #0
	mov	r2, r0
	beq	.L4
	movw	r1, #:lower16:.LANCHOR0
	add	ip, r0, #40
	movt	r1, #:upper16:.LANCHOR0
	mov	lr, #0
	mov	r5, #1
.L5:
	ldr	r4, [ip, #-16]
	add	lr, lr, #1
	add	ip, ip, #40
	cmp	r4, #0
	ldrh	r4, [ip, #-78]
	streq	r5, [ip, #-72]
	streq	r1, [ip, #-56]
	streq	r5, [ip, #-52]
	cmp	lr, r3
	orr	r4, r4, #1
	strh	r4, [ip, #-78]	@ movhi
	bne	.L5
.L4:
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:s5p_uart_resources
	movw	ip, #:lower16:s3c24xx_init_uartdevs
	movt	r0, #:upper16:.LC0
	movt	r1, #:upper16:s5p_uart_resources
	movt	ip, #:upper16:s3c24xx_init_uartdevs
	blx	ip
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	exynos_common_init_uarts, .-exynos_common_init_uarts
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	exynos_serial_clocks, %object
	.size	exynos_serial_clocks, 16
exynos_serial_clocks:
	.word	.LC1
	.word	1
	.word	0
	.word	0
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"s5pv210-uart\000"
	.space	3
.LC1:
	.ascii	"uclk1\000"
	.ident	"GCC: (GNU) 4.8"
