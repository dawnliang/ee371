// EE371 Lab2 Autumn 2016
// authors: William Li, Dawn Liang, Jun Park
// date: 02 November 2016
// 
// clock divider module: outputs a 32-bit counter bus
//    choose the clock speed by choosing the bit
module clock_divider (clk, divided_clocks);
	input clk;
	output [31:0] divided_clocks;

	reg [31:0] clocks;
	initial clocks = 0;

	always@(posedge clk) begin
		clocks <= clocks + 1'b1;
	end

	assign divided_clocks = clocks;
endmodule