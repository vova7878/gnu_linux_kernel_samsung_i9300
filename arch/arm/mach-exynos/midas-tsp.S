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
	.file	"midas-tsp.c"
	.text
	.align	2
	.global	melfas_get_lcdtype
	.type	melfas_get_lcdtype, %function
melfas_get_lcdtype:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	ldr	r0, [r3]
	bx	lr
	.fnend
	.size	melfas_get_lcdtype, .-melfas_get_lcdtype
	.align	2
	.type	melfas_register_callback, %function
melfas_register_callback:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	str	r0, [r3, #4]
	bx	lr
	.fnend
	.size	melfas_register_callback, .-melfas_register_callback
	.align	2
	.global	is_melfas_vdd_on
	.type	is_melfas_vdd_on, %function
is_melfas_vdd_on:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	ldr	r0, [r4, #8]
	cmp	r0, #0
	beq	.L9
.L4:
	movw	r3, #:lower16:regulator_is_enabled
	movt	r3, #:upper16:regulator_is_enabled
	blx	r3
	adds	r0, r0, #0
	movne	r0, #1
	ldmfd	sp!, {r3, r4, r5, pc}
.L9:
	movw	r1, #:lower16:.LC0
	movw	r3, #:lower16:regulator_get
	movt	r1, #:upper16:.LC0
	movt	r3, #:upper16:regulator_get
	blx	r3
	cmn	r0, #4096
	mov	r5, r0
	str	r0, [r4, #8]
	movls	r0, r0
	bls	.L4
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	mov	r1, r5
	movt	r0, #:upper16:.LC1
	blx	r3
	mov	r0, r5
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	is_melfas_vdd_on, .-is_melfas_vdd_on
	.align	2
	.global	melfas_mux_fw_flash
	.type	melfas_mux_fw_flash, %function
melfas_mux_fw_flash:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	movw	r1, #:lower16:.LANCHOR1
	mov	r4, r0
	movw	r5, #:lower16:printk
	movw	r0, #:lower16:.LC2
	mov	r2, r4
	movt	r0, #:upper16:.LC2
	movt	r1, #:upper16:.LANCHOR1
	movt	r5, #:upper16:printk
	blx	r5
	cmp	r4, #0
	beq	.L11
	movw	r1, #:lower16:.LC3
	movw	r4, #:lower16:gpio_request
	movt	r1, #:upper16:.LC3
	movt	r4, #:upper16:gpio_request
	mov	r0, #12
	blx	r4
	cmp	r0, #0
	bne	.L21
.L12:
	movw	r1, #:lower16:.LC5
	mov	r0, #11
	movt	r1, #:upper16:.LC5
	blx	r4
	cmp	r0, #0
	bne	.L22
.L13:
	movw	r6, #:lower16:gpio_direction_output
	mov	r1, #0
	movt	r6, #:upper16:gpio_direction_output
	movw	r0, #269
	movw	r5, #:lower16:s3c_gpio_cfgpin
	movw	r4, #:lower16:s3c_gpio_setpull
	blx	r6
	movt	r5, #:upper16:s3c_gpio_cfgpin
	mvn	r1, #14
	movw	r0, #269
	movt	r4, #:upper16:s3c_gpio_setpull
	blx	r5
	mov	r1, #0
	movw	r0, #269
	blx	r4
	mov	r1, #0
	mov	r0, #12
	blx	r6
	mvn	r1, #14
	mov	r0, #12
	blx	r5
	mov	r1, #0
	mov	r0, #12
	blx	r4
	mov	r1, #0
	mov	r0, #11
	blx	r6
	mvn	r1, #14
	mov	r0, #11
	blx	r5
	mov	r1, #0
	mov	r0, #11
	blx	r4
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L11:
	movw	r8, #:lower16:gpio_direction_output
	mov	r1, #1
	movt	r8, #:upper16:gpio_direction_output
	movw	r0, #269
	movw	r7, #:lower16:gpio_direction_input
	movw	r6, #:lower16:s3c_gpio_cfgpin
	blx	r8
	movt	r7, #:upper16:gpio_direction_input
	movw	r0, #269
	blx	r7
	movt	r6, #:upper16:s3c_gpio_cfgpin
	mvn	r1, #0
	movw	r0, #269
	movw	r5, #:lower16:s3c_gpio_setpull
	blx	r6
	movt	r5, #:upper16:s3c_gpio_setpull
	mov	r1, r4
	movw	r0, #269
	movw	r9, #:lower16:gpio_free
	blx	r5
	mov	r1, #1
	mov	r0, #12
	blx	r8
	mov	r0, #12
	movt	r9, #:upper16:gpio_free
	blx	r7
	mvn	r1, #12
	mov	r0, #12
	blx	r6
	mov	r1, r4
	mov	r0, #12
	blx	r5
	mov	r1, #1
	mov	r0, #11
	blx	r8
	mov	r0, #11
	blx	r7
	mvn	r1, #12
	mov	r0, #11
	blx	r6
	mov	r1, r4
	mov	r0, #11
	blx	r5
	mov	r0, #12
	blx	r9
	mov	r0, #11
	blx	r9
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L22:
	movw	r0, #:lower16:.LC6
	movt	r0, #:upper16:.LC6
	blx	r5
	b	.L13
.L21:
	movw	r0, #:lower16:.LC4
	movt	r0, #:upper16:.LC4
	blx	r5
	b	.L12
	.fnend
	.size	melfas_mux_fw_flash, .-melfas_mux_fw_flash
	.align	2
	.type	TSP_VDD_18V.part.0, %function
TSP_VDD_18V.part.0:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r1, #:lower16:.LC7
	movw	r3, #:lower16:regulator_get
	mov	r5, r0
	movt	r1, #:upper16:.LC7
	movt	r3, #:upper16:regulator_get
	mov	r0, #0
	blx	r3
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L31
	cmp	r5, #0
	bne	.L32
	movw	r3, #:lower16:regulator_is_enabled
	movt	r3, #:upper16:regulator_is_enabled
	blx	r3
	cmp	r0, #0
	bne	.L33
.L27:
	movw	r2, #:lower16:.LANCHOR0
	movw	r3, #:lower16:regulator_put
	mov	r0, r4
	movt	r2, #:upper16:.LANCHOR0
	movt	r3, #:upper16:regulator_put
	strb	r5, [r2, #12]
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, pc}
.L32:
	movw	r3, #:lower16:regulator_enable
	movt	r3, #:upper16:regulator_enable
	blx	r3
	b	.L27
.L33:
	movw	r3, #:lower16:regulator_disable
	mov	r0, r4
	movt	r3, #:upper16:regulator_disable
	blx	r3
	b	.L27
.L31:
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	TSP_VDD_18V.part.0, .-TSP_VDD_18V.part.0
	.align	2
	.global	melfas_power
	.type	melfas_power, %function
melfas_power:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	mov	r5, r0
	ldrb	r3, [r4, #12]	@ zero_extendqisi2
	cmp	r3, r0
	beq	.L45
	movw	r1, #:lower16:.LC0
	movw	r3, #:lower16:regulator_get
	movt	r1, #:upper16:.LC0
	movt	r3, #:upper16:regulator_get
	mov	r0, #0
	blx	r3
	cmn	r0, #4096
	mov	r6, r0
	bhi	.L49
	cmp	r5, #0
	bne	.L38
	movw	r0, #:lower16:.LC8
	movw	r2, #:lower16:.LC10
	movw	r3, #:lower16:printk
	movt	r2, #:upper16:.LC10
	movt	r3, #:upper16:printk
	ldr	r1, .L51
	movt	r0, #:upper16:.LC8
	blx	r3
	movw	r3, #:lower16:regulator_is_enabled
	mov	r0, r6
	movt	r3, #:upper16:regulator_is_enabled
	blx	r3
	cmp	r0, #0
	bne	.L50
.L40:
	movw	r3, #:lower16:regulator_put
	mov	r0, r6
	movt	r3, #:upper16:regulator_put
	strb	r5, [r4, #12]
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
.L38:
	movw	r0, #:lower16:.LC8
	movw	r2, #:lower16:.LC9
	movw	r3, #:lower16:printk
	movt	r2, #:upper16:.LC9
	movt	r3, #:upper16:printk
	ldr	r1, .L51
	movt	r0, #:upper16:.LC8
	blx	r3
	movw	r3, #:lower16:regulator_enable
	mov	r0, r6
	movt	r3, #:upper16:regulator_enable
	blx	r3
	ldrb	r3, [r4, #12]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L40
	mov	r0, #1
	bl	TSP_VDD_18V.part.0
	b	.L40
.L45:
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
.L50:
	movw	r3, #:lower16:regulator_disable
	mov	r0, r6
	movt	r3, #:upper16:regulator_disable
	blx	r3
	ldrb	r3, [r4, #12]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L40
	mov	r0, r5
	bl	TSP_VDD_18V.part.0
	b	.L40
.L49:
	ldmfd	sp!, {r4, r5, r6, pc}
.L52:
	.align	2
.L51:
	.word	.LANCHOR1+20
	.fnend
	.size	melfas_power, .-melfas_power
	.align	2
	.global	TSP_VDD_18V
	.type	TSP_VDD_18V, %function
TSP_VDD_18V:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	ldrb	r3, [r3, #12]	@ zero_extendqisi2
	cmp	r3, r0
	beq	.L54
	b	TSP_VDD_18V.part.0
.L54:
	mov	r0, #0
	bx	lr
	.fnend
	.size	TSP_VDD_18V, .-TSP_VDD_18V
	.align	2
	.global	midas_tsp_set_lcdtype
	.type	midas_tsp_set_lcdtype, %function
midas_tsp_set_lcdtype:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	str	r0, [r3]
	bx	lr
	.fnend
	.size	midas_tsp_set_lcdtype, .-midas_tsp_set_lcdtype
	.align	2
	.global	tsp_charger_infom
	.type	tsp_charger_infom, %function
tsp_charger_infom:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	mov	r1, r0
	ldr	r0, [r3, #4]
	cmp	r0, #0
	ldmeqfd	sp!, {r3, pc}
	ldr	r2, [r0]
	cmp	r2, #0
	ldmeqfd	sp!, {r3, pc}
	blx	r2
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	tsp_charger_infom, .-tsp_charger_infom
	.align	2
	.global	midas_tsp_set_platdata
	.type	midas_tsp_set_platdata, %function
midas_tsp_set_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR2
	cmp	r0, #0
	movt	r3, #:upper16:.LANCHOR2
	moveq	r0, r3
	str	r0, [r3, #88]
	bx	lr
	.fnend
	.size	midas_tsp_set_platdata, .-midas_tsp_set_platdata
	.align	2
	.global	midas_tsp_init
	.type	midas_tsp_init, %function
midas_tsp_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r0, #:lower16:.LC11
	movw	r4, #:lower16:printk
	movt	r0, #:upper16:.LC11
	movt	r4, #:upper16:printk
	blx	r4
	movw	r1, #:lower16:.LC12
	movw	r3, #:lower16:gpio_request
	movt	r1, #:upper16:.LC12
	movt	r3, #:upper16:gpio_request
	movw	r0, #269
	blx	r3
	cmp	r0, #0
	bne	.L72
.L68:
	movw	r3, #:lower16:s3c_gpio_cfgpin
	mvn	r1, #0
	movt	r3, #:upper16:s3c_gpio_cfgpin
	movw	r0, #269
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r1, #0
	movt	r3, #:upper16:s3c_gpio_setpull
	movw	r0, #269
	blx	r3
	movw	r3, #:lower16:s5p_register_gpio_interrupt
	movw	r0, #269
	movt	r3, #:upper16:s5p_register_gpio_interrupt
	movw	r5, #:lower16:.LANCHOR2
	blx	r3
	movw	r3, #:lower16:__gpio_to_irq
	movw	r0, #269
	movt	r3, #:upper16:__gpio_to_irq
	movt	r5, #:upper16:.LANCHOR2
	blx	r3
	mov	r3, r0
	movw	r0, #:lower16:.LC14
	mov	r2, r3
	ldr	r1, .L73
	movt	r0, #:upper16:.LC14
	str	r3, [r5, #100]
	blx	r4
	movw	r3, #:lower16:i2c_register_board_info
	add	r1, r5, #64
	movt	r3, #:upper16:i2c_register_board_info
	mov	r2, #1
	mov	r0, #3
	blx	r3
	ldmfd	sp!, {r3, r4, r5, pc}
.L72:
	movw	r0, #:lower16:.LC13
	movt	r0, #:upper16:.LC13
	blx	r4
	b	.L68
.L74:
	.align	2
.L73:
	.word	.LANCHOR1+36
	.fnend
	.size	midas_tsp_init, .-midas_tsp_init
	.global	charger_callbacks
	.global	get_lcd_type
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.16822, %object
	.size	__func__.16822, 20
__func__.16822:
	.ascii	"melfas_mux_fw_flash\000"
	.type	__func__.16813, %object
	.size	__func__.16813, 13
__func__.16813:
	.ascii	"melfas_power\000"
	.space	3
	.type	__func__.16851, %object
	.size	__func__.16851, 15
__func__.16851:
	.ascii	"midas_tsp_init\000"
	.data
	.align	2
	.set	.LANCHOR2,. + 0
	.type	mms_ts_pdata, %object
	.size	mms_ts_pdata, 64
mms_ts_pdata:
	.word	720
	.word	1280
	.byte	0
	.byte	0
	.space	2
	.word	269
	.word	11
	.word	12
	.word	melfas_mux_fw_flash
	.word	melfas_power
	.word	is_melfas_vdd_on
	.space	12
	.word	.LC15
	.space	4
	.word	melfas_get_lcdtype
	.word	melfas_register_callback
	.type	i2c_devs3, %object
	.size	i2c_devs3, 40
i2c_devs3:
	.ascii	"melfas-ts\000"
	.space	10
	.space	2
	.short	72
	.word	mms_ts_pdata
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"touch\000"
	.space	2
.LC1:
	.ascii	"<3>could not get touch, rc = %d\012\000"
	.space	3
.LC2:
	.ascii	"<6>%s:to_gpios=%d\012\000"
	.space	1
.LC3:
	.ascii	"GPIO_TSP_SCL\000"
	.space	3
.LC4:
	.ascii	"<3>failed to request gpio(GPIO_TSP_SCL)\012\000"
	.space	3
.LC5:
	.ascii	"GPIO_TSP_SDA\000"
	.space	3
.LC6:
	.ascii	"<3>failed to request gpio(GPIO_TSP_SDA)\012\000"
	.space	3
.LC7:
	.ascii	"touch_1.8v\000"
	.space	1
.LC8:
	.ascii	"<7>[TSP] %s %s\012\000"
.LC9:
	.ascii	"on\000"
	.space	1
.LC10:
	.ascii	"off\000"
.LC11:
	.ascii	"<6>[TSP] midas_tsp_init() is called\012\000"
	.space	3
.LC12:
	.ascii	"TSP_INT\000"
.LC13:
	.ascii	"<3>failed to request gpio(TSP_INT)\012\000"
.LC14:
	.ascii	"<6>%s touch : %d\012\000"
	.space	2
.LC15:
	.ascii	"I9300_Me_0507\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	get_lcd_type, %object
	.size	get_lcd_type, 4
get_lcd_type:
	.space	4
	.type	charger_callbacks, %object
	.size	charger_callbacks, 4
charger_callbacks:
	.space	4
	.type	regulator.16818, %object
	.size	regulator.16818, 4
regulator.16818:
	.space	4
	.type	enabled, %object
	.size	enabled, 1
enabled:
	.space	1
	.ident	"GCC: (GNU) 4.8"
