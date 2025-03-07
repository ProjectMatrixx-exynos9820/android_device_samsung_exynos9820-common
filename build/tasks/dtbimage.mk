#
# Copyright (C) 2021-2025 The LineageOS Project
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
#

ifeq ($(TARGET_SOC), exynos9820)
ifneq ($(BOARD_INCLUDE_DTB_IN_BOOTIMG), true)

MKDTBOIMG  := $(HOST_OUT_EXECUTABLES)/mkdtboimg$(HOST_EXECUTABLE_SUFFIX)
KERNEL_OUT := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ
DTB_DIR    := $(KERNEL_OUT)/arch/$(KERNEL_ARCH)/boot/dts/exynos
DTB_CFG    := $(COMMON_PATH)/configs/kernel/$(TARGET_SOC).cfg

INSTALLED_DTBIMAGE_TARGET := $(PRODUCT_OUT)/dtb.img

$(INSTALLED_DTBIMAGE_TARGET): $(PRODUCT_OUT)/kernel $(MKDTBOIMG) $(AVBTOOL)
	$(hide) echo "Building dtb.img"
	$(hide) $(MKDTBOIMG) cfg_create $@ $(DTB_CFG) -d $(DTB_DIR)
	$(hide) $(call assert-max-image-size,$@,$(BOARD_DTBIMG_PARTITION_SIZE),raw)
	$(hide) $(AVBTOOL) add_hash_footer \
	  --image $@ \
	  --partition_size $(BOARD_DTBIMG_PARTITION_SIZE) \
	  --partition_name dtb \
	  --algorithm $(BOARD_AVB_ALGORITHM) \
	  --key $(BOARD_AVB_KEY_PATH)

.PHONY: dtbimage
dtbimage: $(INSTALLED_DTBIMAGE_TARGET)

INSTALLED_RADIOIMAGE_TARGET += $(INSTALLED_DTBIMAGE_TARGET)

endif
endif
