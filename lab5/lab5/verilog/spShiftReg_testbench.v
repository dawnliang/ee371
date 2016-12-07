// testbench for spShiftReg module
module spShiftReg_testbench;
	reg serialIn, clk, rst;
	wire [7:0] parallelOut; 
	
	// device under test
	spShiftReg dut(.parallelOut(parallelOut), .serialIn(serialIn), .clk(clk), .rst(rst));

	// set up clock
	parameter CLOCK_PERIOD = 10;
	initial clk = 0;
	always begin
		#(CLOCK_PERIOD/2);
		clk = ~clk;
	end
	
	// begin simulation
	initial begin
		rst <= 1;					@(posedge clk);
		rst <= 0;	serialIn <= 1;	@(posedge clk);
									@(posedge clk);
									@(posedge clk);
					serialIn <= 0;	@(posedge clk);
					serialIn <= 1;	@(posedge clk);
									@(posedge clk);
					serialIn <= 0;	@(posedge clk);
									@(posedge clk);
									@(posedge clk);
					serialIn <= 1;	@(posedge clk);
					serialIn <= 0;	@(posedge clk);
									@(posedge clk);
		$finish;
	end

	// gtkwave filedump
	initial begin
		$dumpfile("spShiftReg.vcd");
		$dumpvars;
	end
endmodule