#
# Create work library
#
vlib work
#
# Compile sources
#
vlog  C:/Users/VeriMake_C1/Desktop/lyj/mnisty/cam_Runs/syn_1/simulation/cam_gate_sim.v
vlog  C:/Users/VeriMake_C1/Desktop/lyj/mnisty/cam_Runs/syn_1/simulation/test_camera_tb.v
#
# Call vsim to invoke simulator
#
vsim -L C:/Anlogic/TD5.6.2/sim_release/eg -L C:/Anlogic/TD5.6.2/sim_release/common -gui -novopt work.test_camera_tb
#
# Add waves
#
do wave_GATE.do
#
# Run simulation
#
run 300000ns
#
# End