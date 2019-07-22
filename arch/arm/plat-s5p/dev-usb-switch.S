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
	.file	"dev-usb-switch.c"
	.text
	.align	2
	.global	s5p_usbswitch_set_platdata
	.type	s5p_usbswitch_set_platdata, %function
s5p_usbswitch_set_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r2, #:lower16:.LANCHOR0
	movw	r3, #:lower16:s3c_set_platdata
	movt	r2, #:upper16:.LANCHOR0
	movt	r3, #:upper16:s3c_set_platdata
	mov	r1, #40
	movw	r6, #:lower16:__gpio_to_irq
	movw	r4, #:lower16:.LANCHOR1
	blx	r3
	movt	r4, #:upper16:.LANCHOR1
	mov	r5, r0
	movt	r6, #:upper16:__gpio_to_irq
	ldr	r0, [r0]
	blx	r6
	mov	r7, #1024
	str	r0, [r4]
	ldr	r0, [r5]
	blx	r6
	str	r7, [r4, #12]
	str	r0, [r4, #4]
	ldr	r0, [r5, #4]
	blx	r6
	str	r0, [r4, #28]
	ldr	r0, [r5, #4]
	blx	r6
	str	r7, [r4, #40]
	str	r0, [r4, #32]
	ldr	r0, [r5, #12]
	blx	r6
	str	r0, [r4, #56]
	ldr	r0, [r5, #12]
	blx	r6
	str	r7, [r4, #68]
	str	r0, [r4, #60]
	ldr	r0, [r5, #16]
	blx	r6
	str	r0, [r4, #84]
	ldr	r0, [r5, #16]
	blx	r6
	ldr	r1, .L2
	ldr	r2, .L2+4
	ldr	r3, .L2+8
	str	r0, [r4, #88]
	str	r7, [r4, #96]
	str	r1, [r5, #20]
	str	r2, [r5, #24]
	str	r3, [r5, #32]
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L3:
	.align	2
.L2:
	.word	s5p_device_ehci+8
	.word	s5p_device_ohci+8
	.word	s3c_device_usbgadget+8
	.fnend
	.size	s5p_usbswitch_set_platdata, .-s5p_usbswitch_set_platdata
	.global	s5p_device_usbswitch
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	s5p_device_usbswitch, %object
	.size	s5p_device_usbswitch, 360
s5p_device_usbswitch:
	.word	.LC0
	.word	-1
	.space	336
	.word	4
	.word	s5p_usbswitch_res
	.space	8
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"exynos-usb-switch\000"
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	s5p_usbswitch_res, %object
	.size	s5p_usbswitch_res, 112
s5p_usbswitch_res:
	.space	112
	.ident	"GCC: (GNU) 4.8"
