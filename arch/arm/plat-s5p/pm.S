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
	.file	"pm.c"
	.text
	.align	2
	.global	s3c_pm_configure_extint
	.type	s3c_pm_configure_extint, %function
s3c_pm_configure_extint:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	s3c_pm_configure_extint, .-s3c_pm_configure_extint
	.align	2
	.global	s3c_pm_restore_core
	.type	s3c_pm_restore_core, %function
s3c_pm_restore_core:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	s3c_pm_restore_core, .-s3c_pm_restore_core
	.align	2
	.global	s3c_pm_save_core
	.type	s3c_pm_save_core, %function
s3c_pm_save_core:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	s3c_pm_save_core, .-s3c_pm_save_core
	.ident	"GCC: (GNU) 4.8"
