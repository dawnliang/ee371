module rippleUpCounter(out, clk, rst);
	output logic [3:0] out;
	input logic clk, rst;
	logic Q0, Q1, Q2, Q3, clkTemp1, clkTemp2, clkTemp3, clkTemp4;
	
	logic [31:0] clocks;
	parameter WHICH_CLOCK = 22;
	clock_divider cdiv (clk, clocks);
	
	DFlipFlop d0(.q(Q0), .qBar(clkTemp1), .D(clkTemp1), .clk(clocks[WHICH_CLOCK]), .rst(rst));
	DFlipFlop d1(.q(Q1), .qBar(clkTemp2), .D(clkTemp2), .clk(clkTemp1), .rst(rst));
	DFlipFlop d2(.q(Q2), .qBar(clkTemp3), .D(clkTemp3), .clk(clkTemp2), .rst(rst));
	DFlipFlop d3(.q(Q3), .qBar(clkTemp4), .D(clkTemp4), .clk(clkTemp3), .rst(rst));
	
	assign out = {Q3,Q2,Q1,Q0}; //not {Q0, Q1, Q2, Q3};
endmodule

module clock_divider (clock, divided_clocks);
	input logic clock;
	output logic [31:0] divided_clocks;
	
	initial
		divided_clocks = 0;
	
	always_ff @(posedge clock)
		divided_clocks = divided_clocks + 1;
endmodule
