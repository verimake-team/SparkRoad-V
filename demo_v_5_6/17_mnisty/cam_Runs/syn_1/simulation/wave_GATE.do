onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group 1 /test_camera_tb/uut/conv1_raddr
add wave -noupdate -expand -group 1 /test_camera_tb/uut/conv1_data_in
add wave -noupdate -expand -group 1 /test_camera_tb/uut/conv1_waddr
add wave -noupdate -expand -group 1 /test_camera_tb/uut/conv1_data_out
add wave -noupdate -expand -group 2 /test_camera_tb/uut/pool1_raddr
add wave -noupdate -expand -group 2 /test_camera_tb/uut/pool1_data_in
add wave -noupdate -expand -group 2 /test_camera_tb/uut/pool1_waddr
add wave -noupdate -expand -group 2 /test_camera_tb/uut/pool1_data_out
add wave -noupdate -expand -group 3 /test_camera_tb/uut/conv2_raddr
add wave -noupdate -expand -group 3 /test_camera_tb/uut/conv2_data_in
add wave -noupdate -expand -group 3 /test_camera_tb/uut/conv2_waddr
add wave -noupdate -expand -group 3 /test_camera_tb/uut/conv2_data_out
add wave -noupdate -expand -group 4 /test_camera_tb/uut/pool2_raddr
add wave -noupdate -expand -group 4 /test_camera_tb/uut/pool2_data_in
add wave -noupdate -expand -group 4 /test_camera_tb/uut/pool2_waddr
add wave -noupdate -expand -group 4 /test_camera_tb/uut/pool2_data_out
add wave -noupdate -expand -group 5 /test_camera_tb/uut/fc_raddr
add wave -noupdate -expand -group 5 /test_camera_tb/uut/fc_data_in
add wave -noupdate -expand -group 5 /test_camera_tb/uut/fc_data_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {99999999300 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 233
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {99999999100 fs} {100000000100 fs}
