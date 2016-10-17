/*
	4-bit synchronous up counter tester

	Authors: William Li, Dawn Liang, Jun Park
	Date: 16 Oct 2016
*/
module synUpCounter_testbench;
	// declare variables
	logic [3:0] out;
	logic clk, rst;

	// declare module
	synUpCounter dut(.out, .clk, .rst);
	
	// test states
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
		rst=0; @(posedge clk);
			    @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
		$stop();
	end
endmodule
