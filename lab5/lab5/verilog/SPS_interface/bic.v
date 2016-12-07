// bit identification count
// counts bits received and signals when frame has reached end
module bic(frameProgress, endFrame, enable, clk, rst);
	input	clk, rst,	// bit_clk
			enable;
	output endFrame;

	parameter FRAME_WIDTH = 10;

	output reg [3:0] frameProgress;
	initial frameProgress = 0;
	
	always@(posedge clk) begin
		if (rst) frameProgress <= 0;
		else begin
			if (enable) frameProgress <= frameProgress + 1'b1;
			else frameProgress <= 0;
		end
	end

	assign endFrame = (frameProgress == FRAME_WIDTH - 1);
endmodule
