



# Clock constraints

create_clock -name "clkin" -period 41.6 [get_ports {CLKIN}] -waveform {0 20.8}

create_clock -name "sd_clk" -period 5 [get_nets {clk_200m}] -waveform {0 2.5}

create_clock -name "sd_clk1" -period 5 [get_nets {sd_clk_int}] -waveform {0 2.5}


# tsu/th constraints

# tco constraints

# tpd constraints

