// bit sample count
// counts samples (0-15) and outputs a posedge when hitting sample 7
module bsc(bitProgress, bit_clk, enable, clk, rst);
	input	clk, rst,	// 16xdata rate clk
			enable;
	output 	bit_clk;

	output reg [3:0] bitProgress;
	initial bitProgress = 0;
	
	always@(posedge clk) begin
		if (rst) bitProgress <= 0;
		else begin
			if (enable) bitProgress <= bitProgress + 1'b1;
			else bitProgress <= 0;
		end
	end

	assign bit_clk = (bitProgress == 7);
endmodule
