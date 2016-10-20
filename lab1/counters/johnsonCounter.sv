/*
	Johnson counter module

	Authors: William Li, Dawn Liang, Jun Park
	Date: 16 Oct 2016
*/

module johnsonCounter(out, clk, rst);
	// declare inputs/outputs, wires
	output [3:0] out;
	input clk, rst;
	reg [3:0] temp;
	
	// clock
	logic [31:0] clocks;
	parameter WHICH_CLOCK = 5;
	clock_divider cdiv (clk, clocks);
	
	// count edges
	always_ff@(negedge rst or posedge clocks[WHICH_CLOCK]) begin
		if (rst == 0) begin
			temp <= 4'b0000;
		end else if (clocks[WHICH_CLOCK] == 1'b1) begin
			temp <= {~temp[0], temp[3:1]}; // right shift and negating most signf bit
		end	
	end

	// output logic
	assign out = temp; 
endmodule