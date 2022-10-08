#-----------------------------------------------------------------------------
# The confidential and proprietary information contained in this file may
# only be used by a person authorised under and to the extent permitted
# by a subsisting licensing agreement from ARM Limited or its affiliates.
#
#            (C) COPYRIGHT 2010-2013 ARM Limited or its affiliates.
#                ALL RIGHTS RESERVED
#
# This entire notice must be reproduced on all copies of this file
# and copies of this file may only be made by a person if such person is
# permitted to do so under the terms of a subsisting license agreement
# from ARM Limited or its affiliates.
#
#  Version and Release Control Information:
#
#  File Revision       : $Revision: 368444 $
#  File Date           : $Date: 2017-07-25 15:10:13 +0100 (Tue, 25 Jul 2017) $
#
#  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
#-----------------------------------------------------------------------------
#
# CMSDK Debug Tester Makefile
#
#-----------------------------------------------------------------------------
# Remove any current implicit rules
.IMPLICIT	=

# Choose the core instantiated, can be
#  - CORTEX_M0
#  - CORTEX_M0PLUS
#  - CORTEX_M3
#  - CORTEX_M4
#  - CORTEX_M4F
#    Note: if CORTEX_M4F is used, make sure:
#     1. RTL is configured to enable FPU option (cmsdk_mcu_defs.v) and recompiled
#     2. __FPU_PRESENT variable in header file (e.g. CMSDK_CM4.h) is set to 1
CPU_PRODUCT  = CORTEX_M0

# Shared software directory
SOFTWARE_DIR = ../
CMSIS_DIR    = $(SOFTWARE_DIR)/cmsis
CORE_DIR     = $(CMSIS_DIR)/CMSIS/Include

GCC_LINKER_SCRIPT_PATH = $(SOFTWARE_DIR)/common/scripts

ifeq ($(CPU_PRODUCT),CORTEX_M0_DS)
  DEVICE_DIR   = $(CMSIS_DIR)/Device/ARM/CMSDK_CM0
  STARTUP_FILE = startup_CMSDK_CM0
  USER_DEFINE  = -DCORTEX_M0
  ARM_CPU_TYPE = --cpu=Cortex-M0
  GCC_CPU_TYPE = -mcpu=cortex-m0
  GCC_LINKER_SCRIPT = $(GCC_LINKER_SCRIPT_PATH)/debugtester.ld
endif
ifeq ($(CPU_PRODUCT),CORTEX_M0)
  DEVICE_DIR   = $(CMSIS_DIR)/Device/ARM/CMSDK_CM0
  STARTUP_FILE = startup_CMSDK_CM0
  USER_DEFINE  = -DCORTEX_M0
  ARM_CPU_TYPE = --cpu=Cortex-M0
  GCC_CPU_TYPE = -mcpu=cortex-m0
  GCC_LINKER_SCRIPT = $(GCC_LINKER_SCRIPT_PATH)/debugtester.ld
endif
ifeq ($(CPU_PRODUCT),CORTEX_M0PLUS)
  DEVICE_DIR   = $(CMSIS_DIR)/Device/ARM/CMSDK_CM0plus
  STARTUP_FILE = startup_CMSDK_CM0plus
  USER_DEFINE  = -DCORTEX_M0PLUS
  ARM_CPU_TYPE = --cpu=Cortex-M0plus
  GCC_CPU_TYPE = -mcpu=cortex-m0plus
  GCC_LINKER_SCRIPT = $(GCC_LINKER_SCRIPT_PATH)/debugtester.ld
endif
ifeq ($(CPU_PRODUCT),CORTEX_M3)
  DEVICE_DIR   = $(CMSIS_DIR)/Device/ARM/CMSDK_CM3
  STARTUP_FILE = startup_CMSDK_CM3
  USER_DEFINE  = -DCORTEX_M3
  ARM_CPU_TYPE = --cpu=Cortex-M3
  GCC_CPU_TYPE = -mcpu=cortex-m3
  GCC_LINKER_SCRIPT = $(GCC_LINKER_SCRIPT_PATH)/debugtester.ld
endif
ifeq ($(CPU_PRODUCT),CORTEX_M4)
  DEVICE_DIR   = $(CMSIS_DIR)/Device/ARM/CMSDK_CM4
  STARTUP_FILE = startup_CMSDK_CM4
  USER_DEFINE  = -DCORTEX_M4
  ARM_CPU_TYPE = --cpu=Cortex-M4
  GCC_CPU_TYPE = -mcpu=cortex-m4
  GCC_LINKER_SCRIPT = $(GCC_LINKER_SCRIPT_PATH)/debugtester.ld
endif
ifeq ($(CPU_PRODUCT),CORTEX_M4F)
  DEVICE_DIR   = $(CMSIS_DIR)/Device/ARM/CMSDK_CM4
  STARTUP_FILE = startup_CMSDK_CM4
  USER_DEFINE  = -DCORTEX_M4
  # The debug tester processor for M4F as the target is an M4, so the processor
  # for compiling the debug tester code must be M4
  ARM_CPU_TYPE = --cpu=Cortex-M4
  GCC_CPU_TYPE = -mcpu=cortex-m4
  GCC_LINKER_SCRIPT = $(GCC_LINKER_SCRIPT_PATH)/debugtester.ld
endif

# Program file
DEBUGTESTER       = debugtester

# Endian Option
COMPILE_BIGEND = 0

DEPS_LIST      = Makefile debugtester.h cmsdk_debugtester.h

# Tool chain : ds5 / gcc / keil
TOOL_CHAIN     = ds5

# ---------------------------------------------------------------------------------------
# DS-5 options

# MicroLIB option (DS-5)
COMPILE_MICROLIB = 0

ARM_CC_OPTIONS   = -c -O3 -g -Otime -I $(CORE_DIR) -I $(DEVICE_DIR)/Include \
		   -I $(SOFTWARE_DIR)/common/retarget $(USER_DEFINE)
ARM_ASM_OPTIONS  = -g

ARM_LINK_OPTIONS = "--keep=$(STARTUP_FILE).o(RESET)" "--first=$(STARTUP_FILE).o(RESET)" \
		--rw_base 0x20000000 --ro_base 0x00000000 --map

# Big Endian
ARM_CC_OPTIONS_BE = $(ARM_CC_OPTIONS) -DDEBUGTESTER_BE

ifeq ($(COMPILE_MICROLIB),1)
 # MicroLib
 ARM_CC_OPTIONS   += --library_type=microlib
 ARM_ASM_OPTIONS  += --library_type=microlib --pd "__MICROLIB SETA 1"
 ARM_LINK_OPTIONS += --library_type=microlib
endif

# ---------------------------------------------------------------------------------------
# gcc options

GNG_CC      = arm-none-eabi-gcc
GNU_OBJDUMP = arm-none-eabi-objdump
GNU_OBJCOPY = arm-none-eabi-objcopy

# The optimisation level for the GCC compiler should be fixed at -01 or the results can
# cause unpredictable results for the debugtester behaviour.
GNU_CC_FLAGS = -g -O1 -mthumb $(GCC_CPU_TYPE)

# ---------------------------------------------------------------------------------------
all: all_$(TOOL_CHAIN)

# ---------------------------------------------------------------------------------------
# DS-5
all_ds5 : $(DEBUGTESTER)_le.hex $(DEBUGTESTER)_be.hex $(DEBUGTESTER)_le.lst $(DEBUGTESTER)_be.lst

debugtester_le.o : debugtester.c $(DEPS_LIST)
	armcc $(ARM_CC_OPTIONS) $(ARM_CPU_TYPE) $< -o  $@

system_cmsdk_debugtester_le.o : 	system_cmsdk_debugtester.c $(DEPS_LIST)
	armcc $(ARM_CC_OPTIONS) $(ARM_CPU_TYPE) $< -o  $@

retarget_cmsdk_debugtester_le.o : 	retarget_cmsdk_debugtester.c $(DEPS_LIST)
	armcc $(ARM_CC_OPTIONS) $(ARM_CPU_TYPE) $< -o  $@

$(STARTUP_FILE).o : $(DEVICE_DIR)/Source/ARM/$(STARTUP_FILE).s $(DEPS_LIST)
	armasm $(ARM_ASM_OPTIONS) $(ARM_CPU_TYPE) $< -o  $@

$(DEBUGTESTER)_le.elf : $(DEBUGTESTER)_le.o $(STARTUP_FILE).o system_cmsdk_debugtester_le.o retarget_cmsdk_debugtester_le.o
	armlink $(ARM_LINK_OPTIONS) $(DEBUGTESTER)_le.o $(STARTUP_FILE).o system_cmsdk_debugtester_le.o retarget_cmsdk_debugtester_le.o -o $@

$(DEBUGTESTER)_le.hex : $(DEBUGTESTER)_le.elf
	fromelf --vhx --8x1 $< --output $@

$(DEBUGTESTER)_le.lst : $(DEBUGTESTER)_le.elf
	fromelf -c -d -e -s $< --output $@

debugtester_be.o : debugtester.c $(DEPS_LIST)
	armcc $(ARM_CC_OPTIONS_BE) $(ARM_CPU_TYPE) $< -o  $@

system_cmsdk_debugtester_be.o : 	system_cmsdk_debugtester.c $(DEPS_LIST)
	armcc $(ARM_CC_OPTIONS_BE) $(ARM_CPU_TYPE) $< -o  $@

retarget_cmsdk_debugtester_be.o : 	retarget_cmsdk_debugtester.c $(DEPS_LIST)
	armcc $(ARM_CC_OPTIONS_BE) $(ARM_CPU_TYPE) $< -o  $@

$(DEBUGTESTER)_be.elf : $(DEBUGTESTER)_be.o $(STARTUP_FILE).o system_cmsdk_debugtester_be.o retarget_cmsdk_debugtester_be.o
	armlink $(ARM_LINK_OPTIONS) $(DEBUGTESTER)_be.o $(STARTUP_FILE).o system_cmsdk_debugtester_be.o retarget_cmsdk_debugtester_be.o -o $@

$(DEBUGTESTER)_be.hex : $(DEBUGTESTER)_be.elf
	fromelf --vhx --8x1 $< --output $@

$(DEBUGTESTER)_be.lst : $(DEBUGTESTER)_be.elf
	fromelf -c -d -e -s $< --output $@

# ---------------------------------------------------------------------------------------
# GCC
all_gcc : $(DEBUGTESTER)_le $(DEBUGTESTER)_be

$(DEBUGTESTER)_le :
	$(GNG_CC) $(GNU_CC_FLAGS) $(DEVICE_DIR)/Source/GCC/$(STARTUP_FILE).s \
		$(DEBUGTESTER).c \
		system_cmsdk_debugtester.c \
		retarget_cmsdk_debugtester.c \
		-I $(DEVICE_DIR)/Include -I $(CORE_DIR) \
		-L $(GCC_LINKER_SCRIPT_PATH) \
		-D__STACK_SIZE=0x200 \
		-D__HEAP_SIZE=0x1000 \
		$(USER_DEFINE) -T $(GCC_LINKER_SCRIPT) -o $(DEBUGTESTER)_le.o
	# Generate disassembly code
	$(GNU_OBJDUMP) -S $(DEBUGTESTER)_le.o > $(DEBUGTESTER)_le.lst
	# Generate binary file
	$(GNU_OBJCOPY) -S $(DEBUGTESTER)_le.o -O binary $(DEBUGTESTER)_le.bin
	# Generate hex file
	$(GNU_OBJCOPY) -S $(DEBUGTESTER)_le.o -O verilog $(DEBUGTESTER)_le.hex

$(DEBUGTESTER)_be :
	$(GNG_CC) $(GNU_CC_FLAGS) $(DEVICE_DIR)/Source/GCC/$(STARTUP_FILE).s \
		$(DEBUGTESTER).c \
		system_cmsdk_debugtester.c \
		retarget_cmsdk_debugtester.c \
		-I $(DEVICE_DIR)/Include -I $(CORE_DIR) \
		-L $(GCC_LINKER_SCRIPT_PATH) \
		-D__STACK_SIZE=0x200 \
		-D__HEAP_SIZE=0x1000 \
		$(USER_DEFINE) -DDEBUGTESTER_BE -T $(GCC_LINKER_SCRIPT) -o $(DEBUGTESTER)_be.o
	# Generate disassembly code
	$(GNU_OBJDUMP) -S $(DEBUGTESTER)_be.o > $(DEBUGTESTER)_be.lst
	# Generate binary file
	$(GNU_OBJCOPY) -S $(DEBUGTESTER)_be.o -O binary $(DEBUGTESTER)_be.bin
	# Generate hex file
	$(GNU_OBJCOPY) -S $(DEBUGTESTER)_be.o -O verilog $(DEBUGTESTER)_be.hex

# Note:
# If the version of object copy you are using does not support verilog hex file output,
# you can generate the hex file from binary file using the following command
#       od -v -A n -t x1 --width=1  $(DEBUGTESTER)_le.bin > $(DEBUGTESTER)_le.hex

# ---------------------------------------------------------------------------------------
# Keil MDK

all_keil:
	@echo "Please compile your project code and press ENTER when ready"
	@read dummy

# ---------------------------------------------------------------------------------------
# Binary

all_bin: $(DEBUGTESTER)_le.bin
	# Generate hex file from binary
	od -v -A n -t x1 --width=1  $(DEBUGTESTER)_le.bin > $(DEBUGTESTER)_le.hex



# ---------------------------------------------------------------------------------------
# Clean
clean:
	@rm -f *.hex *.bin *.elf *.o *.lst
	@rm -rf *.crf
	@rm -rf *.plg
	@rm -rf *.tra
	@rm -rf *.htm
	@rm -rf *.map
	@rm -rf *.dep
	@rm -rf *.d
	@rm -rf *.lnp
	@rm -rf *.bak
	@rm -rf *.lst
	@rm -rf *.axf
	@rm -rf *.__i
	@rm -rf *._ia
