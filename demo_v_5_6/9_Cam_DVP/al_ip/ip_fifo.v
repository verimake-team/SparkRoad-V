/************************************************************\
 **  Copyright (c) 2011-2022 Anlogic, Inc.
 **  All Right Reserved.\
\************************************************************/
/************************************************************\
 ** Log	:	This file is generated by Anlogic IP Generator.
 ** File	:	C:/Users/zhang/Desktop/back/chace/githubsc/SparkRoad-V/demo_5_6_1/9_Cam_DVP/al_ip/ip_fifo.v
 ** Date	:	2022 10 08
 ** TD version	:	5.6.59063
\************************************************************/

`timescale 1ns / 1ps

module img_fifo (
	rst,
	di, clkw, we,
	do, clkr, re,
	empty_flag,
	full_flag 
);

	input rst;
	input [7:0] di;
	input clkw, we;
	input clkr,re;

	output [15:0] do;
	output empty_flag;
	output full_flag;

EG_LOGIC_FIFO #(
 	.DATA_WIDTH_W(8),
	.DATA_WIDTH_R(16),
	.DATA_DEPTH_W(8192),
	.DATA_DEPTH_R(4096),
	.ENDIAN("BIG"),
	.RESETMODE("ASYNC"),
	.E(0),
	.F(8192),
	.ASYNC_RESET_RELEASE("SYNC"))
fifo_inst(
	.rst(rst),
	.di(di),
	.clkw(clkw),
	.we(we),
	.csw(3'b111),
	.do(do),
	.clkr(clkr),
	.re(re),
	.csr(3'b111),
	.ore(1'b0),
	.empty_flag(empty_flag),
	.aempty_flag(),
	.full_flag(full_flag),
	.afull_flag()

);

endmodule