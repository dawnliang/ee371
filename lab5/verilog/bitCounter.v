`include "bsc.v"
`include "bic.v"
module bitCounter(bitClock, whichBit, nextChar, enable, clk, rst, whichBit);
	input clk, rst;		// 16xdata rate clock, reset
	input enable;		// start of frame - start counting bits
	output bitClock,	// clock with posedge @ every data bit
			nextChar;	// indicates end of frame
	output [3:0] whichBit;
	
	wire [3:0] bitProgress;
	assign bitClock = (bitProgress == 4'b0111);	// posedge at middle sample of every bit; signals next bit

	bsc bsc_in (.bitProgress(bitProgress), .enable(enable), .clk(clk), .rst(rst));	
	bic bic_in (.nextChar(nextChar), .whichBit(whichBit), .enable(enable), .clk(bitClock), .rst(rst));
endmodule
