#!/bin/bash

while getopts "f:p:q:o:" opt; do
  case $opt in
    f)
      flashtype=$OPTARG
      ;;
    p)
      chip=$OPTARG
      ;;
    q)
      fastboot=$OPTARG
      ;;
    o)
      project=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done

DATE=$(date +%m%d)
#RELEASEDIR=ReleaseToCus_${DATE}
#images will output in ${RELEASEDIR}/images/
export RELEASEDIR=`pwd`
#release source code
#find ./boot/ | grep -v boot/.git | cpio -pdm ${RELEASEDIR}/
#find ./project/ | grep -v project/.git | cpio -pdm ${RELEASEDIR}/
#find ./kernel/ | grep -v kernel/.git | cpio -pdm ${RELEASEDIR}/
#find ./sdk/ | grep sdk/verify | grep -v sdk/verify/application/smarttalk | cpio -pdm ${RELEASEDIR}/

#save code version
#repo manifest -o snapshot.xml -r
#cp snapshot.xml ${RELEASEDIR}/sdk_version.xml

export ARCH=arm

echo chose ${flashtype}

if [ ! "${project}" = "2D06" -a ! "${project}" = "2D07" ]; then
	project=2D07
	#exit 1
fi	

export PROJECT=${project}


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


