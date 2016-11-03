// EE371 Lab2 Autumn 2016
// authors: William Li, Dawn Liang, Jun Park
// date: 02 November 2016
// 
// testbench for innerWaterLvl module: tests normal operating conditions,
//   failure test cases include pressing up & down, disabled counter
`include "innerWaterLvl.v"
module innerWaterLvl_testbench();
	reg clk, reset, up, down, enable;
	reg [3:0] max, min;
	wire [3:0] out;

	// set up clock
	parameter CLOCK_PERIOD = 5;
	initial clk = 1;
	always begin
		#(CLOCK_PERIOD/2);
		clk = ~clk;
	end

	// connect I/Os
	innerWaterLvl dut (.out(out), .enable(enable), .up(up), .down(down), .max(max), .min(min), .clk(clk), .reset(reset));

	// run simulation
	initial begin
		reset <= 1;																			@(posedge clk);
		reset <= 0;	enable <= 0;	up <= 0;	down <= 0;	max <= 4'b0100;	min <= 4'b0001;	@(posedge clk);
									up <= 1;												@(posedge clk);
					enable <= 1;															@(posedge clk);
																							@(posedge clk);
																							@(posedge clk);
																							@(posedge clk);
																							@(posedge clk);
																							@(posedge clk);
									up <= 0;			down <= 1;							@(posedge clk);
																							@(posedge clk);
									up <= 1;												@(posedge clk);
									up <= 0;												@(posedge clk);
																							@(posedge clk);
																							@(posedge clk);
																							@(posedge clk);
		$finish;
	end

	// gtkwave filedump
	initial begin
		$dumpfile("innerWaterLvl.vcd");
		$dumpvars;
	end
endmodule
