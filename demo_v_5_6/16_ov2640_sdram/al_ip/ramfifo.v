/************************************************************\
 **  Copyright (c) 2011-2022 Anlogic, Inc.
 **  All Right Reserved.\
\************************************************************/
/************************************************************\
 ** Log	:	This file is generated by Anlogic IP Generator.
 ** File	:	C:/Users/zhang/Desktop/work/FPGA/sparkroadV/16_ov2640_sdram/al_ip/ramfifo.v
 ** Date	:	2022 10 06
 ** TD version	:	5.6.59063
\************************************************************/

`timescale 1ns / 1ps

module ramfifo (
	rst,
	di, re, clk, we,
	do,
	empty_flag,full_flag,rdusedw,wrusedw
 
);

	input rst;
	input [15:0] di;
	input clk, we;
	input re;

	output [15:0] do;
	output empty_flag;
	output full_flag;
	output [10:0] rdusedw;
	output [10:0] wrusedw;

EG_LOGIC_RAMFIFO #(
 	.DATA_WIDTH(16),
	.ADDR_WIDTH(10),
	.SHOWAHEAD(0),
	.IMPLEMENT("32K")
)
logic_ramfifo( 
	.rst(rst),
	.di(di),
	.clk(clk),
	.we(we),
	.do(do),
	.re(re),
	.empty_flag(empty_flag),
	.full_flag(full_flag),
	.rdusedw(rdusedw),
	.wrusedw(wrusedw)
);

endmodule