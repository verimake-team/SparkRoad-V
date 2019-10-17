
#include "ARMCM0.h"
#include "gpio.h"


void gpioint()
{
	bit_set(GPIO_DDR, GPIO_PIN_All,0x00);
	bit_set(GPIO_DDR, GPIO_PIN_6,0x01);
	bit_set(GPIO_DR, GPIO_PIN_6,0x00);
}


void bit_set(unsigned int* GPIO_X, uint8_t GPIO_PIN, uint8_t flag)
{

	if(GPIO_PIN == 0Xff)
	{
		*GPIO_X = flag; 
	}
	else
	{
		if(flag==0x01)
		{
			*GPIO_X=*GPIO_X|GPIO_PIN;

		}
		if(flag==0x00)
		{
			GPIO_PIN=~GPIO_PIN;
			*GPIO_X=*GPIO_X&GPIO_PIN;
		}
  }
	
}

uint8_t bit_read(unsigned int* GPIO_X,uint8_t GPIO_PIN)
{
	uint8_t bitmask;
	uint8_t bitdata = 0xff;
	bitmask = *GPIO_X & GPIO_PIN;
	if(!bitmask)
	{
		bitdata = 0;
	}
	else
	{
		bitdata = 1;
	}
	return bitdata;
	
}



	void IIC_Start(void)
{
	SDA_OUT;
	IIC_SDAH;	  	  
	IIC_SCLH;
	delay_us(1);
 	IIC_SDAL;		//START:when CLK is high,DATA change form high to low 
	delay_us(1);
	IIC_SCLL;		//hold IIC bus, prepare to send data
}	  

void IIC_Stop(void)
{
	SDA_OUT;
	IIC_SCLL;
	IIC_SDAL;			//STOP:when CLK is high DATA change form low to high
 	delay_us(1);
	IIC_SCLH; 
	IIC_SDAH;			
	delay_us(1);							   	
}

uint8_t IIC_Wait_Ack(void)
{
	uint8_t ucErrTime=0;
	IIC_SCLL;
	delay_us(1);	 
	IIC_SDAH;
	delay_us(1);
	SDA_IN;
	IIC_SCLH;
	delay_us(1);	 
	while(READ_SDA)
	{
		ucErrTime++;
		if(ucErrTime>250)
		{
			IIC_Stop();
			return 1;
		}
	}
	IIC_SCLL;
	return 0;  
} 

void IIC_Send_Byte(uint8_t txd)
{                        
    uint8_t t;   
		SDA_OUT;
    IIC_SCLL;				//hold clk to low
	for(t=0;t<8;t++)
    {              
      if((txd&0x80)>>7 == 0x01)
			{
				IIC_SDAH;
			}
			else if((txd&0x80)>>7 == 0x00)
			{
				IIC_SDAL;
			}

        txd<<=1; 	  
				delay_us(1);   
				IIC_SCLH;
			  delay_us(1); 
				IIC_SCLL;	
				delay_us(1);
    }
//	iic_send_test(txd);
		IIC_SCLH;
		IIC_SCLL;	

//		IIC_Wait_Ack();
} 	    

