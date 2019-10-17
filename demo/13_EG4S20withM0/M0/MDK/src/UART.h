#ifndef __UART_H
#define __UART_H


#include <stdint.h>                      /* standard types definitions                      */
#include "DE10.h"
#include <string.h>
#include <stdio.h>




#define UART0_BASE     (APBPERIPH_BASE + 0x4000)
#define UART1_BASE     (APBPERIPH_BASE + 0x5000)
#define UART2_BASE     (APBPERIPH_BASE + 0x6000)
//-------------------------------------
// Programmer's model
// 0x00 R     RXD[7:0]    Received Data
//      W     TXD[7:0]    Transmit data
// 0x04 RW    STAT[3:0]
//              [3] RX buffer overrun (write 1 to clear)
//              [2] TX buffer overrun (write 1 to clear)
//              [1] RX buffer full (Read only)
//              [0] TX buffer full (Read only)
// 0x08 RW    CTRL[3:0]   TxIntEn, RxIntEn, TxEn, RxEn
//              [6] High speed test mode Enable
//              [5] RX overrun interrupt enable
//              [4] TX overrun interrupt enable
//              [3] RX Interrupt Enable
//              [2] TX Interrupt Enable
//              [1] RX Enable
//              [0] TX Enable
// 0x0C R/Wc  intr_status/INTCLEAR
//              [3] RX overrun interrupt
//              [2] TX overrun interrupt
//              [1] RX interrupt
//              [0] TX interrupt
// 0x10 RW    BAUDDIV[19:0] Baud divider
//            (minimum value is 16)
// 0x3E0 - 0x3FC  ID registers
//-------------------------------------
//#define UART0_THR    		*(volatile unsigned *)(UART0_BASE+0x00)
//#define UART0_RBR    		*(volatile unsigned *)(UART0_BASE+0x00)
//#define UART0_STAT   		*(volatile unsigned *)(UART0_BASE+0x04)
//#define UART0_CTRL    	*(volatile unsigned *)(UART0_BASE+0x08)
//#define UART0_INTR    	*(volatile unsigned *)(UART0_BASE+0x0C)
//#define UART0_BAUDDDIV  *(volatile unsigned *)(UART0_BASE+0x10)

#ifdef __cplusplus
  #define   __I     volatile             /*!< Defines 'read only' permissions                 */
#else
  #define   __I     volatile const       /*!< Defines 'read only' permissions                 */
#endif
#define     __O     volatile             /*!< Defines 'write only' permissions                */
#define     __IO    volatile             /*!< Defines 'read / write' permissions              */

typedef struct
{
  __IO   uint32_t  DATA;          /*!< Offset: 0x000 Data Register    (R/W) */
  __IO   uint32_t  STATE;         /*!< Offset: 0x004 Status Register  (R/W) */
  __IO   uint32_t  CTRL;          /*!< Offset: 0x008 Control Register (R/W) */
  union {
    __I    uint32_t  INTSTATUS;   /*!< Offset: 0x00C Interrupt Status Register (R/ ) */
    __O    uint32_t  INTCLEAR;    /*!< Offset: 0x00C Interrupt Clear Register ( /W) */
    };
  __IO   uint32_t  BAUDDIV;       /*!< Offset: 0x010 Baudrate Divider Register (R/W) */

} UART_TypeDef;

#define UART0							((volatile UART_TypeDef   *) UART0_BASE   )
#define UART1							((volatile UART_TypeDef   *) UART1_BASE   )
#define UART2							((volatile UART_TypeDef   *) UART2_BASE   )
	

void uart0init(void);
void uart1init(void);
void uart2init(void);

unsigned char Uart0Putc(unsigned char my_ch);
unsigned char Uart0Getc(void);
unsigned int  Uart0GetLine(char *s);


unsigned char Uart1Putc(unsigned char my_ch);
unsigned char Uart1Getc(void);
unsigned char * Uart1GetLine(char *s);

unsigned char Uart2Putc(unsigned char my_ch);
unsigned char Uart2Getc(void);
unsigned char * Uart2GetLine(char *s);

float mstrtof(char *num); 

double toDouble(char num[]);

#endif


