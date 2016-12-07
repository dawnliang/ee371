
`include "spShiftReg.v"
module SIPO(data, enable, charReceived, parallelOut, serialIn, clk, rst);
	input			clk, rst,		// 16xdata rate clk
					serialIn;
	output 			charReceived;
	output [7:0]	parallelOut;
	output [9:0]	data;

	output reg enable;
	// start bit detection
	always@(*) begin
		case(enable)
			0: begin
				if (serialIn == 0) enable = 1;	// at start bit, turn on bit counting
				else enable = 0;
			end
			1: begin
				if (charReceived) enable = 0;	// at stop bit, turn off bit counting
				else enable = 1;
			end
			default: enable = 0;
		endcase
	end

	wire bit_clk;
	bitCounter #(11) counter (.frameProgress(), .endFrame(charReceived), .bit_clk(bit_clk), .enable(enable), .clk(clk), .rst(rst));
	spShiftReg SIPO (.data(data), .parallelOut(parallelOut), .serialIn(serialIn), .clk(bit_clk), .rst(rst));
endmodule
