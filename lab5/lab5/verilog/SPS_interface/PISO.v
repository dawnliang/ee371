// PISO
module PISO(data, charSent, serialOut, parallelIn, load, enable, clk, rst);
	input			clk, rst,				// 16xdata rate clk
					load, enable;
	input [7:0]		parallelIn;
	output			serialOut, charSent;
	output [10:0]	data;

	wire bit_clk;
	bitCounter #(10) counter (.frameProgress(), .endFrame(charSent), .bit_clk(bit_clk), .enable(enable), .clk(clk), .rst(rst));
	psShiftReg piso (.data(data), .serialOut(serialOut), .parallelIn(parallelIn), .load(load), .bit_clk(bit_clk), .clk(clk), .rst(rst));
endmodule
