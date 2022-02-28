cp .config .config.bkp
make ARCH=arm CROSS_COMPILE=/home/vova7878/i9300_kernel/gcc-linaro-7.5.0-2019.12-x86_64_arm-eabi/bin/arm-eabi- mrproper
cp .config.bkp .config
