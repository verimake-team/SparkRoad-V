
`timescale 1ns/ 1ps
// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// 
// Author: Anlogic
// 
// Description:
//
//		dvp_ov2640,摄像头VGA显示
// 
// Web: www.anlogic.com
// --------------------------------------------------------------------
module top_module
(
	input 	wire 		clk_24m,	//系统时钟
	input 	wire 		rst_n,		//复位
	//camera	
	input 	wire 		cam_pclk,	//像素时钟
	output 	wire 		cam_xclk,	//系统时钟
	input 	wire 		cam_href,	//行同
	input 	wire 		cam_vsync,	//帧同
	output 	wire 		cam_pwdn,	//模式
	output 	wire 		cam_rst,	//复位
	output 	wire 		cam_soic,	//SCCB
	inout 	wire 		cam_soid,	//SCCB
	input 	wire [7:0]	cam_data,	//
	//vga
	output 	wire [7:0] 	vga_r,
	output 	wire [7:0] 	vga_g,
	output 	wire [7:0] 	vga_b,
	output 	wire 		vga_clk,
	output 	wire 		vga_hsync,
	output 	wire 		vga_vsync,
	//数码管
    output 	reg  [3:0]  select_a,
    output 	reg	 [7:0] 	a_data_out
 );
	 
wire 		clk_lcd;
wire 		clk_cam;
wire 		clk_sccb;

wire        camera_wrreq;
wire        camera_wclk;
wire [15:0] camera_wrdat;
wire [19:0] camera_addr;

reg 		init_state;
wire 		init_ready;
wire 		sda_oe;
wire 		sda;
wire 		sda_in;
wire 		scl;

//lcd display
wire [10:0] hsync_cnt;
wire [10:0] vsync_cnt;
wire 		vga_rden;
wire [6:0 ] img_sel;

reg  [7:0]	vga_rddat;	//lcd read
wire [15:0]	vga_rdaddr;

wire [7:0] vga_rddat0, vga_rddat1, vga_rddat2, vga_rddat3, vga_rddat4, vga_rddat5, vga_rddat6;

assign cam_soid = (sda_oe == 1'b1) ? sda : 1'bz;
assign sda_in 	= cam_soid;
assign cam_soic = scl;
assign cam_pwdn = 1'b0;
assign cam_rst 	= rst_n;

//vga rgb565 mode
assign vga_rden = |img_sel;   //缩位或

always@(*)
	case(img_sel)
    	7'b0000001: vga_rddat = vga_rddat0;
   		7'b0000010: vga_rddat = vga_rddat1;
        7'b0000100: vga_rddat = vga_rddat2;
        7'b0001000: vga_rddat = vga_rddat3;
        7'b0010000: vga_rddat = vga_rddat4;
        7'b0100000: vga_rddat = vga_rddat5;
        7'b1000000: vga_rddat = vga_rddat6;
        default: vga_rddat <= 7'd0;
	endcase
    
assign vga_r[7:0] 	= vga_rden ? vga_rddat : 8'h0;
assign vga_g[7:0] 	= vga_rden ? vga_rddat : 8'h0;
assign vga_b[7:0] 	= vga_rden ? vga_rddat : 8'h0;




wire vga_den;
wire vga_pwm;	//backlight,set to high
ip_pll u_pll(
	.refclk(clk_24m),		//24M
	.clk0_out(clk_lcd),		//25M,VGA clk
	.clk1_out(clk_cam),		//12m,for cam xclk
	.clk2_out(clk_sccb)		//4m,for sccb init
);

camera_init u_camera_init
(
	.clk(clk_sccb),
	.reset_n(rst_n),
	.ready(init_ready),
	.sda_oe(sda_oe),
	.sda(sda),
	.sda_in(sda_in),
	.scl(scl)
);
	
lcd_sync u_vga_sync
(
	.clk		(clk_lcd	),
	.rest_n		(rst_n		),
	.lcd_clk	(vga_clk	),
	.lcd_pwm	(vga_pwm	),
	.lcd_hsync	(vga_hsync	), 
	.lcd_vsync	(vga_vsync	), 
	.lcd_de		(vga_den	),
	.hsync_cnt	(hsync_cnt	),
	.vsync_cnt	(vsync_cnt	),
	.img_sel	(img_sel    ),
	.addr		(vga_rdaddr	)
);

camera_reader u_camera_reader
(
	.clk		(clk_cam		),
	.reset_n	(rst_n			),
	.csi_xclk	(cam_xclk		),
	.csi_pclk	(cam_pclk		),
	.csi_data	(cam_data		),
	.csi_vsync	(!cam_vsync		),
	.csi_hsync	(cam_href		),
	.data_out	(camera_wrdat	),
	.wrreq		(camera_wrreq	),
	.wrclk		(camera_wclk	),
	.wraddr		(camera_addr	)
);

wire [7:0]		prepool_data_in;    
wire [13:0]  	prepool_raddr;	
wire        	prepool_ren;		
wire [9:0] 		prepool_waddr;		
wire        	prepool_wen;		
wire [7:0] 		prepool_data_out;	

reg [22:0] clk_cnt;
wire clk_div;

always @(posedge clk_24m or negedge rst_n) begin
	if(!rst_n)
    	clk_cnt <= 1;
    else
		clk_cnt <= clk_cnt + 1;
end
assign clk_div = clk_cnt[12];



img_cache u_imglcd  
( 
	//write 45000*8
	.dia		(camera_wrdat	), 
	.addra		(camera_addr    ), 
	.cea		(camera_wrreq	), 
	.clka		(camera_wclk	),

	//read 22500*16
	.dob		(vga_rddat0		), 
	.addrb		(vga_rdaddr		), 
	.ceb		(vga_rden		),
	.clkb		(clk_lcd		)
);

img_cache u_img  
( 
	//write 45000*8
	.dia		(camera_wrdat	), 
	.addra		(camera_addr    ), 
	.cea		(camera_wrreq	), 
	.clka		(camera_wclk	),

	//read 22500*16
	.dob		(prepool_data_in), 
	.addrb		(prepool_raddr	), 
	.ceb		(prepool_ren	),
	.clkb		(clk_24m		)
);



pre_pool u_prepool1(
	.clk           	( clk_24m        ),
	.rst_n         	( rst_n          ),
	.upstream_busy 	( clk_div        ),  
	.data_in       	( prepool_data_in  ),
	.raddr         	( prepool_raddr    ),
	.ren           	( prepool_ren      ),
	.waddr         	( prepool_waddr    ),
	.wen           	( prepool_wen      ),
	.data_out      	( prepool_data_out )
);


wire [7:0]		conv1_data_in;		
wire [9:0]  	conv1_raddr;		
wire        	conv1_ren;		
wire [10:0] 	conv1_waddr;		
wire        	conv1_wen;			
wire [11:0] 	conv1_data_out;		
wire 			conv1_busy;			






ram_28x28 u_ram_28x28lcd(
	.dia   		(prepool_data_out),
	.addra 		(prepool_waddr  ),
	.cea  	 	(prepool_wen    ),
	.clka  		(clk_24m 		),

	.dob		(vga_rddat1  	), 
	.addrb		(vga_rdaddr		), 
	.ceb		(img_sel[1]		),
	.clkb		(clk_lcd		)
	//.rstb		(!rst_n			)
);

ram_28x28 u_ram_28x28(
	.dia   		(prepool_data_out),
	.addra 		(prepool_waddr  ),
	.cea  	 	(prepool_wen    ),
	.clka  		(clk_24m 		),

	.dob		(conv1_data_in 	), 
	.addrb		(conv1_raddr	), 
	.ceb		(conv1_ren		),
	.clkb		(clk_24m		)
	//.rstb		(!rst_n			)
    

);

conv1 u_conv1(
	.clk           	( clk_24m        ),
	.rst_n         	( rst_n          ),
	.upstream_busy 	( clk_div        ),
	.data_in       	( conv1_data_in  ),
	.raddr         	( conv1_raddr    ),
	.ren           	( conv1_ren      ),
	.waddr         	( conv1_waddr    ),
	.wen           	( conv1_wen      ),
	.data_out      	( conv1_data_out ),
    .busy			( conv1_busy 	 )
);

wire [4:0] nc;

wire [11:0]		pool1_data_in;   
wire [10:0]  	pool1_raddr;	
wire        	pool1_ren;		
wire [8:0] 		pool1_waddr;	
wire        	pool1_wen;	
wire [11:0] 	pool1_data_out;	


ram_24x24x3 u_ram_24x24x3lcd(
	.dia   		(conv1_data_out ),
	.addra 		(conv1_waddr    ),
	.cea  	 	(conv1_wen      ),
	.clka  		(clk_24m        ),

	.dob		(vga_rddat2     ), 
	.addrb		(vga_rdaddr		), 
	.ceb		(img_sel[2]		),
	.clkb		(clk_lcd		)
);

ram_24x24x3 u_ram_24x24x3(
	.dia   		(conv1_data_out ),
	.addra 		(conv1_waddr    ),
	.cea  	 	(conv1_wen      ),
	.clka  		(clk_24m        ),

    
	.dob		(pool1_data_in  ), 
	.addrb		(pool1_raddr	), 
	.ceb		(pool1_ren		),
	.clkb		(clk_24m		)
	//.rstb		(!rst_n			)
);

pool1 u_pool1(
	.clk           	( clk_24m        ),
	.rst_n         	( rst_n          ),
	.upstream_busy 	( conv1_busy     ),  //这里conv1 busy 不行 还不知道原因
	.data_in       	( pool1_data_in  ),
	.raddr         	( pool1_raddr    ),
	.ren           	( pool1_ren      ),
	.waddr         	( pool1_waddr    ),
	.wen           	( pool1_wen      ),
	.data_out      	( pool1_data_out )
);

wire [11:0]		conv2_data_in;			
wire [8:0]  	conv2_raddr;			
wire        	conv2_ren;				
wire [7:0] 		conv2_waddr;			
wire        	conv2_wen;			
wire [11:0] 	conv2_data_out;	
wire 			conv2_busy;				

ram_12x12x3 u_ram_12x12x3lcd(
	.dia   		(pool1_data_out ),
	.addra 		(pool1_waddr    ),
	.cea  	 	(pool1_wen      ),
	.clka  		(clk_24m        ),

	.dob		(vga_rddat3	    ), 
	.addrb		(vga_rdaddr 	), 
	.ceb		(img_sel[3]		),
	.clkb		(clk_lcd		)
	//.rstb		(!rst_n			)
);

ram_12x12x3 u_ram_12x12x3(
	.dia   		(pool1_data_out ),
	.addra 		(pool1_waddr    ),
	.cea  	 	(pool1_wen      ),
	.clka  		(clk_24m        ),

	.dob		(conv2_data_in ), 
	.addrb		(conv2_raddr	), 
	.ceb		(conv2_ren		),
	.clkb		(clk_24m		)
	//.rstb		(!rst_n			)
);


conv2 u_conv2(
	.clk           	( clk_24m        ),
	.rst_n         	( rst_n          ),
	.upstream_busy 	( pool1_ren      ),
	.data_in       	( conv2_data_in  ),
	.raddr         	( conv2_raddr    ),
	.ren           	( conv2_ren      ),
	.waddr         	( conv2_waddr    ),
	.wen           	( conv2_wen      ),
	.data_out      	( conv2_data_out ),
    .busy			( conv2_busy 	 )
);

wire [11:0]		pool2_data_in;		
wire [7:0]  	pool2_raddr;		
wire        	pool2_ren;			
wire [5:0] 		pool2_waddr;		
wire        	pool2_wen;			
wire [11:0] 	pool2_data_out;		

ram_8x8x3 u_ram_8x8x3lcd(
	.dia   		(conv2_data_out ),
	.addra 		(conv2_waddr    ),
	.cea  	 	(conv2_wen      ),
	.clka  		(clk_24m        ),

	.dob		(vga_rddat4	    ), 
	.addrb		(vga_rdaddr 	), 
	.ceb		(img_sel[4]		),
	.clkb		(clk_lcd		)
	//.rstb		(!rst_n			)
);

ram_8x8x3 u_ram_8x8x3(
	.dia   		(conv2_data_out ),
	.addra 		(conv2_waddr    ),
	.cea  	 	(conv2_wen      ),
	.clka  		(clk_24m        ),

	.dob		(pool2_data_in	), 
	.addrb		(pool2_raddr		), 
	.ceb		(pool2_ren		),
	.clkb		(clk_24m		)
	//.rstb		(!rst_n			)

);



pool2 u_pool2(
	.clk           	( clk_24m        ),
	.rst_n         	( rst_n          ),
	.upstream_busy 	( conv2_busy     ),  //这里conv1 busy 不行 还不知道原因
	.data_in       	( pool2_data_in  ),
	.raddr         	( pool2_raddr    ),
	.ren           	( pool2_ren      ),
	.waddr         	( pool2_waddr    ),
	.wen           	( pool2_wen      ),
	.data_out      	( pool2_data_out )
);


wire [11:0]     fc_data_in;		
wire [3:0]  	fc_data_out;	
wire [5:0]  	fc_raddr;		
wire        	read_flag;		
wire        	reset_n;		



ram_4x4x3 u_ram_4x4x3lcd(
	.dia   		(pool2_data_out ),
	.addra 		(pool2_waddr    ),
	.cea  	 	(pool2_wen      ),
	.clka  		(clk_24m        ),

	.dob		(vga_rddat5		), 
	.addrb		(vga_rdaddr		), 
	.ceb		(img_sel[5]		),
	.clkb		(clk_lcd		)
	//.rstb		(!rst_n			)
);

ram_4x4x3 u_ram_4x4x3(
	.dia   		(pool2_data_out ),
	.addra 		(pool2_waddr    ),
	.cea  	 	(pool2_wen      ),
	.clka  		(clk_24m        ),

	.dob		(fc_data_in	), 
	.addrb		(fc_raddr		), 
	.ceb		(read_flag		),
	.clkb		(clk_24m		)
	//.rstb		(!rst_n			)
);



fc u_fc(
	.clk       	( clk_24m        ),
	.rst_n     	( rst_n         ),
	.layer_ren 	( pool2_ren     ),
	.data_in   	( fc_data_in    ),
	.data_out  	( fc_data_out   ),
	.raddr     	( fc_raddr      ),
	.read_flag 	( read_flag  ),
	.reset_n   	( reset_n    )
);






wire [7:0] 	TX;

output_layer u_output_layer(
	.clk   	( clk_24m    ),
	.rst_n 	( rst_n  ),
	.nub   	( fc_data_out    ),
	.raddr 	( vga_rdaddr  ),
	.TX    	( vga_rddat6     )
);


always@(  posedge clk_lcd or negedge rst_n   )begin
    if(  rst_n == 0 )begin
        select_a <= 0 ;
        a_data_out <= 0 ;
    end
    else begin
        select_a <= 4'b1110 ;
        case( fc_data_out )    //out_full_layer
            0:a_data_out <= 8'b11000000  ;
            1:a_data_out <= 8'b11111001 ;
            2:a_data_out <= 8'b10100100 ;
            3:a_data_out <= 8'b10110000 ;
            4:a_data_out <= 8'b10011001 ;
            5:a_data_out <= 8'b10010010 ;
            6:a_data_out <= 8'b10000010 ;
            7:a_data_out <= 8'b11111000 ;
            8:a_data_out <= 8'b10000000 ;
            9:a_data_out <= 8'b10010000 ;
            default:a_data_out <= 8'b11000110 ;
        endcase
    end
end 



	
endmodule
