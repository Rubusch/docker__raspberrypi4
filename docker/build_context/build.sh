#!/bin/sh -e
MY_USER="$(whoami)"
MY_HOME="/home/${MY_USER}"
DEFCONFIG=lothars__raspberrypi4_defconfig
CONFIGS_DIR="${MY_HOME}/configs"
BUILD_DIR="${MY_HOME}/buildroot"

## fix permissions
for item in "${BUILD_DIR}" "${CONFIGS_DIR}"; do
    test -e "${item}" && sudo chown "${MY_USER}.${MY_USER}" -R "${item}"
done

cd "${BUILD_DIR}"
make defconfig "${DEFCONFIG}" || exit 1
make -j "$(nproc)" || exit 1

echo "READY."
