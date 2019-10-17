//
//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited or its affiliates.
//
//            (C) COPYRIGHT 2010-2013 ARM Limited or its affiliates.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited or its affiliates.
//
//  Version and Release Control Information:
//
//  File Revision       : $Revision: 368444 $
//  File Date           : $Date: 2017-07-25 15:10:13 +0100 (Tue, 25 Jul 2017) $
//
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//-----------------------------------------------------------------------------

#define PASS 0
#define FAIL 1

#define VGAIMAGE_BASE    0x41100000
#define VGAIMAGE_OFFSET  0x00000000
#define VGAIMAGE_SIZE    0x00000100

#define VGACON_BASE      0x41000000
#define VGACON_OFFSET    0x00000000
#define VGACON_SIZE      0x00000100

#define ETH_BASE         0x40200000
#define ETH_OFFSET       0x00000000
#define ETH_SIZE         0x00000100

#define FPGASYS_BASE     0x40028000
#define FPGASYS_OFFSET   0x00000000
#define FPGASYS_SIZE     0x00000050

#define AUDIO_BASE       0x40024000
#define AUDIO_OFFSET     0x00000000
#define AUDIO_SIZE       0x00000000

#define AUDIOCFG_BASE    0x40023000
#define AUDIOCFG_OFFSET  0x00000000
#define AUDIOCFG_SIZE    0x00000100

#define CLCDTOUCH_BASE   0x40022000
#define CLCDTOUCH_OFFSET 0x00000000
#define CLCDTOUCH_SIZE   0x00000100

#define CLCDSPI_BASE     0x40021000
#define CLCDSPI_OFFSET   0x00000000
#define CLCDSPI_SIZE     0x00000100

#define EXTSPI_BASE      0x40020000
#define EXTSPI_OFFSET    0x00000000
#define EXTSPI_SIZE      0x00000100

#define SYSCTRL_BASE     0x4001F000

#define GPIO1_BASE       0x40011000
#define GPIO1_OFFSET     0x00000000
#define GPIO1_SIZE       0x00000004

#define GPIO0_BASE       0x40010000
#define GPIO0_OFFSET     0x00000000
#define GPIO0_SIZE       0x00000004

#define CMSDK_BASE       0x40000000
#define CMSDK_OFFSET     0x00000000
#define CMSDK_SIZE       0x00000004

#define PSRAM_BASE       0x21000000
#define PSRAM_OFFSET     0x00000000
#define PSRAM_SIZE       0x00000100

#define BLOCK_BASE       0x01000000
#define BLOCK_OFFSET     0x00008000
#define BLOCK_SIZE       0x00000100

#define ZBT2_BASE        0x20000000
#define ZBT2_OFFSET      0x00000000
#define ZBT2_SIZE        0x00000100

#define ZBT1_BASE        0x00000000
#define ZBT1_OFFSET      0x00100000
#define ZBT1_SIZE        0x00000100

#define I2C_CONTROL      0x00
#define I2C_CONTROLS     0x00
#define I2C_CONTROLC     0x04

#define SCC_BASE         0x4002F000

#define SCC_DLLLOCK             (SCC_BASE+0x100) // APB R  SCC RW 
#define SCC_LED                 (SCC_BASE+0x104) // APB RW SCC R  
#define SCC_SW                  (SCC_BASE+0x108) // APB R  SCC RW 
#define SCC_APBLOCK             (SCC_BASE+0x120) // APB RW SCC R  
#define SCC_AID                 (SCC_BASE+0xff8) // APB R  SCC RW 
#define SCC_ID                  (SCC_BASE+0xffc) // APB R  SCC RW 
#define SYS_CFGDATA_SERIAL      (SCC_BASE+0x0A0) // APB RW SCC  
#define SYS_CFGDATA_APB         (SCC_BASE+0x0A4) // APB RW SCC  
#define SYS_CFGCTRL             (SCC_BASE+0x0A8) // APB RW SCC  
#define SYS_CFGSTAT             (SCC_BASE+0x0AC) // APB RW SCC  

  //0xA0 SYS_CFGDATA R/W Configuration data
  //0xA4 SYS_CFGCTRL R/W Configuration control
  // Bit 11:0 OSCCLK select (0,1,2)
  // Bit 19:12 Reserved. Set to 0
  // Bit 25:20: OSCCLK (1)
  // Bit 29:26 : Reserved. Set to 0
  // Bit 30 : Write Read or write data
  // Bit 31 : Start Initiates the transfer
  //0xA8 SYS_CFGSTAT

