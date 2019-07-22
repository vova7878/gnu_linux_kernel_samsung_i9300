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
	.file	"board-smdk5250-usb.c"
	.text
	.align	2
	.global	exynos5_smdk5250_usb_init
	.type	exynos5_smdk5250_usb_init, %function
exynos5_smdk5250_usb_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r5, #:lower16:samsung_rev
	movt	r5, #:upper16:samsung_rev
	blx	r5
	cmp	r0, #15
	bhi	.L12
.L2:
	movw	r4, #:lower16:.LANCHOR0
	movw	r3, #:lower16:s5p_ehci_set_platdata
	movt	r4, #:upper16:.LANCHOR0
	movt	r3, #:upper16:s5p_ehci_set_platdata
	mov	r0, r4
	blx	r3
	movw	r3, #:lower16:s5p_ohci_set_platdata
	add	r0, r4, #24
	movt	r3, #:upper16:s5p_ohci_set_platdata
	blx	r3
	movw	r3, #:lower16:s5p_usbgadget_set_platdata
	add	r0, r4, #40
	movt	r3, #:upper16:s5p_usbgadget_set_platdata
	blx	r3
	movw	r3, #:lower16:exynos_ss_udc_set_platdata
	add	r0, r4, #56
	movt	r3, #:upper16:exynos_ss_udc_set_platdata
	blx	r3
	movw	r3, #:lower16:exynos_xhci_set_platdata
	add	r0, r4, #68
	movt	r3, #:upper16:exynos_xhci_set_platdata
	blx	r3
	blx	r5
	cmp	r0, #15
	bhi	.L4
	mov	r3, #0
	str	r3, [r4, #84]
	str	r3, [r4, #88]
.L5:
	blx	r5
	cmp	r0, #15
	ldr	r0, .L17
	movls	r3, #0
	strls	r3, [r4, #92]
	strls	r3, [r4, #96]
	movw	r3, #:lower16:s5p_usbswitch_set_platdata
	movt	r3, #:upper16:s5p_usbswitch_set_platdata
	blx	r3
.L7:
	movw	r0, #:lower16:.LANCHOR1
	movw	r3, #:lower16:platform_add_devices
	movt	r3, #:upper16:platform_add_devices
	mov	r1, #5
	movt	r0, #:upper16:.LANCHOR1
	blx	r3
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L12:
	movw	r2, #:lower16:.LC0
	movw	r3, #:lower16:gpio_request_one
	mov	r1, #2
	movt	r2, #:upper16:.LC0
	movt	r3, #:upper16:gpio_request_one
	mov	r0, #185
	blx	r3
	subs	r1, r0, #0
	bne	.L13
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r0, #185
	movt	r3, #:upper16:s3c_gpio_setpull
	blx	r3
	movw	r3, #:lower16:gpio_free
	mov	r0, #185
	movt	r3, #:upper16:gpio_free
	blx	r3
	b	.L2
.L4:
	mov	r3, #176
	movw	r2, #:lower16:.LC2
	movw	r6, #:lower16:gpio_request_one
	mov	r0, r3
	movt	r2, #:upper16:.LC2
	movt	r6, #:upper16:gpio_request_one
	mov	r1, #1
	str	r3, [r4, #80]
	blx	r6
	subs	r10, r0, #0
	bne	.L14
	movw	r9, #:lower16:s3c_gpio_cfgpin
	mvn	r1, #0
	ldr	r0, [r4, #80]
	movt	r9, #:upper16:s3c_gpio_cfgpin
	movw	r8, #:lower16:s3c_gpio_setpull
	movw	r7, #:lower16:gpio_free
	blx	r9
	movt	r8, #:upper16:s3c_gpio_setpull
	mov	r1, r10
	ldr	r0, [r4, #80]
	movt	r7, #:upper16:gpio_free
	blx	r8
	ldr	r0, [r4, #80]
	blx	r7
	mov	r3, #185
	movw	r2, #:lower16:.LC0
	mov	r1, r10
	mov	r0, r3
	movt	r2, #:upper16:.LC0
	str	r3, [r4, #88]
	blx	r6
	subs	r1, r0, #0
	bne	.L15
	ldr	r0, [r4, #88]
	blx	r8
	ldr	r0, [r4, #88]
	blx	r7
	mov	r3, #192
	movw	r2, #:lower16:.LC5
	mov	r0, r3
	movt	r2, #:upper16:.LC5
	mov	r1, #1
	str	r3, [r4, #84]
	blx	r6
	subs	r6, r0, #0
	bne	.L16
	ldr	r0, [r4, #84]
	mvn	r1, #0
	blx	r9
	mov	r1, r6
	ldr	r0, [r4, #84]
	blx	r8
	ldr	r0, [r4, #84]
	blx	r7
	b	.L5
.L13:
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC1
	blx	r3
	b	.L2
.L14:
	movw	r0, #:lower16:.LC3
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC3
	blx	r3
	b	.L7
.L15:
	movw	r0, #:lower16:.LC4
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC4
	blx	r3
	b	.L7
.L16:
	movw	r0, #:lower16:.LC6
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC6
	blx	r3
	b	.L7
.L18:
	.align	2
.L17:
	.word	.LANCHOR0+80
	.fnend
	.size	exynos5_smdk5250_usb_init, .-exynos5_smdk5250_usb_init
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	smdk5250_usb_devices, %object
	.size	smdk5250_usb_devices, 20
smdk5250_usb_devices:
	.word	s5p_device_ehci
	.word	s5p_device_ohci
	.word	s3c_device_usbgadget
	.word	exynos_device_ss_udc
	.word	exynos_device_xhci
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"HOST_VBUS_CONTROL\000"
	.space	2
.LC1:
	.ascii	"<3>failed to request gpio_host_vbus\012\000"
	.space	3
.LC2:
	.ascii	"HOST_DETECT\000"
.LC3:
	.ascii	"<3>failed to request host gpio\012\000"
.LC4:
	.ascii	"<3>failed to request host_vbus gpio\012\000"
	.space	3
.LC5:
	.ascii	"DEVICE_DETECT\000"
	.space	2
.LC6:
	.ascii	"<3>failed to request device gpio\012\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	smdk5250_ehci_pdata, %object
	.size	smdk5250_ehci_pdata, 24
smdk5250_ehci_pdata:
	.space	24
	.type	smdk5250_ohci_pdata, %object
	.size	smdk5250_ohci_pdata, 16
smdk5250_ohci_pdata:
	.space	16
	.type	smdk5250_usbgadget_pdata, %object
	.size	smdk5250_usbgadget_pdata, 16
smdk5250_usbgadget_pdata:
	.space	16
	.type	smdk5250_ss_udc_pdata, %object
	.size	smdk5250_ss_udc_pdata, 12
smdk5250_ss_udc_pdata:
	.space	12
	.type	smdk5250_xhci_pdata, %object
	.size	smdk5250_xhci_pdata, 12
smdk5250_xhci_pdata:
	.space	12
	.type	smdk5250_usbswitch_pdata, %object
	.size	smdk5250_usbswitch_pdata, 40
smdk5250_usbswitch_pdata:
	.space	40
	.ident	"GCC: (GNU) 4.8"
