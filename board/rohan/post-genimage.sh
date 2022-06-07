#!/bin/bash

if grep -Eq "^BR2_TARGET_GRUB2=y$" ${BR2_CONFIG}; then
        args=$(grep -w BR2_ROOTFS_POST_SCRIPT_ARGS ${BR2_CONFIG} | cut -d'=' -f2 | tr -d '"')
        bash -c "support/scripts/genimage.sh ${BINARIES_DIR} ${args}"
fi
