-include $(SRCDIR)/project/$(PROJECT)/Makefile

SRCDIR := $(CURDIR)/src
OUTDIR := $(CURDIR)/output
#location of the buildroot sources
MAKEARGS := -C $(BUILDROOT)
#location to store build files
MAKEARGS += O=$(OUTDIR)/$(PROJECT)
# location to store extra config options and buildroot packages
MAKEARGS += BR2_EXTERNAL_SRC_PATH=$(SRCDIR)
#transmit project name to be able to use it in kconfig
MAKEARGS += PROJECT=$(PROJECT)
MAKEARGS += TOOLCHAIN=$(TOOLCHAIN)
# location of default defconfig
DEFCONFIG_FILE=$(SRCDIR)/project/$(PROJECT)/defconfig
DEFCONFIG := BR2_DEFCONFIG=$(DEFCONFIG_FILE)
ALT_DEFCONFIG := BR2_DEFCONFIG=$(CURDIR)/defconfig

MAKEFLAGS += --no-print-directory

#these targets change the config file
config_change_targets:=menuconfig nconfig xconfig gconfig oldconfig \
       	silentoldconfig randconfig allyesconfig allnoconfig randpackageconfig \
       	allyespackageconfig allnopackageconfig

special_target:=$(config_change_targets) Makefile defconfig savedefconfig

all	:= $(filter-out $(special_target),$(MAKECMDGOALS))

default:
	$(MAKE) $(MAKEARGS) $(DEFCONFIG) defconfig
	$(MAKE) $(MAKEARGS) $(DEFCONFIG)

.PHONY: $(special_target) $(all)

# update from current config and save it as defconfig
defconfig:
	$(MAKE) $(MAKEARGS) $(ALT_DEFCONFIG) $@
	$(MAKE) $(MAKEARGS) $(DEFCONFIG) savedefconfig

# update from defconfig and save it as current configuration
savedefconfig:
	$(MAKE) $(MAKEARGS) $(DEFCONFIG) defconfig
	$(MAKE) $(MAKEARGS) $(ALT_DEFCONFIG) savedefconfig

# update from current configuration, run the command, then save the result
$(config_change_targets): $(DEFCONFIG_FILE)
	$(MAKE) $(MAKEARGS) $(DEFCONFIG) defconfig $@
	$(MAKE) $(MAKEARGS) $(DEFCONFIG) savedefconfig

_all:
	$(MAKE) $(MAKEARGS) $(DEFCONFIG) $(all)

$(all): _all
	@:

%/: _all
	@:

Makefile:;
