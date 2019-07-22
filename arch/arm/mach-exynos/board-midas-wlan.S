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
	.file	"board-midas-wlan.c"

	.text
	.align	2
	.type	brcm_wlan_get_country_code, %function
brcm_wlan_get_country_code:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	subs	r6, r0, #0
	beq	.L4
	movw	r4, #:lower16:.LANCHOR0
	movw	r5, #:lower16:strcmp
	movt	r4, #:upper16:.LANCHOR0
	movt	r5, #:upper16:strcmp
	add	r7, r4, #588
	b	.L3
.L9:
	add	r4, r4, #12
	cmp	r4, r7
	beq	.L8
.L3:
	mov	r0, r6
	mov	r1, r4
	blx	r5
	cmp	r0, #0
	bne	.L9
	mov	r0, r4
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L8:
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L4:
	mov	r0, r6
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
	.fnend
	.size	brcm_wlan_get_country_code, .-brcm_wlan_get_country_code
	.align	2
	.type	s3c_config_gpio_alive_table, %function
s3c_config_gpio_alive_table:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r3, #:lower16:printk
	mov	r7, r0
	movw	r0, #:lower16:.LC0
	mov	r4, r1
	movt	r0, #:upper16:.LC0
	mov	r1, r7
	movt	r3, #:upper16:printk
	blx	r3
	cmp	r7, #0
	ldmeqfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
	movw	r9, #:lower16:s3c_gpio_cfgpin
	movw	r8, #:lower16:s3c_gpio_setpull
	movw	r10, #:lower16:__gpio_set_value
	movt	r9, #:upper16:s3c_gpio_cfgpin
	movt	r8, #:upper16:s3c_gpio_setpull
	movt	r10, #:upper16:__gpio_set_value
	mov	r6, #0
.L14:
	ldr	r1, [r4, #4]
	add	r6, r6, #1
	ldr	r5, [r4]
	add	r4, r4, #16
	mvn	r1, r1, asl #28
	mov	r0, r5
	mvn	r1, r1, lsr #28
	blx	r9
	ldr	r1, [r4, #-4]
	mov	r0, r5
	blx	r8
	ldr	r1, [r4, #-8]
	mov	r0, r5
	cmp	r1, #2
	beq	.L12
	blx	r10
.L12:
	cmp	r6, r7
	bne	.L14
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
	.fnend
	.size	s3c_config_gpio_alive_table, .-s3c_config_gpio_alive_table
	.align	2
	.type	brcm_wlan_set_carddetect, %function
brcm_wlan_set_carddetect:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	ldrne	r1, .L21
	mov	r0, #6
	ldreq	r1, .L21+4
	bl	s3c_config_gpio_alive_table
	mov	r0, #2512
	movw	r3, #:lower16:__const_udelay
	movt	r0, 983
	movt	r3, #:upper16:__const_udelay
	blx	r3
	movw	r0, #:lower16:s3c_device_hsmmc3
	movw	r3, #:lower16:mmc_force_presence_change
	movt	r0, #:upper16:s3c_device_hsmmc3
	movt	r3, #:upper16:mmc_force_presence_change
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
.L22:
	.align	2
.L21:
	.word	.LANCHOR0+588
	.word	.LANCHOR0+684
	.fnend
	.size	brcm_wlan_set_carddetect, .-brcm_wlan_set_carddetect
	.align	2
	.type	brcm_wlan_reset, %function
brcm_wlan_reset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	adds	r1, r0, #0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:__gpio_set_value
	movne	r1, #1
	movt	r3, #:upper16:__gpio_set_value
	mov	r0, #234
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	brcm_wlan_reset, .-brcm_wlan_reset
	.align	2
	.type	brcm_wlan_mem_prealloc, %function
brcm_wlan_mem_prealloc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #4
	beq	.L29
	cmp	r0, #5
	beq	.L32
	cmp	r0, #6
	beq	.L33
	cmp	r0, #4
	bhi	.L31
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	add	r0, r3, r0, asl #3
	ldr	r3, [r0, #784]
	cmp	r1, r3
	bhi	.L31
	ldr	r0, [r0, #780]
	bx	lr
.L31:
	mov	r0, #0
	bx	lr
.L29:
	movw	r0, #:lower16:.LANCHOR1
	movt	r0, #:upper16:.LANCHOR1
	bx	lr
.L32:
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	ldr	r0, [r3, #68]
	bx	lr
.L33:
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	ldr	r0, [r3, #72]
	bx	lr
	.fnend
	.size	brcm_wlan_mem_prealloc, .-brcm_wlan_mem_prealloc
	.align	2
	.type	brcm_wlan_power, %function
brcm_wlan_power:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r5, r0
	movw	r4, #:lower16:printk
	movw	r0, #:lower16:.LC1
	movt	r4, #:upper16:printk
	movt	r0, #:upper16:.LC1
	blx	r4
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	blx	r4
	cmp	r5, #0
	movw	r0, #:lower16:.LC3
	movw	r1, #:lower16:.LANCHOR2
	beq	.L38
	movw	r2, #:lower16:.LC4
	movt	r1, #:upper16:.LANCHOR2
	movt	r2, #:upper16:.LC4
	movt	r0, #:upper16:.LC3
	blx	r4
	movw	r0, #:lower16:.LC5
	movw	r1, #:lower16:.LANCHOR2
	movw	r2, #:lower16:.LC4
	movt	r1, #:upper16:.LANCHOR2
	movt	r2, #:upper16:.LC4
	movt	r0, #:upper16:.LC5
	blx	r4
	ldr	r1, .L41
	mov	r0, #2
	bl	s3c_config_gpio_alive_table
	mov	r0, #2512
	movw	r3, #:lower16:__const_udelay
	movt	r0, 983
	movt	r3, #:upper16:__const_udelay
	blx	r3
	movw	r3, #:lower16:__gpio_set_value
	mov	r0, #234
	movt	r3, #:upper16:__gpio_set_value
	mov	r1, #1
	blx	r3
.L40:
	movw	r3, #:lower16:__gpio_get_value
	mov	r0, #234
	movt	r3, #:upper16:__gpio_get_value
	blx	r3
	mov	r1, r0
	movw	r0, #:lower16:.LC6
	movt	r0, #:upper16:.LC6
	blx	r4
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, pc}
.L38:
	movw	r2, #:lower16:.LC7
	movt	r1, #:upper16:.LANCHOR2
	movt	r2, #:upper16:.LC7
	movt	r0, #:upper16:.LC3
	blx	r4
	movw	r0, #:lower16:.LC5
	movw	r1, #:lower16:.LANCHOR2
	movw	r2, #:lower16:.LC7
	movt	r1, #:upper16:.LANCHOR2
	movt	r2, #:upper16:.LC7
	movt	r0, #:upper16:.LC5
	blx	r4
	movw	r3, #:lower16:__gpio_set_value
	mov	r1, r5
	movt	r3, #:upper16:__gpio_set_value
	mov	r0, #234
	blx	r3
	mov	r0, #2
	ldr	r1, .L41+4
	bl	s3c_config_gpio_alive_table
	b	.L40
.L42:
	.align	2
.L41:
	.word	.LANCHOR0+812
	.word	.LANCHOR0+844
	.fnend
	.size	brcm_wlan_power, .-brcm_wlan_power
	.align	2
	.global	brcm_wlan_init
	.type	brcm_wlan_init, %function
brcm_wlan_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	movw	r0, #:lower16:.LC8
	movw	r8, #:lower16:printk
	movw	r7, #:lower16:dev_alloc_skb
	movt	r0, #:upper16:.LC8
	movt	r8, #:upper16:printk
	ldr	r1, .L74
	movt	r7, #:upper16:dev_alloc_skb
	ldr	r5, .L74+4
	mov	r4, #0
	blx	r8
.L46:
	mov	r0, #3760
	blx	r7
	cmp	r0, #0
	str	r0, [r5, #4]!
	beq	.L44
	add	r4, r4, #1
	cmp	r4, #8
	bne	.L46
	ldr	r6, .L74+8
.L49:
	movw	r0, #7856
	movw	r5, #:lower16:dev_alloc_skb
	blx	r7
	cmp	r0, #0
	str	r0, [r6, #4]!
	movt	r5, #:upper16:dev_alloc_skb
	beq	.L47
	add	r4, r4, #1
	cmp	r4, #16
	bne	.L49
	movw	r0, #16048
	movw	r7, #:lower16:.LANCHOR1
	blx	r5
	cmp	r0, #0
	movt	r7, #:upper16:.LANCHOR1
	str	r0, [r7, #64]
	beq	.L47
	ldr	r6, .L74+12
	mov	r4, #0
	movw	r9, #:lower16:__kmalloc
	mov	r5, r4
	movt	r9, #:upper16:__kmalloc
.L52:
	add	r3, r6, r4
	mov	r1, #208
	ldr	r0, [r3, #4]
	blx	r9
	cmp	r0, #0
	str	r0, [r6, r4]
	add	r4, r4, #8
	beq	.L50
	add	r5, r5, #1
	cmp	r5, #4
	bne	.L52
	movw	r4, #:lower16:kmalloc_order_trace
	mov	r0, #65536
	movt	r4, #:upper16:kmalloc_order_trace
	mov	r1, #208
	mov	r2, r5
	movw	r9, #:lower16:.LANCHOR1
	blx	r4
	cmp	r0, #0
	str	r0, [r7, #68]
	movt	r9, #:upper16:.LANCHOR1
	beq	.L53
	mov	r0, #65536
	mov	r1, #208
	mov	r2, r5
	blx	r4
	cmp	r0, #0
	str	r0, [r9, #72]
	beq	.L53
	movw	r0, #:lower16:.LC9
	ldr	r1, .L74+16
	movt	r0, #:upper16:.LC9
	blx	r8
.L54:
	movw	r3, #:lower16:platform_device_register
	ldr	r0, .L74+20
	movt	r3, #:upper16:platform_device_register
	blx	r3
	mov	r4, r0
	movw	r0, #:lower16:.LC12
	movt	r0, #:upper16:.LC12
	blx	r8
	movw	r0, #:lower16:.LC12
	movt	r0, #:upper16:.LC12
	blx	r8
	movw	r0, #:lower16:.LC12
	movt	r0, #:upper16:.LC12
	blx	r8
	movw	r0, #:lower16:.LC13
	mov	r1, r4
	movt	r0, #:upper16:.LC13
	blx	r8
	mov	r0, r4
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L47:
	movw	r0, #:lower16:.LC11
	movt	r0, #:upper16:.LC11
	blx	r8
.L58:
	ldr	r6, .L74+4
	movw	r7, #:lower16:consume_skb
	movt	r7, #:upper16:consume_skb
	mov	r5, #0
.L60:
	add	r5, r5, #1
	ldr	r0, [r6, #4]!
	blx	r7
	cmp	r4, r5
	bgt	.L60
	b	.L54
.L44:
	movw	r0, #:lower16:.LC11
	movt	r0, #:upper16:.LC11
	blx	r8
	cmp	r4, #0
	bne	.L58
	b	.L54
.L50:
	movw	r0, #:lower16:.LC10
	movt	r0, #:upper16:.LC10
	blx	r8
	cmp	r5, #0
	beq	.L56
.L55:
	movw	r7, #:lower16:kfree
	mov	r4, #0
	movt	r7, #:upper16:kfree
.L57:
	ldr	r0, [r6, r4, asl #3]
	add	r4, r4, #1
	blx	r7
	cmp	r4, r5
	blt	.L57
.L56:
	movw	r0, #:lower16:.LC11
	mov	r4, #17
	movt	r0, #:upper16:.LC11
	blx	r8
	b	.L58
.L53:
	movw	r0, #:lower16:.LC10
	movt	r0, #:upper16:.LC10
	blx	r8
	b	.L55
.L75:
	.align	2
.L74:
	.word	.LANCHOR2+16
	.word	.LANCHOR1-4
	.word	.LANCHOR1+28
	.word	.LANCHOR0+780
	.word	.LANCHOR2+32
	.word	.LANCHOR0+880
	.fnend
	.size	brcm_wlan_init, .-brcm_wlan_init
	.global	wlan_static_scan_buf1
	.global	wlan_static_scan_buf0
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	__func__.19675, %object
	.size	__func__.19675, 16
__func__.19675:
	.ascii	"brcm_wlan_power\000"
	.type	__func__.19721, %object
	.size	__func__.19721, 15
__func__.19721:
	.ascii	"brcm_wlan_init\000"
	.space	1
	.type	__func__.19652, %object
	.size	__func__.19652, 19
__func__.19652:
	.ascii	"brcm_init_wlan_mem\000"
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	brcm_wlan_translate_custom_table, %object
	.size	brcm_wlan_translate_custom_table, 588
brcm_wlan_translate_custom_table:
	.ascii	"\000"
	.space	3
	.ascii	"XZ\000"
	.space	1
	.word	11
	.ascii	"AE\000"
	.space	1
	.ascii	"AE\000"
	.space	1
	.word	1
	.ascii	"AR\000"
	.space	1
	.ascii	"AR\000"
	.space	1
	.word	1
	.ascii	"AT\000"
	.space	1
	.ascii	"AT\000"
	.space	1
	.word	1
	.ascii	"AU\000"
	.space	1
	.ascii	"AU\000"
	.space	1
	.word	2
	.ascii	"BE\000"
	.space	1
	.ascii	"BE\000"
	.space	1
	.word	1
	.ascii	"BG\000"
	.space	1
	.ascii	"BG\000"
	.space	1
	.word	1
	.ascii	"BN\000"
	.space	1
	.ascii	"BN\000"
	.space	1
	.word	1
	.ascii	"CA\000"
	.space	1
	.ascii	"CA\000"
	.space	1
	.word	2
	.ascii	"CH\000"
	.space	1
	.ascii	"CH\000"
	.space	1
	.word	1
	.ascii	"CY\000"
	.space	1
	.ascii	"CY\000"
	.space	1
	.word	1
	.ascii	"CZ\000"
	.space	1
	.ascii	"CZ\000"
	.space	1
	.word	1
	.ascii	"DE\000"
	.space	1
	.ascii	"DE\000"
	.space	1
	.word	3
	.ascii	"DK\000"
	.space	1
	.ascii	"DK\000"
	.space	1
	.word	1
	.ascii	"EE\000"
	.space	1
	.ascii	"EE\000"
	.space	1
	.word	1
	.ascii	"ES\000"
	.space	1
	.ascii	"ES\000"
	.space	1
	.word	1
	.ascii	"FI\000"
	.space	1
	.ascii	"FI\000"
	.space	1
	.word	1
	.ascii	"FR\000"
	.space	1
	.ascii	"FR\000"
	.space	1
	.word	1
	.ascii	"GB\000"
	.space	1
	.ascii	"GB\000"
	.space	1
	.word	1
	.ascii	"GR\000"
	.space	1
	.ascii	"GR\000"
	.space	1
	.word	1
	.ascii	"HR\000"
	.space	1
	.ascii	"HR\000"
	.space	1
	.word	1
	.ascii	"HU\000"
	.space	1
	.ascii	"HU\000"
	.space	1
	.word	1
	.ascii	"IE\000"
	.space	1
	.ascii	"IE\000"
	.space	1
	.word	1
	.ascii	"IS\000"
	.space	1
	.ascii	"IS\000"
	.space	1
	.word	1
	.ascii	"IT\000"
	.space	1
	.ascii	"IT\000"
	.space	1
	.word	1
	.ascii	"JP\000"
	.space	1
	.ascii	"JP\000"
	.space	1
	.word	3
	.ascii	"KR\000"
	.space	1
	.ascii	"KR\000"
	.space	1
	.word	24
	.ascii	"KW\000"
	.space	1
	.ascii	"KW\000"
	.space	1
	.word	1
	.ascii	"LI\000"
	.space	1
	.ascii	"LI\000"
	.space	1
	.word	1
	.ascii	"LT\000"
	.space	1
	.ascii	"LT\000"
	.space	1
	.word	1
	.ascii	"LU\000"
	.space	1
	.ascii	"LU\000"
	.space	1
	.word	1
	.ascii	"LV\000"
	.space	1
	.ascii	"LV\000"
	.space	1
	.word	1
	.ascii	"MA\000"
	.space	1
	.ascii	"MA\000"
	.space	1
	.word	1
	.ascii	"MT\000"
	.space	1
	.ascii	"MT\000"
	.space	1
	.word	1
	.ascii	"MX\000"
	.space	1
	.ascii	"MX\000"
	.space	1
	.word	1
	.ascii	"NL\000"
	.space	1
	.ascii	"NL\000"
	.space	1
	.word	1
	.ascii	"NO\000"
	.space	1
	.ascii	"NO\000"
	.space	1
	.word	1
	.ascii	"PL\000"
	.space	1
	.ascii	"PL\000"
	.space	1
	.word	1
	.ascii	"PT\000"
	.space	1
	.ascii	"PT\000"
	.space	1
	.word	1
	.ascii	"PY\000"
	.space	1
	.ascii	"PY\000"
	.space	1
	.word	1
	.ascii	"RO\000"
	.space	1
	.ascii	"RO\000"
	.space	1
	.word	1
	.ascii	"RU\000"
	.space	1
	.ascii	"RU\000"
	.space	1
	.word	5
	.ascii	"SE\000"
	.space	1
	.ascii	"SE\000"
	.space	1
	.word	1
	.ascii	"SG\000"
	.space	1
	.ascii	"SG\000"
	.space	1
	.word	4
	.ascii	"SI\000"
	.space	1
	.ascii	"SI\000"
	.space	1
	.word	1
	.ascii	"SK\000"
	.space	1
	.ascii	"SK\000"
	.space	1
	.word	1
	.ascii	"TR\000"
	.space	1
	.ascii	"TR\000"
	.space	1
	.word	7
	.ascii	"TW\000"
	.space	1
	.ascii	"TW\000"
	.space	1
	.word	2
	.ascii	"US\000"
	.space	1
	.ascii	"US\000"
	.space	1
	.word	46
	.type	wlan_sdio_on_table, %object
	.size	wlan_sdio_on_table, 96
wlan_sdio_on_table:
	.word	105
	.word	2
	.word	2
	.word	0
	.word	106
	.word	2
	.word	2
	.word	0
	.word	108
	.word	2
	.word	2
	.word	0
	.word	109
	.word	2
	.word	2
	.word	0
	.word	110
	.word	2
	.word	2
	.word	0
	.word	111
	.word	2
	.word	2
	.word	0
	.type	wlan_sdio_off_table, %object
	.size	wlan_sdio_off_table, 96
wlan_sdio_off_table:
	.word	105
	.word	1
	.word	0
	.word	0
	.word	106
	.word	0
	.word	2
	.word	0
	.word	108
	.word	0
	.word	2
	.word	0
	.word	109
	.word	0
	.word	2
	.word	0
	.word	110
	.word	0
	.word	2
	.word	0
	.word	111
	.word	0
	.word	2
	.word	0
	.type	wlan_mem_array, %object
	.size	wlan_mem_array, 32
wlan_mem_array:
	.word	0
	.word	20504
	.word	0
	.word	20504
	.word	0
	.word	81944
	.word	0
	.word	163864
	.type	wlan_on_gpio_table, %object
	.size	wlan_on_gpio_table, 32
wlan_on_gpio_table:
	.word	234
	.word	1
	.word	1
	.word	0
	.word	213
	.word	15
	.word	2
	.word	1
	.type	wlan_off_gpio_table, %object
	.size	wlan_off_gpio_table, 32
wlan_off_gpio_table:
	.word	234
	.word	1
	.word	0
	.word	0
	.word	213
	.word	0
	.word	2
	.word	1
	.space	4
	.type	brcm_device_wlan, %object
	.size	brcm_device_wlan, 360
brcm_device_wlan:
	.word	.LC14
	.word	1
	.space	84
	.word	brcm_wlan_control
	.space	248
	.word	1
	.word	brcm_wlan_resources
	.space	8
	.type	brcm_wlan_control, %object
	.size	brcm_wlan_control, 24
brcm_wlan_control:
	.word	brcm_wlan_power
	.word	brcm_wlan_reset
	.word	brcm_wlan_set_carddetect
	.word	brcm_wlan_mem_prealloc
	.space	4
	.word	brcm_wlan_get_country_code
	.type	brcm_wlan_resources, %object
	.size	brcm_wlan_resources, 28
brcm_wlan_resources:
	.word	373
	.word	373
	.word	.LC15
	.word	1044
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"gpio_table = [%d] \015\012\000"
	.space	3
.LC1:
	.ascii	"------------------------------------------------\000"
	.space	3
.LC2:
	.ascii	"------------------------------------------------\012"
	.ascii	"\000"
	.space	2
.LC3:
	.ascii	"%s Enter: power %s\012\000"
.LC4:
	.ascii	"on\000"
	.space	1
.LC5:
	.ascii	"<6>111%s Enter: power %s\012\000"
	.space	2
.LC6:
	.ascii	"<7>WLAN: GPIO_WLAN_EN = %d \012\000"
	.space	3
.LC7:
	.ascii	"off\000"
.LC8:
	.ascii	"%s: start\012\000"
	.space	1
.LC9:
	.ascii	"%s: WIFI MEM Allocated\012\000"
.LC10:
	.ascii	"<3>Failed to mem_alloc for WLAN\012\000"
	.space	3
.LC11:
	.ascii	"<3>Failed to skb_alloc for WLAN\012\000"
	.space	3
.LC12:
	.ascii	"---------------------------------------------------"
	.ascii	"--\012\000"
	.space	1
.LC13:
	.ascii	"regist ret:%d\012\000"
	.space	1
.LC14:
	.ascii	"bcmdhd_wlan\000"
.LC15:
	.ascii	"bcmdhd_wlan_irq\000"
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	wlan_static_skb, %object
	.size	wlan_static_skb, 68
wlan_static_skb:
	.space	68
	.type	wlan_static_scan_buf0, %object
	.size	wlan_static_scan_buf0, 4
wlan_static_scan_buf0:
	.space	4
	.type	wlan_static_scan_buf1, %object
	.size	wlan_static_scan_buf1, 4
wlan_static_scan_buf1:
	.space	4
	.ident	"GCC: (GNU) 4.8"
