// testbench for psShiftReg module
module psShiftReg_testbench;
	reg clk, rst;
	reg load, bit_clk;
	reg [7:0] parallelIn;
	wire serialOut;

	// device under test
	psShiftReg dut (.serialOut(serialOut), .parallelIn(parallelIn), .load(load), .bit_clk(bit_clk), .clk(clk), .rst(rst));

	// set up clock
	parameter CLOCK_PERIOD = 10;
	initial clk = 0;
	always begin
		#(CLOCK_PERIOD/2);
		clk = ~clk;
	end

	// begin simulation
	initial begin
		rst <= 1;												@(posedge clk);
		rst <= 0;   load <= 1;  parallelIn <= 8'b11100100;		@(posedge clk);
					load <= 0;                                  @(posedge clk);
																@(posedge clk);
																@(posedge clk);
																@(posedge clk);
																@(posedge clk);
																@(posedge clk);
																@(posedge clk);
																@(posedge clk);
																@(posedge clk);
																@(posedge clk);
								parallelIn <= 8'b11011100;		@(posedge clk);
					load <= 1;                                  @(posedge clk);
																@(posedge clk);
		$finish;
	end

	// gtkwave filedump
	initial begin
		$dumpfile("psShiftReg.vcd");
		$dumpvars;
	end
endmodule
