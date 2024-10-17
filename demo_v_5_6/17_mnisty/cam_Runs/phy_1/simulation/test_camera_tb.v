// Verilog testbench created by TD v5.6.71036
// 2024-08-15 19:55:48

`timescale 1ns / 1ns

module test_camera_tb();

reg [7:0] cam_data;
reg cam_href;
reg cam_pclk;
reg cam_vsync;
reg clk_24m;
reg rst_n;
wire [7:0] a_data_out;
wire cam_pwdn;
wire cam_rst;
wire cam_soic;
wire cam_xclk;
wire [3:0] select_a;
wire [7:0] vga_b;
wire vga_clk;
wire [7:0] vga_g;
wire vga_hsync;
wire [7:0] vga_r;
wire vga_vsync;
wire cam_soid;

//Clock process
parameter PERIOD = 10;
always #(PERIOD/2) clk_24m = clk_24m;

//glbl Instantiate
glbl glbl();

//Unit Instantiate
test_camera uut(
	.cam_data(cam_data),
	.cam_href(cam_href),
	.cam_pclk(cam_pclk),
	.cam_vsync(cam_vsync),
	.clk_24m(clk_24m),
	.rst_n(rst_n),
	.a_data_out(a_data_out),
	.cam_pwdn(cam_pwdn),
	.cam_rst(cam_rst),
	.cam_soic(cam_soic),
	.cam_xclk(cam_xclk),
	.select_a(select_a),
	.vga_b(vga_b),
	.vga_clk(vga_clk),
	.vga_g(vga_g),
	.vga_hsync(vga_hsync),
	.vga_r(vga_r),
	.vga_vsync(vga_vsync),
	.cam_soid(cam_soid)
);

//Stimulus process
initial begin
	clk_24m = 0;
  	rst_n = 0;
  	#15;
  	rst_n = 1;
end

endmodule