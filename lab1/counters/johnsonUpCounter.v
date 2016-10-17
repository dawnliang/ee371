/*
	4-bit Johnson up counter, implemeneted using D-flipflops at the
	behavioural level

	Authors: William Li, Dawn Liang, Jun Park
	Date: 16 Oct 2016
*/
module johnsonUpCounter(out, clk, rst);
	// declare inputs/outputs & variables
	output logic [3:0] out;
	input logic clk, rst;
	logic [3:0] temp;

	// counting every clock edge
	always_ff@(negedge rst or posedge clk) begin
		if (rst == 0)
			begin
				temp <= 4'b0000;
			end
		else if (clk == 1'b1)
			begin
				temp <= {~temp[0], temp[3:1]}; // right shift and negate most signf bit
			end	
	end

	// output assignment
	assign out = temp;
endmodule
