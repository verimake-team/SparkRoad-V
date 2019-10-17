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
//

#ifndef __CMSDK_DEBUGTESTER_H__
#define __CMSDK_DEBUGTESTER_H__

//////////////////////////////////////////////////////////////////////////////////
////
//// CMSDK Debug Tester CMSIS Configuration File
////
//// This file corresponds to the device.h file in the CMSIS standard,
//// and defines the peripherals for the Debug Tester device:
////   IRQ number
////   IO address mapping and data structures
////   core configuration etc
////
//////////////////////////////////////////////////////////////////////////////////

 //============================================================================
 //---------- Interrupt Number Definition -------------------------------------
 //============================================================================

typedef enum IRQn
{
///////  Cortex-M Processor Exceptions Numbers /////////////////////////////////////////////////////
  NonMaskableInt_IRQn         = -14,    //!< 2  Non Maskable Interrupt                            //
  HardFault_IRQn              = -13,    //!< 3  Cortex-M Hard Fault Interrupt                     //
  SVCall_IRQn                 = -5,     //!< 11 Cortex-M SV Call Interrupt                        //
  PendSV_IRQn                 = -2,     //!< 14 Cortex-M Pend SV Interrupt                        //
  SysTick_IRQn                = -1,     //!< 15 Cortex-M System Tick Interrupt                    //

///////  Example MCU Cortex-M specific Interrupt Numbers ///////////////////////////////////////////
  GPIO_IRQn                   = 0       //!< GPIO Interrupt                                       //
} IRQn_Type;


//
// ==========================================================================
// ----------- Processor and Core Peripheral Section ------------------------
// ==========================================================================
//

// Include the appropriate CMSIS core header file

#ifdef CORTEX_M0
#define __CM0_REV                 0x0000    /*!< Core revision r0p0                              */
#define __MPU_PRESENT             0         /*!< MPU present or not                              */
#define __NVIC_PRIO_BITS          2         /*!< Number of Bits used for Priority Levels         */
#define __Vendor_SysTickConfig    0         /*!< Set to 1 if different SysTick Config is used    */
#include "core_cm0.h"               // Cortex-M0 processor and core peripherals

#else

#ifdef CORTEX_M0PLUS
#define __CM0_REV                 0x0001    /*!< Core revision r0p1                              */
#define __MPU_PRESENT             0         /*!< MPU present or not                              */
#define __NVIC_PRIO_BITS          2         /*!< Number of Bits used for Priority Levels         */
#define __Vendor_SysTickConfig    0         /*!< Set to 1 if different SysTick Config is used    */
#include "core_cm0plus.h"           // Cortex-M0+ processor and core peripherals

#else

#ifdef CORTEX_M3
#define __CM3_REV                 0x0201    /*!< Core revision r2p1                              */
#define __MPU_PRESENT             1         /*!< MPU present or not                              */
#define __NVIC_PRIO_BITS          3         /*!< Number of Bits used for Priority Levels         */
#define __Vendor_SysTickConfig    0         /*!< Set to 1 if different SysTick Config is used    */
#include "core_cm3.h"               // Cortex-M3 processor and core peripherals

#else

#ifdef CORTEX_M4
#define __CM4_REV                 0x0001    /*!< Core revision r0p1                              */
#define __MPU_PRESENT             1         /*!< MPU present or not                              */
#define __NVIC_PRIO_BITS          3         /*!< Number of Bits used for Priority Levels         */
#define __Vendor_SysTickConfig    0         /*!< Set to 1 if different SysTick Config is used    */
#define __FPU_PRESENT             1         /*!< FPU present or not                              */
#include "core_cm4.h"               // Cortex-M4 processor and core peripherals

#endif
#endif
#endif
#endif

#include "system_cmsdk_debugtester.h"


// =============================================================================
//                Device Specific Peripheral registers structures             //
// =============================================================================

/* -------------------  Start of section using anonymous unions  ------------------ */
#if defined(__CC_ARM)
  #pragma push
  #pragma anon_unions
#elif defined(__ICCARM__)
  #pragma language=extended
#elif defined(__GNUC__)
  /* anonymous unions are enabled by default */
#elif defined(__TMS470__)
/* anonymous unions are enabled by default */
#elif defined(__TASKING__)
  #pragma warning 586
#else
  #warning Not supported compiler type
#endif


/*-------------------- General Purpose Input Output (GPIO) -------------------*/

/** @addtogroup CMSDK_GPIO CMSDK GPIO
  @{
*/
typedef struct
{
  __IO   uint32_t  DATA;             /*!< Offset: 0x000 DATA Register (R/W) */
  __IO   uint32_t  DATAOUT;          /*!< Offset: 0x004 Data Output Latch Register (R/W) */
         uint32_t  RESERVED0[2];
  __IO   uint32_t  OUTENABLESET;     /*!< Offset: 0x010 Output Enable Set Register  (R/W) */
  __IO   uint32_t  OUTENABLECLR;     /*!< Offset: 0x014 Output Enable Clear Register  (R/W) */
  __IO   uint32_t  ALTFUNCSET;       /*!< Offset: 0x018 Alternate Function Set Register  (R/W) */
  __IO   uint32_t  ALTFUNCCLR;       /*!< Offset: 0x01C Alternate Function Clear Register  (R/W) */
  __IO   uint32_t  INTENSET;         /*!< Offset: 0x020 Interrupt Enable Set Register  (R/W) */
  __IO   uint32_t  INTENCLR;         /*!< Offset: 0x024 Interrupt Enable Clear Register  (R/W) */
  __IO   uint32_t  INTTYPESET;       /*!< Offset: 0x028 Interrupt Type Set Register  (R/W) */
  __IO   uint32_t  INTTYPECLR;       /*!< Offset: 0x02C Interrupt Type Clear Register  (R/W) */
  __IO   uint32_t  INTPOLSET;        /*!< Offset: 0x030 Interrupt Polarity Set Register  (R/W) */
  __IO   uint32_t  INTPOLCLR;        /*!< Offset: 0x034 Interrupt Polarity Clear Register  (R/W) */
  union {
    __I    uint32_t  INTSTATUS;      /*!< Offset: 0x038 Interrupt Status Register (R/ ) */
    __O    uint32_t  INTCLEAR;       /*!< Offset: 0x038 Interrupt Clear Register ( /W) */
    };
  uint32_t RESERVED1[241];
  __IO   uint32_t LB_MASKED[256];    /*!< Offset: 0x400 - 0x7FC Lower byte Masked Access Register (R/W) */
  __IO   uint32_t UB_MASKED[256];    /*!< Offset: 0x800 - 0xBFC Upper byte Masked Access Register (R/W) */
} CMSDK_GPIO_TypeDef;

#define CMSDK_GPIO_DATA_Pos            0                                          /*!< CMSDK_GPIO DATA: DATA Position */
#define CMSDK_GPIO_DATA_Msk            (0xFFFFul << CMSDK_GPIO_DATA_Pos)          /*!< CMSDK_GPIO DATA: DATA Mask */

#define CMSDK_GPIO_DATAOUT_Pos         0                                          /*!< CMSDK_GPIO DATAOUT: DATAOUT Position */
#define CMSDK_GPIO_DATAOUT_Msk         (0xFFFFul << CMSDK_GPIO_DATAOUT_Pos)       /*!< CMSDK_GPIO DATAOUT: DATAOUT Mask */

#define CMSDK_GPIO_OUTENSET_Pos        0                                          /*!< CMSDK_GPIO OUTEN: OUTEN Position */
#define CMSDK_GPIO_OUTENSET_Msk        (0xFFFFul << CMSDK_GPIO_OUTEN_Pos)         /*!< CMSDK_GPIO OUTEN: OUTEN Mask */

#define CMSDK_GPIO_OUTENCLR_Pos        0                                          /*!< CMSDK_GPIO OUTEN: OUTEN Position */
#define CMSDK_GPIO_OUTENCLR_Msk        (0xFFFFul << CMSDK_GPIO_OUTEN_Pos)         /*!< CMSDK_GPIO OUTEN: OUTEN Mask */

#define CMSDK_GPIO_ALTFUNCSET_Pos      0                                          /*!< CMSDK_GPIO ALTFUNC: ALTFUNC Position */
#define CMSDK_GPIO_ALTFUNCSET_Msk      (0xFFFFul << CMSDK_GPIO_ALTFUNC_Pos)       /*!< CMSDK_GPIO ALTFUNC: ALTFUNC Mask */

#define CMSDK_GPIO_ALTFUNCCLR_Pos      0                                          /*!< CMSDK_GPIO ALTFUNC: ALTFUNC Position */
#define CMSDK_GPIO_ALTFUNCCLR_Msk      (0xFFFFul << CMSDK_GPIO_ALTFUNC_Pos)       /*!< CMSDK_GPIO ALTFUNC: ALTFUNC Mask */

#define CMSDK_GPIO_INTENSET_Pos        0                                          /*!< CMSDK_GPIO INTEN: INTEN Position */
#define CMSDK_GPIO_INTENSET_Msk        (0xFFFFul << CMSDK_GPIO_INTEN_Pos)         /*!< CMSDK_GPIO INTEN: INTEN Mask */

#define CMSDK_GPIO_INTENCLR_Pos        0                                          /*!< CMSDK_GPIO INTEN: INTEN Position */
#define CMSDK_GPIO_INTENCLR_Msk        (0xFFFFul << CMSDK_GPIO_INTEN_Pos)         /*!< CMSDK_GPIO INTEN: INTEN Mask */

#define CMSDK_GPIO_INTTYPESET_Pos      0                                          /*!< CMSDK_GPIO INTTYPE: INTTYPE Position */
#define CMSDK_GPIO_INTTYPESET_Msk      (0xFFFFul << CMSDK_GPIO_INTTYPE_Pos)       /*!< CMSDK_GPIO INTTYPE: INTTYPE Mask */

#define CMSDK_GPIO_INTTYPECLR_Pos      0                                          /*!< CMSDK_GPIO INTTYPE: INTTYPE Position */
#define CMSDK_GPIO_INTTYPECLR_Msk      (0xFFFFul << CMSDK_GPIO_INTTYPE_Pos)       /*!< CMSDK_GPIO INTTYPE: INTTYPE Mask */

#define CMSDK_GPIO_INTPOLSET_Pos       0                                          /*!< CMSDK_GPIO INTPOL: INTPOL Position */
#define CMSDK_GPIO_INTPOLSET_Msk       (0xFFFFul << CMSDK_GPIO_INTPOL_Pos)        /*!< CMSDK_GPIO INTPOL: INTPOL Mask */

#define CMSDK_GPIO_INTPOLCLR_Pos       0                                          /*!< CMSDK_GPIO INTPOL: INTPOL Position */
#define CMSDK_GPIO_INTPOLCLR_Msk       (0xFFFFul << CMSDK_GPIO_INTPOL_Pos)        /*!< CMSDK_GPIO INTPOL: INTPOL Mask */

#define CMSDK_GPIO_INTSTATUS_Pos       0                                          /*!< CMSDK_GPIO INTSTATUS: INTSTATUS Position */
#define CMSDK_GPIO_INTSTATUS_Msk       (0xFFul << CMSDK_GPIO_INTSTATUS_Pos)       /*!< CMSDK_GPIO INTSTATUS: INTSTATUS Mask */

#define CMSDK_GPIO_INTCLEAR_Pos        0                                          /*!< CMSDK_GPIO INTCLEAR: INTCLEAR Position */
#define CMSDK_GPIO_INTCLEAR_Msk        (0xFFul << CMSDK_GPIO_INTCLEAR_Pos)        /*!< CMSDK_GPIO INTCLEAR: INTCLEAR Mask */

#define CMSDK_GPIO_MASKLOWBYTE_Pos     0                                          /*!< CMSDK_GPIO MASKLOWBYTE: MASKLOWBYTE Position */
#define CMSDK_GPIO_MASKLOWBYTE_Msk     (0x00FFul << CMSDK_GPIO_MASKLOWBYTE_Pos)   /*!< CMSDK_GPIO MASKLOWBYTE: MASKLOWBYTE Mask */

#define CMSDK_GPIO_MASKHIGHBYTE_Pos    0                                          /*!< CMSDK_GPIO MASKHIGHBYTE: MASKHIGHBYTE Position */
#define CMSDK_GPIO_MASKHIGHBYTE_Msk    (0xFF00ul << CMSDK_GPIO_MASKHIGHBYTE_Pos)  /*!< CMSDK_GPIO MASKHIGHBYTE: MASKHIGHBYTE Mask */

/*@}*/ /* end of group CMSDK_GPIO */


/*-------------------- Trace Capture Buffer (TCB) -------------------*/

typedef struct
{
  __IO uint32_t CONFIG;
  __I  uint32_t DATA;
  __I  uint32_t DEPTH;
  __I  uint32_t SYNCS;
  __I  uint32_t HSYNCS;
  __I  uint32_t STATUS;

} TRACE_TypeDef;


/* --------------------  End of section using anonymous unions  ------------------- */
#if defined(__CC_ARM)
  #pragma pop
#elif defined(__ICCARM__)
  /* leave anonymous unions enabled */
#elif defined(__GNUC__)
  /* anonymous unions are enabled by default */
#elif defined(__TMS470__)
  /* anonymous unions are enabled by default */
#elif defined(__TASKING__)
  #pragma warning restore
#else
  #warning Not supported compiler type
#endif


// =============================================================================
//                         Peripheral memory map                              //
// =============================================================================
// Peripheral and SRAM base address //
#define SRAM_BASE             ((uint32_t)0x20000000)

// Peripheral memory map //
#define GPIO0_BASE            ((uint32_t)0x40000000)
#define GPIO1_BASE            ((uint32_t)0x40001000)
#define TRACE_BASE            ((uint32_t)0x40002000)

// =============================================================================
//                         Peripheral declaration                             //
// =============================================================================
#define GPIO0                    ((CMSDK_GPIO_TypeDef *) GPIO0_BASE)
#define GPIO1                    ((CMSDK_GPIO_TypeDef *) GPIO1_BASE)
#define TRACE                    ((TRACE_TypeDef *)      TRACE_BASE)

// =============================================================================
// GPIO 0 Pin Assignments
// =============================================================================

//
// Debug tester Hardware Interface to the MCU
//
// Debug tester --------------------------------------- Example MCU
//
// GPIO[15] 7 >----------------------------------------> Running
// GPIO[14] 6 >----------------------------------------> Error
// GPIO[13] 5 <----------------------------------------< Function Strobe
// GPIO[12] 4 <----------------------------------------< Function Select bit 4
// GPIO[11] 3 <----------------------------------------< Function Select bit 3
// GPIO[10] 2 <----------------------------------------< Function Select bit 2
// GPIO[ 9] 1 <----------------------------------------< Function Select bit 1
// GPIO[ 8] 0 <----------------------------------------< Function Select bit 0
//
//

#define DD_IO_RUNNING (1 << 7)
#define DD_IO_ERROR   (1 << 6)
#define DD_IO_STROBE  (1 << 5)
#define DD_IO_FUNCSEL  0x1f


//
// JTAG / SerialWire Connectivity
//
// Debug tester --------------------------------------- Example MCU
//
//
// GPIO[ 6]  6 >----------------------+
//                                  |\|
// GPIO[ 5]  5 >--------------------| >--------+-------<> SWDIOTMS
//                                  |/         |
// GPIO[ 4]  4 <-------------------------------+
// GPIO[ 3]  3 <----------------------------------------< TDO
// GPIO[ 2]  2 >----------------------------------------> TDI
// GPIO[ 1]  1 >----------------------------------------> SWCLKTCK
// GPIO[ 0]  0 >----------------------------------------> nTRST
//
//

#define DD_DBG_TMSEN    (1 << 6)
#define DD_DBG_TMS      (1 << 5)
#define DD_DBG_TMSIN    (1 << 4)
#define DD_DBG_TDO      (1 << 3)
#define DD_DBG_TDI      (1 << 2)
#define DD_DBG_SWCLKTCK (1 << 1)
#define DD_DBG_nTRST    (1 << 0)


// =============================================================================
// GPIO 1 Pin Assignments
// =============================================================================

//
// Character device for printf and miscellaneous signals
//
//
// GPIO[ 7] 7 >----------------------------------------> Character Strobe
// GPIO[ 6] 6 >----------------------------------------> \
// GPIO[ 5] 5 >---------------------------------------->  \
// GPIO[ 4] 4 >---------------------------------------->   \ Character
// GPIO[ 3] 3 >---------------------------------------->    >  Value
// GPIO[ 2] 2 >---------------------------------------->   /
// GPIO[ 1] 1 >---------------------------------------->  /
// GPIO[ 0] 0 >----------------------------------------> /
//
//

#define DD_PRINT_STROBE (1 << 7)
#define DD_PRINT_CHAR    0x7F


#endif


