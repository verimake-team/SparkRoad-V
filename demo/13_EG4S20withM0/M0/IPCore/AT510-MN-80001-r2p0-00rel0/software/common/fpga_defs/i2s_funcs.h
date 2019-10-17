#include "CMSDK_CM4.h"
#include "v2mm1.h"

extern int i2s_config(V2MM1_I2S_TypeDef *pI2S,
   uint32_t tx_enable, uint32_t tx_int_enable, uint32_t tx_waterlevel, 
   uint32_t rx_enable, uint32_t rx_int_enable, uint32_t rx_waterlevel);
	       
extern int i2s_tx_fifo_empty(V2MM1_I2S_TypeDef * pI2S);
extern int i2s_tx_fifo_full(V2MM1_I2S_TypeDef * pI2S);
extern int i2s_rx_fifo_empty(V2MM1_I2S_TypeDef * pI2S);
extern int i2s_rx_fifo_full(V2MM1_I2S_TypeDef * pI2S);
extern int i2s_rx_irq_alert(V2MM1_I2S_TypeDef * pI2S);
extern int i2s_tx_irq_alert(V2MM1_I2S_TypeDef * pI2S);
extern int i2s_tx_stop(V2MM1_I2S_TypeDef * pI2S);
extern int i2s_rx_stop(V2MM1_I2S_TypeDef * pI2S);
// Return TX error status  
extern int i2s_get_tx_error(V2MM1_I2S_TypeDef * pI2S);
// Return RX error status  
extern int i2s_get_rx_error(V2MM1_I2S_TypeDef * pI2S);
// Clear TX error status  
extern void i2s_clear_tx_error(V2MM1_I2S_TypeDef * pI2S);
// Clear RX error status  
extern void i2s_clear_rx_error(V2MM1_I2S_TypeDef * pI2S);
extern void i2s_fifo_reset(V2MM1_I2S_TypeDef *pI2S);
extern void i2s_codec_reset(V2MM1_I2S_TypeDef *pI2S);
extern int i2s_speed_config(V2MM1_I2S_TypeDef *pI2S, uint32_t divide_ratio);
