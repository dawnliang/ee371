// receive side: serial to parallel, shift left
// earliest input becomes most significant bit
module spShiftReg(parallelOut, data, serialIn, clk, rst);
	input clk, rst;				// bit clock, reset
	input serialIn;				// input serial data
	output [7:0] parallelOut;	// output parallel data

	// memory
	output reg [7:0] data;
	initial data = 8'b11111111;
 
 	// at each clock edge, read new input & shift left
	always @(posedge clk) begin
		if(rst) data <= 8'b11111111;
		else data = {data[6:0], serialIn};
	end 
	
	// output logic
	assign parallelOut = data;
endmodule 
