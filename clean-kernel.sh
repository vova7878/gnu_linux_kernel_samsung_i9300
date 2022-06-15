mv .config .config.bkp
make ARCH=arm CROSS_COMPILE=/home/vova7878/linux_kernel/gcc-linaro-arm-eabi/bin/arm-eabi- mrproper
mv .config.bkp .config
