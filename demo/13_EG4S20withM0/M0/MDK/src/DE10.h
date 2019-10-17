#ifndef __DE10_H
#define __DE10_H

#include <stdint.h>
#include <stdio.h>
#include "core_cm0.h"


#define APBPERIPH_BASE	((unsigned int)0x40000000)

#define GPIO_BASE	(APBPERIPH_BASE+0x0000)



#define GPIO_DR		(unsigned int*)(GPIO_BASE+0x00) //out data register
#define GPIO_DDR	(unsigned int*)(GPIO_BASE+0x04) //direction data register
#define GPIO_CTL	(unsigned int*)(GPIO_BASE+0x08)
#define GPIO_INTEN	(unsigned int*)(GPIO_BASE+0x30)
#define GPIO_INTMASK	(unsigned int*)(GPIO_BASE+0x34)
#define GPIO_INTTYPE	(unsigned int*)(GPIO_BASE+0x38)
#define GPIO_INTPOL	(unsigned int*)(GPIO_BASE+0x3C)
#define GPIO_INTSTA	(unsigned int*)(GPIO_BASE+0x40)
#define GPIO_INTRAW	(unsigned int*)(GPIO_BASE+0x44)
#define GPIO_EOI	(unsigned int*)(GPIO_BASE+0x4C) //interrupt clear
#define GPIO_EXT	(unsigned int*)(GPIO_BASE+0x50) //pod data register
#define GPIO_SYNC	(unsigned int*)(GPIO_BASE+0x60) //level sensitive interrupt synchronization register

#endif
