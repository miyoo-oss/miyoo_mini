#!/bin/bash
set -e
export RELEASEDIR=`pwd`
export ARCH=arm
export PROJECT=2D06

# build uboot
cd ${RELEASEDIR}/boot
declare -x ARCH="arm"
declare -x CROSS_COMPILE="arm-linux-gnueabihf-"

#make mrproper
#make clean
make infinity2m_defconfig
make -j24

if [ -d ../project/board/i2m/boot/nor/uboot ]; then
	cp u-boot.xz.img.bin ../project/board/i2m/boot/nor/uboot
fi

#build kernel
cd ${RELEASEDIR}/kernel
declare -x ARCH="arm"
declare -x CROSS_COMPILE="arm-linux-gnueabihf-"

#make clean
#make mrproper
make miyoo_defconfig
make -j24

#build project
cd ${RELEASEDIR}/project
./setup_config.sh ./configs/nor.glibc-squashfs.011a.128
./release.sh -k ${RELEASEDIR}/kernel -b 011A -p nvr -f nor -c i2m -l glibc -v 8.2.1

make clean
make image-nocheck


