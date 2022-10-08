
#include "ARMCM0.h"

#include "systick.h"
void delay_us(uint32_t i)
{
	int temp;
	SysTick->LOAD=25*i;	//设置重装数值, 25MHZ时   
	SysTick->CTRL=0X05;		 //使能，减到零是无动作，采用25M时钟源
	SysTick->VAL=0;		   	 //清零计数器
	do
	{
		temp=SysTick->CTRL;		   //读取当前倒计数值
	}
	while((temp&0x01)&&(!(temp&(1<<16))));	 //等待时间到达
	SysTick->CTRL=0;	//关闭计数器
	SysTick->VAL=0;		//清空计数器
}
void delay_ms(uint32_t i)
{
	int temp;
	SysTick->LOAD=25000*i;	  //设置重装数值, 25MHZ时  最大671ms
	SysTick->CTRL=0X05;		//使能，减到零是无动作，采用外部时钟源
	SysTick->VAL=0;			//清零计数器
	do
	{
		temp=SysTick->CTRL;	   //读取当前倒计数值
	}
	while((temp&0x01)&&(!(temp&(1<<16))));	//等待时间到达
	SysTick->CTRL=0;	//关闭计数器
	SysTick->VAL=0;		//清空计数器
}
