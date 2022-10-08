#-----------------------------------------------------------------------------
# The confidential and proprietary information contained in this file may
# only be used by a person authorised under and to the extent permitted
# by a subsisting licensing agreement from ARM Limited or its affiliates.
#
#            (C) COPYRIGHT 2010-2017 ARM Limited or its affiliates.
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
# Cortex-M0 DesignStart FPGA simulation make file
#
#-----------------------------------------------------------------------------
#
#  Configurations
#

# Tool chain : ds5 / gcc / keil
TOOL_CHAIN      = ds5
TESTNAME        = rtx_demo

CPU_PRODUCT     = CORTEX_M0
HEXFILE         = rtx_demo_cm0.hex

ifeq ($(CPU_PRODUCT),CORTEX_M0)
  HEXFILE         = rtx_demo_cm0.hex
endif

# ---------------------------------------------------------------------------------------
all: all_$(TOOL_CHAIN)

# ---------------------------------------------------------------------------------------
hexfile_select:
	@if [ -e $(HEXFILE) ] ; then \
	  cp $(HEXFILE) rtx_demo.hex ; \
	fi

# ---------------------------------------------------------------------------------------
# DS-5
all_ds5 : hexfile_select
	@if [ -e $(TESTNAME).hex ] ; then \
	  echo "Found rtx_demo.hex ... use existing hex file. Continue ..." ; \
	else \
	  echo "RTX demo compilation not available for DS-5." ; \
	  echo "Please compile RTX demo in Keil MDK and press ENTER when ready" ; \
	  read dummy ; \
	fi

# ---------------------------------------------------------------------------------------
# gcc
#
all_gcc: hexfile_select
	@if [ -e $(TESTNAME).hex ] ; then \
	  echo "Found rtx_demo.hex ... use existing hex file. Continue ..." ; \
	else \
	  echo "RTX demo compilation not available for gcc." ;\
	  echo "Please compile RTX demo in Keil MDK and press ENTER when ready" ; \
	  read dummy ; \
	fi

# ---------------------------------------------------------------------------------------
# Keil MDK

all_keil:
	@echo "Please compile your project code and press ENTER when ready"
	@read dummy
	cp $(HEXFILE) rtx_demo.hex

# ---------------------------------------------------------------------------------------
# Clean
clean :
	@rm -rf *.o
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
	@rm -rf *.sct
	@rm -rf *.uvgui.*
