module synUpCounter(out, clk, rst);
	output logic [3:0] out;
	input logic clk, rst;
	
	logic Q0, Q1, Q2, Q3;
	logic D0, D1, D2, D3;
	
	logic [31:0] clocks;
	parameter WHICH_CLOCK = 5;
	clock_divider cdiv (clk, clocks);
	
	DFlipFlop dff0(.q(Q0), .qBar(), .D(D0), .clk(clocks[WHICH_CLOCK]), .rst(rst));
	DFlipFlop dff1(.q(Q1), .qBar(), .D(D1), .clk(clocks[WHICH_CLOCK]), .rst(rst));
	DFlipFlop dff2(.q(Q2), .qBar(), .D(D2), .clk(clocks[WHICH_CLOCK]), .rst(rst));
	DFlipFlop dff3(.q(Q3), .qBar(), .D(D3), .clk(clocks[WHICH_CLOCK]), .rst(rst));
	
	assign D0 = (~Q0)&rst;
	assign D1 = ((Q0&~Q1) | (Q1&~Q0))&rst;
	assign D2 = ((Q2&~Q1) | (Q2&~Q0) | (Q1&Q0&~Q2))&rst;
	assign D3 = ((Q3&~Q2) | (Q3&~Q1) | (Q3&~Q0) | (~Q3&Q2&Q1&Q0))&rst;  
	
	assign out = {Q3, Q2, Q1, Q0};
endmodule

// divided_clocks[0] = 25MHz, [1] = 12.5Mhz, ... [23] = 3Hz, [24] = 1.5Hz,[25] = 0.75Hz, ...
module clock_divider (clock, divided_clocks);
	input logic clock;
	output logic [31:0] divided_clocks;
	
	initial
		divided_clocks = 0;
	
	always_ff @(posedge clock)
		divided_clocks = divided_clocks + 1;
endmodule

module synUpCounter_testbench;
	logic [3:0] out;
	logic clk, rst;

	synUpCounter dut(.out, .clk, .rst);
	
	parameter PERIOD = 100; // period = length of clock
	initial begin
		clk <= 0;
		forever #(PERIOD/2) clk = ~clk;
	end
	
	initial begin
		rst=0; @(posedge clk);
		rst=1; @(posedge clk);
				 @(posedge clk);
		  		 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
		  		 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
		  		 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
		  		 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
		  		 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
		  		 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
		  		 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
		  		 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
		  		 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
		  		 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
		  		 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
		  		 @(posedge clk);
		rst=0; @(posedge clk);
			    @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
		$stop();
	end
endmodule
