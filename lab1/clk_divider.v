module clk_divider #(parameter WHICH_CLOCK=15) (clk, clk_out);
	input clk;
	output clk_out;
	reg [63:0] tBase;

	always @(posedge clk)		// time base for system
	begin
		tBase <= tBase + 1'b1;
	end

	always @(posedge tBase[WHICH_CLOCK])	// select a frequency bit
	begin
		clk_out <= tBase[WHICH_CLOCK];
	end
endmodule