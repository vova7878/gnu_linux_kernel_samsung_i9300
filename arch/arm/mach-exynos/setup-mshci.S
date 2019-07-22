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
	.file	"setup-mshci.c"
	.text
	.align	2
	.global	exynos4_setup_mshci_cfg_card
	.type	exynos4_setup_mshci_cfg_card, %function
exynos4_setup_mshci_cfg_card:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	exynos4_setup_mshci_cfg_card, .-exynos4_setup_mshci_cfg_card
	.global	exynos4_mshci_clksrcs
	.data
	.align	2
	.type	exynos4_mshci_clksrcs, %object
	.size	exynos4_mshci_clksrcs, 4
exynos4_mshci_clksrcs:
	.word	.LC0
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"sclk_dwmci\000"
	.ident	"GCC: (GNU) 4.8"
