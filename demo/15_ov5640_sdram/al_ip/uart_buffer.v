/************************************************************\
 **  Copyright (c) 2011-2021 Anlogic, Inc.
 **  All Right Reserved.
\************************************************************/
/************************************************************\
 ** Log	:	This file is generated by Anlogic IP Generator.
 ** File	:	D:/_Tools/Anlogic/Projects/Gyro reader/al_ip/uart_buffer.v
 ** Date	:	2020 01 05
 ** TD version	:	4.6.14756
\************************************************************/

`timescale 1ns / 1ps

module uart_buffer (
	rst,
	di, clkr, re, clkw, we,
	do,
	empty_flag,full_flag,rdusedw,wrusedw
 
);

	input rst;
	input [7:0] di;
	input clkw, we;
	input clkr,re;

	output [7:0] do;
	output empty_flag;
	output full_flag;
	output [10:0] rdusedw;
	output [10:0] wrusedw;

EG_LOGIC_RAMFIFO #(
 	.DATA_WIDTH(8),
	.ADDR_WIDTH(10),
	.SHOWAHEAD(1),
	.IMPLEMENT("AUTO")
)
logic_ramfifo(
	.rst(rst),
	.di(di),
	.clkw(clkw),
	.we(we),
	.do(do),
	.clkr(clkr),
	.re(re),
	.empty_flag(empty_flag),
	.full_flag(full_flag),
	.rdusedw(rdusedw),
	.wrusedw(wrusedw)
);

endmodule