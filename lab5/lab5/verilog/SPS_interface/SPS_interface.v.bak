`include "SIPO.v"
`include "PISO.v"
module SPS_interface(charReceived, charSent, parallelOut, serialOut, parallelIn, serialIn, load, transmitEnable, clk, rst);
	input			clk, rst, 		// 16xdata rate clk
					load, transmitEnable,
					serialIn;
	input [7:0]		parallelIn;
	output			charReceived, charSent,
					serialOut;
	output [7:0]	parallelOut;


	// I/O buffers
	wire sDataIn, sDataOut;
	buf in (sDataIn, serialIn);
	buf out (serialOut, sDataOut);

	SIPO sipo (.charReceived(charReceived), .parallelOut(parallelOut), .serialIn(sDataIn), .clk(clk), .rst(rst));
	PISO piso (.charSent(charSent), .serialOut(sDataOut), .parallelIn(parallelIn), .load(load), .enable(transmitEnable), .clk(clk), .rst(rst));
endmodule
