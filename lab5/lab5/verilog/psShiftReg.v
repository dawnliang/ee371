// trasmit side: parallel to serial, shift right
// outputs least significant bit into serial stream
module psShiftReg(serialOut, parallelIn, load, bit_clk, clk, rst);
	input clk, rst;				// 16xdata rate clock, reset
	input bit_clk;				// bit clock
	input load;					// load parallel data
	input [7:0] parallelIn;		// input parallel data
	output serialOut;			// output serial data

	// 11-bit memory - extra leading 1 to ensure 1-0 negedge start
	reg [10:0] data;
	initial data = 11'b11111111111;

	// at each clock edge, push out lowest bit & shift right
	always @(posedge clk) begin
		if (rst) begin
			data[0] <= 1'b1;
			data[1] <= 1'b0;
			data[10:2] <= 9'b111111111;
		end else begin
			if (load) begin
				data[0] <= 1'b1;
				data[1] <= 1'b0;
				data[10:2] <= parallelIn;
			end else if (bit_clk) data <= {1'b1, data[10:1]};
			else data <= data;
		end
	end

	// output logic
	assign serialOut = data[0];
endmodule 
