// PARALLEL DATA OUT OF NIOS II
module psOut(serialOut, charSent, parallelIn, load, transmitEnable, clk, rst);
	input clk, rst;
	input load, transmitEnable;
	input [7:0] parallelIn;
	output serialOut;
	output charSent;

	// bit counter & data shifting
	wire bit_clk;
	bitCounter #(11) countOut (.bitClock(bit_clk), .nextChar(charSent), .enable(transmitEnable), .clk(clk), .rst(rst));
	psShiftReg psOut(.serialOut(serialOut), .parallelIn(parallelIn), .load(load), .bit_clk(bit_clk), .clk(clk), .rst(rst));
endmodule
