// trasmit side: parallel to serial, shift right
// outputs least significant bit into serial stream
module psShiftReg(serialOut, parallelIn, load, clk, rst);
	input clk, rst;				// bit clock, reset
	input load;					// load parallel data
	input [9:0] parallelIn;		// input parallel data
	output serialOut;			// output serial data

	// memory
	reg [9:0] data;
	initial data = 10'b0;

	// at each clock edge, push out lowest bit & shift right
	always @(posedge clk) begin
		if (rst) data <= 10'b0;
		else begin
			if (load) data <= parallelIn;
			else data <= {1'b0, data[9:1]};
		end
	end

	// output logic
	assign serialOut = data[0];
endmodule 
