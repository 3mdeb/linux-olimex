#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-

# build DTB overlays
if [ ! -d olinuxino-overlays ]; then
  git clone https://github.com/OLIMEX/olinuxino-overlays.git
  cd olinuxino-overlays
  make clean
  make
  cd ..
fi

make olinuxino_micro_defconfig
make -j$(nproc) LOCALVERSION=-olimex KDEB_PKGVERSION=$(make kernelversion)-$(date +%Y%m%d-%H%M%S) DTC_FLAGS=-@
mkimage -f kernel.its kernel.itb
