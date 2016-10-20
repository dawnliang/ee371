// Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, the Altera Quartus II License Agreement,
// the Altera MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Altera and sold by Altera or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 14.0.0 Build 200 06/17/2014 SJ Web Edition"
// CREATED		"Tue Oct 18 12:20:52 2016"

module shematicEntrySynUpCounter(
	rst,
	clk,
	enable,
	Cout,
	Q0,
	Q1,
	Q2,
	Q3
);


input wire	rst;
input wire	clk;
input wire	enable;
output wire	Cout;
output wire	Q0;
output wire	Q1;
output wire	Q2;
output wire	Q3;

reg	SYNTHESIZED_WIRE_14;
reg	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
reg	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
reg	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_12;

assign	Q0 = SYNTHESIZED_WIRE_14;
assign	Q1 = SYNTHESIZED_WIRE_15;
assign	Q2 = SYNTHESIZED_WIRE_17;
assign	Q3 = SYNTHESIZED_WIRE_19;



assign	SYNTHESIZED_WIRE_6 = SYNTHESIZED_WIRE_14 ^ enable;

assign	SYNTHESIZED_WIRE_8 = SYNTHESIZED_WIRE_15 ^ SYNTHESIZED_WIRE_16;

assign	SYNTHESIZED_WIRE_20 = SYNTHESIZED_WIRE_17 & SYNTHESIZED_WIRE_18;

assign	Cout = SYNTHESIZED_WIRE_19 & SYNTHESIZED_WIRE_20;


clkDivider	b2v_inst12(
	.clk(clk),
	.clk_out(SYNTHESIZED_WIRE_21));

assign	SYNTHESIZED_WIRE_10 = SYNTHESIZED_WIRE_17 ^ SYNTHESIZED_WIRE_18;

assign	SYNTHESIZED_WIRE_12 = SYNTHESIZED_WIRE_19 ^ SYNTHESIZED_WIRE_20;


always@(posedge SYNTHESIZED_WIRE_21 or negedge rst)
begin
if (!rst)
	begin
	SYNTHESIZED_WIRE_14 <= 0;
	end
else
	begin
	SYNTHESIZED_WIRE_14 <= SYNTHESIZED_WIRE_6;
	end
end


always@(posedge SYNTHESIZED_WIRE_21 or negedge rst)
begin
if (!rst)
	begin
	SYNTHESIZED_WIRE_15 <= 0;
	end
else
	begin
	SYNTHESIZED_WIRE_15 <= SYNTHESIZED_WIRE_8;
	end
end


always@(posedge SYNTHESIZED_WIRE_21 or negedge rst)
begin
if (!rst)
	begin
	SYNTHESIZED_WIRE_17 <= 0;
	end
else
	begin
	SYNTHESIZED_WIRE_17 <= SYNTHESIZED_WIRE_10;
	end
end


always@(posedge SYNTHESIZED_WIRE_21 or negedge rst)
begin
if (!rst)
	begin
	SYNTHESIZED_WIRE_19 <= 0;
	end
else
	begin
	SYNTHESIZED_WIRE_19 <= SYNTHESIZED_WIRE_12;
	end
end

assign	SYNTHESIZED_WIRE_16 = SYNTHESIZED_WIRE_14 & enable;

assign	SYNTHESIZED_WIRE_18 = SYNTHESIZED_WIRE_15 & SYNTHESIZED_WIRE_16;


endmodule
