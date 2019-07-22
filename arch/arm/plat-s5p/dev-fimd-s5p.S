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
	.file	"dev-fimd-s5p.c"
	.text
	.align	2
	.global	s3cfb_set_platdata
	.type	s3cfb_set_platdata, %function
s3cfb_set_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r2, #:lower16:.LANCHOR0
	cmp	r0, #0
	movt	r2, #:upper16:.LANCHOR0
	movw	r3, #:lower16:kmemdup
	moveq	r0, r2
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movt	r3, #:upper16:kmemdup
	mov	r1, #88
	mov	r2, #208
	blx	r3
	subs	r4, r0, #0
	beq	.L3
	ldr	r1, [r4, #20]
	cmp	r1, #0
	addgt	r1, r4, r1, asl #2
	movgt	r3, r4
	movgt	r2, #1
	ble	.L6
.L7:
	str	r2, [r3, #24]
	add	r3, r3, #4
	cmp	r3, r1
	bne	.L7
.L6:
	ldr	r2, [r4, #44]
	mov	r1, #2
	movw	r3, #:lower16:s3cfb_get_clk_name
	add	r0, r4, #4
	movt	r3, #:upper16:s3cfb_get_clk_name
	movw	r8, #:lower16:s3cfb_set_display_path
	add	r2, r2, #6
	movw	r7, #:lower16:s3cfb_cfg_gpio
	str	r1, [r4, r2, asl #2]
	movw	r6, #:lower16:s3cfb_backlight_on
	blx	r3
	movw	r5, #:lower16:s3cfb_backlight_off
	movw	ip, #:lower16:s3cfb_lcd_on
	movw	r0, #:lower16:s3cfb_lcd_off
	movw	r1, #:lower16:s3cfb_clk_on
	movw	r2, #:lower16:s3cfb_clk_off
	movw	r3, #:lower16:.LANCHOR0
	movt	r8, #:upper16:s3cfb_set_display_path
	movt	r7, #:upper16:s3cfb_cfg_gpio
	movt	r6, #:upper16:s3cfb_backlight_on
	movt	r5, #:upper16:s3cfb_backlight_off
	movt	ip, #:upper16:s3cfb_lcd_on
	movt	r0, #:upper16:s3cfb_lcd_off
	movt	r1, #:upper16:s3cfb_clk_on
	movt	r2, #:upper16:s3cfb_clk_off
	movt	r3, #:upper16:.LANCHOR0
	str	r8, [r4, #56]
	str	r7, [r4, #60]
	str	r6, [r4, #64]
	str	r5, [r4, #68]
	str	ip, [r4, #72]
	str	r0, [r4, #76]
	str	r1, [r4, #80]
	str	r2, [r4, #84]
	str	r4, [r3, #180]
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L3:
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LANCHOR1
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR1
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
	.fnend
	.size	s3cfb_set_platdata, .-s3cfb_set_platdata
	.global	s3c_device_fb
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.13558, %object
	.size	__func__.13558, 19
__func__.13558:
	.ascii	"s3cfb_set_platdata\000"
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	default_fb_data, %object
	.size	default_fb_data, 88
default_fb_data:
	.word	112
	.space	16
	.word	5
	.space	20
	.word	2
	.word	16842752
	.space	36
	.type	s3c_device_fb, %object
	.size	s3c_device_fb, 360
s3c_device_fb:
	.word	.LC1
	.word	0
	.space	252
	.word	fb_dma_mask
	.word	-1
	.word	0
	.space	72
	.word	3
	.word	s3cfb_resource
	.space	8
	.type	fb_dma_mask, %object
	.size	fb_dma_mask, 8
fb_dma_mask:
	.word	-1
	.word	0
	.type	s3cfb_resource, %object
	.size	s3cfb_resource, 84
s3cfb_resource:
	.word	297795584
	.word	297828351
	.space	4
	.word	512
	.space	12
	.word	281
	.word	281
	.space	4
	.word	1024
	.space	12
	.word	280
	.word	280
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>%s: no memory for platform data\012\000"
.LC1:
	.ascii	"s3cfb\000"
	.ident	"GCC: (GNU) 4.8"
