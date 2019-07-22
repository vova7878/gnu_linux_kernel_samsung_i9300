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
	.file	"dev-uart.c"
	.global	s5p_uart_resources
	.data
	.align	2
	.type	s5p_uart_resources, %object
	.size	s5p_uart_resources, 48
s5p_uart_resources:
	.word	s5p_uart0_resource
	.word	4
	.word	s5p_uart1_resource
	.word	4
	.word	s5p_uart2_resource
	.word	4
	.word	s5p_uart3_resource
	.word	4
	.word	s5p_uart4_resource
	.word	0
	.word	s5p_uart5_resource
	.word	0
	.type	s5p_uart3_resource, %object
	.size	s5p_uart3_resource, 112
s5p_uart3_resource:
	.word	327352320
	.word	327352575
	.space	4
	.word	512
	.space	12
	.word	28
	.word	28
	.space	4
	.word	1024
	.space	12
	.word	30
	.word	30
	.space	4
	.word	1024
	.space	12
	.word	29
	.word	29
	.space	4
	.word	1024
	.space	12
	.type	s5p_uart2_resource, %object
	.size	s5p_uart2_resource, 112
s5p_uart2_resource:
	.word	327286784
	.word	327287039
	.space	4
	.word	512
	.space	12
	.word	24
	.word	24
	.space	4
	.word	1024
	.space	12
	.word	26
	.word	26
	.space	4
	.word	1024
	.space	12
	.word	25
	.word	25
	.space	4
	.word	1024
	.space	12
	.type	s5p_uart1_resource, %object
	.size	s5p_uart1_resource, 112
s5p_uart1_resource:
	.word	327221248
	.word	327221503
	.space	4
	.word	512
	.space	12
	.word	20
	.word	20
	.space	4
	.word	1024
	.space	12
	.word	22
	.word	22
	.space	4
	.word	1024
	.space	12
	.word	21
	.word	21
	.space	4
	.word	1024
	.space	12
	.type	s5p_uart0_resource, %object
	.size	s5p_uart0_resource, 112
s5p_uart0_resource:
	.word	327155712
	.word	327155967
	.space	4
	.word	512
	.space	12
	.word	16
	.word	16
	.space	4
	.word	1024
	.space	12
	.word	18
	.word	18
	.space	4
	.word	1024
	.space	12
	.word	17
	.word	17
	.space	4
	.word	1024
	.space	12
	.bss
	.align	2
	.type	s5p_uart5_resource, %object
	.size	s5p_uart5_resource, 0
s5p_uart5_resource:
	.type	s5p_uart4_resource, %object
	.size	s5p_uart4_resource, 0
s5p_uart4_resource:
	.ident	"GCC: (GNU) 4.8"
