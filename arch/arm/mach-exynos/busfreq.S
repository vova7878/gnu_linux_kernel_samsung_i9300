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
	.file	"busfreq.c"
	.text
	.align	2
	.type	busfreq_mon_init, %function
busfreq_mon_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mvn	r0, #18
	bx	lr
	.fnend
	.size	busfreq_mon_init, .-busfreq_mon_init
	.align	2
	.global	exynos4_busfreq_lock
	.type	exynos4_busfreq_lock, %function
exynos4_busfreq_lock:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mvn	r0, #18
	bx	lr
	.fnend
	.size	exynos4_busfreq_lock, .-exynos4_busfreq_lock
	.align	2
	.global	exynos4_busfreq_lock_free
	.type	exynos4_busfreq_lock_free, %function
exynos4_busfreq_lock_free:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	exynos4_busfreq_lock_free, .-exynos4_busfreq_lock_free
	.align	2
	.global	exynos4_request_apply
	.type	exynos4_request_apply, %function
exynos4_request_apply:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	exynos4_request_apply, .-exynos4_request_apply
	.global	curjiffies
	.global	prejiffies
	.global	cpufreq_lock_name
	.section	.rodata
	.align	2
	.type	cpufreq_lock_name, %object
	.size	cpufreq_lock_name, 72
cpufreq_lock_name:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.space	4
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.space	24
	.word	.LC7
	.space	4
	.word	.LC8
	.space	4
	.section	.initcall7.init,"aw",%progbits
	.align	2
	.type	__initcall_busfreq_mon_init7, %object
	.size	__initcall_busfreq_mon_init7, 4
__initcall_busfreq_mon_init7:
	.word	busfreq_mon_init
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"G2D\000"
.LC1:
	.ascii	"TV\000"
	.space	1
.LC2:
	.ascii	"MFC\000"
.LC3:
	.ascii	"USB\000"
.LC4:
	.ascii	"CAM\000"
.LC5:
	.ascii	"PM\000"
	.space	1
.LC6:
	.ascii	"USER\000"
	.space	3
.LC7:
	.ascii	"LCD\000"
.LC8:
	.ascii	"ROTATION_BOOSTER\000"
	.bss
	.align	2
	.type	curjiffies, %object
	.size	curjiffies, 4
curjiffies:
	.space	4
	.type	prejiffies, %object
	.size	prejiffies, 4
prejiffies:
	.space	4
	.ident	"GCC: (GNU) 4.8"
