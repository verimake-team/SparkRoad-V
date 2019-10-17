/*
 *-----------------------------------------------------------------------------
 * The confidential and proprietary information contained in this file may
 * only be used by a person authorised under and to the extent permitted
 * by a subsisting licensing agreement from ARM Limited or its affiliates.
 *
 *            (C) COPYRIGHT 2013-2017 ARM Limited or its affiliates.
 *                ALL RIGHTS RESERVED
 *
 * This entire notice must be reproduced on all copies of this file
 * and copies of this file may only be made by a person if such person is
 * permitted to do so under the terms of a subsisting license agreement
 * from ARM Limited or its affiliates.
 *
 *      SVN Information
 *
 *      Checked In          : $Date: 2017-08-11 14:45:24 +0100 (Fri, 11 Aug 2017) $
 *
 *      Revision            : $Revision: 369126 $
 *
 *      Release Information : Cortex-M0 DesignStart-r2p0-00rel0
 *-----------------------------------------------------------------------------
 */
#include "CMSDK_CM0.h"
#include <stdio.h>
#include "designtest_m0.h"
#include "uart_stdout.h"
#include "apaaci.h"
#include "v2mm1.h"

#if defined ( __CC_ARM   )
__asm unsigned int  memcpy_LDM_STM(unsigned int to, unsigned int* from, unsigned int size);
#else
      unsigned int  memcpy_LDM_STM(unsigned int to, unsigned int* from, unsigned int size);
#endif

unsigned int burst_test(unsigned int base, unsigned int offset, unsigned int range)
{
  unsigned int addr;
  unsigned int din;
  unsigned int address_start;
  unsigned int address_end;
  unsigned int* testvalues_ptr;
  int status;
  int cycles;
  unsigned int result;
  int testvalues[] = {0x12345678,0xa5a5a5a5,0x00000000,0xFFFFFFFF,0x01011010,0x02022020,0x03033030,0x04044040};
  result=PASS;
  address_start = (base+offset);
  address_end   = (address_start+range);
  testvalues_ptr = testvalues;
  printf("Start address 0x%08X\n",address_start);
  printf("End address   0x%08X ignored\n",address_end);
   
  // (To memory address, From array of test values, Copy size)
  result += memcpy_LDM_STM( address_start, testvalues_ptr, 8);
  //Check data
  status = PASS;
  cycles = 0;
  address_end = (address_start+(8*4)); // Burst test limits range
  for(addr = address_start; addr < address_end; addr = addr + 4)
  {
    din = *((volatile unsigned int *)addr);
    // Check and display errors
    if (din != testvalues[cycles])
    {
      status++;
    }
    cycles++;
    }
  //Report status
  if (status == PASS)
  {
    printf("Pass %d locations tested\n",cycles);
  } else {
    printf("Fail %d errors of %d locations\n",status,cycles);
    result++;
  }
  return(result);
}
unsigned int test(unsigned int base, unsigned int offset, unsigned int range)
{
  unsigned int addr;
  unsigned int dout;
  unsigned int din;
  unsigned int address_start;
  unsigned int address_end; 
  unsigned int data;
  int status;
  int cycles;
  unsigned int result;

  data=0;
  result=PASS;
  address_start = (base+offset);
  address_end   = (address_start+range);
  printf("Start address 0x%08X\n",address_start);
  printf("End address   0x%08X\n",address_end);
  //Write data
  for(addr = address_start; addr < address_end; addr = addr + 4)
  {
    data = data + 0x200211 * addr;
    dout = data;
    *((volatile unsigned int *)addr) = dout;
  }
  //Check data
  status = PASS;
  cycles = 0;
  data = 0;
  for(addr = address_start; addr < address_end; addr = addr + 4)
  {
    data = data + 0x200211 * addr;
    dout = data;
    din = *((volatile unsigned int *)addr);
    cycles++;
    // Check and display errors
    if (din != dout)
    {
      status++;
    }
  }
  //Report status
  if (status == PASS)
  {
    printf("Pass %d locations tested\n",cycles);
  } else {
    printf("Fail %d errors of %d locations\n",status,cycles);
    result++;
  }
  return(result);
}

unsigned int test_fpgareg(unsigned int base)
{
  unsigned int counter_start;
  int loopcounter;  
  unsigned int result;
  result=PASS;
  counter_start = FPGASYS->COUNTCYC;
  printf("Base address 0x%08X\n",base);
  printf("Remap 0x%08X\n",*((volatile unsigned int *)SYSCTRL_BASE));
  printf("Timer 0 ID 0x%08X\n",*((volatile unsigned int *)(CMSDK_BASE + 0x0FE0)));
  printf("Timer 0 0x%08X\n",*((volatile unsigned int *)(CMSDK_BASE + 0x0000)));
  printf("Writing 0x55\n");
  *((volatile unsigned int *)(CMSDK_BASE + 0x0000)) = 0x55;
  printf("Timer 0 0x%08X\n",*((volatile unsigned int *)(CMSDK_BASE + 0x0000)));
  printf("Timer 1 0x%08X\n",*((volatile unsigned int *)(CMSDK_BASE + 0x1000)));
  printf("Counter 1Hz 0x%08X, 100Hz 0x%08X, Cycleup 0x%08X\n",
         FPGASYS->COUNT1HZ,
         FPGASYS->CNT100HZ,
         FPGASYS->COUNTCYC);

  /* If Arduino support is built in, then a number of the GPIO pins are hardwired
     in which instance, mask them off from the GPIO read and writing tests */
#ifdef ARDUINO_SUPPORT
  #define ARDUINO_MASK_0 0x47CE
  #define ARDUINO_MASK_1 0x3A70
  #define ARDUINO_MASK_2 0xED3F
  #define ARDUINO_MASK_3 0x000F
#else
  #define ARDUINO_MASK_0 0xFF1F
  #define ARDUINO_MASK_1 0xF2FF
  #define ARDUINO_MASK_2 0x1FFF
  #define ARDUINO_MASK_3 0x000F
#endif
  
  printf("EXT bus [15:0] = 0x%08X\n", CMSDK_GPIO0->DATA);
  if ((CMSDK_GPIO0->DATA & ARDUINO_MASK_0) != (0x0000FFFF & ARDUINO_MASK_0))
  {
    printf("Fail\n");
    result++;
  }
  
  printf("EXT bus [31:16] = 0x%08X\n", CMSDK_GPIO1->DATA);
  if ((CMSDK_GPIO1->DATA & ARDUINO_MASK_1) != (0x0000FFFF & ARDUINO_MASK_1))
  {
    printf("Fail\n");
    result++;
  }
  
  printf("EXT bus [47:32] = 0x%08X\n", CMSDK_GPIO2->DATA);
  if ((CMSDK_GPIO2->DATA & ARDUINO_MASK_2) != (0x0000FFFF & ARDUINO_MASK_2))
  {
    printf("Fail\n");
    result++;
  }
  
  printf("EXT bus [51:48] = 0x%08X\n", CMSDK_GPIO3->DATA);
  if ((CMSDK_GPIO3->DATA & ARDUINO_MASK_3) != (0x00000000F & ARDUINO_MASK_3))
  {
    printf("Fail\n");
    result++;
  }
  
  printf("Zeroing bus (not yet enabled)\n");

  CMSDK_GPIO0->DATAOUT = 0x0;
  CMSDK_GPIO1->DATAOUT = 0x0;
  CMSDK_GPIO2->DATAOUT = 0x0;
  CMSDK_GPIO3->DATAOUT = 0x0;


  printf("EXT bus [15:0] = 0x%08X\n",CMSDK_GPIO0->DATA);
  printf("EXT bus [31:16] = 0x%08X\n",CMSDK_GPIO1->DATA);
  printf("EXT bus [47:32] = 0x%08X\n",CMSDK_GPIO2->DATA);
  printf("EXT bus [51:48] = 0x%08X\n",CMSDK_GPIO3->DATA);
  

  CMSDK_GPIO0->OUTENABLESET = ARDUINO_MASK_0;
  CMSDK_GPIO1->OUTENABLESET = ARDUINO_MASK_1;
  CMSDK_GPIO2->OUTENABLESET = ARDUINO_MASK_2;
  CMSDK_GPIO3->OUTENABLESET = ARDUINO_MASK_3;
  printf("Enabled bus drive\n");


  printf("EXT bus [15:0] = 0x%08X\n",CMSDK_GPIO0->DATA);
  if ((CMSDK_GPIO0->DATA & ARDUINO_MASK_0) == 0x0)
  {
    printf("Pass\n");
  } else {
    printf("Fail\n");
    result++;
  }
  
  printf("EXT bus [31:16] = 0x%08X\n",CMSDK_GPIO1->DATA);
  if ((CMSDK_GPIO1->DATA & ARDUINO_MASK_1) == 0x0)
  {
    printf("Pass\n");
  } else {
    printf("Fail\n");
    result++;
  }
  
  printf("EXT bus [47:32] = 0x%08X\n",CMSDK_GPIO2->DATA);
  if ((CMSDK_GPIO2->DATA & ARDUINO_MASK_2) == 0x0)
  {
    printf("Pass\n");
  } else {
    printf("Fail\n");
    result++;
  }

  printf("EXT bus [51:48] = 0x%08X\n",CMSDK_GPIO3->DATA);

  if ((CMSDK_GPIO3->DATA & ARDUINO_MASK_3) == 0x0)
  {
    printf("Pass\n");
  } else {
    printf("Fail\n");
    result++;
  }

  printf("LEDs and buttons - Buttons are looped back from LEDs.\n");
  for (loopcounter = 0; loopcounter < 4; loopcounter = loopcounter + 1)
  {
    printf("Setting LEDs to 0x%08X\n",loopcounter);
    
    FPGASYS->LEDS = loopcounter;
    
    printf("Buttons = 0x%08X\n",FPGASYS->BUTTONS);
      if (FPGASYS->BUTTONS == loopcounter)
    {
      printf("Pass\n");
    } else {
      printf("Fail\n");
      result++;
    }
  }
  
  
  printf("Counter 1Hz 0x%08X, 100Hz 0x%08X, Cycleup 0x%08X\n",
         FPGASYS->COUNT1HZ,
         FPGASYS->CNT100HZ,
         FPGASYS->COUNTCYC);
  printf("Checking Cycleup counter is counting - ");
  if (counter_start != FPGASYS->COUNTCYC)
    {
    printf("Pass\n");
  } else {
    printf("Fail\n");
    result++;
  }
  return(result);
}

unsigned int test_scc(unsigned int base)
{
  unsigned int result;
  result=PASS;
  printf("Base address 0x%08X\n",base);
  printf("DLLLOCK     0x%08X\n",*((volatile unsigned int *)SCC_DLLLOCK));
  printf("SCC_LED     0x%08X\n",*((volatile unsigned int *)SCC_LED    ));
  printf("SCC_SW      0x%08X\n",*((volatile unsigned int *)SCC_SW     ));
  printf("SCC_APBLOCK 0x%08X\n",*((volatile unsigned int *)SCC_APBLOCK));
  printf("SCC_AID     0x%08X\n",*((volatile unsigned int *)SCC_AID    ));
  printf("SCC_ID      0x%08X\n",*((volatile unsigned int *)SCC_ID     ));
  printf("SYS_CFGDATA_SERIAL 0x%08X\n",*((volatile unsigned int *)SYS_CFGDATA_SERIAL));
  printf("SYS_CFGDATA_APB 0x%08X\n",*((volatile unsigned int *)SYS_CFGDATA_APB));
  printf("SYS_CFGCTRL 0x%08X\n",*((volatile unsigned int *)SYS_CFGCTRL));
  printf("SYS_CFGSTAT 0x%08X\n",*((volatile unsigned int *)SYS_CFGSTAT));

  printf("Writing 0xa5a5a5a5 to SYS_CFGDATA_APB\n");
  *((volatile unsigned int *)SYS_CFGDATA_APB) = 0xa5a5a5a5;
  printf("SYS_CFGDATA_APB 0x%08X\n",*((volatile unsigned int *)SYS_CFGDATA_APB));
  if (*((volatile unsigned int *)SYS_CFGDATA_APB) != 0xa5a5a5a5)
  {
    printf("Fail\n");
    result++;
  }
  printf("Writing 0xFFFFFFFF to SYS_CFGDATA_APB\n");
  *((volatile unsigned int *)SYS_CFGDATA_APB) = 0xFFFFFFFF;
  printf("SYS_CFGDATA_APB 0x%08X\n",*((volatile unsigned int *)SYS_CFGDATA_APB));
  if (*((volatile unsigned int *)SYS_CFGDATA_APB) != 0xFFFFFFFF)
  {
    printf("Fail\n");
    result++;
  }

  printf("Writing 0xa5a5a5a5 to SYS_CFGCTRL - Also triggers interrupt\n");
  *((volatile unsigned int *)SYS_CFGCTRL) = 0xa5a5a5a5;
  printf("SYS_CFGCTRL 0x%08X\n",*((volatile unsigned int *)SYS_CFGCTRL));
  if (*((volatile unsigned int *)SYS_CFGCTRL) != 0xa5a5a5a5)
  {
    printf("Fail\n");
    result++;
  }
  printf("Writing 0xFFFFFFFF to SYS_CFGCTRL\n");
  *((volatile unsigned int *)SYS_CFGCTRL) = 0xFFFFFFFF;
  printf("SYS_CFGCTRL 0x%08X\n",*((volatile unsigned int *)SYS_CFGCTRL));
  if (*((volatile unsigned int *)SYS_CFGCTRL) != 0xFFFFFFFF)
  {
    printf("Fail\n");
    result++;
  }
  return(result);
}

void listmemory(unsigned int base, unsigned int offset, unsigned int range)
{
  unsigned int addr;
  unsigned int address_start;
  unsigned int address_end;
 
  address_start = (base+offset);
  address_end   = (address_start+range);
  printf("Start address 0x%08X\n",address_start);
  printf("End address   0x%08X\n",address_end);
  for(addr = address_start; addr < address_end; addr = addr + 4)
  {
    printf("0x%08X contains 0x%08X\n",addr,*((volatile unsigned int *)addr));
  }
  return;
}

// Write 8 bits of data to the serial bus
void genAI2C_send_byte(unsigned char c, unsigned int address)
{
    int ctrlc;
    int ctrls;
    int loop;
    ctrlc = address+I2C_CONTROLC;
    ctrls = address+I2C_CONTROLS;
    for (loop = 0; loop < 8; loop++) {
        // apSleepus(1);
        *((volatile unsigned int *)ctrlc) = SCL;
        // apSleepus(1);
        if (c & (1 << (7 - loop)))
            *((volatile unsigned int *)ctrls) = SDA;
        else
            *((volatile unsigned int *)ctrlc) = SDA;
        *((volatile unsigned int *)ctrls) = SCL;
        *((volatile unsigned int *)ctrlc) = SCL;
    }

    *((volatile unsigned int *)ctrls) = SDA;
}
/* Test function for read */
#if defined ( __CC_ARM   )
/* Test function for read - for ARM / Keil */
__asm unsigned int memcpy_LDM_STM(unsigned int to, unsigned int* from, unsigned int size)
{
    PUSH    {r4-r7}         ; Store 4 registers onto stack
    CMP     r2,#8           ; Always size 8 LDM,
    BNE     fail            ; Check just in case accidentally modified.
    LDMIA     r1!,{r4-r7}   ; Load from memory 4 words
    STMIA     r0!,{r4-r7}   ; Store to temporary array
    LDMIA     r1!,{r4-r7}   ; Load from memory 4 words
    STMIA     r0!,{r4-r7}   ; Store to temporary array
success
    MOVS    r0, #0
    B       return
fail
    MOVS    r0, #1
return
    POP     {r4-r7}         ; Load 4 registers from stack
    BX      lr
}
#elif defined ( __IAR_SYSTEMS_ICC__ )
/* Test function for read - for IAR Systems */
unsigned int  memcpy_LDM_STM(unsigned int to, unsigned int* from, unsigned int size)
{
   unsigned int rdata;
  __asm("  push  {r4-r7}\n"
        "  cmp   %3, #8 \n"
        "  bne   fail   \n"
        "  ldmia %2!,{r4-r7} \n"
        "  stmia %1!,{r4-r7} \n"
        "  ldmia %2!,{r4-r7} \n"
        "  stmia %1!,{r4-r7} \n"
        "sucess: \n"
        "  movs  %0, #0 \n"
        "  b return \n"
        "fail: \n"
        "  movs %0, #1\n"
        "return: \n"
        "  pop {r4-r7} \n"
        :"=r"(rdata) : "r" (to), "r" (from), "r" (size) :  "memory"
   );
   return rdata;
}
#else
/* Test function for read - for gcc */
unsigned int  memcpy_LDM_STM(unsigned int to, unsigned int* from, unsigned int size) __attribute__((naked));
unsigned int  memcpy_LDM_STM(unsigned int to, unsigned int* from, unsigned int size)
{
  __asm("  push  {r4-r7}\n"
        "  cmp   r2, #8 \n"
        "  bne   fail   \n"
        "  ldmia r1!,{r4-r7} \n"
        "  stmia r0!,{r4-r7} \n"
        "  ldmia r1!,{r4-r7} \n"
        "  stmia r0!,{r4-r7} \n"
        "  sucess: \n"
        "  movs  r0, #0 \n"
        "  b return \n"
        "  fail: \n"
        "  movs r0, #1\n"
        "  return: \n"
        "  pop {r4-r7} \n"
        "  bx lr \n"  );
}
#endif

int main(void)
{
  unsigned int result;
  
  unsigned int addr, val;
  
    result=PASS;
  // UART init
  UartStdOutInit();

  printf("*** Designtest_m0\n");

  printf("*** Testing Audio\n");
  apAI2C_send_byte(0x65);
  
  printf("*** Single PSRAM read\n");
  addr = (PSRAM_BASE+PSRAM_OFFSET+8);
  *((volatile unsigned int *)addr) = (unsigned int)0x55AA;
  val = *((volatile unsigned int *)addr);
  // Try reading again
  val = *((volatile unsigned int *)addr);
  
  printf("*** Testing SCC registers\n");
  result += result + test_scc(SCC_BASE);
  printf("*** Testing Reading FPGA control registers\n");
  result += result + test_fpgareg(FPGASYS_BASE);
  printf("*** Sending data from LCD I2C\n");
  genAI2C_send_byte(0x45,CLCDTOUCH_BASE);
  printf("*** Testing PSRAM\n");
  result += test(PSRAM_BASE,PSRAM_OFFSET,PSRAM_SIZE);
  printf("*** Testing PSRAM burst\n");
  result += burst_test(PSRAM_BASE,0x800000,PSRAM_SIZE); 
  printf("*** Testing Ethernet\n");
  result += test(ETH_BASE,ETH_OFFSET,ETH_SIZE);
  printf("*** Testing ZBT1\n");
  result += test(ZBT1_BASE,ZBT1_OFFSET,ZBT1_SIZE);
  printf("*** Testing ZBT burst\n");
  result += burst_test(ZBT1_BASE,ZBT1_OFFSET,ZBT1_SIZE); 
#if defined ( __CC_ARM   )
  printf("*** Testing ZBT2 and ZBT3\n");
  result += test(ZBT2_BASE,ZBT2_OFFSET,ZBT2_SIZE); 
#else
  printf("*** no need to test ZBT2 and ZBT3 for GCC since they are used for stack\n");
#endif
  printf("*** Testing block RAM\n");
  result += test(BLOCK_BASE,BLOCK_OFFSET,BLOCK_SIZE);
  
  if (result == PASS)
  {
    printf("\n\n\n----------\n** TEST PASSED **\n----------\n\n\n\n");
  } else {
    if (result == 1)
    {
      printf("\n\n\nFail, %u failure\n\n\n\n",result);
    } else {
      printf("\n\n\nFail, %u failures\n\n\n\n",result);
    }
  }

  // End simulation
  UartEndSimulation();   
  }
