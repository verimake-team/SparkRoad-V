#
# Create work library
#
vlib work
#
# Compile sources
#
vlog  E:/DEMO/EG4S20BG256_DEMO/uart_r_ram/uart/simulation/uart_rtl_sim.v
vlog  E:/DEMO/EG4S20BG256_DEMO/uart_r_ram/uart/simulation/uart_top_tb.v
#
# Call vsim to invoke simulator
#
vsim -L E:/DEMO/EG4S20BG256_DEMO/uart_r_ram/uart/simulation -gui -novopt work.uart_top_tb
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