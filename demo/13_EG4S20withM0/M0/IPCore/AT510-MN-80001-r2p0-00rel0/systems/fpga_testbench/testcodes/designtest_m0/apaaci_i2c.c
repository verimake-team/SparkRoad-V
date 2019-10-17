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
 * Code implementation file for the AACI (Advanced Audio CODEC I2C) interface.
 */

#include <stdio.h>
#include <stdlib.h>
#include "apaaci.h"

// Write 8 bits of data to the serial bus
void apAI2C_send_byte(unsigned char c)
{
    int loop;

    for (loop = 0; loop < 8; loop++) {
        // apSleepus(1);
        *AI2C_CONTROLC = SCL;
        // apSleepus(1);
        if (c & (1 << (7 - loop)))
            *AI2C_CONTROLS = SDA;
        else
            *AI2C_CONTROLC = SDA;
        // apSleepus(1);
        *AI2C_CONTROLS = SCL;
        // apSleepus(1);
        *AI2C_CONTROLC = SCL;
    }

    // apSleepus(1);
    *AI2C_CONTROLS = SDA;
    // apSleepus(1);
}

// Read 8 bits of data from the serial bus
unsigned char apAI2C_receive_byte(void)
{
    int data, loop;

    *AI2C_CONTROLS = SDA;
    data         = 0;

    for (loop = 0; loop < 8; loop++) {
        // apSleepus(1);
        *AI2C_CONTROLC = SCL;
        // apSleepus(1);
        *AI2C_CONTROLS = SCL | SDA;
        // apSleepus(1);
        if ((*AI2C_CONTROL & SDA))
            data += (1 << (7 - loop));
        // apSleepus(1);
        *AI2C_CONTROLC = SCL;
    }

    // apSleepus(1);
    *AI2C_CONTROLC = SDA;
    // apSleepus(1);

    return data;
}

// Read the acknowledge bit
int apAI2C_receive_ack(void)
{
    int nack;

    // apSleepus(1);
    *AI2C_CONTROLS = SDA;
    // apSleepus(1);
    *AI2C_CONTROLC = SCL;
    // apSleepus(1);
    *AI2C_CONTROLS = SCL;
    // apSleepus(1);
    nack = *AI2C_CONTROL & SDA;
    // apSleepus(1);
    *AI2C_CONTROLC = SCL;
    // apSleepus(1);
    *AI2C_CONTROLS = SDA;
    // apSleepus(1);
    if(nack==0)
        return 1;

    return 0;
}

// Write the acknowledge bit
void apAI2C_send_ack(void)
{
    // apSleepus(1);
    *AI2C_CONTROLC = SCL;
    // apSleepus(1);
    *AI2C_CONTROLS = SDA;
    // apSleepus(1);
    *AI2C_CONTROLS = SCL;
    // apSleepus(1);
    *AI2C_CONTROLC = SCL;
    // apSleepus(1);
    *AI2C_CONTROLC = SDA;
    // apSleepus(1);
}

// Write data stream and read one byte
unsigned char apAI2C_read(unsigned char reg_addr, unsigned char sadr)
{
    unsigned char rxdata;

    // Start bit
    // apSleepus(1);
    *AI2C_CONTROLS = SDA | SCL;
    // apSleepus(1);
    *AI2C_CONTROLC = SDA;
    // apSleepus(1);

    // Set serial and register address
    apAI2C_send_byte(sadr);
    apAI2C_receive_ack();
    apAI2C_send_byte(reg_addr);
    apAI2C_receive_ack();

    // Start bit
    // apSleepus(1);
    *AI2C_CONTROLS = SDA | SCL;
    // apSleepus(1);
    *AI2C_CONTROLC = SDA;
    // apSleepus(1);

    // Read from serial address
    apAI2C_send_byte(sadr | 1);
    apAI2C_receive_ack();
    rxdata = apAI2C_receive_byte();
    apAI2C_send_ack();

    // Stop bit, clock the ack
    // apSleepus(1);
    *AI2C_CONTROLS = SCL;
    // apSleepus(1);
    *AI2C_CONTROLC = SCL;

    // Actual stop bit
    // apSleepus(1);
    *AI2C_CONTROLC = SDA;
    // apSleepus(1);
    *AI2C_CONTROLS = SCL;
    // apSleepus(1);
    *AI2C_CONTROLS = SDA;
    // apSleepus(1);

    return rxdata;
}

// Write data stream and write one byte
void apAI2C_write(unsigned char reg_addr, unsigned char data_byte, unsigned char sadr)
{
    // Start bit
    // apSleepus(1);
    *AI2C_CONTROLS = SDA | SCL;
    // apSleepus(1);
    *AI2C_CONTROLC = SDA;
    // apSleepus(1);

    // Set serial and register address
    apAI2C_send_byte(sadr);
    apAI2C_receive_ack();
    apAI2C_send_byte(reg_addr);
    apAI2C_receive_ack();
    apAI2C_send_byte(data_byte);

    // Stop bit, clock the ack
    // apSleepus(1);
    *AI2C_CONTROLS = SCL;
    // apSleepus(1);
    *AI2C_CONTROLC = SCL;

    // Actual stop bit
    // apSleepus(1);
    *AI2C_CONTROLC = SDA;
    // apSleepus(1);
    *AI2C_CONTROLS = SCL;
    // apSleepus(1);
    *AI2C_CONTROLS = SDA;
    // apSleepus(1);
}
