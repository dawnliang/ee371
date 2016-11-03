module clock_divider #(parameter WHICH_CLOCK=5) (clk, divided_clock);
	input clk;
	output divided_clock;

	reg [31:0] clocks;
	initial clocks = 0;

	always@(posedge clk) begin
		clocks <= clocks + 1'b1;
	end

	assign divided_clock = clocks[WHICH_CLOCK];
endmodule