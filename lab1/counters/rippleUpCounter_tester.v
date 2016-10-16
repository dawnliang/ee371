/*
	Ripple-up counter tester

	Authors: William Li, Dawn Liang, Jun Park
	Date: 16 Oct 2016
*/

`include "rippleUpCounter.v"
module rippleUpCounter_testbench;
	logic [3:0] out;
	logic clk, rst;

	rippleUpCounter dut(.out, .clk, .rst);
	
	parameter PERIOD = 100; // period = length of clock
	initial begin
		clk <= 0;
		forever #(PERIOD/2) clk = ~clk;
	end
	
	initial begin
		rst=0; @(posedge clk);
		rst=1; @(posedge clk);
	end
endmodule