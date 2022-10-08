#-----------------------------------------------------------------------------
# The confidential and proprietary information contained in this file may
# only be used by a person authorised under and to the extent permitted
# by a subsisting licensing agreement from ARM Limited.
#
#            (C) COPYRIGHT 2011-2013 ARM Limited.
#                ALL RIGHTS RESERVED
#
# This entire notice must be reproduced on all copies of this file
# and copies of this file may only be made by a person if such person is
# permitted to do so under the terms of a subsisting license agreement
# from ARM Limited.
#
#      SVN Information
#
#      Checked In          : $Date: 2013-04-10 14:53:30 +0100 (Wed, 10 Apr 2013) $
#
#      Revision            : $Revision: 243491 $
#
#      Release Information : Cortex-M System Design Kit-r1p0-01rel0
#-----------------------------------------------------------------------------

#------------------------------------------------------------------------------
# Abstract            : Pre-configured AHB BusMatrix README file
#------------------------------------------------------------------------------

This directory contains the preconfiged AHB Bus Matrix for the example
Cortex-M3 / Cortex-M4 microcontroller in the ARM Cortex-M System Design Kit.

There are two sub-directories:
- verilog  : Verilog RTL source of the preconfigured bus matrix
- xml      : XML file for generating the bus matrix

You can re-generate the bus matrix Verilog code using the script provided
in the logical/ahb_busmatrix directory.

> cd logical/cmsdk_ahb_busmatrix
> bin/BuildBusMatrix.pl -xmldir ../cmsdk_mcu_mtx4x2/xml/ -cfg cmsdk_mcu_4x2.xml -over -verbose

You can then find the generated Verilog RTL in logical/cmsdk_ahb_busmatrix/verilog/built/cmsdk_mcu_mtx4x2/.

======================== End of README.txt ===========================
