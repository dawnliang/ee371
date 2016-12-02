// receive side: serial to parallel, shift left
// earliest input becomes most significant bit
module spShiftReg(parallelOut, serialIn, clk, rst);
	input clk, rst;				// bit clock, reset
	input serialIn;				// input serial data
	output [9:0] parallelOut;	// output parallel data

	// memory
	reg [9:0] data;
	initial data = 10'b0;
 
 	// at each clock edge, read new input & shift left
	always @(posedge clk) begin
		if(rst) data <= 10'b0;
		else data = {data[8:0], serialIn};
	end 
	
	// output logic
	assign parallelOut = data;
endmodule 
