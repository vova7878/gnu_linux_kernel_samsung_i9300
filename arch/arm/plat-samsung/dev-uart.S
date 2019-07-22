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
	.file	"dev-uart.c"
	.text
	.global	s3c24xx_uart_devs
	.global	s3c24xx_uart_src
	.data
	.align	3
	.type	s3c24xx_uart_src, %object
	.size	s3c24xx_uart_src, 16
s3c24xx_uart_src:
	.word	s3c24xx_uart_device0
	.word	s3c24xx_uart_device1
	.word	s3c24xx_uart_device2
	.word	s3c24xx_uart_device3
	.type	s3c24xx_uart_device3, %object
	.size	s3c24xx_uart_device3, 360
s3c24xx_uart_device3:
	.space	4
	.word	3
	.space	352
	.type	s3c24xx_uart_device2, %object
	.size	s3c24xx_uart_device2, 360
s3c24xx_uart_device2:
	.space	4
	.word	2
	.space	352
	.type	s3c24xx_uart_device1, %object
	.size	s3c24xx_uart_device1, 360
s3c24xx_uart_device1:
	.space	4
	.word	1
	.space	352
	.bss
	.align	3
	.type	s3c24xx_uart_devs, %object
	.size	s3c24xx_uart_devs, 16
s3c24xx_uart_devs:
	.space	16
	.type	s3c24xx_uart_device0, %object
	.size	s3c24xx_uart_device0, 360
s3c24xx_uart_device0:
	.space	360
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
