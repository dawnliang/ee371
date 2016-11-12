// EE371 Lab2 Autumn 2016
// authors: William Li, Dawn Liang, Jun Park
// date: 02 November 2016
// 
// testbench for clock_divider module
module clock_divider_testbench();
	reg clk;
	wire divided_clock;

	// set up clock
	parameter CLOCK_PERIOD = 5;
	initial clk = 1;
	always begin
		#(CLOCK_PERIOD/2);
		clk = ~clk;
	end

	// connect I/O's
	clock_divider #(2) dut (.clk(clk), .divided_clock(divided_clock));

	// start simulation
	initial begin
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		$finish;
	end

	// gtkwave filedump
	initial begin
		$dumpfile("clock_divider.vcd");
		$dumpvars;
	end
endmodule