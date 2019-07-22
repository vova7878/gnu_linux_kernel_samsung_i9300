	.cpu cortex-a9
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
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_arch_init, %function
s3c_arch_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L6
	ldr	r3, [r3, #20]
	blx	r3
	cmp	r0, #0
	popne	{r4, pc}
	movw	r0, #:lower16:s3c24xx_uart_devs
	movw	r3, #:lower16:platform_add_devices
	ldr	r1, [r4, #4]
	movt	r0, #:upper16:s3c24xx_uart_devs
	movt	r3, #:upper16:platform_add_devices
	pop	{r4, lr}
	bx	r3
.L6:
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:panic
	movt	r0, #:upper16:.LC0
	movt	r3, #:upper16:panic
	blx	r3
	.fnend
	.size	s3c_arch_init, .-s3c_arch_init
	.align	2
	.global	s3c_init_cpu
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_init_cpu, %function
s3c_init_cpu:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	subs	ip, r2, #0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r2, r0
	beq	.L8
	mov	r3, r1
	b	.L11
.L29:
	subs	ip, ip, #1
	add	r3, r3, #28
	beq	.L8
.L11:
	ldr	r1, [r3]
	ldr	r0, [r3, #4]
	eor	r1, r1, r2
	tst	r1, r0
	bne	.L29
	movw	r4, #:lower16:.LANCHOR0
	movw	r0, #:lower16:.LC5
	movw	r5, #:lower16:printk
	movt	r4, #:upper16:.LANCHOR0
	ldr	r1, [r3, #24]
	movt	r0, #:upper16:.LC5
	movt	r5, #:upper16:printk
	str	r3, [r4]
	blx	r5
	ldr	r3, [r4]
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L13
	ldr	r1, [r3, #20]
	cmp	r1, #0
	beq	.L13
	pop	{r4, r5, r6, lr}
	bx	r2	@ indirect register sibling call
.L8:
	movw	ip, #:lower16:.LANCHOR0
	movw	r0, #:lower16:.LC3
	movw	r3, #:lower16:printk
	mov	r1, r2
	movt	ip, #:upper16:.LANCHOR0
	mov	r2, #0
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC3
	str	r2, [ip]
	blx	r3
	movw	r0, #:lower16:.LC4
	movw	r3, #:lower16:panic
	movt	r0, #:upper16:.LC4
	movt	r3, #:upper16:panic
	blx	r3
.L13:
	movw	r0, #:lower16:.LC1
	ldr	r1, [r3, #24]
	movt	r0, #:upper16:.LC1
	blx	r5
	movw	r0, #:lower16:.LC2
	movw	r3, #:lower16:panic
	movt	r0, #:upper16:.LC2
	movt	r3, #:upper16:panic
	blx	r3
	.fnend
	.size	s3c_init_cpu, .-s3c_init_cpu
	.align	2
	.global	s3c24xx_init_clocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c24xx_init_clocks, %function
s3c24xx_init_clocks:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r2, #:lower16:.LANCHOR0
	push	{r4, lr}
	.save {r4, lr}
	movt	r2, #:upper16:.LANCHOR0
	mov	r3, #6912
	cmp	r0, #0
	movt	r3, 183
	ldr	r2, [r2]
	moveq	r0, r3
	cmp	r2, #0
	beq	.L35
	ldr	r3, [r2, #16]
	cmp	r3, #0
	beq	.L36
	pop	{r4, lr}
	bx	r3	@ indirect register sibling call
.L35:
	movw	r0, #:lower16:.LC6
	movw	r3, #:lower16:panic
	movt	r0, #:upper16:.LC6
	movt	r3, #:upper16:panic
	blx	r3
.L36:
	movw	r0, #:lower16:.LC7
	movw	r3, #:lower16:panic
	movt	r0, #:upper16:.LC7
	movt	r3, #:upper16:panic
	blx	r3
	.fnend
	.size	s3c24xx_init_clocks, .-s3c24xx_init_clocks
	.align	2
	.global	s3c24xx_init_uartdevs
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c24xx_init_uartdevs, %function
s3c24xx_init_uartdevs:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	lsl	r7, r3, #2
	mov	r5, r3
	mov	ip, r2
	movw	r3, #:lower16:memcpy
	add	r2, r7, r5
	mov	r6, r0
	mov	r4, r1
	ldr	r0, .L42
	lsl	r2, r2, #3
	mov	r1, ip
	movt	r3, #:upper16:memcpy
	blx	r3
	cmp	r5, #0
	ble	.L38
	movw	ip, #:lower16:s3c24xx_uart_devs
	ldr	r0, .L42
	movt	ip, #:upper16:s3c24xx_uart_devs
	movw	r8, #:lower16:s3c24xx_uart_src
	add	lr, r7, ip
	movt	r8, #:upper16:s3c24xx_uart_src
.L39:
	ldrb	r1, [r0]	@ zero_extendqisi2
	ldr	r2, [r8, r1, lsl #2]
	sxth	r1, r1
	str	r2, [ip], #4
	add	r3, r4, r1, lsl #3
	str	r6, [r2]
	cmp	lr, ip
	ldr	r1, [r4, r1, lsl #3]
	str	r1, [r2, #348]
	ldr	r1, [r3, #4]
	str	r0, [r2, #92]
	add	r0, r0, #40
	str	r1, [r2, #344]
	bne	.L39
.L38:
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	str	r5, [r3, #4]
	pop	{r4, r5, r6, r7, r8, pc}
.L43:
	.align	2
.L42:
	.word	.LANCHOR0+8
	.fnend
	.size	s3c24xx_init_uartdevs, .-s3c24xx_init_uartdevs
	.align	2
	.global	s3c24xx_init_uarts
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c24xx_init_uarts, %function
s3c24xx_init_uarts:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	ldr	r3, [r3]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L47
	bx	r3	@ indirect register sibling call
.L47:
	movw	r0, #:lower16:.LC8
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC8
	movt	r3, #:upper16:printk
	bx	r3
	.fnend
	.size	s3c24xx_init_uarts, .-s3c24xx_init_uarts
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	cpu, %object
	.size	cpu, 4
cpu:
	.space	4
	.type	nr_uarts, %object
	.size	nr_uarts, 4
nr_uarts:
	.space	4
	.type	uart_cfgs, %object
	.size	uart_cfgs, 160
uart_cfgs:
	.space	160
	.section	.initcall3.init,"aw",%progbits
	.align	2
	.type	__initcall_s3c_arch_init3, %object
	.size	__initcall_s3c_arch_init3, 4
__initcall_s3c_arch_init3:
	.word	s3c_arch_init
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"s3c_arch_init: NULL cpu\012\000"
	.space	3
.LC1:
	.ascii	"<3>CPU %s support not enabled\012\000"
	.space	1
.LC2:
	.ascii	"Unsupported Samsung CPU\000"
.LC3:
	.ascii	"<3>Unknown CPU type 0x%08lx\012\000"
	.space	3
.LC4:
	.ascii	"Unknown S3C24XX CPU\000"
.LC5:
	.ascii	"CPU %s (id 0x%08lx)\012\000"
	.space	3
.LC6:
	.ascii	"s3c24xx_init_clocks: no cpu setup?\012\000"
.LC7:
	.ascii	"s3c24xx_init_clocks: cpu has no clock init\012\000"
.LC8:
	.ascii	"<3>s3c24xx_init_uarts: cpu has no uart init\012\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
