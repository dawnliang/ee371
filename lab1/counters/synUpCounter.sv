/*
	Synchronous up counter module

	Authors: William Li, Dawn Liang, Jun Park
	Date: 16 Oct 2016
*/
module synUpCounter(out, clk, rst);
	// declare inputs/outputs, wires
	output logic [3:0] out;
	input logic clk, rst;
	logic Q0, Q1, Q2, Q3;
	logic D0, D1, D2, D3;
	
	// clocks
	logic [31:0] clocks;
	parameter WHICH_CLOCK = 5;
	clock_divider cdiv (clk, clocks);
	
	// connect flip-flops
	DFlipFlop dff0(.q(Q0), .qBar(), .D(D0), .clk(clocks[WHICH_CLOCK]), .rst(rst));
	DFlipFlop dff1(.q(Q1), .qBar(), .D(D1), .clk(clocks[WHICH_CLOCK]), .rst(rst));
	DFlipFlop dff2(.q(Q2), .qBar(), .D(D2), .clk(clocks[WHICH_CLOCK]), .rst(rst));
	DFlipFlop dff3(.q(Q3), .qBar(), .D(D3), .clk(clocks[WHICH_CLOCK]), .rst(rst));
	
	// input boolean logic
	assign D0 = (~Q0)&rst;
	assign D1 = ((Q0&~Q1) | (Q1&~Q0))&rst;
	assign D2 = ((Q2&~Q1) | (Q2&~Q0) | (Q1&Q0&~Q2))&rst;
	assign D3 = ((Q3&~Q2) | (Q3&~Q1) | (Q3&~Q0) | (~Q3&Q2&Q1&Q0))&rst;  
	
	// output logic
	assign out = {Q3, Q2, Q1, Q0};
endmodule