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
	.file	"dev-usbgadget.c"

	.text
	.align	2
	.global	s5p_usbgadget_set_platdata
	.type	s5p_usbgadget_set_platdata, %function
s5p_usbgadget_set_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r2, #:lower16:.LANCHOR0
	movw	r3, #:lower16:s3c_set_platdata
	movt	r2, #:upper16:.LANCHOR0
	movt	r3, #:upper16:s3c_set_platdata
	mov	r1, #16
	blx	r3
	ldr	r3, [r0]
	cmp	r3, #0
	movweq	r3, #:lower16:s5p_usb_phy_init
	movteq	r3, #:upper16:s5p_usb_phy_init
	streq	r3, [r0]
	ldr	r3, [r0, #4]
	cmp	r3, #0
	movweq	r3, #:lower16:s5p_usb_phy_exit
	movteq	r3, #:upper16:s5p_usb_phy_exit
	streq	r3, [r0, #4]
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	s5p_usbgadget_set_platdata, .-s5p_usbgadget_set_platdata
	.global	s3c_device_usb_mass_storage
	.global	s3c_device_android_usb
	.global	s3c_device_usbgadget
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	s3c_device_usbgadget, %object
	.size	s3c_device_usbgadget, 360
s3c_device_usbgadget:
	.word	.LC5
	.word	-1
	.space	252
	.word	s5p_device_usb_gadget_dmamask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	s3c_usbgadget_resource
	.space	8
	.type	s3c_device_usb_mass_storage, %object
	.size	s3c_device_usb_mass_storage, 360
s3c_device_usb_mass_storage:
	.word	.LC0
	.word	-1
	.space	84
	.word	ums_pdata
	.space	248
	.space	16
	.type	ums_pdata, %object
	.size	ums_pdata, 16
ums_pdata:
	.word	.LC1
	.word	.LC2
	.word	1
	.word	1
	.type	s3c_device_android_usb, %object
	.size	s3c_device_android_usb, 360
s3c_device_android_usb:
	.word	.LC3
	.word	-1
	.space	84
	.word	android_usb_pdata
	.space	248
	.space	16
	.type	android_usb_pdata, %object
	.size	android_usb_pdata, 44
android_usb_pdata:
	.short	1256
	.short	26718
	.space	4
	.word	.LC4
	.word	.LC1
	.word	device_serial
	.word	1
	.word	usb_products
	.word	0
	.word	usb_functions_all
	.space	8
	.type	device_serial, %object
	.size	device_serial, 17
device_serial:
	.ascii	"0123456789ABCDEF\000"
	.space	3
	.type	s5p_device_usb_gadget_dmamask, %object
	.size	s5p_device_usb_gadget_dmamask, 8
s5p_device_usb_gadget_dmamask:
	.word	-1
	.word	0
	.type	s3c_usbgadget_resource, %object
	.size	s3c_usbgadget_resource, 56
s3c_usbgadget_resource:
	.word	306708480
	.word	306712575
	.space	4
	.word	512
	.space	12
	.word	135
	.word	135
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"usb_mass_storage\000"
	.space	3
.LC1:
	.ascii	"SAMSUNG\000"
.LC2:
	.ascii	"S5P UMS\000"
.LC3:
	.ascii	"android_usb\000"
.LC4:
	.ascii	"S5P OTG-USB\000"
.LC5:
	.ascii	"s3c-usbgadget\000"
	.bss
	.align	2
	.type	usb_products, %object
	.size	usb_products, 12
usb_products:
	.space	12
	.type	usb_functions_all, %object
	.size	usb_functions_all, 0
usb_functions_all:
	.ident	"GCC: (GNU) 4.8"
