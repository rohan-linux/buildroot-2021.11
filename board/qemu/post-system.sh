#!/bin/bash

SKELETON="board/rohan/skeleton"

if grep -Eq "^BR2_TARGET_ROOTFS_CPIO=y$" ${BR2_CONFIG}; then
	if [ ! -e ${TARGET_DIR}/init ]; then
		# mount devtmpfs & run '/sbin/init'
		install -m 0755 fs/cpio/init ${TARGET_DIR}/init;
    fi
fi

if [ -e ${TARGET_DIR}/etc/inittab ]; then
	if ! grep -Eq "^BR2_INIT_SYSTEMD=y$" ${BR2_CONFIG}; then
		# set autologin
		cp ${SKELETON}/etc/inittab ${TARGET_DIR}/etc/inittab
	fi
fi
