`timescale  1ns / 1ps

module tb_conv1;

// conv1 Parameters
parameter PERIOD  = 10;


// conv1 Inputs
reg   clk                                  = 0 ;
reg   rst_n                                = 0 ;
reg   upstream_busy                        = 1 ;
wire   [7:0]  data_in                          ;

// conv1 Outputs
wire  [9:0]  raddr                         ;    
wire  ren                                  ;    
wire  [10:0]  waddr                        ;
wire  wen                                  ;
wire  [11:0]  data_out                     ;


wire [7:0]		conv1_data_in;
wire [9:0]  	conv1_raddr;
wire        	conv1_ren;
wire [10:0] 	conv1_waddr;
wire        	conv1_wen;
wire [11:0] 	conv1_data_out;
wire 			conv1_busy;



initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

initial
begin
    #(PERIOD*2) rst_n  =  1;
end

rom_8x784 u_rom(
    .clk        (clk),
    .ren        (conv1_ren),
    .addr       (conv1_raddr),
    .data_out   (conv1_data_in)
);

// conv1_ram u_conv1_ram(
// 	.clk     	( clk      ),
// 	.wen     	( wen      ),
// 	.addr    	( waddr     ),
// 	.data_in 	( data_out  )
// );


conv1  u_conv1 (
    .clk                     ( clk                   ),
    .rst_n                   ( rst_n                 ),
    .upstream_busy           ( upstream_busy         ),
    .data_in                 ( conv1_data_in  [7:0]  ),

    .raddr                   ( conv1_raddr    [9:0]  ),
    .ren                     ( conv1_ren             ),
    .waddr                   ( conv1_waddr    [10:0] ),
    .wen                     ( conv1_wen             ),
    .data_out                ( conv1_data_out [11:0] ),
	.busy 					 ( conv1_busy            )
);

wire [11:0]		pool1_data_in;
wire [10:0]  	pool1_raddr;
wire        	pool1_ren;
wire [8:0] 		pool1_waddr;
wire        	pool1_wen;
wire [11:0] 	pool1_data_out;


ram_24x24x3 u_ram_24x24x3(
	.dia   		(conv1_data_out ),
	.addra 		(conv1_waddr    ),
	.cea  	 	(conv1_wen      ),
	.clka  		(clk            ),

	.dob		(pool1_data_in  ), 
	.addrb		(pool1_raddr	), 
	.ceb		(pool1_ren		),
	.clkb		(clk    		), 
	.rstb		(!rst_n			)
);

pool1 u_pool1(
	.clk           	( clk            ),
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

ram_12x12x3 u_ram_12x12x3(
	.dia   		(pool1_data_out ),
	.addra 		(pool1_waddr    ),
	.cea  	 	(pool1_wen      ),
	.clka  		(clk            ),
    
	.dob		(conv2_data_in ), 
	.addrb		(conv2_raddr	), 
	.ceb		(conv2_ren		),
	.clkb		(clk     		), 
	.rstb		(!rst_n			)
);


conv2 u_conv2(
	.clk           	( clk            ),
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

ram_8x8x3 u_ram_8x8x3(
	.dia   		(conv2_data_out ),
	.addra 		(conv2_waddr    ),
	.cea  	 	(conv2_wen      ),
	.clka  		(clk            ),

	.dob		(pool2_data_in	), 
	.addrb		(pool2_raddr	), 
	.ceb		(pool2_ren		),		
	.clkb		(clk    		), 
	.rstb		(!rst_n			)
);



pool2 u_pool2(
	.clk           	( clk            ),
	.rst_n         	( rst_n          ),
	.upstream_busy 	( conv2_busy     ),  
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


ram_4x4x3 u_ram_4x4x3(
	.dia   		(pool2_data_out ),
	.addra 		(pool2_waddr    ),
	.cea  	 	(pool2_wen      ),


	.clka  		(clk            ),

	.dob		(fc_data_in	), 
	.addrb		(fc_raddr		), 
	.ceb		(read_flag		),
	.clkb		(clk    		), 
	.rstb		(!rst_n			)

);


fc u_fc(
	.clk       	( clk        ),
	.rst_n     	( rst_n      ),
	.layer_ren 	( pool2_ren  ),
	.data_in   	( fc_data_in    ),
	.data_out  	( fc_data_out   ),
	.raddr     	( fc_raddr      ),
	.read_flag 	( read_flag  ),
	.reset_n   	( reset_n    )
);






initial
begin
    #20 upstream_busy = 0;
end

endmodule
