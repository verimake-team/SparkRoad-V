## Generated SDC file "CM0DAP.out.sdc"

## Copyright (C) 2016  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel MegaCore Function License Agreement, or other 
## applicable license agreement, including, without limitation, 
## that your use is for the sole purpose of programming logic 
## devices manufactured by Intel and sold by Intel or its 
## authorized distributors.  Please refer to the applicable 
## agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 16.1.0 Build 196 10/24/2016 SJ Standard Edition"

## DATE    "Tue Jul 11 18:30:29 2017"

##
## DEVICE  "5CEBA9F31C8"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {OSCCLK0} -period 20.000 -waveform { 0.000 10.000 } [get_ports {OSCCLK[0]}]
create_clock -name {OSCCLK1} -period 40.689 -waveform { 0.000 20.344 } [get_ports {OSCCLK[1]}]
create_clock -name {OSCCLK2} -period 40.000 -waveform { 0.000 20.000 } [get_ports {OSCCLK[2]}]
create_clock -name {DBGCLK} -period 40.000 -waveform { 0.000 20.000 } [get_ports {CS_TCK}]
create_clock -name {CFGCLK} -period 2000.000 -waveform { 0.000 1000.000 } [get_ports {CLCD_PDH[13]}]
create_clock -name {SPICFGCLK} -period 133.333 -waveform { 0.000 66.666 } [get_ports {CLCD_PDL[6]}]
create_clock -name {SPICLCD} -period 40.000 -waveform { 0.000 20.000 } [get_ports {CLCD_T_SCK}]
create_clock -name {SPICON} -period 40.000 -waveform { 0.000 20.000 } [get_ports {SPI_SCK}]
create_clock -name {I2CCLCD} -period 40.000 -waveform { 0.000 20.000 } [get_ports {CLCD_T_SCL}]
create_clock -name {I2CAUD} -period 40.000 -waveform { 0.000 20.000 } [get_ports {AUD_SCL}]
create_clock -name {I2C_SHIELD0} -period 40.000 -waveform { 0.000 20.000 } [get_ports {EXP[5]}]
create_clock -name {I2C_SHIELD1} -period 40.000 -waveform { 0.000 20.000 } [get_ports {EXP[31]}]
create_clock -name {SPI_SHIELD0} -period 40.000 -waveform { 0.000 20.000 } [get_ports {EXP[11]}]
create_clock -name {SPI_SHIELD1} -period 40.000 -waveform { 0.000 20.000 } [get_ports {EXP[44]}]
create_clock -name {SPI_ADC} -period 40.000 -waveform { 0.000 20.000 } [get_ports {EXP[19]}]
create_clock -name {zbt_virtual_clock} -period 40.000 -waveform { 8.000 28.000 } 
create_clock -name {spicon_virtual_clock} -period 40.000 -waveform { 1.000 21.000 } 
create_clock -name {spicfg_virtual_clock} -period 133.333 -waveform { 1.000 67.666 } 
create_clock -name {dbg_virtual_clock} -period 40.000 -waveform { 1.000 21.000 } 
create_clock -name {scc_virtual_clock} -period 2000.000 -waveform { 1.000 1001.000 } 
create_clock -name {clcdspi_virtual_clock} -period 40.000 -waveform { 1.000 21.000 } 
create_clock -name {clcdi2c_virtual_clock} -period 40.000 -waveform { 1.000 21.000 } 
create_clock -name {audiosclk_virtual_clock} -period 325.512 -waveform { 1.000 163.756 } 
create_clock -name {i2caud_virtual_clock} -period 40.000 -waveform { 1.000 21.000 } 
create_clock -name {i2c_shield0_virtual_clock} -period 40.000 -waveform { 1.000 21.000 } 
create_clock -name {i2c_shield1_virtual_clock} -period 40.000 -waveform { 1.000 21.000 } 
create_clock -name {spi_shield0_virtual_clock} -period 40.000 -waveform { 1.000 21.000 } 
create_clock -name {spi_shield1_virtual_clock} -period 40.000 -waveform { 1.000 21.000 } 
create_clock -name {spi_adc_virtual_clock} -period 40.000 -waveform { 1.000 21.000 } 


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {AUDSCLK_MUX} -source [get_pins -compatibility_mode {*u_apb_if|reg_itcr|clk}] -divide_by 100 -master_clock {SYSCLK} [get_pins {u_fpga_system|u_user_partition|u_fpga_apb_subsystem|u_apb_i2s_top|u_apb_if|reg_itcr|q}] 
create_generated_clock -name {SYSCLK} -source [get_ports {OSCCLK[0]}] -duty_cycle 50.000 -multiply_by 1 -divide_by 2 -master_clock {OSCCLK0} [get_pins {u_fpga_pll|u_cpu_periph_clk_pll_0|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] 
create_generated_clock -name {AUDMCLK} -source [get_ports {OSCCLK[1]}] -duty_cycle 50.000 -multiply_by 1 -divide_by 2 -master_clock {OSCCLK1} [get_pins {u_fpga_pll|u_cpu_periph_clk_pll_1|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] 
create_generated_clock -name {AUDSCLK} -source [get_ports {OSCCLK[1]}] -duty_cycle 50.000 -multiply_by 1 -divide_by 8 -master_clock {OSCCLK1} [get_pins {u_fpga_pll|u_cpu_periph_clk_pll_1|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] 
create_generated_clock -name {zbt_gen_clock} -source [get_pins {u_fpga_pll|u_cpu_periph_clk_pll_0|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -master_clock {SYSCLK} [get_ports {SSRAM1_CLK[0]}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {spi_adc_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {spi_adc_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {spi_adc_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {spi_adc_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {spi_adc_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {spi_adc_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {spi_adc_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {spi_adc_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {spi_shield1_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {spi_shield1_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {spi_shield1_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {spi_shield1_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {spi_shield1_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {spi_shield1_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {spi_shield1_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {spi_shield1_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {spi_shield0_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {spi_shield0_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {spi_shield0_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {spi_shield0_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {spi_shield0_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {spi_shield0_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {spi_shield0_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {spi_shield0_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {i2c_shield1_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {i2c_shield1_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {i2c_shield1_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {i2c_shield1_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {i2c_shield1_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {i2c_shield1_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {i2c_shield1_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {i2c_shield1_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {i2c_shield0_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {i2c_shield0_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {i2c_shield0_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {i2c_shield0_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {i2c_shield0_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {i2c_shield0_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {i2c_shield0_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {i2c_shield0_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {i2caud_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {i2caud_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {i2caud_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {i2caud_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {i2caud_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {i2caud_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {i2caud_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {i2caud_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {audiosclk_virtual_clock}] -rise_to [get_clocks {AUDSCLK}]  0.070  
set_clock_uncertainty -rise_from [get_clocks {audiosclk_virtual_clock}] -fall_to [get_clocks {AUDSCLK}]  0.070  
set_clock_uncertainty -rise_from [get_clocks {audiosclk_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {audiosclk_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {audiosclk_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {audiosclk_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {audiosclk_virtual_clock}] -rise_to [get_clocks {AUDSCLK}]  0.070  
set_clock_uncertainty -fall_from [get_clocks {audiosclk_virtual_clock}] -fall_to [get_clocks {AUDSCLK}]  0.070  
set_clock_uncertainty -fall_from [get_clocks {audiosclk_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {audiosclk_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {audiosclk_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {audiosclk_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {clcdi2c_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {clcdi2c_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {clcdi2c_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {clcdi2c_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {clcdi2c_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {clcdi2c_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {clcdi2c_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {clcdi2c_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {clcdspi_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {clcdspi_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {clcdspi_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {clcdspi_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {clcdspi_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {clcdspi_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {clcdspi_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {clcdspi_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {scc_virtual_clock}] -rise_to [get_clocks {CFGCLK}]  0.050  
set_clock_uncertainty -rise_from [get_clocks {scc_virtual_clock}] -fall_to [get_clocks {CFGCLK}]  0.050  
set_clock_uncertainty -fall_from [get_clocks {scc_virtual_clock}] -rise_to [get_clocks {CFGCLK}]  0.050  
set_clock_uncertainty -fall_from [get_clocks {scc_virtual_clock}] -fall_to [get_clocks {CFGCLK}]  0.050  
set_clock_uncertainty -rise_from [get_clocks {dbg_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {dbg_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {dbg_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {dbg_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {dbg_virtual_clock}] -rise_to [get_clocks {DBGCLK}]  0.050  
set_clock_uncertainty -rise_from [get_clocks {dbg_virtual_clock}] -fall_to [get_clocks {DBGCLK}]  0.050  
set_clock_uncertainty -fall_from [get_clocks {dbg_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {dbg_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {dbg_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {dbg_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {dbg_virtual_clock}] -rise_to [get_clocks {DBGCLK}]  0.050  
set_clock_uncertainty -fall_from [get_clocks {dbg_virtual_clock}] -fall_to [get_clocks {DBGCLK}]  0.050  
set_clock_uncertainty -rise_from [get_clocks {spicfg_virtual_clock}] -rise_to [get_clocks {SPICFGCLK}]  0.050  
set_clock_uncertainty -rise_from [get_clocks {spicfg_virtual_clock}] -fall_to [get_clocks {SPICFGCLK}]  0.050  
set_clock_uncertainty -fall_from [get_clocks {spicfg_virtual_clock}] -rise_to [get_clocks {SPICFGCLK}]  0.050  
set_clock_uncertainty -fall_from [get_clocks {spicfg_virtual_clock}] -fall_to [get_clocks {SPICFGCLK}]  0.050  
set_clock_uncertainty -rise_from [get_clocks {spicon_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {spicon_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {spicon_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {spicon_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {spicon_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {spicon_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {spicon_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {spicon_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {zbt_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {zbt_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {zbt_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {zbt_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {zbt_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {zbt_virtual_clock}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {zbt_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {zbt_virtual_clock}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {SPI_ADC}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {SPI_ADC}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {SPI_ADC}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {SPI_ADC}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {SPI_ADC}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {SPI_ADC}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {SPI_ADC}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {SPI_ADC}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {SPI_SHIELD1}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {SPI_SHIELD1}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {SPI_SHIELD1}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {SPI_SHIELD1}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {SPI_SHIELD1}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {SPI_SHIELD1}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {SPI_SHIELD1}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {SPI_SHIELD1}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {SPI_SHIELD0}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {SPI_SHIELD0}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {SPI_SHIELD0}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {SPI_SHIELD0}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {SPI_SHIELD0}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {SPI_SHIELD0}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {SPI_SHIELD0}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {SPI_SHIELD0}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {I2C_SHIELD1}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {I2C_SHIELD1}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {I2C_SHIELD1}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {I2C_SHIELD1}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {I2C_SHIELD1}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {I2C_SHIELD1}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {I2C_SHIELD1}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {I2C_SHIELD1}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {I2C_SHIELD0}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {I2C_SHIELD0}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {I2C_SHIELD0}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {I2C_SHIELD0}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {I2C_SHIELD0}] -rise_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {I2C_SHIELD0}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {I2C_SHIELD0}] -fall_to [get_clocks {SYSCLK}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {I2C_SHIELD0}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {AUDSCLK}] -rise_to [get_clocks {AUDSCLK}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {AUDSCLK}] -rise_to [get_clocks {AUDSCLK}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {AUDSCLK}] -fall_to [get_clocks {AUDSCLK}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {AUDSCLK}] -fall_to [get_clocks {AUDSCLK}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {AUDSCLK}] -rise_to [get_clocks {AUDSCLK}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {AUDSCLK}] -rise_to [get_clocks {AUDSCLK}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {AUDSCLK}] -fall_to [get_clocks {AUDSCLK}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {AUDSCLK}] -fall_to [get_clocks {AUDSCLK}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {AUDMCLK}] -rise_to [get_clocks {AUDMCLK}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {AUDMCLK}] -rise_to [get_clocks {AUDMCLK}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {AUDMCLK}] -fall_to [get_clocks {AUDMCLK}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {AUDMCLK}] -fall_to [get_clocks {AUDMCLK}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {AUDMCLK}] -rise_to [get_clocks {AUDMCLK}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {AUDMCLK}] -rise_to [get_clocks {AUDMCLK}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {AUDMCLK}] -fall_to [get_clocks {AUDMCLK}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {AUDMCLK}] -fall_to [get_clocks {AUDMCLK}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -rise_to [get_clocks {zbt_gen_clock}] -setup 0.140  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -rise_to [get_clocks {zbt_gen_clock}] -hold 0.130  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -fall_to [get_clocks {zbt_gen_clock}] -setup 0.140  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -fall_to [get_clocks {zbt_gen_clock}] -hold 0.130  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -rise_to [get_clocks {SPI_ADC}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -rise_to [get_clocks {SPI_ADC}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -fall_to [get_clocks {SPI_ADC}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -fall_to [get_clocks {SPI_ADC}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -rise_to [get_clocks {SPI_SHIELD1}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -rise_to [get_clocks {SPI_SHIELD1}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -fall_to [get_clocks {SPI_SHIELD1}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -fall_to [get_clocks {SPI_SHIELD1}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -rise_to [get_clocks {SPI_SHIELD0}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -rise_to [get_clocks {SPI_SHIELD0}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -fall_to [get_clocks {SPI_SHIELD0}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -fall_to [get_clocks {SPI_SHIELD0}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -rise_to [get_clocks {I2C_SHIELD1}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -rise_to [get_clocks {I2C_SHIELD1}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -fall_to [get_clocks {I2C_SHIELD1}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -fall_to [get_clocks {I2C_SHIELD1}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -rise_to [get_clocks {I2C_SHIELD0}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -rise_to [get_clocks {I2C_SHIELD0}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -fall_to [get_clocks {I2C_SHIELD0}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -fall_to [get_clocks {I2C_SHIELD0}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -rise_to [get_clocks {I2CAUD}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -rise_to [get_clocks {I2CAUD}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -fall_to [get_clocks {I2CAUD}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -fall_to [get_clocks {I2CAUD}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -rise_to [get_clocks {I2CCLCD}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -rise_to [get_clocks {I2CCLCD}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -fall_to [get_clocks {I2CCLCD}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -fall_to [get_clocks {I2CCLCD}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -rise_to [get_clocks {SPICON}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -rise_to [get_clocks {SPICON}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -fall_to [get_clocks {SPICON}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -fall_to [get_clocks {SPICON}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -rise_to [get_clocks {SPICLCD}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -rise_to [get_clocks {SPICLCD}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -fall_to [get_clocks {SPICLCD}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -fall_to [get_clocks {SPICLCD}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -rise_to [get_clocks {SYSCLK}] -setup 0.080  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -fall_to [get_clocks {SYSCLK}] -setup 0.080  
set_clock_uncertainty -rise_from [get_clocks {SYSCLK}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -rise_to [get_clocks {zbt_gen_clock}] -setup 0.140  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -rise_to [get_clocks {zbt_gen_clock}] -hold 0.130  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -fall_to [get_clocks {zbt_gen_clock}] -setup 0.140  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -fall_to [get_clocks {zbt_gen_clock}] -hold 0.130  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -rise_to [get_clocks {SPI_ADC}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -rise_to [get_clocks {SPI_ADC}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -fall_to [get_clocks {SPI_ADC}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -fall_to [get_clocks {SPI_ADC}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -rise_to [get_clocks {SPI_SHIELD1}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -rise_to [get_clocks {SPI_SHIELD1}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -fall_to [get_clocks {SPI_SHIELD1}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -fall_to [get_clocks {SPI_SHIELD1}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -rise_to [get_clocks {SPI_SHIELD0}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -rise_to [get_clocks {SPI_SHIELD0}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -fall_to [get_clocks {SPI_SHIELD0}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -fall_to [get_clocks {SPI_SHIELD0}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -rise_to [get_clocks {I2C_SHIELD1}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -rise_to [get_clocks {I2C_SHIELD1}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -fall_to [get_clocks {I2C_SHIELD1}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -fall_to [get_clocks {I2C_SHIELD1}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -rise_to [get_clocks {I2C_SHIELD0}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -rise_to [get_clocks {I2C_SHIELD0}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -fall_to [get_clocks {I2C_SHIELD0}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -fall_to [get_clocks {I2C_SHIELD0}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -rise_to [get_clocks {I2CAUD}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -rise_to [get_clocks {I2CAUD}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -fall_to [get_clocks {I2CAUD}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -fall_to [get_clocks {I2CAUD}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -rise_to [get_clocks {I2CCLCD}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -rise_to [get_clocks {I2CCLCD}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -fall_to [get_clocks {I2CCLCD}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -fall_to [get_clocks {I2CCLCD}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -rise_to [get_clocks {SPICON}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -rise_to [get_clocks {SPICON}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -fall_to [get_clocks {SPICON}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -fall_to [get_clocks {SPICON}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -rise_to [get_clocks {SPICLCD}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -rise_to [get_clocks {SPICLCD}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -fall_to [get_clocks {SPICLCD}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -fall_to [get_clocks {SPICLCD}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -rise_to [get_clocks {SYSCLK}] -setup 0.080  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -rise_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -fall_to [get_clocks {SYSCLK}] -setup 0.080  
set_clock_uncertainty -fall_from [get_clocks {SYSCLK}] -fall_to [get_clocks {SYSCLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {SPICFGCLK}] -rise_to [get_clocks {SPICFGCLK}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {SPICFGCLK}] -rise_to [get_clocks {SPICFGCLK}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {SPICFGCLK}] -fall_to [get_clocks {SPICFGCLK}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {SPICFGCLK}] -fall_to [get_clocks {SPICFGCLK}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {SPICFGCLK}] -rise_to [get_clocks {SPICFGCLK}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {SPICFGCLK}] -rise_to [get_clocks {SPICFGCLK}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {SPICFGCLK}] -fall_to [get_clocks {SPICFGCLK}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {SPICFGCLK}] -fall_to [get_clocks {SPICFGCLK}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {CFGCLK}] -rise_to [get_clocks {zbt_gen_clock}]  0.160  
set_clock_uncertainty -rise_from [get_clocks {CFGCLK}] -fall_to [get_clocks {zbt_gen_clock}]  0.160  
set_clock_uncertainty -rise_from [get_clocks {CFGCLK}] -rise_to [get_clocks {CFGCLK}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {CFGCLK}] -rise_to [get_clocks {CFGCLK}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {CFGCLK}] -fall_to [get_clocks {CFGCLK}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {CFGCLK}] -fall_to [get_clocks {CFGCLK}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {CFGCLK}] -rise_to [get_clocks {zbt_gen_clock}]  0.160  
set_clock_uncertainty -fall_from [get_clocks {CFGCLK}] -fall_to [get_clocks {zbt_gen_clock}]  0.160  
set_clock_uncertainty -fall_from [get_clocks {CFGCLK}] -rise_to [get_clocks {CFGCLK}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {CFGCLK}] -rise_to [get_clocks {CFGCLK}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {CFGCLK}] -fall_to [get_clocks {CFGCLK}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {CFGCLK}] -fall_to [get_clocks {CFGCLK}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {OSCCLK2}] -rise_to [get_clocks {OSCCLK2}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {OSCCLK2}] -rise_to [get_clocks {OSCCLK2}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {OSCCLK2}] -fall_to [get_clocks {OSCCLK2}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {OSCCLK2}] -fall_to [get_clocks {OSCCLK2}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {OSCCLK2}] -rise_to [get_clocks {OSCCLK2}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {OSCCLK2}] -rise_to [get_clocks {OSCCLK2}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {OSCCLK2}] -fall_to [get_clocks {OSCCLK2}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {OSCCLK2}] -fall_to [get_clocks {OSCCLK2}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {DBGCLK}] -rise_to [get_clocks {zbt_gen_clock}]  0.160  
set_clock_uncertainty -rise_from [get_clocks {DBGCLK}] -fall_to [get_clocks {zbt_gen_clock}]  0.160  
set_clock_uncertainty -rise_from [get_clocks {DBGCLK}] -rise_to [get_clocks {DBGCLK}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {DBGCLK}] -rise_to [get_clocks {DBGCLK}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {DBGCLK}] -fall_to [get_clocks {DBGCLK}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {DBGCLK}] -fall_to [get_clocks {DBGCLK}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {DBGCLK}] -rise_to [get_clocks {zbt_gen_clock}]  0.160  
set_clock_uncertainty -fall_from [get_clocks {DBGCLK}] -fall_to [get_clocks {zbt_gen_clock}]  0.160  
set_clock_uncertainty -fall_from [get_clocks {DBGCLK}] -rise_to [get_clocks {DBGCLK}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {DBGCLK}] -rise_to [get_clocks {DBGCLK}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {DBGCLK}] -fall_to [get_clocks {DBGCLK}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {DBGCLK}] -fall_to [get_clocks {DBGCLK}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {AUDSCLK_MUX}] -rise_to [get_clocks {SYSCLK}] -setup 0.080  
set_clock_uncertainty -rise_from [get_clocks {AUDSCLK_MUX}] -rise_to [get_clocks {SYSCLK}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {AUDSCLK_MUX}] -fall_to [get_clocks {SYSCLK}] -setup 0.080  
set_clock_uncertainty -rise_from [get_clocks {AUDSCLK_MUX}] -fall_to [get_clocks {SYSCLK}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {AUDSCLK_MUX}] -rise_to [get_clocks {SYSCLK}] -setup 0.080  
set_clock_uncertainty -fall_from [get_clocks {AUDSCLK_MUX}] -rise_to [get_clocks {SYSCLK}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {AUDSCLK_MUX}] -fall_to [get_clocks {SYSCLK}] -setup 0.080  
set_clock_uncertainty -fall_from [get_clocks {AUDSCLK_MUX}] -fall_to [get_clocks {SYSCLK}] -hold 0.060  


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay -max -clock [get_clocks {i2caud_virtual_clock}]  25.000 [get_ports {AUD_SDA}]
set_input_delay -add_delay -min -clock [get_clocks {i2caud_virtual_clock}]  0.000 [get_ports {AUD_SDA}]
set_input_delay -add_delay -max -clock [get_clocks {audiosclk_virtual_clock}]  81.000 [get_ports {AUD_SDOUT}]
set_input_delay -add_delay -min -clock [get_clocks {audiosclk_virtual_clock}]  0.000 [get_ports {AUD_SDOUT}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {CLCD_PDH[10]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  3.000 [get_ports {CLCD_PDH[10]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {CLCD_PDH[11]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  3.000 [get_ports {CLCD_PDH[11]}]
set_input_delay -add_delay -max -clock [get_clocks {scc_virtual_clock}]  -499.000 [get_ports {CLCD_PDH[13]}]
set_input_delay -add_delay -min -clock [get_clocks {scc_virtual_clock}]  500.000 [get_ports {CLCD_PDH[13]}]
set_input_delay -add_delay -max -clock [get_clocks {scc_virtual_clock}]  -499.000 [get_ports {CLCD_PDH[14]}]
set_input_delay -add_delay -min -clock [get_clocks {scc_virtual_clock}]  500.000 [get_ports {CLCD_PDH[14]}]
set_input_delay -add_delay -max -clock [get_clocks {scc_virtual_clock}]  -499.000 [get_ports {CLCD_PDH[15]}]
set_input_delay -add_delay -min -clock [get_clocks {scc_virtual_clock}]  500.000 [get_ports {CLCD_PDH[15]}]
set_input_delay -add_delay -max -clock [get_clocks {scc_virtual_clock}]  -499.000 [get_ports {CLCD_PDH[16]}]
set_input_delay -add_delay -min -clock [get_clocks {scc_virtual_clock}]  500.000 [get_ports {CLCD_PDH[16]}]
set_input_delay -add_delay -max -clock [get_clocks {scc_virtual_clock}]  -499.000 [get_ports {CLCD_PDH[17]}]
set_input_delay -add_delay -min -clock [get_clocks {scc_virtual_clock}]  500.000 [get_ports {CLCD_PDH[17]}]
set_input_delay -add_delay -max -clock [get_clocks {spicfg_virtual_clock}]  11.000 [get_ports {CLCD_PDL[8]}]
set_input_delay -add_delay -min -clock [get_clocks {spicfg_virtual_clock}]  0.000 [get_ports {CLCD_PDL[8]}]
set_input_delay -add_delay -max -clock [get_clocks {clcdspi_virtual_clock}]  25.000 [get_ports {CLCD_SDO}]
set_input_delay -add_delay -min -clock [get_clocks {clcdspi_virtual_clock}]  0.000 [get_ports {CLCD_SDO}]
set_input_delay -add_delay -max -clock [get_clocks {clcdi2c_virtual_clock}]  25.000 [get_ports {CLCD_T_CS}]
set_input_delay -add_delay -min -clock [get_clocks {clcdi2c_virtual_clock}]  0.000 [get_ports {CLCD_T_CS}]
set_input_delay -add_delay -max -clock [get_clocks {clcdi2c_virtual_clock}]  25.000 [get_ports {CLCD_T_SDA}]
set_input_delay -add_delay -min -clock [get_clocks {clcdi2c_virtual_clock}]  0.000 [get_ports {CLCD_T_SDA}]
set_input_delay -add_delay -max -clock [get_clocks {dbg_virtual_clock}]  11.000 [get_ports {CS_GNDDETECT}]
set_input_delay -add_delay -min -clock [get_clocks {dbg_virtual_clock}]  0.000 [get_ports {CS_GNDDETECT}]
set_input_delay -add_delay -max -clock [get_clocks {dbg_virtual_clock}]  11.000 [get_ports {CS_TDI}]
set_input_delay -add_delay -min -clock [get_clocks {dbg_virtual_clock}]  0.000 [get_ports {CS_TDI}]
set_input_delay -add_delay -max -clock [get_clocks {dbg_virtual_clock}]  11.000 [get_ports {CS_TMS}]
set_input_delay -add_delay -min -clock [get_clocks {dbg_virtual_clock}]  0.000 [get_ports {CS_TMS}]
set_input_delay -add_delay -max -clock [get_clocks {dbg_virtual_clock}]  11.000 [get_ports {CS_nSRST}]
set_input_delay -add_delay -min -clock [get_clocks {dbg_virtual_clock}]  0.000 [get_ports {CS_nSRST}]
set_input_delay -add_delay -max -clock [get_clocks {dbg_virtual_clock}]  11.000 [get_ports {CS_nTRST}]
set_input_delay -add_delay -min -clock [get_clocks {dbg_virtual_clock}]  0.000 [get_ports {CS_nTRST}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[0]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[0]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[1]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[1]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[2]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[2]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[3]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[3]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[4]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[4]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[6]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[6]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[7]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[7]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[8]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[8]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[9]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[9]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[10]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[10]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[12]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[12]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[13]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[13]}]
set_input_delay -add_delay -max -clock [get_clocks {spi_shield0_virtual_clock}]  11.000 [get_ports {EXP[14]}]
set_input_delay -add_delay -min -clock [get_clocks {spi_shield0_virtual_clock}]  0.000 [get_ports {EXP[14]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[14]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[14]}]
set_input_delay -add_delay -max -clock [get_clocks {i2c_shield0_virtual_clock}]  25.000 [get_ports {EXP[15]}]
set_input_delay -add_delay -min -clock [get_clocks {i2c_shield0_virtual_clock}]  0.000 [get_ports {EXP[15]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[15]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[15]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[16]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[16]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[17]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[17]}]
set_input_delay -add_delay -max -clock [get_clocks {spi_adc_virtual_clock}]  11.000 [get_ports {EXP[18]}]
set_input_delay -add_delay -min -clock [get_clocks {spi_adc_virtual_clock}]  0.000 [get_ports {EXP[18]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[18]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[18]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[20]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[20]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[21]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[21]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[22]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[22]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[23]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[23]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[24]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[24]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[25]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[25]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[26]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[26]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[27]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[27]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[28]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[28]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[29]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[29]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[30]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[30]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[32]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[32]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[33]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[33]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[34]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[34]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[35]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[35]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[36]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[36]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[37]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[37]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[38]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[38]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[39]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[39]}]
set_input_delay -add_delay -max -clock [get_clocks {spi_shield1_virtual_clock}]  11.000 [get_ports {EXP[40]}]
set_input_delay -add_delay -min -clock [get_clocks {spi_shield1_virtual_clock}]  0.000 [get_ports {EXP[40]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[40]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[40]}]
set_input_delay -add_delay -max -clock [get_clocks {i2c_shield1_virtual_clock}]  25.000 [get_ports {EXP[41]}]
set_input_delay -add_delay -min -clock [get_clocks {i2c_shield1_virtual_clock}]  0.000 [get_ports {EXP[41]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[41]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[41]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[42]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[42]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[43]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[43]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[45]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[45]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[46]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[46]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[47]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[47]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[48]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[48]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[49]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[49]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[50]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[50]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[51]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {EXP[51]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  18.000 [get_ports {SMB_DQ[0]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {SMB_DQ[0]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  18.000 [get_ports {SMB_DQ[1]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {SMB_DQ[1]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  18.000 [get_ports {SMB_DQ[2]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {SMB_DQ[2]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  18.000 [get_ports {SMB_DQ[3]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {SMB_DQ[3]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  18.000 [get_ports {SMB_DQ[4]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {SMB_DQ[4]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  18.000 [get_ports {SMB_DQ[5]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {SMB_DQ[5]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  18.000 [get_ports {SMB_DQ[6]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {SMB_DQ[6]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  18.000 [get_ports {SMB_DQ[7]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {SMB_DQ[7]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  18.000 [get_ports {SMB_DQ[8]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {SMB_DQ[8]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  18.000 [get_ports {SMB_DQ[9]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {SMB_DQ[9]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  18.000 [get_ports {SMB_DQ[10]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {SMB_DQ[10]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  18.000 [get_ports {SMB_DQ[11]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {SMB_DQ[11]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  18.000 [get_ports {SMB_DQ[12]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {SMB_DQ[12]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  18.000 [get_ports {SMB_DQ[13]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {SMB_DQ[13]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  18.000 [get_ports {SMB_DQ[14]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {SMB_DQ[14]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  18.000 [get_ports {SMB_DQ[15]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {SMB_DQ[15]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  18.000 [get_ports {SMB_ETH_IRQ}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  5.000 [get_ports {SMB_ETH_IRQ}]
set_input_delay -add_delay -max -clock [get_clocks {spicon_virtual_clock}]  11.000 [get_ports {SPI_MISO}]
set_input_delay -add_delay -min -clock [get_clocks {spicon_virtual_clock}]  0.000 [get_ports {SPI_MISO}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQP[0]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQP[0]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQP[1]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQP[1]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQP[2]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQP[2]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQP[3]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQP[3]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQP[4]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQP[4]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQP[5]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQP[5]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQP[6]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQP[6]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQP[7]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQP[7]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[0]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[0]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[1]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[1]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[2]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[2]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[3]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[3]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[4]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[4]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[5]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[5]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[6]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[6]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[7]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[7]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[8]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[8]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[9]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[9]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[10]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[10]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[11]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[11]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[12]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[12]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[13]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[13]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[14]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[14]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[15]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[15]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[16]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[16]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[17]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[17]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[18]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[18]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[19]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[19]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[20]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[20]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[21]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[21]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[22]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[22]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[23]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[23]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[24]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[24]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[25]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[25]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[26]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[26]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[27]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[27]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[28]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[28]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[29]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[29]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[30]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[30]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[31]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[31]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[32]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[32]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[33]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[33]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[34]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[34]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[35]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[35]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[36]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[36]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[37]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[37]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[38]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[38]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[39]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[39]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[40]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[40]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[41]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[41]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[42]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[42]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[43]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[43]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[44]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[44]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[45]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[45]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[46]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[46]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[47]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[47]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[48]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[48]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[49]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[49]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[50]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[50]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[51]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[51]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[52]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[52]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[53]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[53]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[54]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[54]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[55]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[55]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[56]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[56]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[57]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[57]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[58]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[58]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[59]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[59]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[60]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[60]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[61]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[61]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[62]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[62]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM1_DQ[63]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM1_DQ[63]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQP[0]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQP[0]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQP[1]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQP[1]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQP[2]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQP[2]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQP[3]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQP[3]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[0]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[0]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[1]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[1]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[2]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[2]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[3]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[3]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[4]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[4]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[5]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[5]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[6]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[6]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[7]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[7]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[8]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[8]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[9]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[9]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[10]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[10]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[11]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[11]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[12]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[12]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[13]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[13]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[14]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[14]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[15]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[15]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[16]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[16]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[17]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[17]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[18]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[18]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[19]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[19]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[20]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[20]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[21]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[21]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[22]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[22]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[23]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[23]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[24]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[24]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[25]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[25]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[26]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[26]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[27]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[27]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[28]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[28]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[29]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[29]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[30]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[30]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM2_DQ[31]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM2_DQ[31]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQP[0]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQP[0]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQP[1]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQP[1]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQP[2]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQP[2]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQP[3]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQP[3]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[0]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[0]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[1]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[1]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[2]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[2]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[3]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[3]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[4]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[4]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[5]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[5]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[6]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[6]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[7]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[7]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[8]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[8]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[9]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[9]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[10]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[10]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[11]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[11]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[12]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[12]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[13]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[13]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[14]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[14]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[15]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[15]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[16]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[16]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[17]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[17]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[18]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[18]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[19]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[19]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[20]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[20]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[21]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[21]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[22]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[22]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[23]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[23]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[24]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[24]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[25]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[25]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[26]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[26]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[27]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[27]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[28]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[28]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[29]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[29]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[30]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[30]}]
set_input_delay -add_delay -max -clock [get_clocks {zbt_virtual_clock}]  8.500 [get_ports {SSRAM3_DQ[31]}]
set_input_delay -add_delay -min -clock [get_clocks {zbt_virtual_clock}]  2.000 [get_ports {SSRAM3_DQ[31]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {UART_RXD}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  3.000 [get_ports {UART_RXD}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  2.000 [get_ports {USER_PB[0]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  1.000 [get_ports {USER_PB[0]}]
set_input_delay -add_delay -max -clock [get_clocks {SYSCLK}]  2.000 [get_ports {USER_PB[1]}]
set_input_delay -add_delay -min -clock [get_clocks {SYSCLK}]  1.000 [get_ports {USER_PB[1]}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay -max -clock [get_clocks {AUDSCLK}]  20.000 [get_ports {AUD_LRCK}]
set_output_delay -add_delay -min -clock [get_clocks {AUDSCLK}]  -1.000 [get_ports {AUD_LRCK}]
set_output_delay -add_delay -max -clock [get_clocks {AUDMCLK}]  20.000 [get_ports {AUD_MCLK}]
set_output_delay -add_delay -min -clock [get_clocks {AUDMCLK}]  -1.000 [get_ports {AUD_MCLK}]
set_output_delay -add_delay -max -clock [get_clocks {I2CAUD}]  16.000 [get_ports {AUD_SCL}]
set_output_delay -add_delay -min -clock [get_clocks {I2CAUD}]  -1.000 [get_ports {AUD_SCL}]
set_output_delay -add_delay -max -clock [get_clocks {AUDSCLK}]  20.000 [get_ports {AUD_SCLK}]
set_output_delay -add_delay -min -clock [get_clocks {AUDSCLK}]  -1.000 [get_ports {AUD_SCLK}]
set_output_delay -add_delay -max -clock [get_clocks {I2CAUD}]  16.000 [get_ports {AUD_SDA}]
set_output_delay -add_delay -min -clock [get_clocks {I2CAUD}]  -1.000 [get_ports {AUD_SDA}]
set_output_delay -add_delay -max -clock [get_clocks {AUDSCLK}]  20.000 [get_ports {AUD_SDIN}]
set_output_delay -add_delay -min -clock [get_clocks {AUDSCLK}]  -1.000 [get_ports {AUD_SDIN}]
set_output_delay -add_delay -max -clock [get_clocks {AUDSCLK}]  20.000 [get_ports {AUD_nRESET}]
set_output_delay -add_delay -min -clock [get_clocks {AUDSCLK}]  -1.000 [get_ports {AUD_nRESET}]
set_output_delay -add_delay -max -clock [get_clocks {CFGCLK}]  20.000 [get_ports {CLCD_BL_CTRL}]
set_output_delay -add_delay -min -clock [get_clocks {CFGCLK}]  -1.000 [get_ports {CLCD_BL_CTRL}]
set_output_delay -add_delay -max -clock [get_clocks {CFGCLK}]  20.000 [get_ports {CLCD_CS}]
set_output_delay -add_delay -min -clock [get_clocks {CFGCLK}]  -1.000 [get_ports {CLCD_CS}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {CLCD_PDH[10]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {CLCD_PDH[10]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {CLCD_PDH[11]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {CLCD_PDH[11]}]
set_output_delay -add_delay -max -clock [get_clocks {CFGCLK}]  8.000 [get_ports {CLCD_PDH[12]}]
set_output_delay -add_delay -min -clock [get_clocks {CFGCLK}]  -1.000 [get_ports {CLCD_PDH[12]}]
set_output_delay -add_delay -max -clock [get_clocks {SPICFGCLK}]  10.000 [get_ports {CLCD_PDL[7]}]
set_output_delay -add_delay -min -clock [get_clocks {SPICFGCLK}]  -1.500 [get_ports {CLCD_PDL[7]}]
set_output_delay -add_delay -max -clock [get_clocks {CFGCLK}]  20.000 [get_ports {CLCD_RD}]
set_output_delay -add_delay -min -clock [get_clocks {CFGCLK}]  -1.000 [get_ports {CLCD_RD}]
set_output_delay -add_delay -max -clock [get_clocks {CFGCLK}]  20.000 [get_ports {CLCD_RESET}]
set_output_delay -add_delay -min -clock [get_clocks {CFGCLK}]  -1.000 [get_ports {CLCD_RESET}]
set_output_delay -add_delay -max -clock [get_clocks {CFGCLK}]  20.000 [get_ports {CLCD_RS}]
set_output_delay -add_delay -min -clock [get_clocks {CFGCLK}]  -1.000 [get_ports {CLCD_RS}]
set_output_delay -add_delay -max -clock [get_clocks {SPICLCD}]  16.000 [get_ports {CLCD_SDI}]
set_output_delay -add_delay -min -clock [get_clocks {SPICLCD}]  -1.000 [get_ports {CLCD_SDI}]
set_output_delay -add_delay -max -clock [get_clocks {I2CCLCD}]  16.000 [get_ports {CLCD_T_SCL}]
set_output_delay -add_delay -min -clock [get_clocks {I2CCLCD}]  -1.000 [get_ports {CLCD_T_SCL}]
set_output_delay -add_delay -max -clock [get_clocks {I2CCLCD}]  16.000 [get_ports {CLCD_T_SDA}]
set_output_delay -add_delay -min -clock [get_clocks {I2CCLCD}]  -1.000 [get_ports {CLCD_T_SDA}]
set_output_delay -add_delay -max -clock [get_clocks {CFGCLK}]  20.000 [get_ports {CLCD_T_SDA}]
set_output_delay -add_delay -min -clock [get_clocks {CFGCLK}]  -1.000 [get_ports {CLCD_T_SDA}]
set_output_delay -add_delay -max -clock [get_clocks {CFGCLK}]  20.000 [get_ports {CLCD_WR_SCL}]
set_output_delay -add_delay -min -clock [get_clocks {CFGCLK}]  -1.000 [get_ports {CLCD_WR_SCL}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {DBGCLK}]  -10.000 [get_ports {CS_TDO}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {DBGCLK}]  -1.000 [get_ports {CS_TDO}]
set_output_delay -add_delay -max -clock [get_clocks {DBGCLK}]  10.000 [get_ports {CS_TMS}]
set_output_delay -add_delay -min -clock [get_clocks {DBGCLK}]  -1.000 [get_ports {CS_TMS}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  10.000 [get_ports {CS_TRACECLK}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -1.000 [get_ports {CS_TRACECLK}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  10.000 [get_ports {CS_TRACECTL}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -1.000 [get_ports {CS_TRACECTL}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  10.000 [get_ports {CS_TRACEDATA[0]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -1.000 [get_ports {CS_TRACEDATA[0]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  10.000 [get_ports {CS_TRACEDATA[1]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -1.000 [get_ports {CS_TRACEDATA[1]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  10.000 [get_ports {CS_TRACEDATA[2]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -1.000 [get_ports {CS_TRACEDATA[2]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  10.000 [get_ports {CS_TRACEDATA[3]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -1.000 [get_ports {CS_TRACEDATA[3]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  10.000 [get_ports {CS_TRACEDATA[4]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -1.000 [get_ports {CS_TRACEDATA[4]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  10.000 [get_ports {CS_TRACEDATA[5]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -1.000 [get_ports {CS_TRACEDATA[5]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  10.000 [get_ports {CS_TRACEDATA[6]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -1.000 [get_ports {CS_TRACEDATA[6]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  10.000 [get_ports {CS_TRACEDATA[7]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -1.000 [get_ports {CS_TRACEDATA[7]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  10.000 [get_ports {CS_TRACEDATA[8]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -1.000 [get_ports {CS_TRACEDATA[8]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  10.000 [get_ports {CS_TRACEDATA[9]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -1.000 [get_ports {CS_TRACEDATA[9]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  10.000 [get_ports {CS_TRACEDATA[10]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -1.000 [get_ports {CS_TRACEDATA[10]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  10.000 [get_ports {CS_TRACEDATA[11]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -1.000 [get_ports {CS_TRACEDATA[11]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  10.000 [get_ports {CS_TRACEDATA[12]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -1.000 [get_ports {CS_TRACEDATA[12]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  10.000 [get_ports {CS_TRACEDATA[13]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -1.000 [get_ports {CS_TRACEDATA[13]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  10.000 [get_ports {CS_TRACEDATA[14]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -1.000 [get_ports {CS_TRACEDATA[14]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  10.000 [get_ports {CS_TRACEDATA[15]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -1.000 [get_ports {CS_TRACEDATA[15]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[0]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[0]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[1]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[1]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[2]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[2]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[3]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[3]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[4]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[4]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[6]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[6]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[7]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[7]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[8]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[8]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[9]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[9]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[10]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[10]}]
set_output_delay -add_delay -max -clock [get_clocks {SPI_SHIELD0}]  10.000 [get_ports {EXP[12]}]
set_output_delay -add_delay -min -clock [get_clocks {SPI_SHIELD0}]  -1.500 [get_ports {EXP[12]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[12]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[12]}]
set_output_delay -add_delay -max -clock [get_clocks {SPI_SHIELD0}]  10.000 [get_ports {EXP[13]}]
set_output_delay -add_delay -min -clock [get_clocks {SPI_SHIELD0}]  -1.500 [get_ports {EXP[13]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[13]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[13]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[14]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[14]}]
set_output_delay -add_delay -max -clock [get_clocks {I2C_SHIELD0}]  16.000 [get_ports {EXP[15]}]
set_output_delay -add_delay -min -clock [get_clocks {I2C_SHIELD0}]  -1.000 [get_ports {EXP[15]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[15]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[15]}]
set_output_delay -add_delay -max -clock [get_clocks {SPI_ADC}]  10.000 [get_ports {EXP[16]}]
set_output_delay -add_delay -min -clock [get_clocks {SPI_ADC}]  -1.500 [get_ports {EXP[16]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[16]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[16]}]
set_output_delay -add_delay -max -clock [get_clocks {SPI_ADC}]  10.000 [get_ports {EXP[17]}]
set_output_delay -add_delay -min -clock [get_clocks {SPI_ADC}]  -1.500 [get_ports {EXP[17]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[17]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[17]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[18]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[18]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[20]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[20]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[21]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[21]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[22]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[22]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[23]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[23]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[24]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[24]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[25]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[25]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[26]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[26]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[27]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[27]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[28]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[28]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[29]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[29]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[30]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[30]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[32]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[32]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[33]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[33]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[34]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[34]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[35]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[35]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[36]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[36]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[37]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[37]}]
set_output_delay -add_delay -max -clock [get_clocks {SPI_SHIELD1}]  10.000 [get_ports {EXP[38]}]
set_output_delay -add_delay -min -clock [get_clocks {SPI_SHIELD1}]  -1.500 [get_ports {EXP[38]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[38]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[38]}]
set_output_delay -add_delay -max -clock [get_clocks {SPI_SHIELD1}]  10.000 [get_ports {EXP[39]}]
set_output_delay -add_delay -min -clock [get_clocks {SPI_SHIELD1}]  -1.500 [get_ports {EXP[39]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[39]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[39]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[40]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[40]}]
set_output_delay -add_delay -max -clock [get_clocks {I2C_SHIELD1}]  16.000 [get_ports {EXP[41]}]
set_output_delay -add_delay -min -clock [get_clocks {I2C_SHIELD1}]  -1.000 [get_ports {EXP[41]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[41]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[41]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[42]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[42]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[43]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[43]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[45]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[45]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[46]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[46]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[47]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[47]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[48]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[48]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[49]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[49]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[50]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[50]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {EXP[51]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -5.000 [get_ports {EXP[51]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_A[0]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_A[0]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_A[1]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_A[1]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_A[2]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_A[2]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_A[3]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_A[3]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_A[4]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_A[4]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_A[5]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_A[5]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_A[6]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_A[6]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_A[7]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_A[7]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_A[8]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_A[8]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_A[9]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_A[9]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_A[10]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_A[10]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_A[11]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_A[11]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_A[12]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_A[12]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_A[13]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_A[13]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_A[14]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_A[14]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_A[15]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_A[15]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_A[16]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_A[16]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_A[17]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_A[17]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_A[18]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_A[18]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_A[19]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_A[19]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_A[20]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_A[20]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_A[21]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_A[21]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_A[22]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_A[22]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_DQ[0]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_DQ[0]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_DQ[1]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_DQ[1]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_DQ[2]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_DQ[2]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_DQ[3]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_DQ[3]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_DQ[4]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_DQ[4]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_DQ[5]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_DQ[5]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_DQ[6]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_DQ[6]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_DQ[7]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_DQ[7]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_DQ[8]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_DQ[8]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_DQ[9]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_DQ[9]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_DQ[10]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_DQ[10]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_DQ[11]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_DQ[11]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_DQ[12]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_DQ[12]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_DQ[13]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_DQ[13]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_DQ[14]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_DQ[14]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_DQ[15]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_DQ[15]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_ETH_nCS}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_ETH_nCS}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_PSRAM_nCE[0]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_PSRAM_nCE[0]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_PSRAM_nCE[1]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_PSRAM_nCE[1]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_nLB}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_nLB}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_nOE}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_nOE}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_nRD}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_nRD}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_nRESET}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_nRESET}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_nUB}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_nUB}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {SMB_nWE}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {SMB_nWE}]
set_output_delay -add_delay -max -clock [get_clocks {SPICON}]  10.000 [get_ports {SPI_MOSI}]
set_output_delay -add_delay -min -clock [get_clocks {SPICON}]  -1.500 [get_ports {SPI_MOSI}]
set_output_delay -add_delay -max -clock [get_clocks {SPICON}]  10.000 [get_ports {SPI_SCK}]
set_output_delay -add_delay -min -clock [get_clocks {SPICON}]  -1.500 [get_ports {SPI_SCK}]
set_output_delay -add_delay -max -clock [get_clocks {SPICON}]  10.000 [get_ports {SPI_nSS}]
set_output_delay -add_delay -min -clock [get_clocks {SPICON}]  -1.500 [get_ports {SPI_nSS}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_ADVnLD}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_ADVnLD}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_A[0]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_A[0]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_A[1]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_A[1]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_A[2]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_A[2]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_A[3]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_A[3]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_A[4]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_A[4]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_A[5]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_A[5]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_A[6]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_A[6]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_A[7]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_A[7]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_A[8]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_A[8]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_A[9]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_A[9]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_A[10]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_A[10]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_A[11]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_A[11]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_A[12]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_A[12]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_A[13]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_A[13]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_A[14]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_A[14]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_A[15]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_A[15]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_A[16]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_A[16]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_A[17]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_A[17]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_A[18]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_A[18]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_A[19]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_A[19]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_A[20]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_A[20]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  10.000 [get_ports {SSRAM1_CLK[0]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -1.000 [get_ports {SSRAM1_CLK[0]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  10.000 [get_ports {SSRAM1_CLK[1]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -1.000 [get_ports {SSRAM1_CLK[1]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQP[0]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQP[0]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQP[1]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQP[1]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQP[2]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQP[2]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQP[3]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQP[3]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQP[4]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQP[4]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQP[5]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQP[5]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQP[6]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQP[6]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQP[7]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQP[7]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[0]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[0]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[1]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[1]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[2]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[2]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[3]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[3]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[4]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[4]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[5]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[5]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[6]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[6]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[7]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[7]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[8]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[8]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[9]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[9]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[10]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[10]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[11]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[11]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[12]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[12]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[13]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[13]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[14]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[14]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[15]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[15]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[16]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[16]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[17]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[17]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[18]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[18]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[19]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[19]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[20]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[20]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[21]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[21]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[22]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[22]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[23]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[23]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[24]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[24]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[25]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[25]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[26]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[26]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[27]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[27]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[28]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[28]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[29]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[29]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[30]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[30]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[31]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[31]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[32]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[32]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[33]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[33]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[34]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[34]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[35]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[35]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[36]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[36]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[37]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[37]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[38]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[38]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[39]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[39]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[40]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[40]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[41]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[41]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[42]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[42]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[43]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[43]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[44]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[44]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[45]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[45]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[46]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[46]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[47]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[47]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[48]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[48]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[49]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[49]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[50]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[50]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[51]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[51]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[52]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[52]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[53]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[53]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[54]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[54]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[55]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[55]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[56]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[56]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[57]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[57]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[58]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[58]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[59]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[59]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[60]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[60]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[61]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[61]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[62]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[62]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_DQ[63]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_DQ[63]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_MODE}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_MODE}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_ZZ}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_ZZ}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_nBW[0]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_nBW[0]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_nBW[1]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_nBW[1]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_nBW[2]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_nBW[2]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_nBW[3]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_nBW[3]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_nBW[4]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_nBW[4]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_nBW[5]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_nBW[5]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_nBW[6]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_nBW[6]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_nBW[7]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_nBW[7]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_nCE1}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_nCE1}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_nCEN}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_nCEN}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_nOE}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_nOE}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM1_nWE}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM1_nWE}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_ADVnLD}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_ADVnLD}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_A[0]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_A[0]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_A[1]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_A[1]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_A[2]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_A[2]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_A[3]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_A[3]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_A[4]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_A[4]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_A[5]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_A[5]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_A[6]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_A[6]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_A[7]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_A[7]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_A[8]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_A[8]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_A[9]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_A[9]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_A[10]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_A[10]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_A[11]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_A[11]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_A[12]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_A[12]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_A[13]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_A[13]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_A[14]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_A[14]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_A[15]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_A[15]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_A[16]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_A[16]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_A[17]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_A[17]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_A[18]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_A[18]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_A[19]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_A[19]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_A[20]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_A[20]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  10.000 [get_ports {SSRAM2_CLK}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -1.000 [get_ports {SSRAM2_CLK}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQP[0]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQP[0]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQP[1]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQP[1]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQP[2]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQP[2]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQP[3]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQP[3]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[0]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[0]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[1]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[1]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[2]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[2]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[3]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[3]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[4]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[4]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[5]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[5]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[6]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[6]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[7]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[7]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[8]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[8]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[9]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[9]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[10]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[10]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[11]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[11]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[12]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[12]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[13]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[13]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[14]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[14]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[15]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[15]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[16]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[16]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[17]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[17]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[18]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[18]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[19]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[19]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[20]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[20]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[21]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[21]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[22]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[22]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[23]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[23]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[24]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[24]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[25]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[25]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[26]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[26]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[27]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[27]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[28]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[28]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[29]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[29]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[30]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[30]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_DQ[31]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_DQ[31]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_MODE}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_MODE}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_ZZ}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_ZZ}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_nBW[0]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_nBW[0]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_nBW[1]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_nBW[1]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_nBW[2]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_nBW[2]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_nBW[3]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_nBW[3]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_nCE1}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_nCE1}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_nCEN}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_nCEN}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_nOE}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_nOE}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM2_nWE}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM2_nWE}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_ADVnLD}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_ADVnLD}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_A[0]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_A[0]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_A[1]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_A[1]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_A[2]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_A[2]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_A[3]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_A[3]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_A[4]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_A[4]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_A[5]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_A[5]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_A[6]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_A[6]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_A[7]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_A[7]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_A[8]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_A[8]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_A[9]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_A[9]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_A[10]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_A[10]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_A[11]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_A[11]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_A[12]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_A[12]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_A[13]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_A[13]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_A[14]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_A[14]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_A[15]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_A[15]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_A[16]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_A[16]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_A[17]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_A[17]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_A[18]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_A[18]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_A[19]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_A[19]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_A[20]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_A[20]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  10.000 [get_ports {SSRAM3_CLK}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  -1.000 [get_ports {SSRAM3_CLK}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQP[0]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQP[0]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQP[1]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQP[1]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQP[2]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQP[2]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQP[3]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQP[3]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[0]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[0]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[1]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[1]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[2]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[2]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[3]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[3]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[4]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[4]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[5]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[5]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[6]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[6]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[7]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[7]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[8]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[8]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[9]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[9]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[10]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[10]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[11]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[11]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[12]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[12]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[13]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[13]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[14]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[14]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[15]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[15]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[16]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[16]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[17]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[17]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[18]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[18]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[19]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[19]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[20]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[20]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[21]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[21]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[22]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[22]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[23]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[23]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[24]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[24]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[25]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[25]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[26]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[26]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[27]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[27]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[28]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[28]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[29]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[29]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[30]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[30]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_DQ[31]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_DQ[31]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_MODE}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_MODE}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_ZZ}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_ZZ}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_nBW[0]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_nBW[0]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_nBW[1]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_nBW[1]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_nBW[2]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_nBW[2]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_nBW[3]}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_nBW[3]}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_nCE1}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_nCE1}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_nCEN}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_nCEN}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_nOE}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_nOE}]
set_output_delay -add_delay -max -clock [get_clocks {zbt_gen_clock}]  1.500 [get_ports {SSRAM3_nWE}]
set_output_delay -add_delay -min -clock [get_clocks {zbt_gen_clock}]  -1.500 [get_ports {SSRAM3_nWE}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {UART_TXD}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {UART_TXD}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  6.000 [get_ports {USER_LED[0]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {USER_LED[0]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  6.000 [get_ports {USER_LED[1]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {USER_LED[1]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {VGA_B[0]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {VGA_B[0]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {VGA_B[1]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {VGA_B[1]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {VGA_B[2]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {VGA_B[2]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {VGA_B[3]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {VGA_B[3]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {VGA_G[0]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {VGA_G[0]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {VGA_G[1]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {VGA_G[1]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {VGA_G[2]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {VGA_G[2]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {VGA_G[3]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {VGA_G[3]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {VGA_HSYNC}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {VGA_HSYNC}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {VGA_R[0]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {VGA_R[0]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {VGA_R[1]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {VGA_R[1]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {VGA_R[2]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {VGA_R[2]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {VGA_R[3]}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {VGA_R[3]}]
set_output_delay -add_delay -max -clock [get_clocks {SYSCLK}]  21.000 [get_ports {VGA_VSYNC}]
set_output_delay -add_delay -min -clock [get_clocks {SYSCLK}]  0.000 [get_ports {VGA_VSYNC}]


#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous -group [get_clocks {SYSCLK}] -group [get_clocks {DBGCLK}] -group [get_clocks {SPICFGCLK}] -group [get_clocks {AUDSCLK}] -group [get_clocks {OSCCLK2}] -group [get_clocks {CFGCLK}] 


#**************************************************************
# Set False Path
#**************************************************************

set_false_path  -from  [get_clocks {AUDSCLK_MUX}]  -to  [get_clocks {AUDSCLK}]
set_false_path  -from  [get_clocks {OSCCLK0}]  -to  [get_clocks {AUDSCLK_MUX}]
set_false_path  -from  [get_clocks {AUDSCLK_MUX}]  -to  [get_clocks {OSCCLK0}]
set_false_path  -from  [get_clocks {OSCCLK0}]  -to  [get_clocks {SPICLCD}]
set_false_path  -from  [get_clocks {SPICLCD}]  -to  [get_clocks {OSCCLK0}]
set_false_path  -from  [get_clocks {OSCCLK0}]  -to  [get_clocks {I2CAUD}]
set_false_path  -from  [get_clocks {SYSCLK}]  -to  [get_clocks {AUDSCLK}]
set_false_path  -from  [get_clocks {SYSCLK}]  -to  [get_clocks {SPICFGCLK}]
set_false_path  -from  [get_clocks {AUDSCLK}]  -to  [get_clocks {SYSCLK}]
set_false_path  -from  [get_clocks {SPICFGCLK}]  -to  [get_clocks {SYSCLK}]
set_false_path -from [get_ports {CB_nPOR}] 
set_false_path -from [get_ports {CB_nRST}] 
set_false_path -from [get_ports {AUD_SDOUT}] -to [get_clocks {SYSCLK}]


#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************

set_max_delay -from [get_keepers {fpga_system:u_fpga_system|user_partition:u_user_partition|cmsdk_mcu_system:u_cmsdk_mcu_system|cmsdk_ahb_gpio:u_ahb_gpio_*|cmsdk_iop_gpio:u_iop_gpio|*}] -to [get_ports {EXP[5]}] 21.000
set_max_delay -from [get_keepers {fpga_system:u_fpga_system|user_partition:u_user_partition|cmsdk_mcu_system:u_cmsdk_mcu_system|cmsdk_ahb_gpio:u_ahb_gpio_*|cmsdk_iop_gpio:u_iop_gpio|*}] -to [get_ports {EXP[11]}] 21.000
set_max_delay -from [get_keepers {fpga_system:u_fpga_system|user_partition:u_user_partition|cmsdk_mcu_system:u_cmsdk_mcu_system|cmsdk_ahb_gpio:u_ahb_gpio_*|cmsdk_iop_gpio:u_iop_gpio|*}] -to [get_ports {EXP[19]}] 21.000
set_max_delay -from [get_keepers {fpga_system:u_fpga_system|user_partition:u_user_partition|cmsdk_mcu_system:u_cmsdk_mcu_system|cmsdk_ahb_gpio:u_ahb_gpio_*|cmsdk_iop_gpio:u_iop_gpio|*}] -to [get_ports {EXP[31]}] 21.000
set_max_delay -from [get_keepers {fpga_system:u_fpga_system|user_partition:u_user_partition|cmsdk_ahb_gpio:u_ahb_gpio_2|cmsdk_iop_gpio:u_iop_gpio|*}] -to [get_ports {EXP[44]}] 21.000
set_max_delay -to [get_ports {CLKOUT*}] 10.000
set_max_delay -to [get_ports {FPGA_CONFIG_nLRST}] 20.000


#**************************************************************
# Set Minimum Delay
#**************************************************************

set_min_delay -from [get_keepers {fpga_system:u_fpga_system|user_partition:u_user_partition|cmsdk_mcu_system:u_cmsdk_mcu_system|cmsdk_ahb_gpio:u_ahb_gpio_*|cmsdk_iop_gpio:u_iop_gpio|*}] -to [get_ports {EXP[5]}] -5.000
set_min_delay -from [get_keepers {fpga_system:u_fpga_system|user_partition:u_user_partition|cmsdk_mcu_system:u_cmsdk_mcu_system|cmsdk_ahb_gpio:u_ahb_gpio_*|cmsdk_iop_gpio:u_iop_gpio|*}] -to [get_ports {EXP[11]}] -5.000
set_min_delay -from [get_keepers {fpga_system:u_fpga_system|user_partition:u_user_partition|cmsdk_mcu_system:u_cmsdk_mcu_system|cmsdk_ahb_gpio:u_ahb_gpio_*|cmsdk_iop_gpio:u_iop_gpio|*}] -to [get_ports {EXP[19]}] -5.000
set_min_delay -from [get_keepers {fpga_system:u_fpga_system|user_partition:u_user_partition|cmsdk_mcu_system:u_cmsdk_mcu_system|cmsdk_ahb_gpio:u_ahb_gpio_*|cmsdk_iop_gpio:u_iop_gpio|*}] -to [get_ports {EXP[31]}] -5.000
set_min_delay -from [get_keepers {fpga_system:u_fpga_system|user_partition:u_user_partition|cmsdk_ahb_gpio:u_ahb_gpio_2|cmsdk_iop_gpio:u_iop_gpio|*}] -to [get_ports {EXP[44]}] -5.000
set_min_delay -to [get_ports {CLKOUT*}] 2.000
set_min_delay -to [get_ports {FPGA_CONFIG_nLRST}] 2.000


#**************************************************************
# Set Input Transition
#**************************************************************

