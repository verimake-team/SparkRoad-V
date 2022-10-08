//
//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited or its affiliates.
//
//            (C) COPYRIGHT 2003,2004 ARM Limited or its affiliates.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited or its affiliates.
//
//  Version and Release Control Information:
//
//  File Revision       : $Revision: 368478 $
//  File Date           : $Date: 2017-07-26 13:36:22 +0100 (Wed, 26 Jul 2017) $
//
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//-----------------------------------------------------------------------------
///
/* 
 *            AACI Advanced Audio CODEC Interface
 *            ===================================
 */

#define TRUE  1
#define FALSE 0
#define PASS  0
#define FAIL  1
 
// AACI I2C controller
#define AI2C_ADDR          0x02
#define AI2C_CRID          0x01
#define AI2C_CRPWRC1       0x02

// AACI I2C interface
#define AI2C_CONTROL       ((volatile unsigned int *)0x40023000)
#define AI2C_CONTROLS      ((volatile unsigned int *)0x40023000)
#define AI2C_CONTROLC      ((volatile unsigned int *)0x40023004)
//#define AI2C_CONTROLS      ((volatile unsigned int *)0x40023004)
//#define AI2C_CONTROLC      ((volatile unsigned int *)0x40023008)
#define SDA                1 << 1
#define SCL                1 << 0

// AACI I2S interface
#define AACI_SR            ((volatile unsigned int *)0x40024000)
#define AACI_DR            ((volatile unsigned int *)0x40024004)
#define AACI_TIMEOUT       1000                                    // Timeout for reading FIFOs (10mS)
#define AACI_TXHE          0x0008                                  // TX half empty

// External function types

/*  Function: apAACI_TEST(void)
 *   Purpose: Main entry for AACI test
 *
 * Arguments: None
 *   Returns:
 *        OK: apERR_NONE
 *     Error: apERR_AACI_START;
 */
extern int apAACI_TEST(void);

// External function types for the Audio I2C
extern unsigned char apAI2C_read (unsigned char reg_addr, unsigned char sadr);
extern void          apAI2C_write(unsigned char reg_addr, unsigned char data_byte, unsigned char sadr);
extern void          apAI2C_send_byte(unsigned char C);
