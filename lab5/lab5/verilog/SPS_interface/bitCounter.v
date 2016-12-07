// bitCounter module
// counts samples and outputs a bit-clock and a signal for the end of the frame
module bitCounter(frameProgress, endFrame, bit_clk, enable, clk, rst);
	input	clk, rst,			// 16xdata rate clk
			enable;
	output bit_clk, endFrame;

	parameter FRAME_WIDTH = 10;

	output [3:0] frameProgress;

	bsc bitSample (.bit_clk(bit_clk), .enable(enable), .clk(clk), .rst(rst));
	bic #(FRAME_WIDTH) bitIdent (.frameProgress(frameProgress), .endFrame(endFrame), .enable(enable), .clk(bit_clk), .rst(rst));
endmodule
