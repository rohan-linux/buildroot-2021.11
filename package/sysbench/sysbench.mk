################################################################################
#
# sysbench
#
################################################################################


ifeq ($(BR2_PACKAGE_SYSBENCH_0_4_12),y)
SYSBENCH_VERSION = 0.4.12
SYSBENCH_SOURCE = sysbench_$(SYSBENCH_VERSION).orig.tar.gz
SYSBENCH_SITE = https://launchpad.net/ubuntu/+archive/primary/+files

define SYSBENCH_CONFIUGRE_AC
	touch $(@D)/NEWS $(@D)/AUTHORS
endef
SYSBENCH_PRE_CONFIGURE_HOOKS += SYSBENCH_CONFIUGRE_AC
else 
ifeq ($(BR2_PACKAGE_SYSBENCH_0_4),y)
SYSBENCH_VERSION = 0.4
else ifeq ($(BR2_PACKAGE_SYSBENCH_0_5),y)
SYSBENCH_VERSION = 0.5
else ifeq ($(BR2_PACKAGE_SYSBENCH_1_0_20),y)
SYSBENCH_VERSION = 1.0.20
SYSBENCH_MAKE_ENV += \
	CROSS=$(TARGET_CROSS) \
	PLATFORM=$(BR2_ARCH)
endif
SYSBENCH_SITE = https://github.com/akopytov/sysbench
SYSBENCH_SITE_METHOD = git

ifeq ($(BR2_COMPILER_PARANOID_UNSAFE_PATH),y)
$(error BR2_COMPILER_PARANOID_UNSAFE_PATH must be disabled)
endif
endif

SYSBENCH_CFLAGS = $(TARGET_CFLAGS)
SYSBENCH_AUTORECONF = YES
SYSBENCH_AUTORECONF_OPTS = -fi
SYSBENCH_CONF_OPTS = --without-mysql

$(eval $(autotools-package))
