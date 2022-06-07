#!/bin/sh

if grep -Eq "^BR2_PACKAGE_SELINUX_PYTHON=y$" ${BR2_CONFIG}; then
	if [ ! -L "${TARGET_DIR}/ausearch" ]; then
		cd ${TARGET_DIR}/sbin && ln -s /usr/sbin/ausearch ausearch
		cd -
	fi
fi

if grep -Eq "^BR2_PACKAGE_SELINUX_PYTHON=y$" ${BR2_CONFIG}; then
	if [ ! -L "${TARGET_DIR}/usr/lib/python3.9/site-packages/_semanage.so" ]; then
		cd ${TARGET_DIR}/usr/lib/python3.9/site-packages && \
		ln -s _semanage.cpython-39-x86_64-linux-gnu.so _semanage.so
		cd -
	fi
fi

if grep -Eq "^BR2_PACKAGE_POLICYCOREUTILS=y$" ${BR2_CONFIG}; then
	mkdir -p ${TARGET_DIR}/var/lib/selinux
fi

CHECKPOLICY_VER=3.2
if grep -Eq "^BR2_PACKAGE_CHECKPOLICY=y$" ${BR2_CONFIG}; then
	cp -f ${BUILD_DIR}/checkpolicy-${CHECKPOLICY_VER}/test/dismod ${TARGET_DIR}/usr/bin
fi
