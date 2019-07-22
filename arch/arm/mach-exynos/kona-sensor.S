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
	.file	"kona-sensor.c"
	.text
	.align	2
	.global	kona_sensor_init
	.type	kona_sensor_init, %function
kona_sensor_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LANCHOR0
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR0
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	movw	r0, #:lower16:.LANCHOR1
	movw	r3, #:lower16:platform_add_devices
	movt	r3, #:upper16:platform_add_devices
	mov	r1, #0
	movt	r0, #:upper16:.LANCHOR1
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	kona_sensor_init, .-kona_sensor_init
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.17588, %object
	.size	__func__.17588, 17
__func__.17588:
	.ascii	"kona_sensor_init\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<6>%s, is called\012\000"
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	kona_sensor_devices, %object
	.size	kona_sensor_devices, 0
kona_sensor_devices:
	.ident	"GCC: (GNU) 4.8"
