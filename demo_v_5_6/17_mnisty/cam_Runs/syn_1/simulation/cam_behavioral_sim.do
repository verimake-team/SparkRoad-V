#
# Create work library
#
vlib work
#
# Compile sources
#
vlog  C:/Users/VeriMake_C1/Desktop/lyj/mnisty/sources/rtl/test_camera.v
vlog  C:/Users/VeriMake_C1/Desktop/lyj/mnisty/sources/rtl/conv1.v
vlog  C:/Users/VeriMake_C1/Desktop/lyj/mnisty/sources/rtl/conv2.v
vlog  C:/Users/VeriMake_C1/Desktop/lyj/mnisty/al_ip/ram_accum.v
vlog  C:/Users/VeriMake_C1/Desktop/lyj/mnisty/sources/rtl/fc1.v
vlog  C:/Users/VeriMake_C1/Desktop/lyj/mnisty/al_ip/ip_pll.v
vlog  C:/Users/VeriMake_C1/Desktop/lyj/mnisty/sources/rtl/pool1.v
vlog  C:/Users/VeriMake_C1/Desktop/lyj/mnisty/sources/rtl/pool2.v
vlog  C:/Users/VeriMake_C1/Desktop/lyj/mnisty/al_ip/ram_12x12x3.v
vlog  C:/Users/VeriMake_C1/Desktop/lyj/mnisty/al_ip/ram_24x24x3.v
vlog  C:/Users/VeriMake_C1/Desktop/lyj/mnisty/al_ip/ram_28x28.v
vlog  C:/Users/VeriMake_C1/Desktop/lyj/mnisty/al_ip/ram_4x4x3.v
vlog  C:/Users/VeriMake_C1/Desktop/lyj/mnisty/al_ip/ram_8x8x3.v
vlog  C:/Users/VeriMake_C1/Desktop/lyj/mnisty/sources/rtl/lcd_sync.v
vlog  C:/Users/VeriMake_C1/Desktop/lyj/mnisty/cam_Runs/syn_1/simulation/test_camera_tb.v
#
# Call vsim to invoke simulator
#
vsim -L C:/Anlogic/TD5.6.2/sim_release/eg C:/Anlogic/TD5.6.2/sim_release/common -gui -novopt work.test_camera_tb
#
# Add waves
#
do wave.do
#
# Run simulation
#
run 100000ns
#
# End