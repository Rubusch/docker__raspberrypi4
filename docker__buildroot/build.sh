#!/bin/bash -e
export USER="$(whoami)"
export MY_HOME="/home/${USER}"
export BUILDDIR="${MY_HOME}/buildroot"

export DEFCONFIG=lothars__raspberrypi4_defconfig

sudo chown ${USER}:${USER} -R ${BUILDDIR}

cd ${BUILDDIR}
make defconfig ${DEFCONFIG}
make -j8
