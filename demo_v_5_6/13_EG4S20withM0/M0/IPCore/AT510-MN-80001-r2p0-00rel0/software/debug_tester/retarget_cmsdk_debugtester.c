/*
 *-----------------------------------------------------------------------------
 * The confidential and proprietary information contained in this file may
 * only be used by a person authorised under and to the extent permitted
 * by a subsisting licensing agreement from ARM Limited or its affiliates.
 *
 *            (C) COPYRIGHT 2010-2013 ARM Limited or its affiliates.
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

//
// printf retargetting functions for Debug Tester
//

#include "cmsdk_debugtester.h"

// Routine to write a char - specific to Cortex-M Core debug tester
void debugtester_char_write(int ch)
{
       GPIO1->LB_MASKED[DD_PRINT_CHAR] = ch; // Write whole char to 2nd byte
       GPIO1->LB_MASKED[DD_PRINT_STROBE] = DD_PRINT_STROBE; // Write strobe
       GPIO1->LB_MASKED[DD_PRINT_STROBE] = 0; // Clear Strobe
}


#if defined ( __CC_ARM   )
/******************************************************************************/
/* Retarget functions for ARM DS-5 Professional / Keil MDK                    */
/******************************************************************************/

#include <stdio.h>
#include <time.h>
#include <rt_misc.h>
#pragma import(__use_no_semihosting_swi)

struct __FILE { int handle; /* Add whatever you need here */ };
FILE __stdout;
FILE __stdin;


int fputc(int ch, FILE *f) {
  debugtester_char_write(ch);
  return 0;
}

int fgetc(FILE *f) {
  return 0;
}

int ferror(FILE *f) {
  /* Your implementation of ferror */
  return EOF;
}


void _ttywrch(int ch) {
  debugtester_char_write(ch);
}


void _sys_exit(int return_code) {
label:  goto label;  /* endless loop */
}

#else

/******************************************************************************/
/* Retarget functions for GNU Tools for ARM Embedded Processors               */
/******************************************************************************/
#include <stdio.h>
#include <sys/stat.h>

__attribute__ ((used))  int _write (int fd, char *ptr, int len)
{
  size_t i;
  for (i=0; i<len;i++) {
    debugtester_char_write(ptr[i]); // call character output function
  }
  return len;
}


#endif
