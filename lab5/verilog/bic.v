// bit identifier count
// once the start bit has been detected (enable), counts the number of input bits that have
// been read (10 total). outputs the index of the bit being read
// enable <= 0 sets the count back to 0
module bic(nextChar, whichBit, enable, clk, rst);
	input clk, rst;				// bsc bit clk, KEY0 rst
	input enable;				// reading in frame, so count bits
	output nextChar;			// reading the stop bit

	// 4-bit counter to count clock cycles; indicates which bit is currently being read
	// clock set to posedge at the middle of the samples (bsc at 4'b0111)
	// counts 0-9 then loops back to 0 (10-bit frame)
	output reg [3:0] whichBit;
	initial whichBit = 0;

	always@(posedge clk) begin
		if(rst) whichBit <= 0;
		else begin
			if(enable) begin
				if (whichBit < 9) whichBit <= whichBit + 1'b1;	// maxes out at 10-bits
				else whichBit <= 0;								// loops back to 0
			end else whichBit <= 0;
		end
	end

	// output logic
	assign nextChar = (whichBit == 9); // currently reading the stop bit
endmodule
