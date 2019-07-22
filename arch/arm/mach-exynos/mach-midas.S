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
	.file	"mach-midas.c"

	.text
	.align	2
	.type	sec_debug_check_crash_key, %function
sec_debug_check_crash_key:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	sec_debug_check_crash_key, .-sec_debug_check_crash_key
	.align	2
	.type	is_muic_default_uart_path_cp, %function
is_muic_default_uart_path_cp:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:system_rev
	movt	r3, #:upper16:system_rev
	ldr	r0, [r3]
	subs	r3, r0, #5
	rsbs	r0, r3, #0
	adcs	r0, r0, r3
	bx	lr
	.fnend
	.size	is_muic_default_uart_path_cp, .-is_muic_default_uart_path_cp
	.align	2
	.type	exynos_init_reserve, %function
exynos_init_reserve:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	exynos_init_reserve, .-exynos_init_reserve
	.align	2
	.global	mmc_force_presence_change
	.type	mmc_force_presence_change, %function
mmc_force_presence_change:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movw	r3, #:lower16:mutex_lock
	mov	r4, r0
	movw	r0, #:lower16:.LANCHOR0
	movt	r3, #:upper16:mutex_lock
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	movw	r3, #:lower16:s3c_device_hsmmc3
	movt	r3, #:upper16:s3c_device_hsmmc3
	cmp	r4, r3
	beq	.L11
.L5:
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LANCHOR2
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC0
	movt	r1, #:upper16:.LANCHOR2
	movt	r3, #:upper16:printk
	blx	r3
.L6:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:mutex_unlock
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	ldmfd	sp!, {r4, pc}
.L11:
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L5
	mov	r0, r4
	mov	r1, #1
	blx	r3
	b	.L6
	.fnend
	.size	mmc_force_presence_change, .-mmc_force_presence_change
	.align	2
	.type	early_fbmem, %function
early_fbmem:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	subs	r6, r0, #0
	.pad #8
	sub	sp, sp, #8
	beq	.L15
	movw	r5, #:lower16:memparse
	add	r1, sp, #4
	movt	r5, #:upper16:memparse
	movw	r4, #:lower16:.LANCHOR1
	blx	r5
	ldr	r3, [sp, #4]
	movt	r4, #:upper16:.LANCHOR1
	str	r0, [r4, #4]
	ldrb	r2, [r3]	@ zero_extendqisi2
	cmp	r2, #64
	beq	.L18
.L14:
	cmp	r3, r6
	mvnls	r0, #21
	movhi	r0, #0
.L13:
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, pc}
.L18:
	add	r0, r3, #1
	add	r1, sp, #4
	blx	r5
	ldr	r3, [sp, #4]
	str	r0, [r4, #8]
	b	.L14
.L15:
	mvn	r0, #21
	b	.L13
	.fnend
	.size	early_fbmem, .-early_fbmem
	.align	2
	.type	setup_ram_console_mem, %function
setup_ram_console_mem:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #20
	sub	sp, sp, #20
	add	r4, sp, #16
	movw	r3, #:lower16:memparse
	movt	r3, #:upper16:memparse
	str	r0, [r4, #-4]!
	mov	r1, r4
	blx	r3
	subs	r5, r0, #0
	moveq	r4, r5
	beq	.L20
	ldr	r0, [sp, #12]
	ldrb	r3, [r0]	@ zero_extendqisi2
	cmp	r3, #64
	movne	r4, #0
	beq	.L24
.L20:
	mov	r0, r4
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L24:
	add	ip, r0, #1
	movw	r3, #:lower16:simple_strtoul
	mov	r1, r4
	mov	r2, #0
	mov	r0, ip
	movt	r3, #:upper16:simple_strtoul
	str	ip, [sp, #12]
	mov	r7, r2
	blx	r3
	movw	r3, #:lower16:reserve_bootmem
	mov	r1, r5
	movt	r3, #:upper16:reserve_bootmem
	mov	r2, #1
	mov	r6, r0
	blx	r3
	subs	r4, r0, #0
	bne	.L25
	sub	lr, r5, #1
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	add	lr, lr, r6
	movw	r0, #:lower16:.LC2
	movw	ip, #:lower16:printk
	str	r6, [sp]
	mov	r2, r5
	str	r4, [sp, #4]
	movt	ip, #:upper16:printk
	ldr	r1, .L26
	movt	r0, #:upper16:.LC2
	str	r6, [r3, #24]
	str	lr, [r3, #28]
	blx	ip
	mov	r0, r4
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L25:
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:printk
	str	r6, [sp]
	mov	r2, r5
	str	r7, [sp, #4]
	movt	r0, #:upper16:.LC1
	movt	r3, #:upper16:printk
	ldr	r1, .L26
	blx	r3
	mvn	r4, #0
	b	.L20
.L27:
	.align	2
.L26:
	.word	.LANCHOR2+28
	.fnend
	.size	setup_ram_console_mem, .-setup_ram_console_mem
	.align	2
	.type	s5p_ohci_device_initcall, %function
s5p_ohci_device_initcall:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #:lower16:s5p_device_ohci
	movw	r3, #:lower16:platform_device_register
	movt	r0, #:upper16:s5p_device_ohci
	movt	r3, #:upper16:platform_device_register
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	s5p_ohci_device_initcall, .-s5p_ohci_device_initcall
	.align	2
	.type	s5p_ehci_device_initcall, %function
s5p_ehci_device_initcall:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #:lower16:s5p_device_ehci
	movw	r3, #:lower16:platform_device_register
	movt	r0, #:upper16:s5p_device_ehci
	movt	r3, #:upper16:platform_device_register
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	s5p_ehci_device_initcall, .-s5p_ehci_device_initcall
	.align	2
	.type	aat1290a_freeGpio, %function
aat1290a_freeGpio:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movw	r4, #:lower16:gpio_free
	movt	r4, #:upper16:gpio_free
	mov	r0, #244
	blx	r4
	mov	r0, #245
	blx	r4
	mov	r0, #0
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	aat1290a_freeGpio, .-aat1290a_freeGpio
	.align	2
	.type	aat1290a_initGpio, %function
aat1290a_initGpio:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r1, #:lower16:.LC3
	movw	r3, #:lower16:gpio_request
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movt	r1, #:upper16:.LC3
	movt	r3, #:upper16:gpio_request
	mov	r0, #243
	blx	r3
	subs	r4, r0, #0
	bne	.L34
	movw	r3, #:lower16:gpio_direction_output
	mov	r1, #1
	movt	r3, #:upper16:gpio_direction_output
	mov	r0, #243
	blx	r3
	mov	r0, r4
	ldmfd	sp!, {r4, pc}
.L34:
	movw	r0, #:lower16:.LC4
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC4
	blx	r3
	mvn	r0, #0
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	aat1290a_initGpio, .-aat1290a_initGpio
	.align	2
	.type	aat1290a_torch_set, %function
aat1290a_torch_set:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:__gpio_set_value
	mov	r1, r0
	movt	r3, #:upper16:__gpio_set_value
	mov	r0, #245
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	aat1290a_torch_set, .-aat1290a_torch_set
	.align	2
	.type	aat1290a_torch_en, %function
aat1290a_torch_en:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:__gpio_set_value
	mov	r1, r0
	movt	r3, #:upper16:__gpio_set_value
	mov	r0, #244
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	aat1290a_torch_en, .-aat1290a_torch_en
	.align	2
	.type	aat1290a_switch, %function
aat1290a_switch:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:__gpio_set_value
	mov	r1, r0
	movt	r3, #:upper16:__gpio_set_value
	mov	r0, #243
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	aat1290a_switch, .-aat1290a_switch
	.align	2
	.type	ext_cd_cleanup_hsmmc3, %function
ext_cd_cleanup_hsmmc3:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r5, r0
	movw	r3, #:lower16:mutex_lock
	movw	r0, #:lower16:.LANCHOR0
	movw	r4, #:lower16:.LANCHOR1
	movt	r3, #:upper16:mutex_lock
	movt	r0, #:upper16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR1
	blx	r3
	ldr	r3, [r4]
	cmp	r3, r5
	bne	.L40
.L39:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:mutex_unlock
	mov	r5, #0
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:mutex_unlock
	str	r5, [r4]
	blx	r3
	mov	r0, r5
	ldmfd	sp!, {r3, r4, r5, pc}
.L40:
	movw	r0, #:lower16:.LC5
	movw	r3, #:lower16:warn_slowpath_null
	movt	r0, #:upper16:.LC5
	movt	r3, #:upper16:warn_slowpath_null
	movw	r1, #761
	blx	r3
	b	.L39
	.fnend
	.size	ext_cd_cleanup_hsmmc3, .-ext_cd_cleanup_hsmmc3
	.align	2
	.type	ext_cd_init_hsmmc3, %function
ext_cd_init_hsmmc3:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r5, r0
	movw	r3, #:lower16:mutex_lock
	movw	r0, #:lower16:.LANCHOR0
	movw	r4, #:lower16:.LANCHOR1
	movt	r3, #:upper16:mutex_lock
	movt	r0, #:upper16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR1
	blx	r3
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L46
.L42:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:mutex_unlock
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:mutex_unlock
	str	r5, [r4]
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, pc}
.L46:
	movw	r0, #:lower16:.LC5
	movw	r3, #:lower16:warn_slowpath_null
	movt	r0, #:upper16:.LC5
	movt	r3, #:upper16:warn_slowpath_null
	movw	r1, #761
	blx	r3
	b	.L42
	.fnend
	.size	ext_cd_init_hsmmc3, .-ext_cd_init_hsmmc3
	.align	2
	.type	touchkey_resume, %function
touchkey_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r1, #:lower16:.LC6
	movw	r3, #:lower16:regulator_get
	movt	r1, #:upper16:.LC6
	movt	r3, #:upper16:regulator_get
	mov	r0, #0
	blx	r3
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L49
	movw	r3, #:lower16:regulator_enable
	movw	r4, #:lower16:s3c_gpio_setpull
	movt	r3, #:upper16:regulator_enable
	movt	r4, #:upper16:s3c_gpio_setpull
	blx	r3
	movw	r3, #:lower16:regulator_put
	mov	r0, r5
	movt	r3, #:upper16:regulator_put
	blx	r3
	mov	r1, #0
	mov	r0, #114
	blx	r4
	mov	r1, #0
	mov	r0, #115
	blx	r4
	mov	r0, #1
	ldmfd	sp!, {r3, r4, r5, pc}
.L49:
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	touchkey_resume, .-touchkey_resume
	.align	2
	.type	touchkey_suspend, %function
touchkey_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r1, #:lower16:.LC6
	movw	r3, #:lower16:regulator_get
	movt	r1, #:upper16:.LC6
	movt	r3, #:upper16:regulator_get
	mov	r0, #0
	blx	r3
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L53
	movw	r3, #:lower16:regulator_is_enabled
	movt	r3, #:upper16:regulator_is_enabled
	blx	r3
	cmp	r0, #0
	bne	.L57
.L52:
	movw	r4, #:lower16:s3c_gpio_setpull
	mov	r1, #1
	movt	r4, #:upper16:s3c_gpio_setpull
	mov	r0, #114
	blx	r4
	mov	r1, #1
	mov	r0, #115
	blx	r4
	movw	r3, #:lower16:regulator_put
	mov	r0, r5
	movt	r3, #:upper16:regulator_put
	blx	r3
	mov	r0, #1
	ldmfd	sp!, {r3, r4, r5, pc}
.L57:
	movw	r3, #:lower16:regulator_force_disable
	mov	r0, r5
	movt	r3, #:upper16:regulator_force_disable
	blx	r3
	b	.L52
.L53:
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	touchkey_suspend, .-touchkey_suspend
	.align	2
	.type	touchkey_power_on, %function
touchkey_power_on:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	beq	.L59
	movw	r3, #:lower16:gpio_direction_output
	mov	r1, #1
	movt	r3, #:upper16:gpio_direction_output
	mov	r0, #237
	blx	r3
	movw	r3, #:lower16:__gpio_to_irq
	mov	r0, #237
	movt	r3, #:upper16:__gpio_to_irq
	blx	r3
	movw	r3, #:lower16:irq_set_irq_type
	mov	r1, #2
	movt	r3, #:upper16:irq_set_irq_type
	blx	r3
	movw	r3, #:lower16:s3c_gpio_cfgpin
	mvn	r1, #0
	movt	r3, #:upper16:s3c_gpio_cfgpin
	mov	r0, #237
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r0, #237
	movt	r3, #:upper16:s3c_gpio_setpull
	mov	r1, #0
	blx	r3
	ldmfd	sp!, {r3, lr}
	b	touchkey_resume
.L59:
	movw	r3, #:lower16:gpio_direction_input
	mov	r0, #237
	movt	r3, #:upper16:gpio_direction_input
	blx	r3
	ldmfd	sp!, {r3, lr}
	b	touchkey_suspend
	.fnend
	.size	touchkey_power_on, .-touchkey_power_on
	.align	2
	.type	midas_map_io, %function
midas_map_io:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r0, #0
	movw	ip, #:lower16:clk_xusbxti
	mov	r4, #13824
	movw	r3, #:lower16:s5p_init_io
	movt	ip, #:upper16:clk_xusbxti
	mov	r1, r0
	mov	r2, #-33554432
	movt	r4, 366
	movt	r3, #:upper16:s5p_init_io
	str	r4, [ip, #32]
	blx	r3
	movw	r3, #:lower16:s3c24xx_init_clocks
	mov	r0, r4
	movt	r3, #:upper16:s3c24xx_init_clocks
	blx	r3
	movw	r3, #:lower16:s3c24xx_init_uarts
	ldr	r0, .L77
	movt	r3, #:upper16:s3c24xx_init_uarts
	mov	r1, #4
	blx	r3
	ldr	r0, .L77+4
	movw	ip, #:lower16:s5p_cma_region_reserve
	ldr	r3, .L77+8
	movt	ip, #:upper16:s5p_cma_region_reserve
	mov	r2, #0
	add	r1, r0, #308
	blx	ip
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	ldr	r9, [r3, #8]
	cmp	r9, #0
	ldmeqfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
	ldr	r10, [r3, #4]
	cmp	r10, #0
	ldmeqfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
	ldr	r8, .L77+4
	mov	r4, #0
	movw	r7, #:lower16:strcmp
	mov	r6, r4
	movt	r7, #:upper16:strcmp
.L63:
	ldr	r3, [r8, r4]
	movw	r1, #:lower16:.LC7
	movw	r5, #:lower16:.LANCHOR0
	add	r4, r4, #44
	movt	r1, #:upper16:.LC7
	movt	r5, #:upper16:.LANCHOR0
	subs	r0, r3, #0
	beq	.L62
	blx	r7
	cmp	r0, #0
	beq	.L76
.L62:
	cmp	r4, #308
	add	r6, r6, #1
	bne	.L63
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L76:
	mov	r2, #44
	movw	r3, #:lower16:memcpy
	mla	r5, r2, r6, r5
@ 182 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	sub	r1, r9, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	mov	r2, r10, asl #10
	movt	r3, #:upper16:memcpy
	ldr	r0, [r5, #216]
@ 182 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	sub	r0, r0, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	blx	r3
	movw	r0, #:lower16:.LC8
	movw	r3, #:lower16:printk
	mov	r1, r9
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC8
	blx	r3
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L78:
	.align	2
.L77:
	.word	.LANCHOR0+52
	.word	.LANCHOR0+212
	.word	.LANCHOR2+52
	.fnend
	.size	midas_map_io, .-midas_map_io
	.align	2
	.type	touchkey_led_power_on, %function
touchkey_led_power_on:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	subs	r1, r0, #0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:gpio_direction_output
	movne	r0, #249
	movtne	r3, #:upper16:gpio_direction_output
	movne	r1, #1
	movteq	r3, #:upper16:gpio_direction_output
	moveq	r0, #249
	blx	r3
	mov	r0, #1
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	touchkey_led_power_on, .-touchkey_led_power_on
	.align	2
	.type	aat1290a_setGpio, %function
aat1290a_setGpio:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r1, #:lower16:.LC9
	movw	r4, #:lower16:gpio_request
	movt	r1, #:upper16:.LC9
	movt	r4, #:upper16:gpio_request
	mov	r0, #244
	blx	r4
	subs	r1, r0, #0
	bne	.L86
	movw	r5, #:lower16:gpio_direction_output
	mov	r0, #244
	movt	r5, #:upper16:gpio_direction_output
	blx	r5
	movw	r1, #:lower16:.LC11
	mov	r0, #245
	movt	r1, #:upper16:.LC11
	blx	r4
	subs	r4, r0, #0
	bne	.L87
	mov	r1, r4
	mov	r0, #245
	blx	r5
	mov	r0, r4
	ldmfd	sp!, {r3, r4, r5, pc}
.L86:
	movw	r0, #:lower16:.LC10
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC10
	blx	r3
	mvn	r0, #0
	ldmfd	sp!, {r3, r4, r5, pc}
.L87:
	movw	r0, #:lower16:.LC12
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC12
	blx	r3
	movw	r3, #:lower16:gpio_free
	mov	r0, #244
	movt	r3, #:upper16:gpio_free
	blx	r3
	mvn	r0, #0
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	aat1290a_setGpio, .-aat1290a_setGpio
	.align	2
	.type	touchkey_init_hw.part.2, %function
touchkey_init_hw.part.2:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r1, #:lower16:.LC13
	movw	r5, #:lower16:gpio_request
	movt	r1, #:upper16:.LC13
	movt	r5, #:upper16:gpio_request
	mov	r0, #249
	blx	r5
	movw	r1, #:lower16:.LC14
	movw	r4, #:lower16:s3c_gpio_setpull
	movt	r1, #:upper16:.LC14
	mov	r0, #237
	blx	r5
	movt	r4, #:upper16:s3c_gpio_setpull
	mov	r1, #0
	mov	r0, #237
	movw	r5, #:lower16:__gpio_to_irq
	blx	r4
	movw	r3, #:lower16:s5p_register_gpio_interrupt
	mov	r0, #237
	movt	r3, #:upper16:s5p_register_gpio_interrupt
	movt	r5, #:upper16:__gpio_to_irq
	blx	r3
	movw	r3, #:lower16:gpio_direction_input
	mov	r0, #237
	movt	r3, #:upper16:gpio_direction_input
	blx	r3
	mov	r0, #237
	blx	r5
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	str	r0, [r3, #732]
	mov	r0, #237
	blx	r5
	movw	r3, #:lower16:irq_set_irq_type
	mov	r1, #2
	movt	r3, #:upper16:irq_set_irq_type
	blx	r3
	movw	r3, #:lower16:s3c_gpio_cfgpin
	mvn	r1, #0
	movt	r3, #:upper16:s3c_gpio_cfgpin
	mov	r0, #237
	blx	r3
	mov	r1, #1
	mov	r0, #114
	blx	r4
	mov	r1, #1
	mov	r0, #115
	blx	r4
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	touchkey_init_hw.part.2, .-touchkey_init_hw.part.2
	.align	2
	.type	touchkey_init_hw, %function
touchkey_init_hw:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:system_rev
	movt	r3, #:upper16:system_rev
	ldr	r3, [r3]
	cmp	r3, #10
	bxls	lr
	b	touchkey_init_hw.part.2
	.fnend
	.size	touchkey_init_hw, .-touchkey_init_hw
	.align	2
	.type	midas_machine_init, %function
midas_machine_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #4096
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movt	r2, 65048
	mov	r7, #0
	movw	r3, #:lower16:midas_config_gpio_table
	.pad #20
	sub	sp, sp, #20
	str	r7, [r2, #372]
	movt	r3, #:upper16:midas_config_gpio_table
	blx	r3
	movw	r2, #:lower16:exynos4_sleep_gpio_table_set
	movw	r1, #:lower16:midas_config_sleep_gpio_table
	movw	r3, #:lower16:midas_power_init
	movt	r2, #:upper16:exynos4_sleep_gpio_table_set
	movt	r1, #:upper16:midas_config_sleep_gpio_table
	movt	r3, #:upper16:midas_power_init
	str	r1, [r2]
	movw	r5, #:lower16:i2c_register_board_info
	blx	r3
	movw	r3, #:lower16:s3c_i2c0_set_platdata
	mov	r0, r7
	movt	r3, #:upper16:s3c_i2c0_set_platdata
	movt	r5, #:upper16:i2c_register_board_info
	blx	r3
	mov	r2, r7
	ldr	r1, .L138
	mov	r0, r7
	movw	r8, #:lower16:.LANCHOR0
	blx	r5
	movw	r3, #:lower16:s3c_i2c1_set_platdata
	mov	r0, r7
	movt	r3, #:upper16:s3c_i2c1_set_platdata
	movt	r8, #:upper16:.LANCHOR0
	str	r8, [sp, #12]
	movw	r6, #:lower16:platform_device_register
	blx	r3
	ldr	r1, .L138
	mov	r2, r7
	mov	r0, #1
	movt	r6, #:upper16:platform_device_register
	blx	r5
	movw	r3, #:lower16:s3c_i2c3_set_platdata
	mov	r0, r7
	movt	r3, #:upper16:s3c_i2c3_set_platdata
	movw	r4, #:lower16:system_rev
	blx	r3
	movw	r3, #:lower16:midas_tsp_init
	movt	r4, #:upper16:system_rev
	movt	r3, #:upper16:midas_tsp_init
	blx	r3
	movw	r2, #:lower16:lcdtype
	movw	r3, #:lower16:midas_tsp_set_lcdtype
	movt	r2, #:upper16:lcdtype
	movt	r3, #:upper16:midas_tsp_set_lcdtype
	ldr	r0, [r2]
	blx	r3
	add	r0, r8, #736
	blx	r6
	movw	r3, #:lower16:s3c_i2c4_set_platdata
	mov	r0, r7
	movt	r3, #:upper16:s3c_i2c4_set_platdata
	blx	r3
	ldr	r3, [r4]
	cmp	r3, #3
	beq	.L127
.L92:
	movw	r3, #:lower16:midas_sound_init
	movt	r3, #:upper16:midas_sound_init
	blx	r3
	ldr	r3, [r4]
	cmp	r3, #3
	beq	.L93
	movw	r3, #:lower16:s3c_i2c5_set_platdata
	ldr	r0, .L138+4
	movt	r3, #:upper16:s3c_i2c5_set_platdata
	blx	r3
	mov	r0, #5
	ldr	r1, .L138+8
	mov	r2, #1
	blx	r5
.L93:
	movw	r3, #:lower16:s3c_i2c7_set_platdata
	mov	r0, #0
	movt	r3, #:upper16:s3c_i2c7_set_platdata
	blx	r3
	mov	r0, #7
	ldr	r1, .L138+12
	mov	r2, #1
	blx	r5
	ldr	r3, [r4]
	cmp	r3, #10
	bhi	.L128
.L94:
	ldr	r1, .L138+16
	mov	r2, #1
	mov	r0, #8
	movw	fp, #:lower16:printk
	blx	r5
	movt	fp, #:upper16:printk
	ldr	r1, .L138
	mov	r2, #0
	mov	r0, #9
	str	fp, [sp, #4]
	blx	r5
	movw	ip, #:lower16:gpio_request
	ldr	r1, .L138
	mov	r2, #0
	mov	r0, #10
	str	ip, [sp, #8]
	blx	r5
	ldr	r8, [sp, #8]
	mov	r2, #0
	ldr	r1, .L138
	mov	r0, #11
	movt	r8, #:upper16:gpio_request
	str	r8, [sp, #8]
	blx	r5
	ldr	r1, .L138
	mov	r2, #0
	mov	r0, #12
	blx	r5
	mov	r2, #1
	ldr	r1, .L138+20
	mov	r0, #14
	blx	r5
	movw	r0, #:lower16:.LC15
	ldr	r1, .L138+24
	movt	r0, #:upper16:.LC15
	blx	fp
	ldr	r1, .L138
	mov	r2, #0
	mov	r0, #15
	blx	r5
	ldr	r1, .L138
	mov	r2, #0
	mov	r0, #16
	blx	r5
	ldr	r1, .L138+28
	mov	r2, #1
	mov	r0, #17
	blx	r5
	ldr	r1, .L138+32
	mov	r2, #1
	mov	r0, #21
	blx	r5
	movw	r1, #:lower16:.LC16
	mov	r0, #74
	movt	r1, #:upper16:.LC16
	blx	r8
	cmp	r0, #0
	bne	.L129
	movw	r3, #:lower16:s5p_register_gpio_interrupt
	mov	r0, #74
	movt	r3, #:upper16:s5p_register_gpio_interrupt
	blx	r3
	movw	r3, #:lower16:gpio_free
	mov	r0, #74
	movt	r3, #:upper16:gpio_free
	blx	r3
.L96:
	movw	r3, #:lower16:mipi_fb_init
	ldr	fp, .L138+36
	movt	r3, #:upper16:mipi_fb_init
	blx	r3
	movw	r0, #:lower16:fb_platform_data
	movw	r3, #:lower16:s3cfb_set_platdata
	movt	r0, #:upper16:fb_platform_data
	movt	r3, #:upper16:s3cfb_set_platdata
	blx	r3
	movw	r2, #:lower16:s3c_device_fb
	movw	r3, #:lower16:s5p_ehci_set_platdata
	movt	r2, #:upper16:s3c_device_fb
	movt	r3, #:upper16:s5p_ehci_set_platdata
	ldr	r0, .L138
	str	fp, [r2, #8]
	blx	r3
	movw	r3, #:lower16:s5p_ohci_set_platdata
	ldr	r0, .L138+40
	movt	r3, #:upper16:s5p_ohci_set_platdata
	blx	r3
	movw	r3, #:lower16:s3c_device_android_usb
	movt	r3, #:upper16:s3c_device_android_usb
	ldr	r5, [r3, #92]
	cmp	r5, #0
	beq	.L97
	movw	r0, #:lower16:.LC18
	ldr	r2, [r5, #36]
	mov	r3, #2
	ldr	r1, .L138+44
	movt	r0, #:upper16:.LC18
	ldr	ip, [sp, #4]
	blx	ip
	mov	r2, #2
	mov	r3, #0
	str	r2, [r5, #36]
	str	r3, [r5, #40]
.L98:
	movw	r3, #:lower16:s5p_usbgadget_set_platdata
	ldr	r0, .L138+48
	movt	r3, #:upper16:s5p_usbgadget_set_platdata
	ldr	r7, .L138+52
	blx	r3
	movw	r3, #:lower16:exynos4_fimc_is_set_platdata
	mov	r0, #0
	movt	r3, #:upper16:exynos4_fimc_is_set_platdata
	movw	r5, #:lower16:exynos4_device_fimc_is
	blx	r3
	movw	r3, #:lower16:s3c_mshci_set_platdata
	movt	r5, #:upper16:exynos4_device_fimc_is
	movt	r3, #:upper16:s3c_mshci_set_platdata
	ldr	r0, .L138+56
	str	r7, [r5, #8]!
	movw	r9, #:lower16:exynos4_device_pd
	blx	r3
	movw	r3, #:lower16:s3c_sdhci2_set_platdata
	ldr	r0, .L138+60
	movt	r3, #:upper16:s3c_sdhci2_set_platdata
	movt	r9, #:upper16:exynos4_device_pd
	blx	r3
	movw	r2, #:lower16:s3c_sdhci3_set_platdata
	ldr	r0, .L138+64
	movt	r2, #:upper16:s3c_sdhci3_set_platdata
	movw	r10, #:lower16:s5p_device_jpeg
	blx	r2
	movw	r2, #:lower16:midas_camera_init
	add	r8, r9, #1808
	movt	r2, #:upper16:midas_camera_init
	movt	r10, #:upper16:s5p_device_jpeg
	blx	r2
	movw	r2, #:lower16:s5p_device_tvout
	movw	r1, #:lower16:s5p_hdmi_hpd_set_platdata
	str	r2, [sp]
	movt	r1, #:upper16:s5p_hdmi_hpd_set_platdata
	ldr	r0, .L138+68
	add	r9, r9, #8
	blx	r1
	movw	r1, #:lower16:s5p_hdmi_cec_set_platdata
	ldr	r0, .L138+72
	movt	r1, #:upper16:s5p_hdmi_cec_set_platdata
	blx	r1
	str	r8, [r10, #8]!
	mov	r1, #26624
	ldr	r2, [sp]
	movw	ip, #:lower16:exynos4_jpeg_setup_clock
	str	fp, [r9, #1440]
	sub	fp, r7, #1440
	movt	ip, #:upper16:exynos4_jpeg_setup_clock
	mov	r0, r10
	movt	r2, #:upper16:s5p_device_tvout
	movt	r1, 2441
	str	fp, [r2, #8]!
	movw	fp, #:lower16:s5p_device_mfc
	str	r2, [sp]
	movt	fp, #:upper16:s5p_device_mfc
	blx	ip
	movw	r1, #:lower16:exynos_ion_set_platdata
	movt	r1, #:upper16:exynos_ion_set_platdata
	blx	r1
	mov	r1, #49664
	movw	ip, #:lower16:exynos4_mfc_setup_clock
	str	r9, [fp, #8]!
	movt	ip, #:upper16:exynos4_mfc_setup_clock
	movt	r1, 3051
	mov	r0, fp
	blx	ip
	movw	r1, #:lower16:s5p_fimg2d_set_platdata
	ldr	r0, .L138+76
	movt	r1, #:upper16:s5p_fimg2d_set_platdata
	blx	r1
	movw	r1, #:lower16:brcm_wlan_init
	movt	r1, #:upper16:brcm_wlan_init
	blx	r1
	movw	r1, #:lower16:s5p_tmu_set_platdata
	ldr	r0, .L138+80
	movt	r1, #:upper16:s5p_tmu_set_platdata
	blx	r1
	movw	r1, #:lower16:exynos_device_sysmmu_jpeg
	movw	r0, #:lower16:exynos_device_sysmmu_tv
	movt	r1, #:upper16:exynos_device_sysmmu_jpeg
	movt	r0, #:upper16:exynos_device_sysmmu_tv
	str	r10, [r1, #92]
	movw	r3, #:lower16:exynos_device_sysmmu_mfc_l
	str	r8, [r1, #8]
	movw	r1, #:lower16:exynos_device_sysmmu_mfc_r
	ldr	r2, [sp]
	movt	r3, #:upper16:exynos_device_sysmmu_mfc_l
	movt	r1, #:upper16:exynos_device_sysmmu_mfc_r
	str	fp, [r3, #92]
	str	r9, [r3, #8]
	movw	r3, #:lower16:exynos_device_sysmmu_fimc1
	str	r2, [r0, #92]
	sub	r2, r7, #1440
	str	r2, [r0, #8]
	movw	r2, #:lower16:exynos_device_sysmmu_fimc0
	str	fp, [r1, #92]
	movw	r0, #:lower16:exynos_device_sysmmu_fimc2
	str	r9, [r1, #8]
	movw	r1, #:lower16:exynos_device_sysmmu_fimc3
	ldr	fp, .L138+84
	movt	r2, #:upper16:exynos_device_sysmmu_fimc0
	movt	r3, #:upper16:exynos_device_sysmmu_fimc1
	movt	r0, #:upper16:exynos_device_sysmmu_fimc2
	movt	r1, #:upper16:exynos_device_sysmmu_fimc3
	ldr	ip, .L138+88
	str	r8, [r2, #8]
	movw	lr, #:lower16:exynos_device_sysmmu_is_isp
	str	r8, [r3, #8]
	movw	r9, #:lower16:exynos_device_sysmmu_g2d_acp
	str	r8, [r0, #8]
	movt	lr, #:upper16:exynos_device_sysmmu_is_isp
	str	r8, [r1, #8]
	movt	r9, #:upper16:exynos_device_sysmmu_g2d_acp
	ldr	r8, .L138+92
	str	fp, [r3, #92]
	movw	r3, #:lower16:exynos_device_sysmmu_is_cpu
	ldr	r10, .L138+96
	movt	r3, #:upper16:exynos_device_sysmmu_is_cpu
	ldr	fp, .L138+100
	str	ip, [r2, #92]
	movw	ip, #:lower16:exynos_device_sysmmu_is_drc
	movw	r2, #:lower16:exynos_device_sysmmu_is_fd
	movt	ip, #:upper16:exynos_device_sysmmu_is_drc
	movt	r2, #:upper16:exynos_device_sysmmu_is_fd
	str	r8, [r0, #92]
	movw	r8, #:lower16:platform_add_devices
	str	fp, [r1, #92]
	str	r5, [r3, #92]
	movt	r8, #:upper16:platform_add_devices
	ldr	r0, .L138+104
	mov	r1, #75
	str	r5, [lr, #92]
	str	r5, [ip, #92]
	str	r5, [r2, #92]
	str	r10, [r9, #92]
	str	r7, [r3, #8]
	str	r7, [lr, #8]
	str	r7, [ip, #8]
	str	r7, [r2, #8]
	blx	r8
	ldr	r3, [r4]
	cmp	r3, #3
	beq	.L99
	movw	r0, #:lower16:s3c_device_adc
	movt	r0, #:upper16:s3c_device_adc
	blx	r6
.L99:
	movw	r5, #:lower16:.LANCHOR0
	movt	r5, #:upper16:.LANCHOR0
	add	r0, r5, #1936
	blx	r6
	movw	r0, #:lower16:sec_device_thermistor
	movt	r0, #:upper16:sec_device_thermistor
	blx	r6
	ldr	r3, [r4]
	cmp	r3, #0
	cmpne	r3, #3
	addne	r2, r5, #2320
	movne	r1, #3
	addne	r2, r2, #4
	strne	r1, [r5, #2300]
	strne	r2, [r5, #2296]
	cmp	r3, #10
	bhi	.L130
.L101:
	ldr	r0, .L138+108
	movw	r5, #:lower16:platform_device_register
	blx	r6
	ldr	r3, [r4]
	movt	r5, #:upper16:platform_device_register
	cmp	r3, #3
	beq	.L102
	movw	r0, #:lower16:s3c_device_i2c5
	movt	r0, #:upper16:s3c_device_i2c5
	blx	r5
.L102:
	ldr	r0, .L138+112
	movw	r7, #:lower16:clk_get
	blx	r6
	movw	r1, #:lower16:.LC20
	movt	r7, #:upper16:clk_get
	movt	r1, #:upper16:.LC20
	ldr	r0, .L138+116
	blx	r7
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L131
.L103:
	movw	r1, #:lower16:.LC22
	ldr	r0, .L138+116
	movt	r1, #:upper16:.LC22
	blx	r7
	cmn	r0, #4096
	mov	r6, r0
	bhi	.L132
.L104:
	movw	r3, #:lower16:clk_set_parent
	mov	r0, r4
	movt	r3, #:upper16:clk_set_parent
	mov	r1, r6
	blx	r3
	cmp	r0, #0
	bne	.L133
.L105:
	mov	r1, #57600
	movw	r3, #:lower16:clk_set_rate
	movt	r1, 1525
	movt	r3, #:upper16:clk_set_rate
	mov	r0, r4
	movw	r5, #:lower16:clk_put
	blx	r3
	movt	r5, #:upper16:clk_put
	mov	r0, r4
	blx	r5
	mov	r0, r6
	blx	r5
	movw	r1, #:lower16:.LC25
	mov	r0, #21
	movt	r1, #:upper16:.LC25
	ldr	fp, [sp, #8]
	blx	fp
	subs	r4, r0, #0
	beq	.L134
.L106:
	movw	r6, #:lower16:s5p_gpio_set_drvstr
	mov	r4, #20
	movt	r6, #:upper16:s5p_gpio_set_drvstr
.L108:
	mov	r1, #1
	mov	r0, r4
	add	r4, r4, r1
	blx	r6
	cmp	r4, #24
	bne	.L108
	movw	r3, #:lower16:spi_register_board_info
	mov	r1, #1
	movt	r3, #:upper16:spi_register_board_info
	ldr	r0, .L138+120
	blx	r3
	movw	r3, #:lower16:dev_add
	ldr	r1, .L138+124
	movt	r3, #:upper16:dev_add
	ldr	r0, .L138+128
	blx	r3
	movw	r1, #:lower16:.LC26
	mov	r0, #0
	movt	r1, #:upper16:.LC26
	blx	r7
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L135
.L109:
	movw	r6, #:lower16:clk_enable
	mov	r0, r4
	movt	r6, #:upper16:clk_enable
	blx	r6
	mov	r0, r4
	blx	r5
	movw	r1, #:lower16:.LC28
	mov	r0, #0
	movt	r1, #:upper16:.LC28
	blx	r7
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L136
.L110:
	mov	r0, r4
	blx	r6
	mov	r0, r4
	blx	r5
	movw	r1, #:lower16:.LC30
	mov	r0, #0
	movt	r1, #:upper16:.LC30
	blx	r7
	cmn	r0, #4096
	mov	r7, r0
	bhi	.L137
.L111:
	mov	r0, r7
	movw	r4, #:lower16:ppmu_init
	blx	r6
	mov	r0, r7
	movt	r4, #:upper16:ppmu_init
	blx	r5
	movw	r0, #:lower16:exynos_ppmu
	ldr	r1, .L138+124
	movt	r0, #:upper16:exynos_ppmu
	blx	r4
	ldr	r0, .L138+132
	ldr	r1, .L138+124
	blx	r4
	ldr	r0, .L138+136
	ldr	r1, .L138+124
	blx	r4
	mov	r3, #49152
	movt	r3, 65040
	ldr	r2, [r3, #1356]
	bic	r2, r2, #15
	orr	r2, r2, #9
	str	r2, [r3, #1356]
	ldr	r2, [r3, #1352]
	bic	r2, r2, #983040
	bic	r2, r2, #15
	orr	r2, r2, #524288
	orr	r2, r2, #8
	str	r2, [r3, #1352]
	ldr	r2, [r3, #1348]
	bic	r2, r2, #983040
	bic	r2, r2, #15
	orr	r2, r2, #524288
	orr	r2, r2, #8
	str	r2, [r3, #1348]
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L128:
	bl	touchkey_init_hw.part.2
	b	.L94
.L134:
	movw	r3, #:lower16:gpio_direction_output
	mov	r1, #1
	movt	r3, #:upper16:gpio_direction_output
	mov	r0, #21
	blx	r3
	movw	r3, #:lower16:s3c_gpio_cfgpin
	mvn	r1, #14
	movt	r3, #:upper16:s3c_gpio_cfgpin
	mov	r0, #21
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r1, #3
	movt	r3, #:upper16:s3c_gpio_setpull
	mov	r0, #21
	blx	r3
	mov	r0, #1
	movw	r3, #:lower16:exynos_spi_set_info
	mov	r1, r4
	mov	r2, r0
	movt	r3, #:upper16:exynos_spi_set_info
	blx	r3
	b	.L106
.L130:
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r0, #191
	movt	r3, #:upper16:s3c_gpio_setpull
	mov	r1, #0
	blx	r3
	ldr	r3, .L138+140
	mov	r2, #4
	ldr	ip, [sp, #12]
	str	r2, [ip, #2300]
	str	r3, [ip, #2296]
	b	.L101
.L97:
	movw	r0, #:lower16:.LC19
	ldr	r1, .L138+44
	ldr	r8, [sp, #4]
	movt	r0, #:upper16:.LC19
	blx	r8
	b	.L98
.L127:
	add	r1, r8, #1088
	mov	r2, #1
	add	r1, r1, #8
	mov	r0, #4
	blx	r5
	b	.L92
.L136:
	movw	r0, #:lower16:.LC29
	ldr	r8, [sp, #4]
	movt	r0, #:upper16:.LC29
	blx	r8
	b	.L110
.L135:
	movw	r0, #:lower16:.LC27
	ldr	ip, [sp, #4]
	movt	r0, #:upper16:.LC27
	blx	ip
	b	.L109
.L133:
	movw	r0, #:lower16:.LC24
	ldr	r1, [r6, #16]
	ldr	r2, [r4, #16]
	movt	r0, #:upper16:.LC24
	ldr	r8, [sp, #4]
	blx	r8
	b	.L105
.L132:
	movw	r1, #:lower16:.LC23
	movw	r3, #:lower16:dev_err
	movt	r1, #:upper16:.LC23
	movt	r3, #:upper16:dev_err
	ldr	r0, .L138+116
	blx	r3
	b	.L104
.L131:
	movw	r1, #:lower16:.LC21
	movw	r3, #:lower16:dev_err
	movt	r1, #:upper16:.LC21
	movt	r3, #:upper16:dev_err
	ldr	r0, .L138+116
	blx	r3
	b	.L103
.L129:
	movw	r0, #:lower16:.LC17
	movt	r0, #:upper16:.LC17
	blx	fp
	b	.L96
.L137:
	movw	r0, #:lower16:.LC31
	ldr	fp, [sp, #4]
	movt	r0, #:upper16:.LC31
	blx	fp
	b	.L111
.L139:
	.align	2
.L138:
	.word	.LANCHOR1+12
	.word	.LANCHOR0+1136
	.word	.LANCHOR0+1160
	.word	.LANCHOR0+1200
	.word	.LANCHOR0+696
	.word	.LANCHOR0+1240
	.word	.LANCHOR2+540
	.word	.LANCHOR0+1280
	.word	.LANCHOR0+1320
	.word	exynos4_device_pd+728
	.word	.LANCHOR1+36
	.word	.LANCHOR2+560
	.word	.LANCHOR1+52
	.word	exynos4_device_pd+2888
	.word	.LANCHOR0+1360
	.word	.LANCHOR0+1432
	.word	.LANCHOR0+1484
	.word	.LANCHOR1+68
	.word	.LANCHOR1+80
	.word	.LANCHOR0+1536
	.word	.LANCHOR0+1556
	.word	s3c_device_fimc1+8
	.word	s3c_device_fimc0+8
	.word	s3c_device_fimc2+8
	.word	s5p_device_fimg2d+8
	.word	s3c_device_fimc3+8
	.word	.LANCHOR0+1636
	.word	.LANCHOR0+2632
	.word	.LANCHOR0+2992
	.word	exynos_device_spi1+8
	.word	.LANCHOR0+3352
	.word	.LANCHOR0+3416
	.word	.LANCHOR1+84
	.word	exynos_ppmu+68
	.word	exynos_ppmu+136
	.word	.LANCHOR0+2456
	.fnend
	.size	midas_machine_init, .-midas_machine_init
	.global	midas_tmu_data
	.global	midas_gpiokeys_platform_data
	.global	m0_rev11_buttons
	.global	m0_buttons
	.global	midas_buttons
	.global	s3c_device_i2c21
	.global	s3c_device_i2c17
	.global	s3c_device_i2c16
	.global	s3c_device_i2c15
	.global	s3c_device_i2c14
	.global	s3c_device_i2c8
	.global	default_i2c5_data
	.global	exynos4_max77693_info
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	__func__.31997, %object
	.size	__func__.31997, 26
__func__.31997:
	.ascii	"mmc_force_presence_change\000"
	.space	2
	.type	__func__.35609, %object
	.size	__func__.35609, 22
__func__.35609:
	.ascii	"setup_ram_console_mem\000"
	.space	2
	.type	map.35658, %object
	.size	map.35658, 485
map.35658:
	.ascii	"s3cfb.0=fimd;exynos4-fb.0=fimd;samsung-pd.1=fimd;s3"
	.ascii	"c-fimc.0=fimc0;s3c-fimc.1=fimc1;s3c-fimc.2=fimc2;s3"
	.ascii	"c-fimc.3=fimc3;exynos4210-fimc.0=fimc0;exynos4210-f"
	.ascii	"imc.1=fimc1;exynos4210-fimc.2=fimc2;exynos4210-fimc"
	.ascii	".3=fimc3;ion-exynos=ion;s3c-mfc/A=mfc0,mfc-secure;s"
	.ascii	"3c-mfc/B=mfc1,mfc-normal;s3c-mfc/AB=mfc;samsung-rp="
	.ascii	"srp;exynos4-fimc-is=fimc_is;s5p-fimg2d=fimg2d;s5p-s"
	.ascii	"mem/sectbl=sectbl;s5p-smem/mfc=mfc-secure;s5p-smem/"
	.ascii	"fimc=ion;s5p-smem/mfc-shm=mfc-normal;s5p-smem/fimd="
	.ascii	"fimd;s5p-smem/fimc0=fimc0\000"
	.space	3
	.type	__func__.35719, %object
	.size	__func__.35719, 19
__func__.35719:
	.ascii	"midas_machine_init\000"
	.space	1
	.type	__func__.35559, %object
	.size	__func__.35559, 24
__func__.35559:
	.ascii	"smdk4212_usbgadget_init\000"
	.type	__setup_str_early_fbmem, %object
	.size	__setup_str_early_fbmem, 6
__setup_str_early_fbmem:
	.ascii	"fbmem\000"
	.type	__setup_str_setup_ram_console_mem, %object
	.size	__setup_str_setup_ram_console_mem, 13
__setup_str_setup_ram_console_mem:
	.ascii	"ram_console=\000"
	.section	.arch.info.init,"a",%progbits
	.align	2
	.type	__mach_desc_SMDK4212, %object
	.size	__mach_desc_SMDK4212, 68
__mach_desc_SMDK4212:
	.word	3698
	.word	.LC40
	.word	1073742080
	.space	28
	.word	midas_map_io
	.word	exynos_init_reserve
	.word	exynos4_init_irq
	.word	exynos4_timer
	.word	midas_machine_init
	.word	gic_handle_irq
	.space	4
	.type	__mach_desc_SMDK4412, %object
	.size	__mach_desc_SMDK4412, 68
__mach_desc_SMDK4412:
	.word	3765
	.word	.LC40
	.word	1073742080
	.space	28
	.word	midas_map_io
	.word	exynos_init_reserve
	.word	exynos4_init_irq
	.word	exynos4_timer
	.word	midas_machine_init
	.word	gic_handle_irq
	.space	4
	.section	.initcall7.init,"aw",%progbits
	.align	2
	.type	__initcall_s5p_ehci_device_initcall7, %object
	.size	__initcall_s5p_ehci_device_initcall7, 4
__initcall_s5p_ehci_device_initcall7:
	.word	s5p_ehci_device_initcall
	.type	__initcall_s5p_ohci_device_initcall7, %object
	.size	__initcall_s5p_ohci_device_initcall7, 4
__initcall_s5p_ohci_device_initcall7:
	.word	s5p_ohci_device_initcall
	.section	___ksymtab_gpl+mmc_force_presence_change,"a",%progbits
	.align	2
	.type	__ksymtab_mmc_force_presence_change, %object
	.size	__ksymtab_mmc_force_presence_change, 8
__ksymtab_mmc_force_presence_change:
	.word	mmc_force_presence_change
	.word	__kstrtab_mmc_force_presence_change
	.section	__ksymtab_strings,"a",%progbits
	.type	__kstrtab_mmc_force_presence_change, %object
	.size	__kstrtab_mmc_force_presence_change, 26
__kstrtab_mmc_force_presence_change:
	.ascii	"mmc_force_presence_change\000"
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	notify_lock, %object
	.size	notify_lock, 24
notify_lock:
	.word	1
	.word	0
	.space	4
	.word	notify_lock+12
	.word	notify_lock+12
	.space	4
	.type	ram_console_resource, %object
	.size	ram_console_resource, 28
ram_console_resource:
	.space	12
	.word	512
	.space	12
	.type	smdk4212_uartcfgs, %object
	.size	smdk4212_uartcfgs, 160
smdk4212_uartcfgs:
	.byte	0
	.space	1
	.short	0
	.space	8
	.word	965
	.word	3
	.word	273
	.space	8
	.word	bcm_bt_lpm_exit_lpm_locked
	.space	4
	.byte	1
	.space	1
	.short	0
	.space	8
	.word	965
	.word	3
	.word	577
	.space	12
	.word	set_gps_uart_op
	.byte	2
	.space	1
	.short	0
	.space	8
	.word	965
	.word	3
	.word	273
	.space	16
	.byte	3
	.space	1
	.short	0
	.space	8
	.word	965
	.word	3
	.word	273
	.space	16
	.type	regions.35656, %object
	.size	regions.35656, 308
regions.35656:
	.word	.LC35
	.word	0
	.word	12369920
	.word	67108864
	.space	28
	.word	.LC7
	.word	0
	.word	8388608
	.word	1048576
	.space	28
	.word	.LC36
	.word	0
	.word	63963136
	.word	1048576
	.space	28
	.word	.LC37
	.word	0
	.word	1048576
	.space	32
	.word	.LC38
	.word	1707081728
	.word	15728640
	.space	32
	.word	.LC39
	.word	1677721600
	.word	4194304
	.space	32
	.space	8
	.word	0
	.space	32
	.type	regions_secure.35657, %object
	.size	regions_secure.35657, 176
regions_secure.35657:
	.word	.LC32
	.space	4
	.word	125829120
	.space	32
	.word	.LC33
	.space	4
	.word	37748736
	.space	32
	.word	.LC34
	.space	4
	.word	1048576
	.space	32
	.space	8
	.word	0
	.space	32
	.type	i2c_devs8_emul, %object
	.size	i2c_devs8_emul, 40
i2c_devs8_emul:
	.ascii	"sec_touchkey\000"
	.space	7
	.space	2
	.short	32
	.word	touchkey_pdata
	.space	12
	.type	s3c_device_aat1290a_led, %object
	.size	s3c_device_aat1290a_led, 360
s3c_device_aat1290a_led:
	.word	.LC54
	.word	-1
	.space	84
	.word	aat1290a_led_data
	.space	248
	.space	16
	.type	i2c_devs4_max77693, %object
	.size	i2c_devs4_max77693, 40
i2c_devs4_max77693:
	.ascii	"max77693\000"
	.space	11
	.space	2
	.short	102
	.word	exynos4_max77693_info
	.space	12
	.type	default_i2c5_data, %object
	.size	default_i2c5_data, 24
default_i2c5_data:
	.word	5
	.word	0
	.word	16
	.word	100000
	.word	100
	.space	4
	.type	i2c_devs5, %object
	.size	i2c_devs5, 40
i2c_devs5:
	.ascii	"max77686\000"
	.space	11
	.space	2
	.short	9
	.word	exynos4_max77686_info
	.space	12
	.type	i2c_devs7, %object
	.size	i2c_devs7, 40
i2c_devs7:
	.ascii	"max77686\000"
	.space	11
	.space	2
	.short	9
	.word	exynos4_max77686_info
	.space	12
	.type	i2c_devs14_emul, %object
	.size	i2c_devs14_emul, 40
i2c_devs14_emul:
	.ascii	"max17047-fuelgauge\000"
	.space	1
	.space	2
	.short	54
	.word	max17047_pdata
	.space	12
	.type	i2c_devs17_emul, %object
	.size	i2c_devs17_emul, 40
i2c_devs17_emul:
	.ascii	"max77693\000"
	.space	11
	.space	2
	.short	102
	.word	exynos4_max77693_info
	.space	12
	.type	i2c_devs21_emul, %object
	.size	i2c_devs21_emul, 40
i2c_devs21_emul:
	.ascii	"an30259a\000"
	.space	11
	.space	2
	.short	48
	.space	16
	.type	exynos4_mshc_pdata, %object
	.size	exynos4_mshc_pdata, 72
exynos4_mshc_pdata:
	.word	8
	.word	1074268224
	.word	540
	.word	4
	.space	12
	.word	83
	.word	128
	.space	36
	.type	smdk4212_hsmmc2_pdata, %object
	.size	smdk4212_hsmmc2_pdata, 52
smdk4212_hsmmc2_pdata:
	.space	8
	.word	2
	.word	1
	.space	4
	.word	.LC53
	.word	221
	.byte	1
	.space	23
	.type	smdk4212_hsmmc3_pdata, %object
	.size	smdk4212_hsmmc3_pdata, 52
smdk4212_hsmmc3_pdata:
	.space	8
	.word	1
	.word	1
	.space	16
	.word	1073741824
	.word	ext_cd_init_hsmmc3
	.word	ext_cd_cleanup_hsmmc3
	.space	8
	.type	fimg2d_data, %object
	.size	fimg2d_data, 20
fimg2d_data:
	.word	65
	.word	.LC43
	.word	.LC44
	.word	.LC45
	.word	199000000
	.type	midas_tmu_data, %object
	.size	midas_tmu_data, 80
midas_tmu_data:
	.word	90
	.word	95
	.word	100
	.word	105
	.word	110
	.word	120
	.word	83
	.word	88
	.word	13
	.word	10
	.word	1400000
	.word	200000
	.word	925000
	.word	900000
	.word	900000
	.space	20
	.type	midas_devices, %object
	.size	midas_devices, 300
midas_devices:
	.word	ram_console_device
	.word	exynos4_device_pd
	.word	exynos4_device_pd+360
	.word	exynos4_device_pd+720
	.word	exynos4_device_pd+1800
	.word	exynos4_device_pd+1440
	.word	exynos4_device_pd+2160
	.word	exynos4_device_pd+2880
	.word	exynos4_device_pd+2520
	.word	s3c_device_fb
	.word	mdnie_device
	.word	s3c_device_timer
	.word	s3c_device_timer+360
	.word	s3c_device_timer+720
	.word	s3c_device_timer+1080
	.word	vbatt_device
	.word	s3c_device_wdt
	.word	s3c_device_rtc
	.word	s3c_device_i2c0
	.word	s3c_device_i2c1
	.word	s3c_device_i2c3
	.word	s3c_device_i2c4
	.word	s3c_device_i2c7
	.word	s3c_device_i2c8
	.word	s3c_device_i2c9
	.word	s3c_device_i2c10
	.word	s3c_device_i2c11
	.word	s3c_device_i2c14
	.word	s3c_device_i2c15
	.word	s3c_device_i2c16
	.word	s3c_device_i2c17
	.word	s3c_device_i2c21
	.word	s3c_device_usbgadget
	.word	s3c_device_android_usb
	.word	s3c_device_usb_mass_storage
	.word	s3c_device_mshci
	.word	s3c_device_hsmmc2
	.word	s3c_device_hsmmc3
	.word	exynos_device_i2s0
	.word	exynos_device_srp
	.word	exynos4_device_fimc_is
	.word	s5p_device_tvout
	.word	s5p_device_cec
	.word	s5p_device_hpd
	.word	s3c_device_fimc0
	.word	s3c_device_fimc1
	.word	s3c_device_fimc2
	.word	s3c_device_fimc3
	.word	s3c_device_csis0
	.word	s3c_device_csis1
	.word	s5p_device_mfc
	.word	exynos_device_sysmmu_g2d_acp
	.word	exynos_device_sysmmu_fimc0
	.word	exynos_device_sysmmu_fimc1
	.word	exynos_device_sysmmu_fimc2
	.word	exynos_device_sysmmu_fimc3
	.word	exynos_device_sysmmu_jpeg
	.word	exynos_device_sysmmu_mfc_l
	.word	exynos_device_sysmmu_mfc_r
	.word	exynos_device_sysmmu_tv
	.word	exynos_device_sysmmu_is_isp
	.word	exynos_device_sysmmu_is_drc
	.word	exynos_device_sysmmu_is_fd
	.word	exynos_device_sysmmu_is_cpu
	.word	exynos_device_ion
	.word	exynos_device_flite0
	.word	exynos_device_flite1
	.word	s5p_device_fimg2d
	.word	s5p_device_jpeg
	.word	samsung_asoc_dma
	.word	samsung_asoc_idma
	.word	exynos_device_spi1
	.word	bcm4334_bluetooth_device
	.word	exynos4_busfreq
	.word	s5p_device_tmu
	.type	samsung_device_battery, %object
	.size	samsung_device_battery, 360
samsung_device_battery:
	.word	.LC47
	.word	-1
	.space	84
	.word	samsung_battery_pdata
	.space	248
	.space	16
	.type	midas_gpiokeys_platform_data, %object
	.size	midas_gpiokeys_platform_data, 28
midas_gpiokeys_platform_data:
	.word	midas_buttons
	.word	3
	.space	20
	.type	m0_buttons, %object
	.size	m0_buttons, 132
m0_buttons:
	.word	115
	.word	210
	.word	1
	.space	4
	.word	1
	.word	0
	.word	10
	.space	4
	.word	sec_debug_check_crash_key
	.word	1
	.space	4
	.word	114
	.word	220
	.word	1
	.space	4
	.word	1
	.word	0
	.word	10
	.space	4
	.word	sec_debug_check_crash_key
	.word	1
	.space	4
	.word	116
	.word	215
	.word	1
	.space	4
	.word	1
	.word	1
	.word	10
	.space	4
	.word	sec_debug_check_crash_key
	.word	1
	.space	4
	.type	m0_rev11_buttons, %object
	.size	m0_rev11_buttons, 176
m0_rev11_buttons:
	.word	115
	.word	210
	.word	1
	.space	4
	.word	1
	.word	0
	.word	10
	.space	4
	.word	sec_debug_check_crash_key
	.word	1
	.space	4
	.word	114
	.word	220
	.word	1
	.space	4
	.word	1
	.word	0
	.word	10
	.space	4
	.word	sec_debug_check_crash_key
	.word	1
	.space	4
	.word	116
	.word	215
	.word	1
	.space	4
	.word	1
	.word	1
	.word	10
	.space	4
	.word	sec_debug_check_crash_key
	.word	1
	.space	4
	.word	172
	.word	191
	.word	1
	.space	4
	.word	1
	.word	1
	.word	10
	.space	4
	.word	sec_debug_check_crash_key
	.word	1
	.space	4
	.type	midas_keypad, %object
	.size	midas_keypad, 360
midas_keypad:
	.word	.LC46
	.space	4
	.space	84
	.word	midas_gpiokeys_platform_data
	.space	248
	.space	16
	.type	s3c_device_i2c12, %object
	.size	s3c_device_i2c12, 360
s3c_device_i2c12:
	.word	.LC41
	.word	12
	.space	84
	.word	i2c12_platdata
	.space	248
	.space	16
	.type	spi1_board_info, %object
	.size	spi1_board_info, 56
spi1_board_info:
	.ascii	"s5c73m3_spi\000"
	.space	20
	.word	0
	.word	spi1_csi
	.space	4
	.word	50000000
	.short	1
	.short	0
	.byte	0
	.space	3
	.type	exynos4_busfreq, %object
	.size	exynos4_busfreq, 360
exynos4_busfreq:
	.word	.LC42
	.word	-1
	.space	352
	.type	i2c12_platdata, %object
	.size	i2c12_platdata, 20
i2c12_platdata:
	.word	231
	.word	232
	.word	2
	.space	4
	.byte	0
	.space	3
	.space	4
	.type	s3c_device_i2c11, %object
	.size	s3c_device_i2c11, 360
s3c_device_i2c11:
	.word	.LC41
	.word	11
	.space	84
	.word	i2c11_platdata
	.space	248
	.space	16
	.type	i2c11_platdata, %object
	.size	i2c11_platdata, 20
i2c11_platdata:
	.word	149
	.word	150
	.word	2
	.space	4
	.byte	0
	.space	3
	.space	4
	.type	s3c_device_i2c10, %object
	.size	s3c_device_i2c10, 360
s3c_device_i2c10:
	.word	.LC41
	.word	10
	.space	84
	.word	i2c10_platdata
	.space	248
	.space	16
	.type	i2c10_platdata, %object
	.size	i2c10_platdata, 20
i2c10_platdata:
	.word	151
	.word	152
	.word	2
	.space	4
	.byte	0
	.space	3
	.space	4
	.type	s3c_device_i2c9, %object
	.size	s3c_device_i2c9, 360
s3c_device_i2c9:
	.word	.LC41
	.word	9
	.space	84
	.word	i2c9_platdata
	.space	248
	.space	16
	.type	i2c9_platdata, %object
	.size	i2c9_platdata, 20
i2c9_platdata:
	.word	47
	.word	48
	.word	2
	.space	4
	.byte	0
	.space	3
	.type	midas_buttons, %object
	.size	midas_buttons, 132
midas_buttons:
	.word	115
	.word	244
	.word	1
	.space	4
	.word	1
	.word	0
	.word	10
	.space	4
	.word	sec_debug_check_crash_key
	.word	1
	.space	4
	.word	114
	.word	245
	.word	1
	.space	4
	.word	1
	.word	0
	.word	10
	.space	4
	.word	sec_debug_check_crash_key
	.word	1
	.space	4
	.word	116
	.word	215
	.word	1
	.space	4
	.word	1
	.word	1
	.word	10
	.space	4
	.word	sec_debug_check_crash_key
	.word	1
	.space	4
	.type	samsung_battery_pdata, %object
	.size	samsung_battery_pdata, 208
samsung_battery_pdata:
	.word	.LC48
	.word	.LC49
	.space	8
	.word	4300000
	.word	3300000
	.word	2100
	.word	2100
	.word	475
	.word	1000
	.word	475
	.word	2100
	.word	475
	.word	475
	.word	475
	.word	475
	.word	30
	.word	60
	.word	120
	.word	7200
	.word	30
	.word	10
	.word	4200000
	.word	21600
	.word	28800
	.word	5400
	.word	2
	.space	8
	.word	600
	.word	400
	.word	-50
	.word	0
	.byte	0
	.space	3
	.word	600
	.word	600
	.word	400
	.word	-50
	.word	0
	.word	480
	.word	450
	.word	-50
	.word	0
	.word	1
	.word	2
	.word	convert_adc
	.word	1
	.word	0
	.word	100
	.word	600
	.space	4
	.byte	1
	.byte	0
	.byte	0
	.space	1
	.type	ram_console_device, %object
	.size	ram_console_device, 360
ram_console_device:
	.word	.LC50
	.word	-1
	.space	336
	.word	1
	.word	ram_console_resource
	.space	8
	.type	s3c_device_i2c21, %object
	.size	s3c_device_i2c21, 360
s3c_device_i2c21:
	.word	.LC41
	.word	21
	.space	84
	.word	gpio_i2c_data21
	.space	248
	.space	16
	.type	gpio_i2c_data21, %object
	.size	gpio_i2c_data21, 20
gpio_i2c_data21:
	.word	72
	.word	71
	.space	12
	.space	4
	.type	s3c_device_i2c17, %object
	.size	s3c_device_i2c17, 360
s3c_device_i2c17:
	.word	.LC41
	.word	17
	.space	84
	.word	gpio_i2c_data17
	.space	248
	.space	16
	.type	gpio_i2c_data17, %object
	.size	gpio_i2c_data17, 20
gpio_i2c_data17:
	.word	266
	.word	267
	.space	12
	.space	4
	.type	s3c_device_i2c16, %object
	.size	s3c_device_i2c16, 360
s3c_device_i2c16:
	.word	.LC41
	.word	16
	.space	84
	.word	gpio_i2c_data16
	.space	248
	.space	16
	.type	gpio_i2c_data16, %object
	.size	gpio_i2c_data16, 20
gpio_i2c_data16:
	.word	91
	.word	89
	.space	12
	.space	4
	.type	s3c_device_i2c15, %object
	.size	s3c_device_i2c15, 360
s3c_device_i2c15:
	.word	.LC41
	.word	15
	.space	84
	.word	gpio_i2c_data15
	.space	248
	.space	16
	.type	gpio_i2c_data15, %object
	.size	gpio_i2c_data15, 20
gpio_i2c_data15:
	.word	51
	.word	53
	.word	3
	.word	0
	.space	4
	.type	max17047_pdata, %object
	.size	max17047_pdata, 12
max17047_pdata:
	.word	211
	.space	8
	.type	s3c_device_i2c14, %object
	.size	s3c_device_i2c14, 360
s3c_device_i2c14:
	.word	.LC41
	.word	14
	.space	84
	.word	gpio_i2c_data14
	.space	248
	.space	16
	.type	gpio_i2c_data14, %object
	.size	gpio_i2c_data14, 20
gpio_i2c_data14:
	.word	61
	.word	60
	.space	12
	.space	4
	.type	s3c_device_i2c8, %object
	.size	s3c_device_i2c8, 360
s3c_device_i2c8:
	.word	.LC41
	.word	8
	.space	84
	.word	gpio_i2c_data8
	.space	248
	.space	16
	.type	gpio_i2c_data8, %object
	.size	gpio_i2c_data8, 20
gpio_i2c_data8:
	.word	115
	.word	114
	.space	12
	.space	4
	.type	bcm4334_bluetooth_device, %object
	.size	bcm4334_bluetooth_device, 360
bcm4334_bluetooth_device:
	.word	.LC51
	.word	-1
	.space	352
	.type	exynos4_max77693_info, %object
	.size	exynos4_max77693_info, 36
exynos4_max77693_info:
	.word	424
	.word	204
	.word	1
	.word	max77693_muic
	.word	is_muic_default_uart_path_cp
	.word	max77693_regulators
	.word	3
	.word	max77693_haptic_pdata
	.word	max77693_charger_pdata
	.type	max77693_charger_pdata, %object
	.size	max77693_charger_pdata, 20
max77693_charger_pdata:
	.space	8
	.word	217
	.word	212
	.byte	0
	.space	3
	.type	max77693_haptic_pdata, %object
	.size	max77693_haptic_pdata, 24
max77693_haptic_pdata:
	.short	10000
	.short	-30036
	.short	-27632
	.short	130
	.word	.LC52
	.word	0
	.word	0
	.word	0
	.type	aat1290a_led_data, %object
	.size	aat1290a_led_data, 32
aat1290a_led_data:
	.word	7
	.word	0
	.word	aat1290a_switch
	.word	aat1290a_initGpio
	.word	aat1290a_setGpio
	.word	aat1290a_freeGpio
	.word	aat1290a_torch_en
	.word	aat1290a_torch_set
	.type	touchkey_pdata, %object
	.size	touchkey_pdata, 36
touchkey_pdata:
	.word	115
	.word	114
	.word	237
	.word	touchkey_init_hw
	.word	touchkey_suspend
	.word	touchkey_resume
	.word	touchkey_power_on
	.word	touchkey_led_power_on
	.space	4
	.type	spi1_csi, %object
	.size	spi1_csi, 12
spi1_csi:
	.byte	0
	.space	3
	.word	21
	.word	__gpio_set_value
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<4>%s: called for device with no notifier\012\000"
	.space	1
.LC1:
	.ascii	"<3>%s: failed reserving size %d at base 0x%llx\012\000"
.LC2:
	.ascii	"<3>%s: %x at %llx\012\000"
	.space	1
.LC3:
	.ascii	"CAM_SW_EN\000"
	.space	2
.LC4:
	.ascii	"<3>failed to request CAM_SW_EN\012\000"
.LC5:
	.ascii	"/media/system1/root/CM14/kernel/samsung/smdk4412/ar"
	.ascii	"ch/arm/mach-exynos/mach-midas.c\000"
	.space	1
.LC6:
	.ascii	"touchkey\000"
	.space	3
.LC7:
	.ascii	"fimd\000"
	.space	3
.LC8:
	.ascii	"<6>Bootloader sent 'fbmem' : %08X\012\000"
	.space	1
.LC9:
	.ascii	"TORCH_EN\000"
	.space	3
.LC10:
	.ascii	"<3>failed to request TORCH_EN\012\000"
	.space	1
.LC11:
	.ascii	"TORCH_SET\000"
	.space	2
.LC12:
	.ascii	"<3>failed to request TORCH_SET\012\000"
.LC13:
	.ascii	"gpio_3_touch_en\000"
.LC14:
	.ascii	"3_TOUCH_INT\000"
.LC15:
	.ascii	"<6>%s() register sii9234 driver\012\000"
	.space	3
.LC16:
	.ascii	"OLED_DET\000"
	.space	3
.LC17:
	.ascii	"<3>Request GPIO_OLED_DET is failed\012\000"
.LC18:
	.ascii	"<7>usb: %s: default luns=%d, new luns=%d\012\000"
	.space	2
.LC19:
	.ascii	"<7>usb: %s android_pdata is not available\012\000"
	.space	1
.LC20:
	.ascii	"dout_spi1\000"
	.space	2
.LC21:
	.ascii	"failed to get sclk for SPI-1\012\000"
	.space	2
.LC22:
	.ascii	"mout_mpll_user\000"
	.space	1
.LC23:
	.ascii	"failed to get prnt\012\000"
.LC24:
	.ascii	"<3>Unable to set parent %s of clock %s.\012\000"
	.space	3
.LC25:
	.ascii	"SPI_CS1\000"
.LC26:
	.ascii	"ppmudmc0\000"
	.space	3
.LC27:
	.ascii	"<3>failed to get ppmu_dmc0\012\000"
.LC28:
	.ascii	"ppmudmc1\000"
	.space	3
.LC29:
	.ascii	"<3>failed to get ppmu_dmc1\012\000"
.LC30:
	.ascii	"ppmucpu\000"
.LC31:
	.ascii	"<3>failed to get ppmu_cpu\012\000"
	.space	1
.LC32:
	.ascii	"ion\000"
.LC33:
	.ascii	"mfc-secure\000"
	.space	1
.LC34:
	.ascii	"sectbl\000"
	.space	1
.LC35:
	.ascii	"fimc_is\000"
.LC36:
	.ascii	"fimc0\000"
	.space	2
.LC37:
	.ascii	"srp\000"
.LC38:
	.ascii	"fimc1\000"
	.space	2
.LC39:
	.ascii	"mfc-normal\000"
	.space	1
.LC40:
	.ascii	"SMDK4x12\000"
	.space	3
.LC41:
	.ascii	"i2c-gpio\000"
	.space	3
.LC42:
	.ascii	"exynos-busfreq\000"
	.space	1
.LC43:
	.ascii	"mout_g2d0\000"
	.space	2
.LC44:
	.ascii	"sclk_fimg2d\000"
.LC45:
	.ascii	"fimg2d\000"
	.space	1
.LC46:
	.ascii	"gpio-keys\000"
	.space	2
.LC47:
	.ascii	"samsung-battery\000"
.LC48:
	.ascii	"max77693-charger\000"
	.space	3
.LC49:
	.ascii	"max17047-fuelgauge\000"
	.space	1
.LC50:
	.ascii	"ram_console\000"
.LC51:
	.ascii	"bcm4334_bluetooth\000"
	.space	2
.LC52:
	.ascii	"vmotor\000"
	.space	1
.LC53:
	.ascii	"vtf_2.8v\000"
	.space	3
.LC54:
	.ascii	"aat1290a-led\000"
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	hsmmc3_notify_func, %object
	.size	hsmmc3_notify_func, 4
hsmmc3_notify_func:
	.space	4
	.type	fbmem_size, %object
	.size	fbmem_size, 4
fbmem_size:
	.space	4
	.type	fbmem_start, %object
	.size	fbmem_start, 4
fbmem_start:
	.space	4
	.type	i2c_devs0, %object
	.size	i2c_devs0, 0
i2c_devs0:
	.type	i2c_devs1, %object
	.size	i2c_devs1, 0
i2c_devs1:
	.type	i2c_devs9_emul, %object
	.size	i2c_devs9_emul, 0
i2c_devs9_emul:
	.type	i2c_devs10_emul, %object
	.size	i2c_devs10_emul, 0
i2c_devs10_emul:
	.type	i2c_devs11_emul, %object
	.size	i2c_devs11_emul, 0
i2c_devs11_emul:
	.type	i2c_devs12_emul, %object
	.size	i2c_devs12_emul, 0
i2c_devs12_emul:
	.type	i2c_devs15_emul, %object
	.size	i2c_devs15_emul, 0
i2c_devs15_emul:
	.type	i2c_devs16_emul, %object
	.size	i2c_devs16_emul, 0
i2c_devs16_emul:
	.type	smdk4212_ehci_pdata, %object
	.size	smdk4212_ehci_pdata, 24
smdk4212_ehci_pdata:
	.space	24
	.type	smdk4212_ohci_pdata, %object
	.size	smdk4212_ohci_pdata, 16
smdk4212_ohci_pdata:
	.space	16
	.type	smdk4212_usbgadget_pdata, %object
	.size	smdk4212_usbgadget_pdata, 16
smdk4212_usbgadget_pdata:
	.space	16
	.type	hdmi_hpd_data, %object
	.size	hdmi_hpd_data, 12
hdmi_hpd_data:
	.space	12
	.type	hdmi_cec_data, %object
	.size	hdmi_cec_data, 4
hdmi_cec_data:
	.space	4
	.type	busfreq, %object
	.size	busfreq, 20
busfreq:
	.space	20
	.section	.init.setup,"aw",%progbits
	.align	2
	.type	__setup_early_fbmem, %object
	.size	__setup_early_fbmem, 12
__setup_early_fbmem:
	.word	__setup_str_early_fbmem
	.word	early_fbmem
	.word	1
	.type	__setup_setup_ram_console_mem, %object
	.size	__setup_setup_ram_console_mem, 12
__setup_setup_ram_console_mem:
	.word	__setup_str_setup_ram_console_mem
	.word	setup_ram_console_mem
	.word	0
	.ident	"GCC: (GNU) 4.8"
