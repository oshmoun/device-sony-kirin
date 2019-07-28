# Copyright 2014 The Android Open Source Project
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

include device/sony/ganges-common/PlatformConfig.mk

TARGET_BOOTLOADER_BOARD_NAME := unknown
ifneq (,$(filter %i3113,$(TARGET_PRODUCT)))
TARGET_BOOTLOADER_BOARD_NAME := I3113
else ifneq (,$(filter %i4113,$(TARGET_PRODUCT)))
TARGET_BOOTLOADER_BOARD_NAME := I4113
else
TARGET_BOOTLOADER_BOARD_NAME := I3113
$(warning Unrecognized value for TARGET_PRODUCT: "$(TARGET_PRODUCT)", using default value: "$(TARGET_BOOTLOADER_BOARD_NAME)")
endif

# Platform
PRODUCT_PLATFORM := ganges

BOARD_KERNEL_CMDLINE += androidboot.hardware=kirin

# Partition information
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3772776448
# Reserve space for data encryption (44581257216-16384)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 44581240832
