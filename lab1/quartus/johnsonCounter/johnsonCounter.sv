module johnsonCounter(out, clk, rst);
	output [3:0] out;
	input clk, rst;
	reg [3:0] temp;
	
	logic [31:0] clocks;
	parameter WHICH_CLOCK = 5;
	clock_divider cdiv (clk, clocks);
	
	always_ff@(negedge rst or posedge clocks[WHICH_CLOCK]) begin
		if (rst == 0) begin
			temp <= 4'b0000;
		end else if (clocks[WHICH_CLOCK] == 1'b1) begin
			temp <= {~temp[0], temp[3:1]}; // right shift and negating most signf bit
		end	
	end

	assign out = temp; 
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

module johnsonUpCounter_testbench;
	wire [3:0] out;
	reg clk, rst;

	johnsonCounter dut (.out, .clk, .rst);

	parameter PERIOD = 100; // period = length of clock
	initial begin
		clk <= 0;
		forever #(PERIOD/2) clk = ~clk;
	end
	
	initial begin
		rst=0;   @(posedge clk);
		rst=1;   @(posedge clk);
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
		rst=0;   @(posedge clk);	
				 @(posedge clk);	
				 @(posedge clk);	
		$stop();
	end	
endmodule
