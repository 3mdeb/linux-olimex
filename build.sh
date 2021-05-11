#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-

make olinuxino_defconfig
make -j$(nproc) bindeb-pkg LOCALVERSION=-olimex KDEB_PKGVERSION=$(make kernelversion)-$(date +%Y%m%d-%H%M%S) DTC_FLAGS=-@
