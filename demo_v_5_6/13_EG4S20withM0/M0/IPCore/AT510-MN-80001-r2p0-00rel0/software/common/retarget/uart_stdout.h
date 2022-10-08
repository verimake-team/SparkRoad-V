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
/* Functions for stdout during simulation */
/* The functions are implemented in shared/software/common/uart_stdout.c */

extern void UartStdOutInit(void);
extern unsigned char UartPutc(unsigned char my_ch);
extern unsigned char UartGetc(void);
extern unsigned char UartEndSimulation(void);
