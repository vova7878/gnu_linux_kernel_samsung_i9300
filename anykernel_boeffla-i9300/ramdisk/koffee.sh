#!/system/xbin/bash
# Koffee's startup script
# running immediatelly after mounting /system
# do not edit!

# 1. Systemless HWC
/sbin/busybox mount -o bind /res/koffee/gralloc.exynos4.so /system/lib/hw/gralloc.exynos4.so
/sbin/busybox mount -o bind /res/koffee/hwcomposer.exynos4.so /system/lib/hw/hwcomposer.exynos4.so

/sbin/busybox mount -o remount,rw /

# 2. Pyramid
/sbin/busybox echo "pyramid" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

# 3. SELinux contexts
/system/bin/restorecon -FRD /data/data
#
/sbin/busybox rm /koffee.sh
/sbin/busybox mount -o remount,ro /libs
/sbin/busybox mount -o remount,ro /
/system/bin/toybox setenforce 1
