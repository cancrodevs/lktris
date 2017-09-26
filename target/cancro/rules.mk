LOCAL_DIR := $(GET_LOCAL_DIR)

INCLUDES += -I$(LOCAL_DIR)/../msm8974/include -I$(LK_TOP_DIR)/platform/msm_shared
INCLUDES += -I$(LK_TOP_DIR)/dev/gcdb/display -I$(LK_TOP_DIR)/dev/gcdb/display/include

PLATFORM := msm8974

ifeq ($(ENABLE_2NDSTAGE_BOOT),1)
MEMBASE := 0x0F900000 # SDRAM
else
MEMBASE := 0x0F900000 # SDRAM
endif
MEMSIZE := 0x00200000 # 1MB

BASE_ADDR        := 0x00000

TAGS_ADDR        := BASE_ADDR+0x00000100
KERNEL_ADDR      := BASE_ADDR+0x00008000
RAMDISK_ADDR     := BASE_ADDR+0x01000000
SCRATCH_ADDR     := 0x11000000

#DEFINES += DISPLAY_SPLASH_SCREEN=1
DEFINES += DISPLAY_TYPE_MIPI=1
DEFINES += DISPLAY_TYPE_DSI6G=1

MODULES += \
	dev/keys \
	dev/pmic/pm8x41 \
	dev/panel/msm \
    lib/ptable \
	dev/vib \
    lib/libfdt

DEFINES += \
	MEMSIZE=$(MEMSIZE) \
	MEMBASE=$(MEMBASE) \
	BASE_ADDR=$(BASE_ADDR) \
	TAGS_ADDR=$(TAGS_ADDR) \
	KERNEL_ADDR=$(KERNEL_ADDR) \
	RAMDISK_ADDR=$(RAMDISK_ADDR) \
	SCRATCH_ADDR=$(SCRATCH_ADDR)


OBJS += \
    $(LOCAL_DIR)/../msm8974/init.o \
    $(LOCAL_DIR)/../msm8974/meminfo.o \
	$(LOCAL_DIR)/target_display.o
