#
# Create work library
#
vlib work
#
# Compile sources
#
vlog  C:/Users/VeriMake_C1/Desktop/lyj/mnisty/cam_Runs/phy_1/simulation/cam_phy_sim.v
vlog  C:/Users/VeriMake_C1/Desktop/lyj/mnisty/cam_Runs/phy_1/simulation/test_camera_tb.v
#
# Call vsim to invoke simulator
#
vsim -L C:/Anlogic/TD5.6.2/sim_release/sf1 -gui -novopt work.test_camera_tb
#
# Add waves
#
add wave *
#
# Run simulation
#
run 100000ns
#
# End