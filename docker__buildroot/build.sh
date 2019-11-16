#!/bin/bash -e
export DEFCONFIG=lothars__raspberrypi4_defconfig
cd buildroot
make ${DEFCONFIG}
make -j8
