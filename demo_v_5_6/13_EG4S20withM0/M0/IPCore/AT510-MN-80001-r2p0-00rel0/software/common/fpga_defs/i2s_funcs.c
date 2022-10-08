#include "CMSDK_CM4.h"
#include "v2mm1.h"

int i2s_config(V2MM1_I2S_TypeDef *pI2S,
               uint32_t tx_enable, uint32_t tx_int_enable, uint32_t tx_waterlevel, 
               uint32_t rx_enable, uint32_t rx_int_enable, uint32_t rx_waterlevel)
{
  uint32_t i2s_control_val;
  // TX water level range from 3 to 0
  // Generate IRQ if TX Fifo space > TX water level
  if (tx_waterlevel > 3) return 1; // Error if out of range
  // RX water level range from 4 to 1
  // Generate IRQ if RX Fifo space < RX water level
  if ((rx_waterlevel > 4)||(rx_waterlevel == 0)) return 1; // Error if out of range
  
  i2s_control_val  = (rx_waterlevel << I2S_CONTROL_RXWLVL_Pos) | 
                     (tx_waterlevel << I2S_CONTROL_TXWLVL_Pos) |
              (rx_int_enable & 0x1) << I2S_CONTROL_RXIRQEN_Pos |
                  (rx_enable & 0x1) << I2S_CONTROL_RXEN_Pos    |
              (tx_int_enable & 0x1) << I2S_CONTROL_TXIRQEN_Pos |
                  (tx_enable & 0x1) << I2S_CONTROL_TXEN_Pos;

  pI2S->CONTROL  = i2s_control_val;
  return 0;
}

int i2s_tx_fifo_empty(V2MM1_I2S_TypeDef *pI2S){
  return (pI2S->STATUS & I2S_STATUS_TXEmpty_Msk) >> I2S_STATUS_TXEmpty_Pos;
  }  
int i2s_tx_fifo_full(V2MM1_I2S_TypeDef *pI2S){
  return (pI2S->STATUS & I2S_STATUS_TXFull_Msk)  >> I2S_STATUS_TXFull_Pos;
  }  
int i2s_rx_fifo_empty(V2MM1_I2S_TypeDef *pI2S){
  return (pI2S->STATUS & I2S_STATUS_RXEmpty_Msk) >> I2S_STATUS_RXEmpty_Pos;
  }  
int i2s_rx_fifo_full(V2MM1_I2S_TypeDef *pI2S){
  return (pI2S->STATUS & I2S_STATUS_RXFull_Msk)  >> I2S_STATUS_RXFull_Pos;
  }  
int i2s_rx_irq_alert(V2MM1_I2S_TypeDef *pI2S){
  return (pI2S->STATUS & I2S_STATUS_RXIRQ_Msk)  >> I2S_STATUS_RXIRQ_Pos;
  }  
int i2s_tx_irq_alert(V2MM1_I2S_TypeDef *pI2S){
  return (pI2S->STATUS & I2S_STATUS_TXIRQ_Msk)  >> I2S_STATUS_TXIRQ_Pos;
  }  
int i2s_tx_stop(V2MM1_I2S_TypeDef *pI2S){
  pI2S->CONTROL &= ~I2S_CONTROL_TXEN_Msk;
  return 0;
  }
int i2s_rx_stop(V2MM1_I2S_TypeDef *pI2S){
  pI2S->CONTROL &= ~I2S_CONTROL_RXEN_Msk;
  return 0;
  }
// Return TX error status  
int i2s_get_tx_error(V2MM1_I2S_TypeDef *pI2S){
  return ((pI2S->ERROR & I2S_ERROR_TXERR_Msk) >> I2S_ERROR_TXERR_Pos);
  }  

// Return RX error status  
int i2s_get_rx_error(V2MM1_I2S_TypeDef *pI2S){
  return ((pI2S->ERROR & I2S_ERROR_RXERR_Msk) >> I2S_ERROR_RXERR_Pos);
  }  
  
// Clear TX error status  
void i2s_clear_tx_error(V2MM1_I2S_TypeDef *pI2S){
  pI2S->ERRORCLR = I2S_ERROR_TXERR_Msk;
  return;
  }  

// Clear RX error status  
void i2s_clear_rx_error(V2MM1_I2S_TypeDef *pI2S){
  pI2S->ERRORCLR = I2S_ERROR_RXERR_Msk;
  return;;
  }  
  
void i2s_fifo_reset(V2MM1_I2S_TypeDef *pI2S){
  pI2S->CONTROL |= I2S_CONTROL_FIFORST_Msk;
  pI2S->CONTROL &= ~I2S_CONTROL_FIFORST_Msk;
  return;
  }
  
void i2s_codec_reset(V2MM1_I2S_TypeDef *pI2S){
  int i;
  pI2S->CONTROL |= I2S_CONTROL_CODECRST_Msk;
  for (i=0;i<6;i++) { // delay loop
    __NOP();
    }
  pI2S->CONTROL &= ~I2S_CONTROL_CODECRST_Msk;
  return;
  }
int i2s_speed_config(V2MM1_I2S_TypeDef *pI2S, uint32_t divide_ratio){
  if (divide_ratio < 18) return 1; // Error: Divide ratio too small to send all bits
  if (divide_ratio > 0x3FF) return 1; // Error: Divide ratio too large (only 10 bits)
  
  pI2S->DIVIDE = divide_ratio;
  return 0;
  }
