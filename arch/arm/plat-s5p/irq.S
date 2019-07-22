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
	.file	"irq.c"
	.text
	.align	2
	.global	s5p_init_irq
	.type	s5p_init_irq, %function
s5p_init_irq:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:s3c_init_vic_timer_irq
	mov	r0, #5
	movt	r3, #:upper16:s3c_init_vic_timer_irq
	mov	r1, #11
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:s3c_init_uart_irqs
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:s3c_init_uart_irqs
	mov	r1, #4
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	s5p_init_irq, .-s5p_init_irq
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	uart_irqs, %object
	.size	uart_irqs, 48
uart_irqs:
	.word	-50331648
	.word	16
	.word	116
	.word	-50266112
	.word	20
	.word	117
	.word	-50200576
	.word	24
	.word	118
	.word	-50135040
	.word	28
	.word	119
	.ident	"GCC: (GNU) 4.8"
