
#include "ARMCM0.h"

#include "gpio.h"
#include "UART.h"

int main()
{
	bit_set(GPIO_DDR, GPIO_PIN_All,0x00);
	bit_set(GPIO_DDR, GPIO_PIN_All,0x00);

	while(1)
	{
		bit_set(GPIO_DDR, GPIO_PIN_0,0x00);
	  delay_us(100000);
		bit_set(GPIO_DDR, GPIO_PIN_0,0x01);
		delay_us(100000);

	}
	
}

