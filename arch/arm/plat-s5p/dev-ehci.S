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
	.file	"dev-ehci.c"
	.text
	.align	2
	.global	s5p_ehci_set_platdata
	.type	s5p_ehci_set_platdata, %function
s5p_ehci_set_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r2, #:lower16:.LANCHOR0
	movw	r3, #:lower16:s3c_set_platdata
	movt	r2, #:upper16:.LANCHOR0
	movt	r3, #:upper16:s3c_set_platdata
	mov	r1, #24
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
	ldr	r3, [r0, #8]
	cmp	r3, #0
	movweq	r3, #:lower16:s5p_usb_phy_suspend
	movteq	r3, #:upper16:s5p_usb_phy_suspend
	streq	r3, [r0, #8]
	ldr	r3, [r0, #12]
	cmp	r3, #0
	movweq	r3, #:lower16:s5p_usb_phy_resume
	movteq	r3, #:upper16:s5p_usb_phy_resume
	streq	r3, [r0, #12]
	ldr	r3, [r0, #16]
	cmp	r3, #0
	movweq	r3, #:lower16:set_host_states
	movteq	r3, #:upper16:set_host_states
	streq	r3, [r0, #16]
	ldr	r3, [r0, #20]
	cmp	r3, #0
	movweq	r3, #:lower16:get_cp_active_state
	movteq	r3, #:upper16:get_cp_active_state
	streq	r3, [r0, #20]
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	s5p_ehci_set_platdata, .-s5p_ehci_set_platdata
	.align	2
	.global	s5p_ohci_set_platdata
	.type	s5p_ohci_set_platdata, %function
s5p_ohci_set_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:s3c_set_platdata
	movt	r3, #:upper16:s3c_set_platdata
	mov	r1, #16
	ldr	r2, .L13
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
	ldr	r3, [r0, #8]
	cmp	r3, #0
	movweq	r3, #:lower16:s5p_usb_phy_suspend
	movteq	r3, #:upper16:s5p_usb_phy_suspend
	streq	r3, [r0, #8]
	ldr	r3, [r0, #12]
	cmp	r3, #0
	movweq	r3, #:lower16:s5p_usb_phy_resume
	movteq	r3, #:upper16:s5p_usb_phy_resume
	streq	r3, [r0, #12]
	ldmfd	sp!, {r3, pc}
.L14:
	.align	2
.L13:
	.word	.LANCHOR0+360
	.fnend
	.size	s5p_ohci_set_platdata, .-s5p_ohci_set_platdata
	.global	s5p_device_ohci
	.global	s5p_device_ehci
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	s5p_device_ehci, %object
	.size	s5p_device_ehci, 360
s5p_device_ehci:
	.word	.LC1
	.word	-1
	.space	252
	.word	s5p_device_ehci_dmamask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	s5p_ehci_resource
	.space	8
	.type	s5p_device_ohci, %object
	.size	s5p_device_ohci, 360
s5p_device_ohci:
	.word	.LC0
	.word	-1
	.space	252
	.word	s5p_device_ohci_dmamask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	s5p_ohci_resource
	.space	8
	.type	s5p_device_ohci_dmamask, %object
	.size	s5p_device_ohci_dmamask, 8
s5p_device_ohci_dmamask:
	.word	-1
	.word	0
	.type	s5p_ohci_resource, %object
	.size	s5p_ohci_resource, 56
s5p_ohci_resource:
	.word	307822592
	.word	307822847
	.space	4
	.word	512
	.space	12
	.word	134
	.word	134
	.space	4
	.word	1024
	.space	12
	.type	s5p_device_ehci_dmamask, %object
	.size	s5p_device_ehci_dmamask, 8
s5p_device_ehci_dmamask:
	.word	-1
	.word	0
	.type	s5p_ehci_resource, %object
	.size	s5p_ehci_resource, 56
s5p_ehci_resource:
	.word	307757056
	.word	307757311
	.space	4
	.word	512
	.space	12
	.word	134
	.word	134
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"s5p-ohci\000"
	.space	3
.LC1:
	.ascii	"s5p-ehci\000"
	.ident	"GCC: (GNU) 4.8"
