# -----------------------------------------------------------------------------
# The confidential and proprietary information contained in this file may
# only be used by a person authorised under and to the extent permitted
# by a subsisting licensing agreement from ARM Limited.
#
#            (C) COPYRIGHT 2010-2015 ARM Limited.
#                ALL RIGHTS RESERVED
#
# This entire notice must be reproduced on all copies of this file
# and copies of this file may only be made by a person if such person is
# permitted to do so under the terms of a subsisting license agreement
# from ARM Limited.
#
#      SVN Information
#
#      Checked In          : $Date: 2017-08-11 14:44:16 +0100 (Fri, 11 Aug 2017) $
#
#      Revision            : $Revision: 369125 $
#
#      Release Information : 
# -----------------------------------------------------------------------------
#
# Setup script for VCS
# This script has 3 main functions.
# 1.  Force address bus to 0, run for 1us, release address bus.  This removes warnings
#     from the memories regarding X indexing their arrays.
# 2.  Preload the SSRAM1 bank with the code from the generated hex files
# 3.  Force the zbt_boot_ctrl to be active so that the code is run from the 
#     preloaded SSRAM1 bank above
#
# -----------------------------------------------------------------------------
#

# At the start of simulation, due to the memory bus being X, most memories
# issue a warning.  To clean this up, force the bus to 0, run the sim for 1us
# so that the reset has seen a clock cycle, then remove the force and allow
# the simulation to run normally.
# Path list of all the memory indicies that are unknown at the start of simulation
set addr_list [list \
  tb_fpga/u_fpga_top/u_fpga_system/u_user_partition/u_cmsdk_mcu_system/cm0_haddr \
  tb_fpga/u_fpga_top/u_fpga_system/u_user_partition/u_ahb_blockram_32/reg_haddr \
  tb_fpga/uSSRAM1A/raddr \
  tb_fpga/uSSRAM1B/raddr \
  tb_fpga/uSSRAM2/raddr \
  tb_fpga/uSSRAM3/raddr \
  tb_fpga/u_fpga_top/u_fpga_system/u_user_partition/u_ahbvga/u_vga_console/u_video_ram/addr_a_reg \
  tb_fpga/u_fpga_top/u_fpga_system/u_user_partition/u_ahbvga/u_vga_console/u_video_ram/addr_b_reg \
  tb_fpga/u_fpga_top/u_fpga_system/u_user_partition/u_ahbvga/u_vga_image/u_image_ram/addr_a_reg \
  tb_fpga/u_fpga_top/u_fpga_system/u_user_partition/u_ahbvga/u_vga_image/u_image_ram/addr_b_reg \
]

# Tie them all inactive, run the simulation for a few clock cycles
# then release
foreach addr $addr_list { force $addr 0 }
run 1us
foreach addr $addr_list { release $addr }

# Preload ZBT memories, (SSRAM1)
# In the MPS2 board, this is done by the microcontroller before it releases
# the CPU reset.
# If this was modelled in simulation, then simulation times would increase
# significantly.  So in order to save simulation time, the memories are preloaded.
memory -read tb_fpga/uSSRAM1A/bank0 -file itcm0.hex -radix hex 
memory -read tb_fpga/uSSRAM1A/bank1 -file itcm1.hex -radix hex 
memory -read tb_fpga/uSSRAM1A/bank2 -file itcm2.hex -radix hex 
memory -read tb_fpga/uSSRAM1A/bank3 -file itcm3.hex -radix hex 
                                     
memory -read tb_fpga/uSSRAM1B/bank0 -file itcm4.hex -radix hex 
memory -read tb_fpga/uSSRAM1B/bank1 -file itcm5.hex -radix hex 
memory -read tb_fpga/uSSRAM1B/bank2 -file itcm6.hex -radix hex 
memory -read tb_fpga/uSSRAM1B/bank3 -file itcm7.hex -radix hex 

# Preload ZBT memories, (SSRAM2 and 3) to avoid X in read data
memory -read tb_fpga/uSSRAM2/bank0 -fill 0
memory -read tb_fpga/uSSRAM2/bank1 -fill 0
memory -read tb_fpga/uSSRAM2/bank2 -fill 0
memory -read tb_fpga/uSSRAM2/bank3 -fill 0

memory -read tb_fpga/uSSRAM3/bank0 -fill 0
memory -read tb_fpga/uSSRAM3/bank1 -fill 0
memory -read tb_fpga/uSSRAM3/bank2 -fill 0
memory -read tb_fpga/uSSRAM3/bank3 -fill 0

# Force zbt_boot_ctrl to be active, this makes code execute from the SSRAM
# as it does on the MPS2 board
force tb_fpga/u_fpga_top/u_fpga_system/u_user_partition/zbt_boot_ctrl 1

# ------------
# End of setup
# ------------

# Other commands below here
