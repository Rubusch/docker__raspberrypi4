#!/bin/bash -e
USER="$(whoami)"
HOME="/home/${USER}"
DEFCONFIG=lothars__raspberrypi4_defconfig
CONFIGS_DIR="${HOME}/configs"
BUILD_DIR="${HOME}/buildroot"
SHARES=( ${BUILD_DIR} ${CONFIGS_DIR} )

## fix permissions
for item in ${SHARES[*]}; do
    test -e ${item} && sudo chown $(whoami).$(whoami) -R ${item}
done

cd ${BUILD_DIR}
make defconfig ${DEFCONFIG}
make -j8
