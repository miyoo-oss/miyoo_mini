OUTPUTDIR:=$(CURDIR)/output
IMAGEDIR:=$(CURDIR)/output/images
RESOUCE:=_resource
FSTYPE:=_fstype
PATSIZE:=_patsize
MOUNTPT:=_mountpoint
MOUNTTG:=_mounttarget
OPTIONS:=_options
BOOTENV:=_bootenv
MTDPART:=_mtdpart
BOOTTAB:=_boottab
SYSTAB:=_systab
CISSIZE:=_cissize
BOOTADDR:=_bootaddr
COPIES:=_copies
DATASIZE:=_datasize
BKCOUNT:=_bkcount
BLKSIZE:=_blksize
PATCOUNT:=_patcount
PGSIZE:=_pgsize
OTABLK:=_otablk

include ../configs/current.configs
#include ../release/$(PRODUCT)/$(CHIP)/$(BOARD)/$(TOOLCHAIN)/toolchain.mk
include configs/$(CHIP)/$(IMAGE_CONFIG)

define multiplyhex
$(shell printf "0x%x" $(shell echo $$[$(1)*$(2)]))
endef

include configs/$(CHIP)/script_nor.mk
include configs/$(CHIP)/rootfs.mk
include image.mk
include boot.mk

PERF:=$(patsubst %,tar xf build/%.tar.gz -C $(OUTPUTDIR)/rootfs,$(PERF_NAME))
STAP:=$(patsubst %,tar xf build/%.tar.gz -C $(OUTPUTDIR)/rootfs,$(STAP_NAME))

all:
	@mkdir -p $(OUTPUTDIR)
	@mkdir -p $(IMAGEDIR)
	@mkdir -p $(IMAGEDIR)/boot
	$(MAKE) rootfs
	$(MAKE) images
	$(MAKE) boot_images
	$(MAKE) scripts

clean:
	rm -rf $(OUTPUTDIR)

