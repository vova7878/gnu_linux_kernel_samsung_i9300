ifeq ($(CONFIG_VITHAR_HWVER_R0P0),y)
obj-y			+= drm/ vga/ ion/
else
obj-y			+= drm/ vga/ ion/
endif

ifeq ($(CONFIG_MALI400),y)
ifeq ($(CONFIG_MALI_VER_R3P2),y)
obj-y           += mali400/r3p2/mali/
obj-y           += mali400/r3p2/ump/
endif
endif
ifeq ($(CONFIG_UMPLOCK),y)
obj-y			+= mali400/umplock/
endif

ifeq ($(CONFIG_UMP),y)
obj-y			+= mali400/ump/
endif

obj-$(CONFIG_TEGRA_HOST1X)	+= host1x/
obj-$(CONFIG_IMX_IPUV3_CORE)	+= ipu-v3/
