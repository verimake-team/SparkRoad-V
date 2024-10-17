onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test_camera_tb/uut/clk_24m
add wave -noupdate /test_camera_tb/uut/clk_div
add wave -noupdate /test_camera_tb/uut/conv1_data_in
add wave -noupdate /test_camera_tb/uut/conv1_raddr
add wave -noupdate /test_camera_tb/uut/conv1_waddr
add wave -noupdate /test_camera_tb/uut/conv1_data_out
add wave -noupdate /test_camera_tb/uut/conv1_busy
add wave -noupdate /test_camera_tb/uut/pool1_data_in
add wave -noupdate /test_camera_tb/uut/pool1_raddr
add wave -noupdate /test_camera_tb/uut/pool1_waddr
add wave -noupdate /test_camera_tb/uut/pool1_data_out
add wave -noupdate /test_camera_tb/uut/pool1_ren
add wave -noupdate /test_camera_tb/uut/conv2_data_in
add wave -noupdate /test_camera_tb/uut/conv2_raddr
add wave -noupdate /test_camera_tb/uut/conv2_waddr
add wave -noupdate /test_camera_tb/uut/conv2_data_out
add wave -noupdate /test_camera_tb/uut/conv2_busy
add wave -noupdate /test_camera_tb/uut/pool2_data_in
add wave -noupdate /test_camera_tb/uut/pool2_raddr
add wave -noupdate /test_camera_tb/uut/pool2_ren
add wave -noupdate /test_camera_tb/uut/pool2_waddr
add wave -noupdate /test_camera_tb/uut/pool2_data_out
add wave -noupdate /test_camera_tb/uut/fc_data_in
add wave -noupdate /test_camera_tb/uut/fc_data_out
add wave -noupdate /test_camera_tb/uut/fc_raddr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {99999999200 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 393
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 fs} {900 fs}
