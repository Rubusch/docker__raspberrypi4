#!/bin/sh -e
MY_USER="$(whoami)"
MY_HOME="/home/${MY_USER}"
BUILDROOT_DIR="${MY_HOME}/buildroot"
DEFCONFIG=lothars__raspberrypi4_defconfig

## prepare
00_defenv.sh "${BUILDROOT_DIR}" "${MY_HOME}/.gitconfig"

## initial clone
FIRST="$(ls -A "${BUILDROOT_DIR}")" || true
if [ -z "${FIRST}" ]; then
    cd "${MY_HOME}"

    ## NB: since we mount 'dl' and 'output', it needs a patched version of buildroot
    RUN git clone -j4 --depth=1 --branch ${BRANCH} https://github.com/Rubusch/buildroot.git buildroot
    ## alternatively get official buildrooot
    #RUN git clone -j4 --depth=1 https://github.com/buildroot/buildroot.git buildroot
fi

cd ${BUILDROOT_DIR}
make defconfig ${DEFCONFIG} || exit 1
make -j8 || exit 1

echo "READY."
