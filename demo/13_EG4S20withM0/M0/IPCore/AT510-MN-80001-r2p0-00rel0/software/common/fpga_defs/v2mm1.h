#ifndef __V2MM1_REGS_DEFS__
#define __V2MM1_REGS_DEFS__
/******************************************************************************/
/*                V2M-M1 Specific Peripheral registers structures             */
/******************************************************************************/

#if defined ( __CC_ARM   )
#pragma anon_unions
#endif

// <g> FPGAIO

typedef struct
{
  /*!< Offset: 0x000 LDE0 Register    (R/W) */
  __IO   uint32_t  LEDS;      // <h> LEDS </h>
                              //   <o.0> LED0
                              //     <0=> LED0 off
                              //     <1=> LED0 on
                              //   <o.1> LED1
                              //     <0=> LED1 off
                              //     <1=> LED1 on
  __IO   uint32_t  MCULEDS;   // <h> MCULEDS </h>
                              //   <o.0> LED0
                              //     <0=> LED0 off
                              //     <1=> LED0 on
                              //   <o.1> LED1
                              //     <0=> LED1 off
                              //     <1=> LED1 on
                              //   <o.2> LED2
                              //     <0=> LED2 off
                              //     <1=> LED2 on
                              //   <o.3> LED3
                              //     <0=> LED3 off
                              //     <1=> LED3 on
                              //   <o.4> LED4
                              //     <0=> LED4 off
                              //     <1=> LED4 on
                              //   <o.5> LED5
                              //     <0=> LED5 off
                              //     <1=> LED5 on
                              //   <o.6> LED6
                              //     <0=> LED6 off
                              //     <1=> LED6 on
                              //   <o.7> LED7
                              //     <0=> LED7 off
                              //     <1=> LED7 on
  __I    uint32_t  BUTTONS;   // <h> BUTTONS </h>
                              //   <o.0> BUTTON0
                              //     <0=> off
                              //     <1=> on
                              //   <o.1> BUTTON1
                              //     <0=> off
                              //     <1=> on
  __I    uint32_t  SWITCHES;  // <h> SWITCHES </h>
                              //   <o.0> Switch0
                              //     <0=> off
                              //     <1=> on
                              //   <o.1> Switch1
                              //     <0=> off
                              //     <1=> on
                              //   <o.2> Switch2
                              //     <0=> off
                              //     <1=> on
                              //   <o.3> Switch3
                              //     <0=> off
                              //     <1=> on
                              //   <o.4> Switch4
                              //     <0=> off
                              //     <1=> on
                              //   <o.5> Switch5
                              //     <0=> off
                              //     <1=> on
                              //   <o.6> Switch6
                              //     <0=> off
                              //     <1=> on
                              //   <o.7> Switch7
                              //     <0=> off
                              //     <1=> on
  __IO   uint32_t  COUNT1HZ;  // <h> 1Hz up counter </h>
  __IO   uint32_t  CNT100HZ;  // <h> 100Hz up counter </h>
  __IO   uint32_t  COUNTCYC;  // <h> Cycle counter </h>
  __IO   uint32_t  PRESCALE;  // <h> Reload value for prescale counter</h>
  __IO   uint32_t  PSCNTR;    // <h> Prescale counter for cycle counter</h>
         uint32_t  RESERVED1[10];
  __IO   uint32_t  MISC;      // <h> Misc controls </h>
                              //   <o.0> CLCD_CS
                              //     <0=> off
                              //     <1=> on
                              //   <o.1> SPI_nSS
                              //     <0=> off
                              //     <1=> on
                              //   <o.2> CLCD_T_CS
                              //     <0=> off
                              //     <1=> on
                              //   <o.3> CLCD_RESET
                              //     <0=> off
                              //     <1=> on
                              //   <o.4> CLCD_RS
                              //     <0=> off
                              //     <1=> on
                              //   <o.5> CLCD_RD
                              //     <0=> off
                              //     <1=> on
                              //   <o.6> CLCD_BL_CTRL
                              //     <0=> off
                              //     <1=> on
  
} V2MM1_FPGASYS_TypeDef;

// </g> 

// <g> Audio (I2S)

typedef struct
{
  /*!< Offset: 0x000 CONTROL Register    (R/W) */
  __IO   uint32_t  CONTROL; // <h> CONTROL </h>
                              //   <o.0> TX Enable
                              //     <0=> TX disabled
                              //     <1=> TX enabled
                              //   <o.1> TX IRQ Enable
                              //     <0=> TX IRQ disabled
                              //     <1=> TX IRQ enabled
                              //   <o.2> RX Enable
                              //     <0=> RX disabled
                              //     <1=> RX enabled
                              //   <o.3> RX IRQ Enable
                              //     <0=> RX IRQ disabled
                              //     <1=> RX IRQ enabled
                              //   <o.10..8> TX Buffer Water Level
                              //     <0=> / IRQ triggers when any space available
                              //     <1=> / IRQ triggers when more than 1 space available
                              //     <2=> / IRQ triggers when more than 2 space available
                              //     <3=> / IRQ triggers when more than 3 space available
                              //     <4=> Undefined!
                              //     <5=> Undefined!
                              //     <6=> Undefined!
                              //     <7=> Undefined!  
                              //   <o.14..12> RX Buffer Water Level
                              //     <0=> Undefined!
                              //     <1=> / IRQ triggers when less than 1 space available
                              //     <2=> / IRQ triggers when less than 2 space available
                              //     <3=> / IRQ triggers when less than 3 space available
                              //     <4=> / IRQ triggers when less than 4 space available
                              //     <5=> Undefined!
                              //     <6=> Undefined!
                              //     <7=> Undefined!  
                              //   <o.16> FIFO reset
                              //     <0=> Normal operation
                              //     <1=> FIFO reset
                              //   <o.17> Audio Codec reset
                              //     <0=> Normal operation
                              //     <1=> Assert audio Codec reset
  /*!< Offset: 0x004 STATUS Register     (R/ ) */
  __I    uint32_t  STATUS;  // <h> STATUS </h> 
                              //   <o.0> TX Buffer alert
                              //     <0=> TX buffer don't need service yet
                              //     <1=> TX buffer need service
                              //   <o.1> RX Buffer alert
                              //     <0=> RX buffer don't need service yet 
                              //     <1=> RX buffer need service
                              //   <o.2> TX Buffer Empty
                              //     <0=> TX buffer have data
                              //     <1=> TX buffer empty
                              //   <o.3> TX Buffer Full
                              //     <0=> TX buffer not full
                              //     <1=> TX buffer full
                              //   <o.4> RX Buffer Empty
                              //     <0=> RX buffer have data
                              //     <1=> RX buffer empty
                              //   <o.5> RX Buffer Full
                              //     <0=> RX buffer not full
                              //     <1=> RX buffer full
  union {
   /*!< Offset: 0x008 Error Status Register (R/ ) */  
    __I    uint32_t  ERROR;  // <h> ERROR </h> 
                              //   <o.0> TX error
                              //     <0=> Okay
                              //     <1=> TX overrun/underrun
                              //   <o.1> RX error
                              //     <0=> Okay 
                              //     <1=> RX overrun/underrun
   /*!< Offset: 0x008 Error Clear Register  ( /W) */    
    __O    uint32_t  ERRORCLR;  // <h> ERRORCLR </h> 
                              //   <o.0> TX error
                              //     <0=> Okay
                              //     <1=> Clear TX error
                              //   <o.1> RX error
                              //     <0=> Okay 
                              //     <1=> Clear RX error
    };
   /*!< Offset: 0x00C Divide ratio Register (R/W) */  
  __IO   uint32_t  DIVIDE;  // <h> Divide ratio for Left/Right clock </h> 
                              //   <o.9..0> TX error (default 0x80)			      
   /*!< Offset: 0x010 Transmit Buffer       ( /W) */
  __O    uint32_t  TXBUF;  // <h> Transmit buffer </h> 
                              //   <o.15..0> Right channel			      
                              //   <o.31..16> Left channel
   /*!< Offset: 0x014 Receive Buffer        (R/ ) */
  __I    uint32_t  RXBUF;  // <h> Receive buffer </h> 
                              //   <o.15..0> Right channel			      
                              //   <o.31..16> Left channel
         uint32_t  RESERVED1[186];
  __IO uint32_t ITCR;         // <h> Integration Test Control Register </h>
                              //   <o.0> ITEN
                              //     <0=> Normal operation
                              //     <1=> Integration Test mode enable
  __O  uint32_t ITIP1;        // <h> Integration Test Input Register 1</h>
                              //   <o.0> SDIN
  __O  uint32_t ITOP1;        // <h> Integration Test Output Register 1</h>
                              //   <o.0> SDOUT
                              //   <o.1> SCLK
                              //   <o.2> LRCK
                              //   <o.3> IRQOUT
} V2MM1_I2S_TypeDef;

#define I2S_CONTROL_TXEN_Pos        0
#define I2S_CONTROL_TXEN_Msk        (1UL<<I2S_CONTROL_TXEN_Pos)

#define I2S_CONTROL_TXIRQEN_Pos     1
#define I2S_CONTROL_TXIRQEN_Msk     (1UL<<I2S_CONTROL_TXIRQEN_Pos)

#define I2S_CONTROL_RXEN_Pos        2
#define I2S_CONTROL_RXEN_Msk        (1UL<<I2S_CONTROL_RXEN_Pos)

#define I2S_CONTROL_RXIRQEN_Pos     3
#define I2S_CONTROL_RXIRQEN_Msk     (1UL<<I2S_CONTROL_RXIRQEN_Pos)

#define I2S_CONTROL_TXWLVL_Pos      8
#define I2S_CONTROL_TXWLVL_Msk      (7UL<<I2S_CONTROL_TXWLVL_Pos)

#define I2S_CONTROL_RXWLVL_Pos      12
#define I2S_CONTROL_RXWLVL_Msk      (7UL<<I2S_CONTROL_RXWLVL_Pos)
/* FIFO reset*/
#define I2S_CONTROL_FIFORST_Pos     1
#define I2S_CONTROL_FIFORST_Msk     (1UL<<I2S_CONTROL_FIFORST_Pos)
/* Codec reset*/
#define I2S_CONTROL_CODECRST_Pos    1
#define I2S_CONTROL_CODECRST_Msk    (1UL<<I2S_CONTROL_CODECRST_Pos)

#define I2S_STATUS_TXIRQ_Pos        0
#define I2S_STATUS_TXIRQ_Msk        (1UL<<I2S_STATUS_TXIRQ_Pos)

#define I2S_STATUS_RXIRQ_Pos        1
#define I2S_STATUS_RXIRQ_Msk        (1UL<<I2S_STATUS_RXIRQ_Pos)

#define I2S_STATUS_TXEmpty_Pos      2
#define I2S_STATUS_TXEmpty_Msk      (1UL<<I2S_STATUS_TXEmpty_Pos)

#define I2S_STATUS_TXFull_Pos       3
#define I2S_STATUS_TXFull_Msk       (1UL<<I2S_STATUS_TXFull_Pos)

#define I2S_STATUS_RXEmpty_Pos      4
#define I2S_STATUS_RXEmpty_Msk      (1UL<<I2S_STATUS_RXEmpty_Pos)

#define I2S_STATUS_RXFull_Pos       5
#define I2S_STATUS_RXFull_Msk       (1UL<<I2S_STATUS_RXFull_Pos)

#define I2S_ERROR_TXERR_Pos         0
#define I2S_ERROR_TXERR_Msk         (1UL<<I2S_ERROR_TXERR_Pos)

#define I2S_ERROR_RXERR_Pos         1
#define I2S_ERROR_RXERR_Msk         (1UL<<I2S_ERROR_RXERR_Pos)

// </g>
#define CMSDK_GPIO2_BASE (CMSDK_AHB_BASE + 0x2000UL)
#define CMSDK_GPIO3_BASE (CMSDK_AHB_BASE + 0x3000UL)

#define I2S         ((V2MM1_I2S_TypeDef     *) 0x40024000 )
#define FPGASYS     ((V2MM1_FPGASYS_TypeDef *) 0x40028000 )
#define CMSDK_GPIO2 ((CMSDK_GPIO_TypeDef    *) CMSDK_GPIO2_BASE )
#define CMSDK_GPIO3 ((CMSDK_GPIO_TypeDef    *) CMSDK_GPIO3_BASE )
#endif

