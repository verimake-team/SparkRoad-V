`timescale 1ns/ 1ps
// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// 
// AuTHor: Anlogic
// 
// Description:
//
//		dvp_ov2640,摄像头VGA配置
// 
// Web: www.anlogic.com
// --------------------------------------------------------------------
module lcd_sync
(
	input 	wire 		clk,
	input 	wire 		rest_n,
	output 	wire 		lcd_clk,
	output 	wire 		lcd_pwm,
	output 	wire 		lcd_hsync, 
	output 	wire 		lcd_vsync, 
	output 	wire 		lcd_de,
	output 	wire [10:0] hsync_cnt,
	output 	wire [10:0] vsync_cnt,
	output  wire [6:0 ]	img_sel,
	output 	wire [15:0]	addr
	);
  
//640*480
localparam IMG0_W = 112;
localparam IMG0_H = 112;
localparam IMG0_X = 10;
localparam IMG0_Y = 10;

localparam IMG1_W = 28;
localparam IMG1_H = 28;
localparam IMG1_X = 190;
localparam IMG1_Y = 30;

localparam IMG2_W = 24;
localparam IMG2_H = 72;
localparam IMG2_X = 270;
localparam IMG2_Y = 10;

localparam IMG3_W = 12;
localparam IMG3_H = 36;
localparam IMG3_X = 330;
localparam IMG3_Y = 10;

localparam IMG4_W = 8;
localparam IMG4_H = 24;
localparam IMG4_X = 390;
localparam IMG4_Y = 30;

localparam IMG5_W = 4;
localparam IMG5_H = 12;
localparam IMG5_X = 450;
localparam IMG5_Y = 30;

localparam IMG6_W = 5;
localparam IMG6_H = 5;
localparam IMG6_X = 40;
localparam IMG6_Y = 150;


localparam VGA_H = 640;  
localparam VGA_V = 480; 

localparam THB 	 = 160;
localparam TH 	 = VGA_H + THB;

localparam TVB   = 45;
localparam TV    = VGA_V + TVB;

reg [10:0] counter_hs;
reg [10:0] counter_vs;

reg [15:0] read_addr;             //读图片数据rom地址   

reg [10:0] img_hbegin = 0;   //图片左上角第一个像素点在VGA的行向坐标
reg [10:0] img_vbegin = 0;   //图片左上角第一个像素点在VGA的场向坐标

always@(posedge clk or negedge rest_n)
begin
	if(rest_n == 1'b0)
		counter_hs <= 0;
	else if(counter_hs == TH )
		counter_hs <= 0;
	else
		counter_hs <= counter_hs + 1;
end

always@(posedge clk or negedge rest_n)
begin
	if(rest_n == 1'b0)
		counter_vs <= 0;
	else if(counter_hs == TH && counter_vs == TV)				
		counter_vs <= 0;
	else if(counter_hs == TH && counter_vs != TV)
		counter_vs <= counter_vs + 1;
end

assign lcd_clk   = (rest_n == 1) ? clk  : 1'b0;
assign lcd_pwm   = (rest_n == 1) ? 1'b1 : 1'b0;
assign lcd_hsync = ( counter_hs >= 16 && counter_hs < 112 ) ? 1 : 0;
assign lcd_vsync = ( counter_vs >= 10 && counter_vs < 12 ) ? 1 : 0;
assign lcd_de    = ( counter_hs >= THB && counter_hs <= TH && counter_vs >= TVB  && counter_vs < TV) ? 1 : 0;
assign hsync_cnt = counter_hs;
assign vsync_cnt = counter_vs;

assign img_sel[0] = lcd_de &&
((counter_hs - THB) >= IMG0_X && (counter_hs - THB) < (IMG0_X + IMG0_W)) && 
((counter_vs - TVB) >= IMG0_Y && (counter_vs - TVB) < (IMG0_Y + IMG0_H)) ? 1'b1 : 1'b0;

assign img_sel[1] = lcd_de &&
((counter_hs - THB) >= IMG1_X && (counter_hs - THB) < (IMG1_X + 2*IMG1_W)) && 
((counter_vs - TVB) >= IMG1_Y && (counter_vs - TVB) < (IMG1_Y + 2*IMG1_H)) ? 1'b1 : 1'b0;

assign img_sel[2] = lcd_de &&
((counter_hs - THB) >= IMG2_X && (counter_hs - THB) < (IMG2_X + 2*IMG2_W)) && 
((counter_vs - TVB) >= IMG2_Y && (counter_vs - TVB) < (IMG2_Y + 2*IMG2_H)) ? 1'b1 : 1'b0;

assign img_sel[3] = lcd_de &&
((counter_hs - THB) >= IMG3_X && (counter_hs - THB) < (IMG3_X + 4*IMG3_W)) && 
((counter_vs - TVB) >= IMG3_Y && (counter_vs - TVB) < (IMG3_Y + 4*IMG3_H)) ? 1'b1 : 1'b0;

assign img_sel[4] = lcd_de &&
((counter_hs - THB) >= IMG4_X && (counter_hs - THB) < (IMG4_X + 4*IMG4_W)) && 
((counter_vs - TVB) >= IMG4_Y && (counter_vs - TVB) < (IMG4_Y + 4*IMG4_H)) ? 1'b1 : 1'b0;
               
assign img_sel[5] = lcd_de &&
((counter_hs - THB) >= IMG5_X && (counter_hs - THB) < (IMG5_X + 8*IMG5_W)) && 
((counter_vs - TVB) >= IMG5_Y && (counter_vs - TVB) < (IMG5_Y + 8*IMG5_H)) ? 1'b1 : 1'b0;

assign img_sel[6] = lcd_de &&
((counter_hs - THB) >= IMG6_X && (counter_hs - THB) < (IMG6_X + 8*IMG6_W)) && 
((counter_vs - TVB) >= IMG6_Y && (counter_vs - TVB) < (IMG6_Y + 8*IMG6_H)) ? 1'b1 : 1'b0;

assign addr = read_addr;



always@(posedge clk or negedge rest_n) begin
	if(!rest_n)
    	read_addr <= 16'd0;
    else
    	case(img_sel)
        	7'b0000001: read_addr <= ((counter_hs - IMG0_X - THB)) + ((counter_vs - IMG0_Y - TVB)) * IMG0_W;
        	7'b0000010: read_addr <= ((counter_hs - IMG1_X - THB)>>1) + ((counter_vs - IMG1_Y - TVB)>>1) * IMG1_W;
            7'b0000100: read_addr <= ((counter_hs - IMG2_X - THB)>>1) + ((counter_vs - IMG2_Y - TVB)>>1) * IMG2_W;
            7'b0001000: read_addr <= ((counter_hs - IMG3_X - THB)>>2) + ((counter_vs - IMG3_Y - TVB)>>2) * IMG3_W;
            7'b0010000: read_addr <= ((counter_hs - IMG4_X - THB)>>2) + ((counter_vs - IMG4_Y - TVB)>>2) * IMG4_W;
            7'b0100000: read_addr <= ((counter_hs - IMG5_X - THB)>>3) + ((counter_vs - IMG5_Y - TVB)>>3) * IMG5_W;
            7'b1000000: read_addr <= ((counter_hs - IMG6_X - THB)>>3) + ((counter_vs - IMG6_Y - TVB)>>3) * IMG6_W;
           	default: read_addr <= 16'd0;
		endcase
    end
endmodule
