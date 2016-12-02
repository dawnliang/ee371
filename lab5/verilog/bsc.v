// bit sampling count
// once the start bit has been detected (enable), counts the number of samples of the input
// bit that have been received (16 total). outputs whether currently at the start, middle,
// end, or insignificant part of the bit
// enable <= 0 sets the count back to 0
module bsc(bitProgress, enable, clk, rst);
	input clk, rst;				// 16xdata rate clock, KEY0 rst
	input enable;				// reading in frame, so count bits
	output [3:0] bitProgress;	// which part of the bit

	// 4-bit counter to count samples (16 samples per bit)
	// at the start of the bit, the counter is at 4'b0000 (0)
	// in the middle of the bit, the counter is at 4'b0111 (7)
	// at the end of the bit, the counter is at 4'b1111 (15)
	reg [3:0] count;
	initial count = 0;

	always@(posedge clk) begin
		if(rst) begin
			count <= 0;
		end else begin
			if(enable) count <= count + 1'b1;
			else count <= 0;
		end
	end

	// output logic
	assign bitProgress = count;
endmodule
