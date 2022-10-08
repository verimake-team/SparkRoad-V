#
# Create work library
#
vlib work
#
# Compile sources
#
vlog  D:/WorkPlace/TD/EG4A20BG256_DEMO/VGA_Demo/simulation/VGA_Demo_tb.v
#
# Call vsim to invoke simulator
#
vsim -L D:/WorkPlace/TD/EG4A20BG256_DEMO/VGA_Demo/simulation -gui -novopt work.VGA_Demo_tb
#
# Add waves
#
add wave *
#
# Run simulation
#
run 1000ns
#
# End