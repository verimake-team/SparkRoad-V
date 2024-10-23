set clkw [get_clocks -nowarn -of [get_ports {clkw}]]
set clkr [get_clocks -nowarn -of [get_ports {clkr}]]

set wr_clk_period [get_property -nowarn -max PERIOD $clkw]
set rd_clk_period [get_property -nowarn -max PERIOD $clkr]

set dly_sly_slack 0.3

if { $clkw =="" } { 
    set wr_clk_period 1000 
}

if { $clkr =="" } {
    set rd_clk_period 1001
}

set_max_delay -from [get_regs -nowarn {*/primary_addr_gray_reg[*]}] -to [get_regs -nowarn {*/sync_r1[*]}] [expr min($wr_clk_period,$rd_clk_period) - $dly_sly_slack] -nowarn -datapath_only