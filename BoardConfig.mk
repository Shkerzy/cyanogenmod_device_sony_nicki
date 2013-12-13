# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/sony/nicki/BoardConfigVendor.mk

# inherit from Sony common
-include device/sony/common/BoardConfigCommon.mk

# inherit from qcom-common
-include device/sony/qcom-common/BoardConfigCommon.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := C1904,C1905,nicki

# Architecture
TARGET_BOARD_PLATFORM := msm8960
TARGET_CPU_VARIANT := krait
TARGET_ARCH_VARIANT_CPU := cortex-a9

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -D__ARM_USE_PLD -D__ARM_CACHE_LINE_SIZE=64

# Krait optimizations
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_PLD_SET      := true
TARGET_KRAIT_BIONIC_PLDOFFS   := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH  := 64
TARGET_KRAIT_BIONIC_PLDSIZE   := 64

#TARGET_BOOTLOADER_BOARD_NAME := nicki
TARGET_BOOTLOADER_BOARD_NAME := qcom

# Kernel information
BOARD_KERNEL_CMDLINE  := panic=3 console=ttyHSL0,115200,n8 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3
BOARD_KERNEL_BASE     := 0x80200000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_MKBOOTIMG_ARGS  := --ramdisk_offset 0x02000000

# dev:          size   erasesize  name
# mmcblk0p1:  00200000 00000000 "TA"
# mmcblk0p2:  00020000 00000000 "sbl1"
# mmcblk0p3:  00040000 00000000 "sbl2"
# mmcblk0p4:  00040000 00000000 "s1sbl2"
# mmcblk0p5:  00080000 00000000 "sbl3"
# mmcblk0p6:  00080000 00000000 "aboot"
# mmcblk0p7:  00080000 00000000 "tz"
# mmcblk0p8:  00020000 00000000 "alt_sbl1"
# mmcblk0p9:  00040000 00000000 "alt_sbl2"
# mmcblk0p10: 00040000 00000000 "alt_s1sbl2"
# mmcblk0p11: 00080000 00000000 "alt_sbl3"
# mmcblk0p12: 00080000 00000000 "alt_aboot"
# mmcblk0p13: 00080000 00000000 "alt_tz"
# mmcblk0p14: 00080000 00000000 "rpm"
# mmcblk0p15: 00080000 00000000 "alt_rpm"
# mmcblk0p16: 01000000 00000000 "LTALabel"
# mmcblk0p17: 01400000 00000000 "boot"
# mmcblk0p18: 04000000 00000000 "modem"
# mmcblk0p19: 00300000 00000000 "modemst1"
# mmcblk0p20: 00300000 00000000 "modemst2"
# mmcblk0p21: 00300000 00000000 "fsg"
# mmcblk0p22: 00500000 00000000 "ramdump"
# mmcblk0p23: 01000000 00000000 "FOTAKernel"
# mmcblk0p24: 00400000 00000000 "persist"
# mmcblk0p25: 4b000000 00000000 "system"
# mmcblk0p26: 0fc00000 00000000 "cache"
# mmcblk0p27: 853fbe00 00000000 "userdata"

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x01400000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x01400000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x4B000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x853FBE00
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true

# Partition information
BOARD_VOLD_MAX_PARTITIONS := 27

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/sony/nicki/bluetooth

# Kernel
# Try build from source
TARGET_KERNEL_SOURCE := kernel/sony/nicki
TARGET_KERNEL_CONFIG := proj_S3A_user_alvin_defconfig
# if not present - use prebuilt
TARGET_PREBUILT_KERNEL := device/sony/nicki/kernel

BOARD_CUSTOM_BOOTIMG_MK := device/sony/nicki/custombootimg.mk

# CWM Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun%d/file"
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/sony/nicki/recovery/recovery_keys.c
BOARD_CUSTOM_GRAPHICS := ../../../device/sony/nicki/recovery/graphics.c
RECOVERY_NAME := CWM-based Recovery for Xperia M/M Dual
