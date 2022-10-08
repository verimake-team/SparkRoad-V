/*
 *-----------------------------------------------------------------------------
 * The confidential and proprietary information contained in this file may
 * only be used by a person authorised under and to the extent permitted
 * by a subsisting licensing agreement from ARM Limited or its affiliates.
 *
 *            (C) COPYRIGHT 2003,2004 ARM Limited or its affiliates.
 *                ALL RIGHTS RESERVED
 *
 * This entire notice must be reproduced on all copies of this file
 * and copies of this file may only be made by a person if such person is
 * permitted to do so under the terms of a subsisting license agreement
 * from ARM Limited or its affiliates.
 *
 *      SVN Information
 *
 *      Checked In          : $Date: 2017-07-25 15:10:13 +0100 (Tue, 25 Jul 2017) $
 *
 *      Revision            : $Revision: 368444 $
 *
 *      Release Information : Cortex-M0 DesignStart-r2p0-00rel0
 *-----------------------------------------------------------------------------
 */

/*
 * Code implementation file for the AACI (Advanced Audio CODEC) interface.
 */

#include <stdio.h>
#include <stdlib.h>
#include "apaaci.h"


// A 48 point, 20 bit sine table
static const int sinewave[] = { 0x00000, 0x10B51, 0x2120F, 0x30FBB, 0x3FFFF, 0x4DEBD, 0x5A826, 0x658C8, 0x6ED9D, 0x7641A,
                                0x7BA36, 0x7EE79, 0x7FFFE, 0x7EE79, 0x7BA36, 0x7641A, 0x6ED9D, 0x658C8, 0x5A826, 0x4DEBD,
                                0x3FFFF, 0x30FBB, 0x2120F, 0x10B51, 0x00000, 0xEF4AF, 0xDEDF1, 0xCF045, 0xC0001, 0xB2143,
                                0xA57DA, 0x9A738, 0x91263, 0x89BE6, 0x845CA, 0x81187, 0x80002, 0x81187, 0x845CA, 0x89BE6,
                                0x91263, 0x9A738, 0xA57DA, 0xB2143, 0xC0001, 0xCF045, 0xDEDF1, 0xEF4AF };

// The Tone test produces a sinewave from a lookup table
static int AACI_Tone()
{
    int loop, time, timer;

    printf("\nAACI Tone test: The test will play a tone for 1 second\n");
    printf("out of right and then the left channels of the Line Out socket.\n");
//    Wait_For_Enter(FALSE);

    // Generate a 0.333kHz 1 second tone (sinewave) on each channel
    // Frequency is defined by CODEC (48kHz).
    for (time = 0; time < 2000; time++)
    {
        for (loop = 0; loop < 48; loop++)
        {
            // Wait for TX FIFO not to be full then write left and right channels
            timer = AACI_TIMEOUT;
            while (!(*AACI_SR & AACI_TXHE) && timer)
                timer--;

            *AACI_DR = (time < 1000) ? sinewave[loop] : 0;
            *AACI_DR = (time < 1000) ? 0 : sinewave[loop];
        }
    }
    
    printf("Tone sent ");
    return 0;
}


int apAACI_TEST()
{
    int           failtest;
    unsigned char din;

    failtest = FALSE;

    /* The AACI has I2C and I2S interfaces from the FPGA
     * The IC2 interface is a simple GPIO interface and the apAI2C_
     * software functions generate the correct I2C protocol.
     * The I2S is a simple FIFO buffer in the FPGA with a half-empty
     * flag to indicate the FIFO status, the FIFO is shifted out
     * serially to the CODEC.
     */

    // Get the AACI test mode
    printf("Please connect headphones to J33\n");
    printf("A tone will play out of the left and right sides.\n");
//    Wait_For_Enter(FALSE);

    // See power-up sequence (see DS680F2 page 37)

    // Release Information : Cortex-M0 DesignStart-r2p0-00rel0
    // TODO: set AACI nRESET
//    apSleep(100);
    // TODO: clear AACI nRESET
//    apSleep(100);

    // Read and check the I2C chip ID and revision
    din = apAI2C_read(AI2C_CRID, AI2C_ADDR);
    if ((din & 0xF8) != 0xE0)
    {
        printf("ERROR: AACI ID:0x%02X\n", din);
        failtest = TRUE;
    }
    else
        printf("AACI ID:0x%02X\n", din);

    // Initialise the AACI I2C interface (see DS680F2 page 38)
    apAI2C_write(0x00, 0x99, AI2C_ADDR);
    apAI2C_write(0x3E, 0xBA, AI2C_ADDR);
    apAI2C_write(0x47, 0x80, AI2C_ADDR);
    apAI2C_write(0x32, 0xBB, AI2C_ADDR);
    apAI2C_write(0x32, 0x3B, AI2C_ADDR);
    apAI2C_write(0x00, 0x00, AI2C_ADDR);

    // Enable MCLK and set frequency (LRCK=48KHz, MCLK=12.288MHz, /256)
    // TODO: enable MCLK OSC
//    apSleep(100);
    apAI2C_write(0x05, 0xA0, AI2C_ADDR);

    // Set PDN to 0
    apAI2C_write(AI2C_CRPWRC1, 0x00, AI2C_ADDR);

    // Tone test
    failtest = AACI_Tone();

    if (failtest)
        return FAIL;
    else
        return PASS;
}
