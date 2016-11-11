`include "clock_divider.v"
module counterCtrl(val, state, clk, reset);
	input [2:0] state;
	input clk, reset;

	output [3:0] val;

	parameter	lowPower = 3'b000,
				standby = 3'b001,
				scanning = 3'b010,
				idle = 3'b011,
				xferring = 3'b100,
				flushing = 3'b101;

	reg [31:0] divided_clocks;
	clock_divider div (divided_clocks, .clk(clk));
	wire final_clock;

	always@(*) begin
		case (state)
			lowPower:	
			standby:	
			scanning:	
			idle:		
			xferring:	
			flushing:	
			default:	
		endcase
	end
endmodule