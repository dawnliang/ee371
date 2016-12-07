// SERIAL DATA IN TO NIOS II
module spIn (parallelOut, charReceived, serialIn, clk, rst);
	input clk, rst;
	input serialIn;
	output charReceived;
	output [7:0] parallelOut;

	// frame detection
	reg enable;
	initial enable = 0;

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

	// bit counter & data shifting
	wire bit_clk;
	bitCounter countIn (.bitClock(bit_clk), .nextChar(charReceived), .enable(enable), .clk(clk), .rst(rst));
	spShiftReg spIn (.parallelOut(parallelOut), .serialIn(serialIn), .clk(bit_clk), .rst(rst));
endmodule
