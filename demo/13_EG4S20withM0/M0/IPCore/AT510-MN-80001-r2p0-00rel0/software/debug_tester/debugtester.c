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
//////////////////////////////////////////////////////////////////////////////
//
// CMSDK Debug Tester Code
//
//////////////////////////////////////////////////////////////////////////////


// This code always runs on the Cortex-M processor within the
// cmsdk_debug_tester.v module in the example testbench.
//
// The Debug Tester uses the example components supplied with the CMSDK.
// You must copy and rename the example components if you wish to
// modify their behavior, otherwise the Debug Tester may break.
//
// This code provides access to various test routines that can use
// either a SerialWire or JTAG interface to connect to the
// example MCU.
//
// The functions available to the example MCU are enumerated in
// debugtester_functions.h by the variable "Function". These correspond to
// actual functions within this file beneath the comment "Functions Available
// to MCU Core".
//
// Communication between the example MCU and the Debug Tester takes place
// in two ways:
//
// [1]
//
// Function Calling, Function completion and Error status use a simple
// handshake using GPIO0. Refer to the main() function in this file,
// and the functions EnableDebugTester(), DisableDebugTester(),
// CallDebugtester(), StartDebugtester() and CheckDebugtester() in
// generic/mcu_debugtester_interface.c for details.
//
//
// [2]
//
// Some tests and functions need to pass more complex data between the
// example MCU and the Debug Tester. For these cases, an area of memory
// in the example MCU SRAM is predefined as an area for passing values
// between the Debug Tester and example MCU.
//
// The region used is the last 4 words above the stack pointer of the
// example MCU. The debugtester code reads the example MCU vector table
// to determine its SP, and therefore the location of these four words.
//
// The Debug Tester accesses this region using
// Cortex_MCU.stacktop and suitable offsets, using the
// ReadCommRegion() and WriteCommRegion() functions which also handle
// changing the endianness of the data when required.
// The example MCU accesses this region using the array
// DEBUGTESTERDATA, defined in generic/mcu_debugtester_interface.h
//
//

#include "cmsdk_debugtester.h"        // CMSIS Support for the debugtester
#include "system_cmsdk_debugtester.h" // CMSIS Support for the debugtester
#include "debugtester.h"              // Local header file
#include <stdio.h>                    // Access to printf

// EXPECTED_BE: Expected Endianness <0=> Little Endian <1=> Big Endian
#ifdef DEBUGTESTER_BE
#define EXPECTED_BE 1
#else
#define EXPECTED_BE 0
#endif


//////////////////////////////////////////////////////////////////////////////
// Global Variables
//////////////////////////////////////////////////////////////////////////////

// Track information about the target

struct {
  uint32_t stacktop;
  uint32_t traceconfigured;
} Cortex_MCU;


// Track state of the DAP

struct {
  uint32_t jtagnsw;
  uint32_t jtagapndp;
  uint32_t on;
  uint32_t banksel;
  uint32_t csw;
  uint32_t error;
  uint8_t  ack;
  uint8_t  stkerrclr;
} DAPSTATUS;

// Trace decompression globals
uint32_t trace_id = 0x71; // Init to reserved
uint32_t trace_errors = 0;
uint8_t  etm_packet[6];
uint32_t etm_bytes=0;
uint32_t etm_current=0;
uint32_t itm_current=0;
uint8_t  itm_header;
uint32_t itm_payload=0;
uint32_t itm_ts1=0;
uint32_t itm_ts2=0;
uint32_t itm_ts1_last=0;
uint32_t itm_bytes=0;
uint32_t itm_size=0;
uint32_t itm_ts=0;
uint32_t itm_sync=0;
uint32_t itm_overflow=0;
uint32_t itm_sw=0;
uint32_t itm_event=0;
uint32_t itm_periodic=0;
uint32_t itm_exception=0;
uint32_t itm_comp=0;
uint32_t itm_glb1=0;
uint32_t itm_glb2=0;

uint32_t current_address = 0;
uint32_t etm_ts1 = 0;
uint32_t etm_ts1_last = 0;
uint32_t etm_ts2 = 0;
uint32_t etm_p_headers =0;
uint32_t etm_i_sync =0;
uint32_t etm_branches =0;
uint32_t etm_exceptions =0;
uint32_t etm_rfe =0;
uint32_t etm_timestamps =0;
uint32_t etm_triggers =0;
uint32_t etm_ignore =0; // Expect 0
uint32_t fmt_triggers =0;
uint32_t fmt_frames =0;
uint32_t fmt_etm =0;
uint32_t fmt_itm =0;


//////////////////////////////////////////////////////////////////////////////
// Function Prototypes
//////////////////////////////////////////////////////////////////////////////

// SerialWire

uint32_t SWConnect(void);
uint32_t SWHeader(uint8_t);
uint32_t SWDataRead(void);
void     SWDataWrite(uint32_t);
void     SerialWireClockOut (uint32_t, uint32_t);
uint32_t SerialWireClockIn (uint32_t);
void     SWLineReset(uint8_t);
void     SWExitDormantState(void);


// JTAG

void     JTAGTransition(uint32_t, uint8_t);
uint64_t JTAGShift(uint64_t, uint8_t);
uint64_t JTAGScanIDCODE(void);
void     JTAGScanIR(uint32_t);
uint64_t JTAGScanDR(uint64_t);


// Trace

uint32_t ParseTrace(uint8_t);


// Wire Protocol Agnostic functions

void     pulse_clock(uint8_t);
void     InitDAPSTATUS(void);
void     InitCommRegion(void);
uint32_t SwapEndian(uint32_t);
uint32_t ReadCommRegion(uint32_t);
void     WriteCommRegion(uint32_t, uint32_t);
uint32_t ReadMem(uint32_t);
uint32_t ReadMemH(uint32_t);
uint32_t ReadMemB(uint32_t);
void     ReadMemBlock(uint32_t, uint32_t, uint32_t *);
uint32_t ReadMemSpecial(uint32_t, uint8_t, uint32_t);
void     WriteMem(uint32_t, uint32_t);
void     WriteMemBlock(uint32_t, uint32_t, uint32_t *);
void     WriteMemH(uint32_t, uint32_t);
void     WriteMemB(uint32_t, uint32_t);
void     JtagAPnDP(uint32_t);
void     DPWriteBANKSEL(uint32_t);
void     DPWriteCTRLSTAT(uint32_t);
uint32_t DPReadCTRLSTAT(void);
uint32_t APReadCSW(void);
void     APWriteCSW(uint32_t);
void     APWriteTAR(uint32_t);
uint32_t APReadDRW(void);
void     APWriteDRW(uint32_t);
uint32_t DPReadRDBUFF(void);
uint32_t DPReadIDR(void);
uint32_t APReadIDR(void);
uint32_t APReadBASE(void);
uint32_t DPReadHALTEV(void);
void     DPClearSTICKYERR(void);
uint32_t CheckDAPSTATUS(void);


// Prototypes for MCU exposed functions
uint32_t SetInterfaceJTAG(void);
uint32_t SetInterfaceSW(void);
uint32_t DAPPowerUp(void);
uint32_t DAPPowerDown(void);
uint32_t GetTAPID(void);
uint32_t GetDPReg(void);
uint32_t GetAPReg(void);
uint32_t GetAPMem(void);
uint32_t SetAPMem(void);
uint32_t GetAPMemCSIDs(void);
uint32_t GetAPMemPID(void);
uint32_t ConnectWakeUnhalt(void);
uint32_t ConnectCheckUnlockup(void);
uint32_t EnableHaltingDebug(void);
uint32_t DAPAccess(void);
uint32_t ConfigTrace(void);
uint32_t CheckTrace(void);
uint32_t EmptyFunction(void);



//////////////////////////////////////////////////////////////////////////////
// Func points to the functions that will be used by the MCU
//////////////////////////////////////////////////////////////////////////////

uint32_t (*Func[]) (void) = { SetInterfaceJTAG,
                              SetInterfaceSW,
                              DAPPowerUp,
                              DAPPowerDown,
                              GetTAPID,
                              GetDPReg,
                              GetAPReg,
                              GetAPMem,
                              SetAPMem,
                              GetAPMemCSIDs,
                              ConnectWakeUnhalt,
                              ConnectCheckUnlockup,
                              EnableHaltingDebug,
                              DAPAccess,
                              ConfigTrace,
                              CheckTrace,
                              EmptyFunction,
                              EmptyFunction,
                              EmptyFunction,
                              EmptyFunction,
                              EmptyFunction,
                              EmptyFunction,
                              EmptyFunction,
                              EmptyFunction,
                              EmptyFunction,
                              EmptyFunction,
                              EmptyFunction,
                              EmptyFunction,
                              EmptyFunction,
                              EmptyFunction,
                              EmptyFunction,
                              EmptyFunction
};


//////////////////////////////////////////////////////////////////////////////
// Main code
//////////////////////////////////////////////////////////////////////////////

int main (void)
{
  uint32_t SelectedFunction;

  //
  // Initialisation
  //
  // GPIO0
  GPIO0->DATAOUT = 0;
  GPIO0->OUTENABLESET = ( ((DD_IO_RUNNING | DD_IO_ERROR) << 8) |
                      (DD_DBG_TMSEN | DD_DBG_TMS | DD_DBG_TDI | DD_DBG_SWCLKTCK | DD_DBG_nTRST) );
  // GPIO1
  GPIO1->DATAOUT = 0;
  GPIO1->OUTENABLESET = ( DD_PRINT_STROBE | DD_PRINT_CHAR );

  // Raise nTRST to bring JTAG DAP out of reset
  GPIO0->DATAOUT = DD_DBG_nTRST;

  // Initialise DAPSTATUS struct
  InitDAPSTATUS();

  // Initialise example MCU information
  Cortex_MCU.stacktop = 0;
  Cortex_MCU.traceconfigured = 0;

  //
  // Sit in loop waiting to service requests from the MCU cpu core
  //
  while(1)
    {
      if(GPIO0->UB_MASKED[DD_IO_STROBE])
        {
          // Clear any error flag
          GPIO0->UB_MASKED[DD_IO_ERROR] = 0;

          // Work out which routine to execute
          SelectedFunction = (GPIO0->UB_MASKED[DD_IO_FUNCSEL]) >> 8;

          // Indicate that we are running
          GPIO0->UB_MASKED[DD_IO_RUNNING] = DD_IO_RUNNING << 8;

          // Wait for deassertion of strobe
          while(GPIO0->UB_MASKED[DD_IO_STROBE]);

          // Run it
          if( (*Func[SelectedFunction])() != 0 )
            {
              // Flag an error
              GPIO0->UB_MASKED[DD_IO_ERROR] = DD_IO_ERROR << 8;
            };

          // Indicate that we are finished
          GPIO0->UB_MASKED[DD_IO_RUNNING] = 0;
          DBG_MSG(("Selected function run finished, wait for new function\n"));
        }
    }
}


//============================================================================
//
// Functions Available to MCU Core
//
//============================================================================

uint32_t SetInterfaceJTAG()
{
  // Switch to JTAG mode
  DBG_MSG(("SetInterfaceJTAG()\n"));
  if(DAPSTATUS.on)
    {
      DBG_MSG(("SetInterfaceJTAG() TEST FAILED: DAP power on\n"));
      return TEST_FAIL;
    }
  else
    {
      // Update struct
      DAPSTATUS.jtagnsw = 1;

      // JTAG - We'll always be driving TMS
      GPIO0->LB_MASKED[DD_DBG_TMSEN] = DD_DBG_TMSEN;

      // Ensure we are in TLR by clocking in 5 TMS high cycles
      JTAGTransition(0xff, 5);

      // Get into RTI as our default initial state
      JTAGTransition(0, 1);

      return TEST_PASS;
    }
}


uint32_t SetInterfaceSW()
{
  // Switch to SerialWire mode
  DBG_MSG(("SetInterfaceSW()\n"));
  if(DAPSTATUS.on)
   {
     DBG_MSG(("SetInterfaceSW() TEST FAIL: DAP power on\n"));
     return TEST_FAIL;
   }
  else
    {
      // Initialise
      DAPSTATUS.jtagnsw = 0;
      return SWConnect();
    }
}


uint32_t DAPPowerUp()
{
  DBG_MSG(("DAPPowerUp()\n"));
  if(DAPSTATUS.on == 0)
    {
      DPWriteCTRLSTAT( 0x50000000 );

      // Wait for the effect of write
      while((DPReadCTRLSTAT() & 0xF0000000UL) != 0xF0000000UL);

      DAPSTATUS.on=1;
      return CheckDAPSTATUS();
    }
  DBG_MSG(("DAPPowerUp() FAIL\n"));
  return TEST_FAIL;
}


uint32_t DAPPowerDown()
{
  uint32_t jtagnsw;
  uint32_t error;

  DBG_MSG(("DAPPowerDown()\n"));
  if(DAPSTATUS.on == 1)
    {
      DPWriteCTRLSTAT( 0x0 );

      // Wait for the effect of write
      while((DPReadCTRLSTAT() & 0xF0000000UL) != 0 );

      // Re-Initialise DAPSTATUS, but preserve jtagnsw and error
      jtagnsw = DAPSTATUS.jtagnsw;
      error = DAPSTATUS.error;
      InitDAPSTATUS();
      DAPSTATUS.jtagnsw = jtagnsw;
      DAPSTATUS.error = error;
      return CheckDAPSTATUS();
    }
  DBG_MSG(("DAPPowerDown(): FAIL\n"));
  return TEST_FAIL;
}


// Following functions all use the Comms Region

uint32_t GetTAPID()
{
  DBG_MSG(("GetTAPID()\n"));
  InitCommRegion();
  if(DAPSTATUS.jtagnsw == 1)
    {
      WriteCommRegion(0, (JTAGScanIDCODE() & 0xFFFFFFFFUL) );
      return CheckDAPSTATUS();
    }
  return TEST_FAIL;
}


uint32_t GetDPReg()
{
  uint32_t dpreg;
  uint32_t value;

  DBG_MSG(("GetDPReg()\n"));

  if(DAPSTATUS.on)
    {
      InitCommRegion();

      dpreg = ReadCommRegion(0);

      if(DAPSTATUS.jtagnsw)
        {
          JtagAPnDP(DP);
          JTAGScanDR(JTAG_SCAN(dpreg,READ));
          value = DPReadRDBUFF();
        }
      else
        {
          SWHeader(SW_HEADER(DP, READ, dpreg));
          value = SWDataRead();
        }

      WriteCommRegion(0, value);
      return CheckDAPSTATUS();
    }
  return TEST_FAIL;
}


uint32_t GetAPReg()
{
  uint32_t apreg;
  uint32_t value;

  DBG_MSG(("GetAPReg()\n"));

  if(DAPSTATUS.on)
    {
      InitCommRegion();
      apreg = ReadCommRegion(0);

      DPWriteBANKSEL( (apreg >> 4) & 0xF );

      if(DAPSTATUS.jtagnsw)
        {
          JtagAPnDP(AP);
          JTAGScanDR(JTAG_SCAN(apreg,READ));
          value = DPReadRDBUFF();
        }
      else
        {
          SWHeader( SW_HEADER(AP, READ, apreg) );
          SWDataRead();
          value = DPReadRDBUFF();
        }
      WriteCommRegion(0, value);
      return CheckDAPSTATUS();
    }
  return TEST_FAIL;
}


uint32_t GetAPMem()
{
  uint32_t addr;
  uint32_t value;

  DBG_MSG(("GetAPMem()\n"));

  if(DAPSTATUS.on)
    {
      InitCommRegion();
      addr = ReadCommRegion(0);
      DBG_MSG(("GetAPMem(%x)\n",addr));

      value = ReadMem(addr);
      DBG_MSG(("GetAPMem(%x) returned %x\n", addr, value));

      WriteCommRegion(0, value);
      return CheckDAPSTATUS();
    }
  return TEST_FAIL;
}


uint32_t SetAPMem()
{
  uint32_t addr;
  uint32_t value;

  DBG_MSG(("SetAPMem()\n"));

  if(DAPSTATUS.on)
    {
      InitCommRegion();
      addr = ReadCommRegion(0);
      value = ReadCommRegion(1);

      if(addr&0x3 == 0)
        {
          WriteMem(addr, value);
          return CheckDAPSTATUS();
        }

      DBG_MSG(("Only WORD writes are supported\n"));
    }
  return TEST_FAIL;
}


uint32_t GetAPMemCSIDs()
{
  //
  // Use the Comm Region to return the CoreSight PID and CID values
  //
  // Pack the four byte values CID0-CID3 into one word
  // Pack the four byte values PID0-PID3 into one word
  // Pack the four byte values PID4-PID7 into one word
  //

  uint32_t component_base;

  uint32_t csids[12];

  uint32_t cid;
  uint32_t pid_lo;
  uint32_t pid_hi;

  DBG_MSG(("GetAPMemCSIDs()\n"));

  if(DAPSTATUS.on)
    {
      InitCommRegion();
      component_base = ReadCommRegion(0);

      // Read all 12 ID locations in one operation
      ReadMemBlock((component_base + PID4_OFFSET), 12, csids);

      // Pack CID and PID information into 3 words

      // PID4 (0xFD0)
      pid_hi  =  (csids[0] & 0xFF);

      // PID5 (0xFD4)
      pid_hi |= ((csids[1] & 0xFF) << 8);

      // PID6 (0xFD8)
      pid_hi |= ((csids[2] & 0xFF) << 16);

      // PID7 (0xFDC)
      pid_hi |= ((csids[3] & 0xFF) << 24);

      // PID0 (0xFE0)
      pid_lo =   (csids[4] & 0xFF);

      // PID1 (0xFE4)
      pid_lo |= ((csids[5] & 0xFF) << 8);

      // PID2 (0xFE8)
      pid_lo |= ((csids[6] & 0xFF) << 16);

      // PID3 (0xFEC)
      pid_lo |= ((csids[7] & 0xFF) << 24);

      // CID0 (0xFF0)
      cid =   (csids[8] & 0xFF);

      // CID1 (0xFF4)
      cid |= ((csids[9] & 0xFF) << 8);

      // CID2 (0xFF8)
      cid |= ((csids[10] & 0xFF) << 16);

      // CID3 (0xFFC)
      cid |= ((csids[11] & 0xFF) << 24);

      WriteCommRegion(0, cid);
      WriteCommRegion(1, pid_lo);
      WriteCommRegion(2, pid_hi);

      return CheckDAPSTATUS();
    }

  return TEST_FAIL;
}


uint32_t ConnectWakeUnhalt()
{
  //
  // Used to wake core up when sleeping
  //

  uint32_t data;

  // Connect - Done by SetMode*
  DBG_MSG(("ConnectWakeUnhalt()\n"));

  if(DAPSTATUS.on)
    {
      InitCommRegion();

      // Check S_SLEEP
      data=ReadMem(DHCSR_ADDR);

        if(data & S_SLEEP)
          {
            DBG_MSG(("Seen S_SLEEP\n"));

            // Core is sleeping, so set halting debug enable
            WriteMem(DHCSR_ADDR, (DBGKEY | C_HALT | C_DEBUGEN) );
            DBG_MSG(("Written C_HALT\n"));

            // Wait for core to be halted
            while((ReadMem(DHCSR_ADDR) & S_HALT) == 0);
            DBG_MSG(("Seen S_HALT\n"));

            // Write flag into DATA[0] to allow example MCU code to escape its loop
            WriteCommRegion(0, 1);
            DBG_MSG(("Written flag\n"));

            // Clear Halt and debug enables
            WriteMem(DHCSR_ADDR, DBGKEY);
            DBG_MSG(("Cleared halt\n"));

            return CheckDAPSTATUS();
          }

        DBG_MSG(("Core not sleeping\n"));
        return TEST_FAIL;
    }
  return TEST_FAIL;
}


uint32_t EnableHaltingDebug()
{
  DBG_MSG(("EnableHaltingDebug()\n"));

  if(DAPSTATUS.on)
    {
      // Set C_DEBUGEN bit
      DBG_MSG(("EnableHaltingDebug()\n"));

      // Set Debug enable
      WriteMem(DHCSR_ADDR, (DBGKEY | C_DEBUGEN) );
      DBG_MSG(("Written C_DEBUGEN\n"));

      return CheckDAPSTATUS();
    }
  return TEST_FAIL;
}


uint32_t ConnectCheckUnlockup()
{
  uint32_t value;

  DBG_MSG(("ConnectCheckUnlockup()\n"));

  if(DAPSTATUS.on)
    {
      InitCommRegion();

      // Check for S_LOCKUP
      if(ReadMem(DHCSR_ADDR) & S_LOCKUP)
        {
          DBG_MSG(("Seen S_LOCKUP\n"));

          // Halt the core
          WriteMem(DHCSR_ADDR, (DBGKEY | C_HALT | C_DEBUGEN) );
          DBG_MSG(("Written C_HALT\n"));

          // Wait for core to be halted
          while((ReadMem(DHCSR_ADDR) & S_HALT) == 0);
          DBG_MSG(("Seen S_HALT\n"));


          // Replace faulting code sequence with a non-faulting
          // sequence at the same address, to allow the core to
          // exit HardFault and continue the main() code.

          // Get non-faulting value
          value = ReadCommRegion(2); // Reads from (Cortex_MCU.stacktop + 0x8)

          // Write to execution location
          WriteCommRegion(3, value); // Writes to (Cortex_MCU.stacktop + 0xC)

          //Get the RETURN register value
          WriteMem(DCRSR_ADDR, (DebugReturnAddress));
          while( (ReadMem(DHCSR_ADDR) & S_REGRDY) == 0 );
          value = ReadMem(DCRDR_ADDR);
          DBG_MSG(("Current DebugReturnAddress= %x\n", value));


          // Write address of the (now non-faulting) function
          // as the DebugReturnAddress
          value = (Cortex_MCU.stacktop + 0xC);
          WriteMem(DCRDR_ADDR, value);
          WriteMem(DCRSR_ADDR, (REGWnR | DebugReturnAddress));
          while( (ReadMem(DHCSR_ADDR) & S_REGRDY) == 0 );
          DBG_MSG(("Wrote return address= %x\n", value));

          // Unhalt
          WriteMem(DHCSR_ADDR, DBGKEY);
          DBG_MSG(("Cleared C_HALT\n"));

          return CheckDAPSTATUS();
        }
      DBG_MSG(("Core not in lockup\n"));
      return TEST_FAIL;
    }
  return TEST_FAIL;
}


uint32_t DAPAccess()
{
  //
  // Perform WORD, HALFWORD, and BYTE accesses
  //

  uint32_t retval = 0;

  DBG_MSG(("DAPAccess()\n"));

  if(DAPSTATUS.on)
    {
      InitCommRegion();

      // Zero a WORD
      WriteMem(Cortex_MCU.stacktop, 0);

      // Check WORD reads as zero
      if(ReadMem(Cortex_MCU.stacktop) == 0)
        {
          retval |= 0x1;
          DBG_MSG(("Word was clear\n"));
        }

      // Write a HALFWORD
      WriteMemH((Cortex_MCU.stacktop + 2), 0x3456);

      // Read a WORD, check for expected value
      if(ReadMem(Cortex_MCU.stacktop) == 0x34560000)
        {
          retval |= 0x2;
          DBG_MSG(("Read back correct value\n"));
        }
      else
        {
          DBG_MSG(("Incorrect value - FAIL\n"));
        }

      // Write a BYTE
      WriteMemB((Cortex_MCU.stacktop + 1), 0x12);

      // Read a WORD, check for expected value
      if(ReadMem(Cortex_MCU.stacktop) == 0x34561200)
        {
          retval |= 0x4;
          DBG_MSG(("Read back correct value\n"));
        }
      else
        {
          DBG_MSG(("Incorrect value - FAIL\n"));
        }

      WriteCommRegion(0, retval);
      DBG_MSG(("Written retval: %x\n", retval));

      return CheckDAPSTATUS();
    }
  return TEST_FAIL;
}


uint32_t ConfigTrace(void)
{
  //
  // Function to provide support for trace testing.
  // Initialise the trace capture, and should be after
  // trace port has been set-up.
  //

  DBG_MSG(("ConfigTrace()\n"));

  if(DAPSTATUS.on)
    {
      InitCommRegion();
      // Get config to use from test core.
      TRACE->CONFIG = ReadCommRegion(0); // Reads from (Cortex_MCU.stacktop);
      DBG_MSG(("TRACE->CONFIG= %x\n",TRACE->CONFIG));
      Cortex_MCU.traceconfigured = 1;
      return CheckDAPSTATUS();
    }
  return TEST_FAIL;
}


uint32_t CheckTrace(void)
{
  //
  // Function to provide support for trace testing.
  // Read formatted data from buffer and
  // decompress individual streams
  //
  // Trace is printed, and also counted to allow tests to check
  // the relevant packets were generated
  //

  uint32_t i = 7;
  uint32_t frame_buffer[4];
  uint32_t lsb_bits;

  DBG_MSG(("CheckTrace()\n"));

  if(DAPSTATUS.on)
    {
      if(Cortex_MCU.traceconfigured == 0)
        {
          DBG_MSG(("ERROR : ConfigTrace has not been ran before CheckTrace, or CheckTrace executed again without rerunning ConfigTrace\n"));
          return TEST_FAIL;
        }
      else
        {
          InitCommRegion();

          // Set Cortex_MCU.traceconfigured = 0 again to reconfigure trace next time when
          // it is called. This make it possible for testing ITM/ITMSW/DTM/DTMSW
          // in one main file.
          Cortex_MCU.traceconfigured = 0;

          DBG_MSG(("Trace Decompress\n"));
          DBG_MSG(("initial i= %x, trace_errors=%x\n", i, trace_errors));
          DBG_MSG(("initial TRACE->DEPTH = %x\n", TRACE->DEPTH));
          DBG_MSG(("initial TRACE->STATUS = %x\n", TRACE->STATUS));
          if ((TRACE->DEPTH ==0) &((TRACE->STATUS & 0x8)==0)) { //Trace depth is zero and no overflow
            DBG_MSG(("No trace captured\n"));

            return TEST_FAIL;
          }

          if ((TRACE->STATUS & 0x8)==0x8) { //Trace capture buffer overflow
            DBG_MSG(("Trace capture buffer overflow\n"));
            return TEST_FAIL;
          }
          DBG_MSG(("initial i= %x, trace_errors=%x\n", i, trace_errors));
          // Grab frame of data
          while((i==7) && (trace_errors == 0))
            {
              DBG_MSG(("."));
              for(i=0;i<4;i++)
                {
                  frame_buffer[i] = TRACE->DATA;
                  if (frame_buffer[i] == 0x7FFFFFFFUL)
                    {
                      if (i==0)
                        {
                          DBG_MSG(("No more Frames\n"));
                          i=5;
                        }
                      else
                        {
                          DBG_MSG(("Incomplete Frame. At %d, %08x:%08x:%08x:%08x:\n",i,
                                   frame_buffer[0],frame_buffer[1],frame_buffer[2],frame_buffer[3]));
                          i=5;
                          trace_errors++;
                        }
                    }
                }
              // Decompress frame
              if(i==4)
                {
                  fmt_frames++;;
                  lsb_bits = frame_buffer[3] >> 24;
                  for(i=0;i<7;i++)
                    {
                      if((frame_buffer[i/2] & 0x1) == 0x1)
                        {
                          if ((lsb_bits & 1) == 1)
                            {
                              ParseTrace(((frame_buffer[i/2]) >> 8) & 0xFF);
                              trace_id = (((frame_buffer[i/2]) >> 1) & 0x7F);
                            }
                          else
                            {
                              trace_id = (((frame_buffer[i/2]) >> 1) & 0x7F);
                              ParseTrace(((frame_buffer[i/2]) >> 8) & 0xFF);
                            }
                        }
                      else
                        {
                          ParseTrace((frame_buffer[i/2] & 0xFE) |
                                     (lsb_bits & 1));
                          ParseTrace(((frame_buffer[i/2]) >> 8) & 0xFF);
                        }
                      frame_buffer[i/2] = ((frame_buffer[i/2]) >> 16);
                      lsb_bits = lsb_bits >> 1;
                    }
                  // Byte 14 handled outside of loop Should not be early ID
                  if((frame_buffer[3] & 0x1) == 1)
                    {
                      if(lsb_bits != 0 )
                        {
                          trace_errors ++;
                          DBG_MSG(("\nByte 14 is ID with LSB set, should be data\n"));
                        }
                      else
                        {
                          trace_id = ((frame_buffer[3] >> 1) & 0x7F);
                        }
                    }
                  else
                    {
                      ParseTrace((frame_buffer[3] & 0xFE) | lsb_bits);
                    }
                }
            }
          DBG_MSG(("\nTrace extraction done, %d\n",trace_errors));
          // Write trace statistics into MCU memmory. May be some corruption if counts are too large
          // Maximum of 256 frames, 3840 ETM bytes
          // [0] fmt_trig[2], fmt_itm[10], fmt_etm[12], fmt_frames[8]
          // [1] exceptions[4], branches[8], Isync[6], p_headers [14]
          // [2] itm_sync[2] itm_overflow[2], itm_glb2[4], itm_glb1[8], triggers[2], ignore [2], timestamps[8], rfe[4]
          // [3] itm_ts[5], itm_sw[5], itm_event[6], itm_periodic[5], itm_exception[5], itm_comp[6]
          WriteCommRegion(0, ((fmt_triggers << 30) | (fmt_itm << 20) | (fmt_etm <<8) | fmt_frames) );
          WriteCommRegion(1, (etm_p_headers | etm_i_sync <<14 | etm_branches<<20| etm_exceptions<<28));
          WriteCommRegion(2, (etm_rfe | etm_timestamps<<4 | etm_ignore<<12 | etm_triggers <<14 |
                              itm_glb1 << 16 | itm_glb2 << 24 | itm_overflow <<28 | itm_sync << 2));
          WriteCommRegion(3, (itm_ts<<27 | itm_sw<<22 | itm_event <<16 | itm_periodic <<11 | itm_exception <<6 | itm_comp));

          return trace_errors;
        }
    }
  return TEST_FAIL;
}


uint32_t ParseTrace(uint8_t new_byte)
{
  // ID 0 is null, used for padding. Although not architected, expect to only see data=0
  //
  switch (trace_id)
  {
    case 0:
      if(new_byte != 0)
      {
        DBG_MSG(("NULL ID (0) with non-zero data byte:%02x\n",new_byte));
        trace_errors++;
      }
      break;

  case MCU_ETM_ID:

      fmt_etm++;
      TRC_MSG(("%02x ",new_byte));
      switch (etm_current)
      {
        case 00:
          if(new_byte==0) // Sync Packet
          {
            etm_current = 1;
            etm_bytes++;
          }
          else if((new_byte & 1) ==1) // Branch Packet
          {
            current_address = (current_address & 0xFFFFFF80UL) |
              (new_byte & 0x7E);
            if((new_byte & 0x80)==0x80)
            {
              etm_current = 2;
              etm_packet[0] = new_byte;
              etm_bytes++;
            }
            else
            {
              TRC_MSG(("Branch to %08x\n",current_address));
              etm_branches++;
            }
          }
          else if(new_byte  ==0x08) // I-Sync packet
          {
            etm_current = 4;
          }
          else if(new_byte  ==0x0C) // Trigger, single byte
          {
            TRC_MSG(("ETM Trigger\n"));
            etm_triggers++;
          }
          else if(new_byte  ==0x66) // Ignore, single byte
          {
            TRC_MSG(("ETM Ignore byte\n"));
            etm_ignore++;
          }
          else if(new_byte  ==0x76) // RFE, single byte
          {
            TRC_MSG(("ETM Exception Return\n"));
            etm_rfe++;
          }
          else if((new_byte & 0x80 )== 0x80) // P-header, single byte
          {
            etm_p_headers++;
            TRC_MSG(("P-header, "));
            if((new_byte & 0x3) == 0) {
              if((new_byte & 0x3C) !=0) {
                TRC_MSG(("%d CC pass ",(new_byte & 0x3C)>>2));
              }
              if((new_byte & 0x40) !=0) {
                TRC_MSG(("1 CC Fail "));
              }
              TRC_MSG(("\n"));
            }
            else
            {
              if((new_byte & 0xF0) != 0x80)
              {
                DBG_MSG(("Bad P-Header\n"));
                trace_errors++;
              }
              etm_p_headers++;
              if((new_byte & 0x8) == 0x0)
              {
                TRC_MSG(("CC-Pass,"));
              }
              else
              {
                TRC_MSG(("CC-Fail,"));
              }
              if((new_byte & 0x4) == 0x0)
              {
                TRC_MSG(("CC-Pass\n"));
              }
              else
              {
                TRC_MSG(("CC-Fail\n"));
              }
            }
          }
          else if((new_byte | 0x04 )== 0x46) // Timestamp
          {
            etm_current = 8;
            etm_bytes=0;
            TRC_MSG(("ETM Timestamp, R-bit%d\n",(new_byte>>2) & 1));
            etm_timestamps++;
          }
          else
          {
            trace_errors++;
            DBG_MSG(("Bad ETM Byte\n"));
            TRC_MSG(("Header %02x Unknown\n",new_byte));
          }
          break;
        case 0x01: // Sync packet. 0x00 or 0x80
          if(new_byte==0)
          {
            etm_bytes++;
          }
          else if(new_byte==0x80)
          {
            etm_bytes=0;
            etm_current = 0;
            TRC_MSG(("Sync Packet\n"));
          }
          break;
        case 0x02: // Branch Packet. Uses continuation bits
          etm_packet[etm_bytes] = new_byte;
          etm_bytes++;
          if((new_byte >>7) == 0)
          {
            switch (etm_bytes)
            {
              case 2: // bits[12:7]
                current_address = (current_address & 0xFFFFD07F) | ((new_byte & 0x3E) << 6);
                break;
              case 3: // bits[19:14]
                current_address = (current_address & 0xFFF03FFF) | ((new_byte & 0x3E) << 13);
                break;
              case 4: // bits[26:21]
                current_address = (current_address & 0xF81FFFFF) | ((new_byte & 0x3E) << 20);
                break;
              case 5: // bits[31:28]
                trace_errors++;
                DBG_MSG(("Branch Packet Too long\n"));
                break;
            }
            TRC_MSG(("Branch Packet - Address %08x\n",current_address));
            etm_branches++;
            etm_bytes = 0;
            // Check for exception bytes
            if((new_byte >>6) == 0)
            {
              etm_current = 0;
            }
            else
            {
              etm_current = 0x10;
            }
          }
          else
          {
            if(etm_bytes > 6) {
              DBG_MSG(("Branch Packet too long\n"));
              trace_errors++;
              switch (etm_bytes)
              {
                case 2: // bits[13:7]
                  current_address = (current_address & 0xFFFFC07F) | ((new_byte & 0x7E) << 6);
                  break;
                case 3: // bits[20:14]
                  current_address = (current_address & 0xFFE03FFF) | ((new_byte & 0x7E) << 13);
                  break;
                case 4: // bits[27:21]
                  current_address = (current_address & 0xF01FFFFF) | ((new_byte & 0x7E) << 20);
                  break;
                case 5: // bits[31:28]
                  current_address = (current_address & 0x0FFFFFFF) | ((new_byte & 0x7E) << 27);
                  break;
              }
            }
          }
          break;
        case 0x04: // I-sync packet. Fixed length for CM3-ETM / CM4-ETM
          etm_packet[etm_bytes] = new_byte;
          etm_bytes++;
          if(etm_bytes == 5)
          {
            current_address = (etm_packet[1] & 0xFE) |
              (etm_packet[2] << 8) | (etm_packet[3] << 16) | (etm_packet[4] << 24) ;
            if((etm_packet[0] & 0x9F) != 0x01)
            {
              trace_errors++;
              DBG_MSG(("Bad Isync information byte %02x\n",etm_packet[0]));
            }
            TRC_MSG(("I-Sync Packet "));
            switch(etm_packet[0]>>5 & 3)
            {
              case 0: TRC_MSG(("Periodic"));
                break;
              case 1: TRC_MSG(("Trc On"));
                break;
              case 2: TRC_MSG(("Overflow"));
                break;
              case 3: TRC_MSG(("Debug"));
            }
            TRC_MSG((", Address %08x\n",current_address));
            etm_i_sync++;
            etm_bytes = 0;
            etm_current = 0;
          }
          break;
        case 0x08: // Timestamp Packet
          etm_bytes++;
          switch (etm_bytes)
          {
            case 1:
              etm_ts1 = (etm_ts1 & 0xFFFFFF80UL) | (new_byte & 0x7F);
              break;
            case 2:
              etm_ts1 = (etm_ts1 & 0xFFFFC07FUL) | (new_byte & 0x7F)<<7;
              break;
            case 3:
              etm_ts1 = (etm_ts1 & 0xFFE03FFFUL) | (new_byte & 0x7F)<<14;
              break;
            case 4:
              etm_ts1 = (etm_ts1 & 0xF01FFFFFUL) | (new_byte & 0x7F)<<21;
              break;
            case 5:
              etm_ts1 = (etm_ts1 & 0x0FFFFFFFUL) | (new_byte & 0x0F)<<28;
              etm_ts2 = (etm_ts2 & 0xFFFFFFF8UL) | (new_byte & 0x70)>>4;
              break;
            case 6:
              etm_ts2 = (etm_ts2 & 0xFFFFFC07UL) | (new_byte & 0x7F)<<3;
              break;
            case 7:
              etm_ts2 = (etm_ts2 & 0xFFFF03FFUL) | (new_byte & 0x3F)<<10;
              if(new_byte & 0xC0 !=0)
              {
                DBG_MSG(("Last timestamp byte should have [7:6]=00\n"));
                trace_errors++;
                etm_current = 0;
              }
              break;
          }
          if((new_byte >> 7) ==0)
          {
            if ((etm_ts1 < etm_ts1_last) & etm_bytes <5)
            {
              DBG_MSG(("Timestamp must increase\n"));
              trace_errors++;
            }
            TRC_MSG(("ETM Timestamp %04x%08x\n",etm_ts2,etm_ts1));
            etm_current = 0;
            etm_bytes=0;
          }
          break;
        case 0x10: // Exception packet
          etm_bytes++;
          if((new_byte>>7) == 0)
          {
            etm_bytes=0;
            etm_current = 0;
            TRC_MSG(("Exception Taken\n"));
            etm_exceptions++;
          }
          else
          {
            if(etm_bytes > 2)
            {
              trace_errors++;
              DBG_MSG(("Exception packet too long\n"));
            }
          }
          break;
        default:
          DBG_MSG(("Trace parser crashed\n"));
          trace_errors++;
          break;
      }
      break;

  case MCU_ITM_ID:

      DBG_MSG(("ITM:%02x\n",new_byte));
      fmt_itm++;
      switch (itm_current)
      {
        case 0x00:
          if(new_byte == 00)
          {
            itm_current = 1;        // Sync
            itm_bytes=1;
          }
          else if(new_byte == 0x70) // Overflow
          {
            itm_overflow++;
            TRC_MSG(("ITM Overflow\n"));
          }
          else if((new_byte & 0x0F) == 0) // local timestamp
          {
            if ((new_byte & 0x80) == 0) // single byte TS
            {
              TRC_MSG(("ITM TS :%d\n",(new_byte & 0x70) >> 4));
              itm_ts++;
            }
            else
            {
              itm_current = 2;
              itm_header = new_byte;
              itm_payload = 0;
              itm_bytes=1;
            }
          }
          else if(new_byte == 0x94) // ts1
          {
            itm_current = 4;
            itm_header = new_byte;
            itm_payload = 0;
            itm_bytes=1;
          }
          else if(new_byte == 0xB4) // ts2
          {
            itm_current = 8;
            itm_header = new_byte;
            itm_payload = 0;
            itm_bytes=1;
          }
          else if((new_byte & 0x3) != 0)   // Stimulus packet
          {
            itm_current = 16;
            itm_header = new_byte;
            itm_payload = 0;
            itm_bytes=0;
            switch (new_byte & 0x3)
              {
              case 1: itm_size = 1;
                break;
              case 2: itm_size = 2;
                break;
              case 3: itm_size = 4;
                break;
              }
          }
          else
          {
            trace_errors++;
            DBG_MSG(("Un-recognised ITM\n"));
            TRC_MSG((" BAD Header %02x\n",new_byte));
          }
          break;
        case 0x01:
          itm_bytes ++;
          if(new_byte == 0x80)
          {
            TRC_MSG(("ITM Sync\n"));
            itm_sync++;
            itm_current = 0;
            itm_bytes = 0;
          }
          if((new_byte & 0x7F) != 0)
          {
            trace_errors++;
            itm_current = 0;
            itm_bytes = 0;
            DBG_MSG(("ITM Bad sync byte %02x\n",new_byte));
          }
          break;
        case 0x02:
          itm_payload = (itm_payload <<7) | (new_byte & 0x7F);
          if ((new_byte & 0x80) == 0)
          {
            switch (itm_header>>4 & 3)
            {
              case 0: TRC_MSG(("ITM TS delta:%d\n",itm_payload));
                break;
              case 1: TRC_MSG(("ITM Late TS :%d\n",itm_payload));
                break;
              case 2: TRC_MSG(("ITM TS for delayed packet :%d\n",itm_payload));
                break;
              case 3: TRC_MSG(("ITM late TS for delayed packet:%d\n",itm_payload));
                break;
            }
            itm_ts++;
            itm_current = 0;
            itm_bytes =0;
          }
          else
          {
            itm_bytes++;
            if (itm_bytes > 5)
            {
              trace_errors++;
              DBG_MSG(("ITM timestamp packet too long\n"));
              itm_current = 0;
              itm_bytes =0;
            }
          }
          break;
        case 0x04:
          switch (itm_bytes)
            {
            case 1:
              itm_ts1 = (itm_ts1 & 0xFFFFFF10) | (new_byte & 0x7f);
              break;
            case 2:
              itm_ts1 = (itm_ts1 & 0xFFFFC07F) | ((new_byte & 0x7f) <<7);
              break;
            case 3:
              itm_ts1 = (itm_ts1 & 0xFFF03FFF) | ((new_byte & 0x7f) <<14);
              break;
            case 4:
              itm_ts1 = (itm_ts1 & 0xFF10FFFF) | ((new_byte & 0x7f) <<21);
              break;
            }
          itm_bytes++;
          if((new_byte & 0x80) == 0x00)
          {
            TRC_MSG(("ITM Global TS1 :%d\n",itm_ts1 & 0x03FFFFFFUL));
            itm_glb1 ++;
            if(itm_ts1 > 0)
            {
              if((itm_ts1 < itm_ts1_last) & (new_byte & 0x40 == 0x00))
              {
                DBG_MSG(("Timestamp should increase"));
                trace_errors++;
              }
              itm_ts1_last = itm_ts1;
            }
            if (itm_bytes == 5)
            {
              if((new_byte & 0x20) == 0x20)
              {
                TRC_MSG(("ITM Global Clock Change\n"));
              }
              if((new_byte & 0x40) == 0x40)
              {
                TRC_MSG(("ITM Global low count bits wrapped\n"));
              }
            }
            itm_current = 0;
          }
          else
          {
            if (itm_bytes == 5)
            {
              DBG_MSG(("ITM TS1 too long\n"));
              trace_errors++;
              itm_current = 0;
              itm_bytes =0;
            }
          }
          break;
        case 0x08:
          switch (itm_bytes)
            {
            case 1:
              itm_ts2 = (itm_ts2 & 0xFFFFFF10) | (new_byte & 0x7f);
              break;
            case 2:
              itm_ts2 = (itm_ts2 & 0xFFFFC07F) | ((new_byte & 0x7f) <<7);
              break;
            case 3:
              itm_ts2 = (itm_ts2 & 0xFFF03FFF) | ((new_byte & 0x7f) <<14);
              break;
            case 4:
              itm_ts2 = (itm_ts2 & 0xFF10FFFF) | ((new_byte & 0x7f) <<21);
              break;
            }
          itm_bytes++;
          if((new_byte & 0x80) == 0x00)
          {
            TRC_MSG(("ITM Global TS2 :%d\n",itm_ts2 & 0x007FFFFFUL));
            itm_glb2 ++;
            if (itm_bytes == 5)
            {
              if(new_byte & 0xFE != 0x00)
              {
                DBG_MSG(("ITM TS2 byte 5 can only have bit[0] set\n"));
                trace_errors++;
              }
            }
            itm_current = 0;
          }
          else
          {
            if (itm_bytes == 5)
            {
              DBG_MSG(("ITM TS2 too long\n"));
              trace_errors++;
              itm_current = 0;
              itm_bytes =0;
            }
          }
          break;
        case 0x10:
          itm_payload = itm_payload | (new_byte << (itm_bytes * 8));
          itm_bytes ++;
          if(itm_bytes == itm_size)
          {
            if ((itm_header & 4) == 0)
            {
              TRC_MSG(("ITM s/w channel %d, %08x\n",itm_header>>3,itm_payload));
              itm_sw++;
            }
            else
            {
              switch(itm_header>>3)
                {
                case 0://Event packet
                  TRC_MSG(("ITM #"));
                  if((itm_payload & 1) == 1) {
                    TRC_MSG((" CPI"));
                    itm_event++;
                  }
                  if((itm_payload & 2) == 2) {
                    TRC_MSG((" Exc"));
                    itm_event++;
                  }
                  if((itm_payload & 4) == 4) {
                    TRC_MSG((" Sleep"));
                    itm_event++;
                  }
                  if((itm_payload & 8) == 8) {
                    TRC_MSG((" LSU"));
                    itm_event++;
                  }
                  if((itm_payload & 16) == 16) {
                    TRC_MSG((" FOLD"));
                    itm_event++;
                  }
                  if((itm_payload & 32) == 32) {
                    TRC_MSG((" Cyc"));
                    itm_event++;
                  }
                  TRC_MSG((" Event\n"));
                  break;
                case 1://Exception Packet
                  switch (itm_payload >> 12)
                    {
                    case 1:
                      TRC_MSG(("ITM Exception Entry %d\n",itm_payload & 0x1ff));
                      break;
                    case 2:
                      TRC_MSG(("ITM Exception Exit %d\n",itm_payload & 0x1ff));
                      break;
                    case 3:
                      TRC_MSG(("ITM Exception Return %d\n",itm_payload & 0x1ff));
                      break;
                    }
                  itm_exception++;
                  break;
                case 2:
                  if(itm_size == 4) {
                    TRC_MSG(("ITM PC periodic %08x\n",itm_payload));
                  } else {
                    TRC_MSG(("ITM PC periodic, sleeping\n"));
                  }
                  itm_periodic++;
                  break;
                default: // Other sources
                  if((itm_header & 0xC4) == 0x84){
                    TRC_MSG(("ITM Data Value %d:",(itm_header>> 4) & 3));
                    if ((itm_header & 8) == 0){
                      TRC_MSG(("Read "));
                    } else {
                      TRC_MSG(("Write "));
                    }
                    TRC_MSG((" %08x\n",itm_payload));
                  }
                  if((itm_header & 0xCF) == 0x47) {
                    TRC_MSG(("ITM Data PC %d:%08x\n",(itm_header>> 4) & 3,itm_payload));
                  }
                  if((itm_header & 0xCF) == 0x4E) {
                    TRC_MSG(("ITM Data Address offset %d:%08x\n",(itm_header>> 4) & 3,itm_payload));
                  }
                  if((itm_header >> 5) == 3) {
                    TRC_MSG(("ITM Unspecified HW source %d:%08x\n",(itm_header>> 3),itm_payload));
                    trace_errors++;
                  }
                  itm_comp++;
                }
            }
            itm_current = 0;
            itm_bytes =0;
          }
          break;
      }
      break;
    case 0x7D:
      if(new_byte != 0)
      {
        DBG_MSG(("Trigger with non-zero data byte:%02x\n",new_byte));
      }
      TRC_MSG(("Formatter Trigger\n"));
      fmt_triggers++;
      break;
    default:
      trace_errors ++;
      DBG_MSG(("Unexpected ID:%02x\n",trace_id));
      break;
  }
  return 0;
}


uint32_t EmptyFunction()
{
  DBG_MSG(("EmptyFunction()\n"));

  return TEST_FAIL;
}


////////////////////////////////////////////////////////////////////////////////
//
// Internal Functions - Wire Protocol agnostic
//
////////////////////////////////////////////////////////////////////////////////

void InitDAPSTATUS()
{
  //
  // Initialise DAPSTATUS struct - use from reset, or if DAP powered down
  //
  DAPSTATUS.jtagnsw = 0;     // Serial Wire
  DAPSTATUS.jtagapndp = 2;   // Invalid value
  DAPSTATUS.on = 0;          // DAP powered off
  DAPSTATUS.banksel = 0xff;  // Invalid banksel value
  DAPSTATUS.csw = 0xffffffff;// Invalid CSW value - we haven't set up CSW
  DAPSTATUS.error = 0;       // No errors
  DAPSTATUS.ack = 0;         // Invalid value for ack
  DAPSTATUS.stkerrclr = 0;   // Not cleared
}


void InitCommRegion()
{
  //
  // Get value for Cortex_MCU.stacktop by reading example MCU vector table
  //
  if(Cortex_MCU.stacktop == 0)
    {
      DBG_MSG(("InitCommRegion()\n"));
      Cortex_MCU.stacktop = ReadMem(0);
      Cortex_MCU.stacktop = SwapEndian(Cortex_MCU.stacktop);
      DBG_MSG(("InitCommRegion() StackPointer = %x\n",Cortex_MCU.stacktop ));
    }
}


uint32_t SwapEndian(uint32_t data)
{
  //
  // Swap endianness of data values if CPUs are BigEndian, since
  // the DAP routines are inherently LE
  //

  if(EXPECTED_BE)
    {
      // CPU under test is in BigEndian, so swap data endianness
      return __REV(data);
    }
  else
    {
      return data;
    }
}


uint32_t ReadCommRegion(uint32_t index)
{
  return SwapEndian( ReadMem( Cortex_MCU.stacktop + (4 * index)));
}


void WriteCommRegion(uint32_t index, uint32_t data)
{
  WriteMem( (Cortex_MCU.stacktop + (4 * index)), SwapEndian(data) );
}


uint32_t ReadMem(uint32_t address)
{
  //
  // return the WORD value found at address
  //

  uint32_t value;

  // Ensure CSW is set up
  APWriteCSW(CSW_PROT_MASTER_DBG | CSW_PROT_PRIV | CSW_INCR_OFF | CSW_SIZE_WORD);

  // Write TAR
  APWriteTAR(address);

  // Read DRW
  APReadDRW();

  // Read RdBuff
  value = DPReadRDBUFF();

  DBG_MSG(("ReadMem(%x), returned: %x\n", address,value));

  return value;
}


uint32_t ReadMemH(uint32_t address)
{
  //
  // return the HALFWORD value found at address
  //

  uint32_t value;

  // Ensure CSW is set up
  APWriteCSW(CSW_PROT_MASTER_DBG | CSW_PROT_PRIV | CSW_INCR_OFF | CSW_SIZE_HALFWORD);

  // Write TAR
  APWriteTAR(address);

  // Read DRW
  APReadDRW();

  // Read RdBuff
  value = DPReadRDBUFF();

  DBG_MSG(("ReadMemH(%x), returned: %x\n", address,value));

  return value;
}


uint32_t ReadMemB(uint32_t address)
{
  //
  // return the BYTE value found at address
  //

  uint32_t value;

  // Ensure CSW is set up
  APWriteCSW(CSW_PROT_MASTER_DBG | CSW_PROT_PRIV | CSW_INCR_OFF | CSW_SIZE_BYTE);

  // Write TAR
  APWriteTAR(address);

  // Read DRW
  APReadDRW();

  // Read RdBuff
  value = DPReadRDBUFF();

  DBG_MSG(("ReadMemB(%x), returned: %x\n", address,value));

  return value;
}


void ReadMemBlock(uint32_t address, uint32_t numwords, uint32_t * data)
{
  //
  // Return numword WORDS from address into the data array
  //

  uint32_t tar;
  uint32_t wordsread;

  DBG_MSG(("ReadMemBlock(%x, %x)\n",address, numwords));

  // Ensure CSW is set up
  APWriteCSW(CSW_PROT_MASTER_DBG | CSW_PROT_PRIV | CSW_INCR_SINGLE | CSW_SIZE_WORD);

  // Keep local copy of TAR
  tar = address;

  // Write TAR
  APWriteTAR(tar);

  for(wordsread = 0; wordsread < numwords; wordsread++)
    {
      // If the local copy of the TAR value increments beyond the bottom 10 bits,
      // reload the DAP TAR. (ADIv5 Arch states that autoincrement beyond the
      // bottom 10 bits is implementation defined.)
      if(!(tar & 0x3FF))
        {
          APWriteTAR(tar);
        }

      if(wordsread)
        {
          data[wordsread-1] = APReadDRW();
        }
      else
        {
          // Discard data from initial Read
          APReadDRW();
        }
      tar += 4;
    }

  // Read final word from the Read Buffer
  data[wordsread-1] = DPReadRDBUFF();
}


uint32_t ReadMemSpecial(uint32_t address, uint8_t size, uint32_t user)
{
  //
  // return the value found at address. if the DAPSTATUS error
  // is set as a result of this read (assuming no prior errors),
  // the CTRL/STAT register is read to check sticky ERR bit and
  // then ABORT register written to clear the sticky ERR bit
  //
  uint32_t value;
  uint32_t ctrlstat;

  // Ensure CSW is set up
  APWriteCSW(CSW_PROT_MASTER_DBG | CSW_INCR_OFF | size | user);

  // Write TAR
  APWriteTAR(address);

  // Read DRW
  APReadDRW();

  // Read RdBuff
  value = DPReadRDBUFF();

  // For JTAG, CTRLSTAT needs to be read
  // for faults. Ack doesn't indicate fault
  if(DAPSTATUS.jtagnsw)
    {
      ctrlstat = DPReadCTRLSTAT();
      if((ctrlstat >> 5) & 1UL)
        DAPSTATUS.error++;
    }

  // Read CTRLSTAT to check STICKYERR
  // if STICKYERR is set, clear it
  if(DAPSTATUS.error == 1)
    {
      if(DAPSTATUS.jtagnsw)
        {
          // Already read earlier
          DBG_MSG(("DAP access faulted, clearing sticky error bit\n"));
          DPClearSTICKYERR();
          DAPSTATUS.stkerrclr = 1;
        }
      else
        {
          ctrlstat = DPReadCTRLSTAT();

          if((ctrlstat >> 5) & 1UL)
            {
            DBG_MSG(("DAP access faulted, clearing sticky error bit\n"));
            DPClearSTICKYERR();
            DAPSTATUS.stkerrclr = 1;
            }
        }

     DAPSTATUS.error = 0;
    }
  else if(DAPSTATUS.error > 1)
         DBG_MSG(("More than one DAP error seen! Unexpected so not clearing sticky error bit\n"));

  DBG_MSG(("ReadMemSpecial(%x), returned: %x\n", address,value));

  return value;
}

void WriteMem(uint32_t address, uint32_t data)
{
  //
  // Write WORD value back to target memory
  //

  DBG_MSG(("WriteMem(%x, %x)\n",address, data));

  // Ensure CSW is set up
  APWriteCSW(CSW_PROT_MASTER_DBG | CSW_PROT_PRIV | CSW_INCR_OFF | CSW_SIZE_WORD);

  // Write TAR
  APWriteTAR(address);

  // Write DRW
  APWriteDRW(data);

  // Read RdBuff to flush the write
  DPReadRDBUFF();
}


void WriteMemBlock(uint32_t address, uint32_t numwords, uint32_t * data)
{
  //
  // Write numwords WORD values to target memory
  //

  uint32_t tar;
  uint32_t wordswritten;

  DBG_MSG(("WriteMemBlock(%x, %x, %x)\n",address, numwords, data));

  // Write CSW : Word, incrementing address
  APWriteCSW(CSW_PROT_MASTER_DBG | CSW_PROT_PRIV | CSW_INCR_SINGLE | CSW_SIZE_WORD);

  // Keep local copy of TAR
  tar = address;

  // Write TAR
  APWriteTAR(tar);
  DBG_MSG(("Written 0x%x to TAR\n",tar));

  for(wordswritten = 0; wordswritten < numwords; wordswritten++)
    {
      // If the local copy of the TAR value increments beyond the bottom 10 bits,
      // reload the DAP TAR. (ADIv5 Arch states that autoincrement beyond the
      // bottom 10 bits is implementation defined.)
      if(!(tar & 0x3FF))
        {
          APWriteTAR(tar);
          DBG_MSG(("Written 0x%x to TAR\n",tar));
        }

      // Write DRW
      APWriteDRW(data[wordswritten]);
      tar += 4;
    }

  // Read RdBuff to flush the last write
  DPReadRDBUFF();
}


void WriteMemH(uint32_t address, uint32_t data)
{
  //
  // Write HALFWORD value back to target memory
  //

  uint32_t ldata;

  ldata = data | (data << 16);

  DBG_MSG(("WriteMemH(%x, %x)\n",address, ldata));

  // Ensure CSW is set up
  APWriteCSW(CSW_PROT_MASTER_DBG | CSW_PROT_PRIV | CSW_INCR_OFF | CSW_SIZE_HALFWORD);

  // Write TAR
  APWriteTAR(address);

  // Write DRW
  APWriteDRW(ldata);

  // Read RdBuff to flush the write
  DPReadRDBUFF();
}


void WriteMemB(uint32_t address, uint32_t data)
{
  //
  // Write BYTE value back to target memory
  //

  uint32_t ldata;

  ldata = data | (data << 8);
  ldata = ldata | (ldata << 16);

  DBG_MSG(("WriteMemB(%x, %x)\n",address, ldata));

  // Ensure CSW is set up
  APWriteCSW(CSW_PROT_MASTER_DBG | CSW_PROT_PRIV | CSW_INCR_OFF | CSW_SIZE_BYTE);

  // Write TAR
  APWriteTAR(address);

  // Write DRW
  APWriteDRW(ldata);

  // Read RdBuff to flush the write
  DPReadRDBUFF();
}


void JtagAPnDP(uint32_t apndp)
{
  //
  // JTAG switch scanchains
  //
  if(DAPSTATUS.jtagapndp != apndp)
    {
      if(apndp)
      {
          // AP
          JTAGScanIR(JTAG_APACC);
      }
      else
      {
          // DP
          JTAGScanIR(JTAG_DPACC);
      }
      DAPSTATUS.jtagapndp = apndp;
    }
}


void DPWriteBANKSEL(uint32_t banksel)
{
  //
  // Set DP register BANKSEL
  //

  if(DAPSTATUS.banksel != banksel)
    {
      if(DAPSTATUS.jtagnsw)
      {
            JtagAPnDP(0);
            JTAGScanDR( (banksel << 7) | JTAG_SCAN(SELECT,WRITE) );
      }
      else
      {
            SWHeader( SW_HEADER(DP, WRITE, SELECT) );
            SWDataWrite( banksel << 4 );
      }
      DAPSTATUS.banksel = banksel;
    }
}


void DPWriteCTRLSTAT(uint32_t ctrlstat)
{
  if(DAPSTATUS.jtagnsw)
    {
      JtagAPnDP(0);
      JTAGScanDR( (((uint64_t) ctrlstat) << 3) |  JTAG_SCAN(CTRLSTAT,WRITE)  );
    }
  else
    {
      SWHeader( SW_HEADER(DP, WRITE, CTRLSTAT) );
      SWDataWrite( ctrlstat );
    }
}


uint32_t DPReadCTRLSTAT()
{
  uint32_t data;

  if(DAPSTATUS.jtagnsw)
    {
      JtagAPnDP(0);
      JTAGScanDR( JTAG_SCAN(CTRLSTAT,READ) );
      data = DPReadRDBUFF();
    }
  else
    {
      SWHeader( SW_HEADER(DP, READ, CTRLSTAT) );
      data = SWDataRead();
    }
  return data;
}

uint32_t APReadCSW()
{
   uint32_t data;

  // CSW is in bank 0 (APBANKSEL=0)
  DPWriteBANKSEL(0UL << 4);

  if(DAPSTATUS.jtagnsw)
    {
      JtagAPnDP(1);
      JTAGScanDR( JTAG_SCAN(CSW, READ) );
      data = DPReadRDBUFF();
    }
  else
    {
      SWHeader( SW_HEADER(AP, READ, CSW) );
      SWDataRead();
      data =DPReadRDBUFF();
    }
  return data;
}

void APWriteCSW(uint32_t csw)
{
  // Set up CSW
  if(DAPSTATUS.csw != csw)
    {
      // CSW is in bank 0
      DPWriteBANKSEL(0UL << 4);

      if(DAPSTATUS.jtagnsw)
        {
          JtagAPnDP(1);
          JTAGScanDR( (((uint64_t) csw) << 3) |  JTAG_SCAN(CSW,WRITE) );
        }
      else
        {
          SWHeader( SW_HEADER(AP, WRITE, CSW) );
          SWDataWrite( csw );
        }
      DAPSTATUS.csw = csw;
    }
}


void APWriteTAR(uint32_t address)
{
  // TAR is in bank 0
  DPWriteBANKSEL(0UL << 4);

  if(DAPSTATUS.jtagnsw)
    {
      JtagAPnDP(1);
      JTAGScanDR( (((uint64_t) address) << 3) |  JTAG_SCAN(TAR,WRITE) );
    }
  else
    {
      SWHeader( SW_HEADER(AP, WRITE, TAR) );
      SWDataWrite( address );
    }
}


uint32_t APReadDRW()
{
  uint32_t data;
  // DRW is in bank 0
  DPWriteBANKSEL(0UL << 4);

  if(DAPSTATUS.jtagnsw)
    {
      JtagAPnDP(1);
      data = (JTAGScanDR(JTAG_SCAN(DRW,READ)) >> 3);
    }
  else
    {
      SWHeader( SW_HEADER(AP, READ, DRW) );
      data =  SWDataRead();
    }
  return data;
}


void APWriteDRW(uint32_t data)
{
  // DRW is in bank 0
  DPWriteBANKSEL(0UL << 4);

  if(DAPSTATUS.jtagnsw)
    {
      JtagAPnDP(1);
      JTAGScanDR( (((uint64_t) data) << 3) | JTAG_SCAN(DRW,WRITE) );
    }
  else
    {
      SWHeader( SW_HEADER(AP, WRITE, DRW) );
      SWDataWrite(data);
    }
}


uint32_t DPReadRDBUFF()
{
  uint32_t data;

  if(DAPSTATUS.jtagnsw)
    {
      JtagAPnDP(0);
      data = ( JTAGScanDR(JTAG_SCAN(RDBUFF,READ)) >> 3);
    }
  else
    {
      SWHeader( SW_HEADER(DP, READ, RDBUFF) );
      data = SWDataRead();
    }
  return data;
}


uint32_t DPReadIDR()
{
  uint32_t data;

  if(DAPSTATUS.jtagnsw)
    {
      JtagAPnDP(0);

      JTAGScanDR(JTAG_SCAN(DPIDR,READ));
      data = DPReadRDBUFF();
    }
  else
    {
      SWHeader( SW_HEADER(DP, READ, DPIDR) );
      data = SWDataRead();
    }
  return data;
}


uint32_t APReadIDR()
{
  uint32_t data;

  // IDR is in bank F
  DPWriteBANKSEL(0xF);

  if(DAPSTATUS.jtagnsw)
    {
      JtagAPnDP(1);
      JTAGScanDR(JTAG_SCAN(IDR,READ));
      data = DPReadRDBUFF();
    }
  else
    {
      SWHeader( SW_HEADER(AP, READ, IDR) );
      SWDataRead();
      data = DPReadRDBUFF();
    }
  return data;
}


uint32_t APReadBASE()
{
  uint32_t data;

  // BASE is in bank F
  DPWriteBANKSEL(0xF);

  if(DAPSTATUS.jtagnsw)
    {
      JtagAPnDP(1);
      JTAGScanDR(JTAG_SCAN(BASE,READ));
      data = DPReadRDBUFF();
    }
  else
    {
      SWHeader( SW_HEADER(AP, READ, BASE) );
      SWDataRead();
      data =DPReadRDBUFF();
    }
  return data;
}


uint32_t DPReadHALTEV()
{
  uint32_t data;

  // HALTEV is in bank 4 (DPBANKSEL=4)
  DPWriteBANKSEL(0x4UL);

  if(DAPSTATUS.jtagnsw)
    {
      JtagAPnDP(0);
      JTAGScanDR(JTAG_SCAN(HALTEV,READ));
      data = DPReadRDBUFF();
    }
  else
    {
      SWHeader( SW_HEADER(DP, READ, HALTEV));
      data = SWDataRead();
    }

  // Switch DPBANKSEL back to 0
  DPWriteBANKSEL(0x0UL);

  return data;
}


void DPClearSTICKYERR()
{
  //
  // Clear STICKYERR bit
  //
  uint32_t ctrlstat;

  if(DAPSTATUS.jtagnsw)
    {
      // write 1 to STICKYERR to clear it, also keep power-up requests high
#ifdef CORTEX_M0PLUS
      ctrlstat = (1UL << 5) | (5UL << 28);
#else
      ctrlstat = (1UL << 5);
#endif
      JtagAPnDP(0);
      JTAGScanDR( (((uint64_t) ctrlstat) << 3) |  JTAG_SCAN(CTRLSTAT,WRITE)  );
    }
  else
    {
      SWHeader( SW_HEADER(DP, WRITE, ABORT) );
#ifdef CORTEX_M0PLUS
      SWDataWrite( 1UL << 2 );
#else
      SWDataWrite( 1UL << 5 );
#endif
    }
}


uint32_t CheckDAPSTATUS()
{
  //
  // Check for any debugger errors and return FAIL if any
  //

  // For JTAG, check CTRLSTAT for faults
  if(DAPSTATUS.jtagnsw)
    {
      if((DPReadCTRLSTAT() >> 5) & 1UL)
        DAPSTATUS.error++;
    }

  if(DAPSTATUS.error != 0)
    {
      DBG_MSG(("Errors found in Debugger accesses -\tFAIL\n"));
      return TEST_FAIL;
    }

  return TEST_PASS;
}


void pulse_clock(uint8_t number_of_clock_ticks)
{
  uint8_t count;

  for(count = number_of_clock_ticks; count > 0; count--)
    {
      // Pulse clock pin
      GPIO0->LB_MASKED[DD_DBG_SWCLKTCK] = DD_DBG_SWCLKTCK;
      GPIO0->LB_MASKED[DD_DBG_SWCLKTCK] = 0;
    }
}

////////////////////////////////////////////////////////////////////////////////
//
// JTAG Routines
//
////////////////////////////////////////////////////////////////////////////////

uint64_t JTAGScanIDCODE()
{
  // Read the TAP ID code

  uint64_t tmp;

  JTAGScanIR(JTAG_IDCODE);

  // RTI->SDR
  // 001
  JTAGTransition(0x1, 3);

  // Shift
  tmp = JTAGShift(0, 32);

  // E1DR->RTI
  // 01
  JTAGTransition(0x1, 2);

  return tmp;
}


void JTAGScanIR(uint32_t instruction)
{
  //
  // Scan in the passed Instruction
  //

  // RTI->SIR
  // 0011
  JTAGTransition(0x3, 4);

  // Shift Instruction
  JTAGShift(instruction, 4);

  // E1IR->RTI
  // 01
  JTAGTransition(0x1, 2);
}


uint64_t JTAGScanDR(uint64_t data)
{
  //
  // Scan in/out values for the APACC/DPACC/ABORT Scan Chains
  //
  // Repeat scan chain for ack=WAIT
  uint64_t tmp;
  uint8_t ack;

  do
  {
    // RTI->SDR
    // 001
    JTAGTransition(0x1, 3);

    // Shift
    tmp = JTAGShift(data, 35);

    // E1DR->RTI
    // 01
    JTAGTransition(0x1, 2);

    ack = (uint8_t)tmp & 7UL;

    DAPSTATUS.ack = ack;

  } while (ack == JTAG_DP_ACK_WAIT);

  return tmp;
}


void JTAGTransition(uint32_t tms, uint8_t numbits)
{
  //
  // JTAGTransition causes us to ENTER a new TAP state
  //

  uint8_t i;

  for(i = numbits; i > 0; i--)
    {
      // Drive TMS
      if(tms & 0x1)
        {
          GPIO0->LB_MASKED[DD_DBG_TMS] = DD_DBG_TMS;
        }
      else
        {
          GPIO0->LB_MASKED[DD_DBG_TMS] = 0;
        }
      tms = (tms >> 1);

      pulse_clock(1);
    }
}


uint64_t JTAGShift(uint64_t data, uint8_t numbits)
{
  //
  // JTAGShift handles shifts into and out of the the SR
  //

  // Most of the shift state has TMS Low, however the final cycle
  // which exits from the Shift to Exit1 also clocks out the final bit

  // When we enter this function, JTAGTransition has already created the negedge,
  // so here we want to drive the output and sample the input.

  // On the final cycle, we'll drive TMS high to escape the SHIFT state


  uint8_t i;
  uint64_t captured_data = 0;

  // Shifts require TMS == 0
  GPIO0->LB_MASKED[DD_DBG_TMS] = 0;

  for(i = numbits; i > 0; i--)
    {
      // Posedge of clock enters the state
      //    GPIO0->DATA[DD_SWCLKTCK].BYTE[DD_DBG_BYTE] = DD_SWCLKTCK;

      // Drive signals to the DAP on negedge of clock
      // Also sample signals from the DAP after negedge of clock

      // Drive output
      if(data & 0x1)
        {
          // Set
          GPIO0->LB_MASKED[DD_DBG_TDI] = DD_DBG_TDI;
        }
      else
        {
          // Clear
          GPIO0->LB_MASKED[DD_DBG_TDI] = 0;
        }
      data = (data >> 1);


      // Capture Input
      captured_data = captured_data >> 1;

      if(GPIO0->LB_MASKED[DD_DBG_TDO])
        {
          // Set
           captured_data |= (0x1ull << 63);
        }


      // Final cycle - drive TMS high to escape to Exit1
      if(i == 1)
        {
          GPIO0->LB_MASKED[DD_DBG_TMS] = DD_DBG_TMS;
        }

      pulse_clock(1);

    }

  // fix up alignment of captured data before returning it
  captured_data = captured_data >> (64-numbits);

  return captured_data;

}


////////////////////////////////////////////////////////////////////////////////
//
// SerialWire routines
//
////////////////////////////////////////////////////////////////////////////////

uint32_t SWConnect()
{
  uint32_t tmp;

#ifdef SWJ_DEPRECATED_SWITCHING_SEQUENCE

  // Note: This sequence is deprecated if dormant mode is supported.
  // Switch from Jtag to SW (no effect if just SW present)

  SWLineReset(0);

  // : start
  // Switching sequence (lsb first) = 0xE79E;
  SerialWireClockOut(0xE79E,16);
  // Should now be waiting in sw state

#endif

#ifdef SWMD_TARGET_SELECTION
  // SWMD starts in dormant state so first exit dormant state
  SWExitDormantState();

  SWHeader( SW_HEADER(DP, WRITE, TARGETSEL));

  // Ack for TARGETSEL access is not driven, so set it explicitly
  DAPSTATUS.ack = SW_DP_ACK_OK;

  SWDataWrite( MCU_TARGETSEL_VALUE );

#endif

  // Attempt a SerialWire connection sequence
  SWLineReset(8);

  // Attempt an ID code read
  SWHeader( SW_HEADER(DP,READ,DPIDR) );
  tmp = SWDataRead();

  DBG_MSG(("SWConnect returned DPIDR: %x\n", tmp));

  return CheckDAPSTATUS();
}


void SWDataWrite(uint32_t data)
{
  //
  // Enter from SW header+Ack, we are not currently driving the line
  //

  uint32_t mask;
  uint32_t parity;

  // Send one turnaround cycle
  pulse_clock(1);

  // Only clock out bits if ACK was OK
  if(DAPSTATUS.ack == SW_DP_ACK_OK)
    {
      // Clock data out
      SerialWireClockOut(data,32);

      // Calculate data parity
      for(parity=0, mask=0x1; mask != 0; mask = mask << 1)
        {
          parity += (data & mask) ? 1 : 0;
        }

      // Clock parity out
      SerialWireClockOut(parity,1);
    }
}


uint32_t SWDataRead(void)
{
   uint32_t rdata;

  // Only clock in bits if ACK was OK
  if(DAPSTATUS.ack == SW_DP_ACK_OK)
    {
      // Reads do not need to flip the line at all.
      // Clock out 32 data bits, + parity, + turnaround

      // Clock in 32 bits of read data
      rdata = SerialWireClockIn(32);

      // Clock in (and ignore!) parity bit and turnround bit
      SerialWireClockIn(2);
    }
  else
    {
      // Clock in 1 cycle to put SW state in correct state
      pulse_clock(1);

      // return bogus value
      rdata = 0xDEADBEEFUL;
    }

  DBG_MSG(("SWDataRead() returned %x\n", rdata));

  return rdata;
}


uint32_t SWHeader(uint8_t header)
{
  // Clock out the (precalculated) SW header
  //
  // Always clock out 8 bits.
  // Drive ALL bits, including park (DE 618567)
  //

  uint32_t ack;

  do {
  // Clock out the header
  SerialWireClockOut(header, 8);

  // Clock in the first turnround bit and 3 ack bits
  ack = SerialWireClockIn(4);

  // LSB adjust Ack value and lose turnround bit
  ack = (ack >> (32 - 3)) & 0x7;

  if (ack == SW_DP_ACK_FAULT)
    DAPSTATUS.error++;

  // Insert turnaround bit if for WAITed ACK
  if (ack == SW_DP_ACK_WAIT)
      SerialWireClockOut(0UL,1);

    DAPSTATUS.ack = ack;

  } while (ack == SW_DP_ACK_WAIT);


  if (ack != SW_DP_ACK_OK)
    {
      DBG_MSG(("ERROR - Maybe unhandled SW-DP response "));
      switch(ack)
        {
        case SW_DP_ACK_WAIT:
          DBG_MSG(("WAIT\n"));
          break;
        case SW_DP_ACK_FAULT:
          DBG_MSG(("ERROR\n"));
          break;
        default:
          DBG_MSG(("Unknown, %x\n",ack));
          break;
        }
    }

  return ack;
}


void SerialWireClockOut (uint32_t data, uint32_t numbits)
{
  // Ensure we are going to drive the line
  GPIO0->LB_MASKED[DD_DBG_TMSEN] = DD_DBG_TMSEN;

  for(; numbits > 0; numbits--)
    {
      if(data & 0x1)
        {
          // Bit set
          GPIO0->LB_MASKED[DD_DBG_TMS] = DD_DBG_TMS;
        }
      else
        {
          // Bit clear
          GPIO0->LB_MASKED[DD_DBG_TMS] = 0;
        }

      pulse_clock(1);

      data = (data >> 1);
    }
}


uint32_t SerialWireClockIn (uint32_t numbits)
{
  uint32_t data = 0;

  // Don't drive the line while clocking data in
  GPIO0->LB_MASKED[DD_DBG_TMSEN] = 0;

  for(; numbits > 0; numbits--)
    {
      data = (data >> 1);

      if(GPIO0->LB_MASKED[DD_DBG_TMSIN])
        {
          data |= (0x1UL << 31);
        }

      pulse_clock(1);
    }

  return data;
}


void SWLineReset(uint8_t num_of_idle_cycles)
{
  // Ensure Clock is low
  GPIO0->LB_MASKED[DD_DBG_SWCLKTCK] = 0;

  // Set SWDO and SWDOEN
  GPIO0->LB_MASKED[(DD_DBG_TMS | DD_DBG_TMSEN)] = (DD_DBG_TMS | DD_DBG_TMSEN);

  pulse_clock(50);

  // Insert requested idle cycles
  GPIO0->LB_MASKED[DD_DBG_TMS] = 0;

  pulse_clock(num_of_idle_cycles);
}


void SWExitDormantState(void)
{
  // Leave Dormant state
  DBG_MSG(("Leaving Dormant State\n"));

  // 1. At least 8 SWCLKTCK cycles with SWDIOTMS high
  SerialWireClockOut(0xFFUL,8);

  // 2. 128-bit Selection Alert
  SerialWireClockOut(DS_to_SWD_0,32);
  SerialWireClockOut(DS_to_SWD_1,32);
  SerialWireClockOut(DS_to_SWD_2,32);
  SerialWireClockOut(DS_to_SWD_3,32);

  // 3. 4 SWCLKTCK cycles with SWDIOTMS low
  SerialWireClockOut(0UL,4);

  // 4. Activation Sequence
  SerialWireClockOut(SW_ACTV_CODE,8);

  // 5. Line Reset
  SWLineReset(2);
}

