//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2001-2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2013-04-10 14:51:18 +0100 (Wed, 10 Apr 2013) $
//
//      Revision            : $Revision: 243489 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-01rel0
//
//-----------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
//  Abstract            : AHB BusMatrix top level README file
//------------------------------------------------------------------------------

Introduction
------------

This directory contains the AHB BusMatrix component.

cmsdk_ahb_busmatrix/bin/BuildBusMatrix.pl
  The AHB BusMatrix is a configurable component. The configuration
  process is handled by a Perl script, located in bin/BuildBusMatrix.pl

cmsdk_ahb_busmatrix/verilog/src
  The source code of the configurable AHB Bus matrix is located in
  verilog/src directory. Do not use the Verilog files in this directory
  directly.

cmsdk_ahb_busmatrix/verilog/built
  After configuration process, the Verilog files generated will be stored
  in verilog/built directory.

cmsdk_ahb_busmatrix/xml/
  During the configuration process, the configuration of the AHB BusMatrix
  can be controlled by command line options or by an XML file.
  Example XML files can be found in the xml directory.

cmsdk_mtx4x2/verilog/
  A preconfigured version of AHB Bus matrix for the example Cortex-M3/M4
  system is prepared in the cmsdk_mcu_mtx4x2 directory. The configuration
  of this bus matrix can be found in cmsdk_mcu_mtx4x2/xml/

Several example AHB Bus Matrix configuration XML files are provided.
You can generate the AHB bus matrix RTL by running the following command:

> cd logical/cmsdk_ahb_busmatrix
> bin/BuildBusMatrix.pl -xmldir xml -cfg example2x3_full.xml -over -verbose


Please refer to the Cortex-M System Design Kit Technical Reference Manual for
further details on the use of this component.

======================== End of README.txt ===========================
