/*
	4-bit synchronous up counter, implemented using D-flipflops at
	dataflow level

	Authors: William Li, Dawn Liang, Jun Park
	Date: 16 Oct 2016
*/

module synUpCounter(out, clk, rst);
	// declare inputs/outputs
	output logic [3:0] out;
	input logic clk, rst;
	
	// connecting wires
	logic Q0, Q1, Q2, Q3;
	logic D0, D1, D2, D3; 
	
	// D-ff connections
	DFlipFlop dff0(.q(Q0), .qBar(), .D(D0), .clk(clk), .rst(rst));
	DFlipFlop dff1(.q(Q1), .qBar(), .D(D1), .clk(clk), .rst(rst));
	DFlipFlop dff2(.q(Q2), .qBar(), .D(D2), .clk(clk), .rst(rst));
	DFlipFlop dff3(.q(Q3), .qBar(), .D(D3), .clk(clk), .rst(rst));
	
	// output logic assignments
	assign D0 = (~Q0)&rst;
	assign D1 = ((Q0&~Q1) | (Q1&~Q0))&rst;
	assign D2 = ((Q2&~Q1) | (Q2&~Q0) | (Q1&Q0&~Q2))&rst;
	assign D3 = ((Q3&~Q2) | (Q3&~Q1) | (Q3&~Q0) | (~Q3&Q2&Q1&Q0))&rst;
	
	assign out = {Q3, Q2, Q1, Q0};
endmodule