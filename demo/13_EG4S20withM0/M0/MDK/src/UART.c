
#include "ARMCM0.h"

#include "UART.h"
#include "math.h"

//#define UART_REC_LEN  30;
//uint32_t Uart_Rx_Sta = 0;


//void  Uart_receiveData()
//{
//	
//}

//void Uart_RX()
//{
//	uint16_t res;
//	
//	if(flag )
//	{
//		res = Uart_receiveData();
//		
//		if((Uart_Rx_Sta & 0x8000) == 0){		//接受未完成
//			if(Uart_Rx_Sta & 0x4000){		//接受到0x0d
//				if(res != 0x0a)
//					Uart_Rx_Sta = 0;				//接受错误，重新开始
//				else
//					Uart_Rx_Sta |= 0x8000;	//接受完成
//			}
//			else{
//				if(res == 0x0d)
//					Uart_Rx_Sta |= 0x4000;
//				else{
//					Rx_Buf[Uart_Rx_Sta & 0x3fff] = res;
//					Uart_Rx_Sta ++;
//					if(Uart_Rx_Sta > (UART_REC_LEN - 1))
//						Uart_Rx_Sta = 0;
//				}
//			}
//		}
//	}
//	
//}

//len = (Uart_Rx_Sta & 0x3fff)

//for(u16 t = 0; t < len; t ++){
//	 string[t];
//}
//Uart_Rx_sta = 0;



// Output a character
	unsigned char Uart1Putc(unsigned char my_ch)
{
  while ((UART1->STATE & 1)); // Wait if Transmit Holding register is full
  UART1->DATA = my_ch;	// write to transmit holding register

	return (my_ch);
}

//uart1 init
void uart1init(void)
{
//	UART1->BAUDDIV = 0x16;	//only for test
	UART1->BAUDDIV = 0x0a2c;
	UART1->CTRL = 0x03;	//r&x
}



// Get a character
unsigned char Uart1Getc(void)
{
  unsigned char my_ch;

  while ((UART1->STATE & 2)!=2); // Wait if Receive Holding register is empty


  my_ch = UART1->DATA;
//	UART1->STATE & 0x8;

  //Convert CR to LF
  if(my_ch == '\r')
     my_ch = '\n';

  return (my_ch);
}

unsigned char* Uart1GetLine(char *s)
{
	char ctemp, string[30] = {0};
	int flag = 1;
	unsigned char cnt = 0;
	while(flag)
	{
	ctemp = Uart1Getc();
	if (ctemp == '\n'){
		string[cnt] = ctemp;
		flag = 0;
		continue;
	}
	else {
		string[cnt] = ctemp;
		cnt++;
		}
	
	}
	
	
	
//	char str[30];
//	memcpy(str,string, 30);
	strcpy(s,string);
	return cnt;
}


//// Get line from terminal
//unsigned int Get1Line (char *lp, unsigned int len)
//{
//   unsigned int cnt = 0;
//   char c;

//    do {
//        c = Uart1Getc ();
//        switch (c) {
//            case CNTLQ:                       /* ignore Control S/Q             */
//            case CNTLS:
//                break;
//            case BACKSPACE:
//            case DEL:
//                if (cnt == 0) {
//                    break;
//                }
//                cnt--;                         /* decrement count                */
//                lp--;                          /* and line pointer               */
//                UartPutc (0x08);               /* echo backspace                 */
//                UartPutc (' ');
//                UartPutc (0x08);
//                fflush (stdout);
//                break;
//            case ESC:
//            case 0:
//                *lp = 0;                       /* ESC - stop editing line        */
//                return (FALSE);
//            case CR:                           /* CR - done, stop editing line   */
//                *lp = c;
//                lp++;                          /* increment line pointer         */
//                cnt++;                         /* and count                      */
//                c = LF;
//            default:
//                UartPutc (*lp = c);            /* echo and store character       */
//                fflush (stdout);
//                lp++;                          /* increment line pointer         */
//                cnt++;                         /* and count                      */
//                break;
//        }
//    } while (cnt < len - 2  &&  c != LF);      /* check limit and CR             */
//    *lp = 0;                                   /* mark end of string             */
//    return (TRUE);
//}

// Output a character

	unsigned char Uart2Putc(unsigned char my_ch)
{
  while ((UART2->STATE & 1)); // Wait if Transmit Holding register is full
  UART2->DATA = my_ch; // write to transmit holding register
  return my_ch;
}

//uart1 init
void uart2init(void)
{
//	UART2->BAUDDIV = 0x16;	//only for test
	UART2->BAUDDIV = 0x0a2c;
	UART2->CTRL = 0x03;	//r&x
}



// Get a character
unsigned char Uart2Getc(void)
{
  unsigned char my_ch;

  while ((UART2->STATE & 2)!=2); // Wait if Receive Holding register is empty


  my_ch = UART2->DATA;

  //Convert CR to LF
  if(my_ch == '\r')
     my_ch = '\n';

  return (my_ch);
}


unsigned char * Uart2GetLine(char *s)
{
	char ctemp, string[30]={0};
	int cnt = 0, flag = 1;
	while(flag)
	{
	ctemp = Uart2Getc();
	if (ctemp == '\n'){
		string[cnt] = ctemp;
		flag = 0;
		continue;
	}
	else {
		string[cnt] = ctemp;
		cnt++;
		}
	}
	strcpy(s,string);
	return cnt;
}









// Output a character

	unsigned char Uart0Putc(unsigned char my_ch)
{
  while ((UART0->STATE & 1)); // Wait if Transmit Holding register is full
  UART0->DATA = my_ch; // write to transmit holding register
  return (my_ch);
}

//uart1 init
void uart0init(void)
{
//	UART2->BAUDDIV = 0x16;	//only for test
	UART0->BAUDDIV = 0x0a2c;
	UART0->CTRL = 0x03;	//r&x
}



// Get a character
unsigned char Uart0Getc(void)
{
  unsigned char my_ch;

  while ((UART0->STATE & 2)!=2); // Wait if Receive Holding register is empty


  my_ch = UART0->DATA;

  //Convert CR to LF
  if(my_ch == '\r')
     my_ch = '\n';

  return (my_ch);
}

unsigned int Uart0GetLine(char *s)
{
	char ctemp, string[30]={0};
	int cnt = 0, flag = 1;
	while(flag)
	{
	ctemp = Uart0Getc();
	if (ctemp == '\n'){
		string[cnt] = '\0';
		cnt++;
		flag = 0;
		continue;
	}
	else {
		string[cnt] = ctemp;
		cnt++;
		}
	}
	strcpy(s,string);
	return cnt;
}

float mstrtof(char *num){  
          
    double n = 0, sign = 1, scale = 0;  
    int subscale = 0, signsubscale = 1;  
  
    if (*num == '-') {  
        sign = -1, num++;   /* Has sign? */  
    }  
  
    while (*num == '0') {  
        num++;  
    }  
  
    if (*num >= '1' && *num <= '9')   {  
        do {  
            n = (n * 10.0) + (*num++ - '0');      
        } while (*num >= '0' && *num <= '9'); /* Number? */  
    }  
  
    if (*num == '.' && num[1] >= '0' && num[1] <= '9') {  
        num++;        
        do {      
            n = (n * 10.0) + (*num++ -'0'), scale--;   
        } while (*num >= '0' && *num <= '9');  
    }   /* Fractional part? */  
  
    if (*num == 'e' || *num == 'E') {   /* Exponent? */  
        num++;  
        if (*num == '+') {  
            num++;    
        } else if (*num == '-') {   
            signsubscale = -1, num++;       /* With sign? */  
        }  
  
        while (*num >= '0' && *num <= '9' ) {   
            subscale = (subscale * 10) + (*num++ - '0');    /* Number? */  
        }  
    }  
  
    n = sign * n * pow(10.0, (scale + subscale * signsubscale));    /* number = +/- number.fraction * 10^ +/- exponent */  
      
    return n;  
} 


double toDouble(char num[]) {
    int i = 0,base;
    double dnum1 = 0,dnum2 = 0;
    while(num[i] && num[i] != '.') {
        dnum1 = 10 * dnum1 + num[i] - '0';
        ++i;
    }
    if(num[i] == '.') {
        ++i; 
        base = 1;
        while(num[i] != '\0') {
            dnum2 = 10 * dnum2 + num[i] - '0';
            base *= 10;
            ++i;
        }
        dnum2 /= base;
    }
    return dnum1 + dnum2;
}
