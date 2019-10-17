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

//============================================================================
// Debug tester header file, contain debug related definition
//============================================================================

//============================================================================
// Define pass/fail value
//============================================================================
#define TEST_PASS 0
#define TEST_FAIL 1

// Define whether the DebugTester code should display messages
// using the character output device in the debugtester.
//#define DEBUGTESTER_PRINTF
//#define DEBUGTRACE_PRINTF


//============================================================================
// Print macro to allow conditional printing of messages
//
// Invoke like printf, but use double braces: DBG_MSG(("format %x", var));
//============================================================================

#ifdef DEBUGTESTER_PRINTF
#define DBG_MSG(arg) { printf arg ; }
#else
#define DBG_MSG(arg) { (void) 0; }
#endif

#ifdef DEBUGTRACE_PRINTF
#define TRC_MSG(arg) { printf arg ; }
#else
#define TRC_MSG(arg) { (void) 0; }
#endif

//============================================================================
// SW responses
//============================================================================
#define SW_DP_ACK_OK     1
#define SW_DP_ACK_WAIT   2
#define SW_DP_ACK_FAULT  4

// SW to Dormant state sequence
#define SWD_to_DS       0xE3BCUL

// Dormant state to SW sequence
#define DS_to_SWD_0     0x6209F392UL
#define DS_to_SWD_1     0x86852D95UL
#define DS_to_SWD_2     0xE3DDAFE9UL
#define DS_to_SWD_3     0x19BC0EA2UL

#define SW_ACTV_CODE    0x1AUL

//============================================================================
// JTAG Definitions
//============================================================================
#define JTAG_ABORT  0x8
#define JTAG_DPACC  0xa
#define JTAG_APACC  0xb
#define JTAG_IDCODE 0xe
#define JTAG_BYPASS 0xf

#define JTAG_SCAN(Address,RnW) (((Address & 0xC) >> 1) | RnW)

#define JTAG_DP_ACK_OKFAULT 2
#define JTAG_DP_ACK_WAIT    1


//============================================================================
// Macro definitions to generate SerialWire packet headers at compilation time
//============================================================================

// Header Bits

#define AP 1
#define DP 0

#define READ  1
#define WRITE 0

// DP Register Addresses

#define DPIDR     0x0
#define ABORT     0x0
#define CTRLSTAT  0x4
#define DLCR      0x4
#define TARGETID  0x4
#define HALTEV    0x4
#define RESEND    0x8
#define SELECT    0x8
#define RDBUFF    0xc
#define TARGETSEL 0xc

// DP control and state register bit definition

#define CTRL_CSYSPWRUPACK  (1UL << 31)  //System power up ack, RO
#define CTRL_CSYSPWRUPREQ  (1UL << 30)  //System power up req, RW
#define CTRL_CDBGPWRUPACK  (1UL << 29)  //Debug power up ack, RO
#define CTRL_CDBGPWRUPREQ  (1UL << 28)  //Debug power up req, RW
#define CTRL_CDBGRSTACK    (1UL << 27)  //Debug reset ack, RO
#define CTRL_CDBGRSTREQ    (1UL << 26)  //Debug reset req, RW

// AP Register Addresses

#define CSW  0x00
#define TAR  0x04
#define DRW  0x0c
#define BD0  0x10
#define BD1  0x14
#define BD2  0x18
#define BD3  0x1c
#define CFG  0xf4
#define BASE 0xf8
#define IDR  0xfc

// CSW Register Fields
#define CSW_PROT_USER     (0UL << 25)
#define CSW_PROT_PRIV     (1UL << 25)
#define CSW_PROT_BUFF     (1UL << 26)
#define CSW_PROT_CACH     (1UL << 27)
#define CSW_PROT_MASTER_CORE (0UL << 29)
#define CSW_PROT_MASTER_DBG  (1UL << 29)

#define CSW_INCR_OFF      (0UL << 4)
#define CSW_INCR_SINGLE   (1UL << 4)

#define CSW_SIZE_BYTE     0
#define CSW_SIZE_HALFWORD 1
#define CSW_SIZE_WORD     2

// Serial Wire Header Macros

#define SW_HEADER_PARITY(APnDP,RnW,Address) ( (APnDP & 0x1) ^ (RnW & 0x1) ^ ((Address & 0x4) >> 2) ^ ((Address & 0x8) >> 3) )

// Start, APnDP, RnW, A[3:2], Parity, Stop, Park
#define SW_HEADER(APnDP,RnW,Address) (1 | ((APnDP & 0x1) << 1) | ((RnW & 0x1) << 2) | ((Address & 0xC) << 1) | SW_HEADER_PARITY(APnDP,RnW,Address) << 5 | 0 << 6 | 1 << 7)


//============================================================================
// CoreSight ID Register Offset values
//============================================================================

// CID OFFSET define
#define CID0_OFFSET   0xFF0
#define CID1_OFFSET   0xFF4
#define CID2_OFFSET   0xFF8
#define CID3_OFFSET   0xFFC


// PID OFFSET define
#define PID0_OFFSET   0xFE0
#define PID1_OFFSET   0xFE4
#define PID2_OFFSET   0xFE8
#define PID3_OFFSET   0xFEC
#define PID4_OFFSET   0xFD0
#define PID5_OFFSET   0xFD4
#define PID6_OFFSET   0xFD8
#define PID7_OFFSET   0xFDC


//============================================================================
// ARMv6M and ARMv7M Architectural Debug Register Definitions
//============================================================================

// DHCSR
#define DHCSR_ADDR 0xE000EDF0

#define DBGKEY 0xA05F0000
#define S_LOCKUP   (1UL << 19)
#define S_SLEEP    (1UL << 18)
#define S_HALT     (1UL << 17)
#define S_REGRDY   (1UL << 16)
#define C_MASKINTS (1UL << 3)
#define C_STEP     (1UL << 2)
#define C_HALT     (1UL << 1)
#define C_DEBUGEN  (1UL << 0)


// DCRSR
#define DCRSR_ADDR 0xE000EDF4

#define REGWnR (1UL << 16)
#define R0  0x00
#define R1  0x01
#define R2  0x02
#define R3  0x03
#define R4  0x04
#define R5  0x05
#define R6  0x06
#define R7  0x07
#define R8  0x08
#define R9  0x09
#define R10 0x0A
#define R11 0x0B
#define R12 0x0C
#define SP  0x0D
#define LR  0x0E
#define DebugReturnAddress 0x0F
#define xPSR 0x10
#define MSP  0x11
#define PSP  0x12
#define CONTROL 0x14


// DCRDR
#define DCRDR_ADDR 0xE000EDF8


//============================================================================
// Trace related defines
//============================================================================

#define MCU_ETM_ID 0x23 // CM_MCU_ETM_ID in trace_tests.h
#define MCU_ITM_ID 0x59 // CM_MCU_ITM_ID in trace_tests.h
