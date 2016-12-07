module spShiftReg_testbench();
	reg 		clk, rst,
				serialIn;
	wire [7:0]	parallelOut;
	wire [9:0]	data;

	// set up clock
	parameter PERIOD = 10;
	initial clk = 0;
	always begin
		#(PERIOD/2);
		clk = ~clk;
	end

	spShiftReg dut (.data(data), .parallelOut(parallelOut), .serialIn(serialIn), .clk(clk), .rst(rst));

	// begin simulation
	initial begin
		rst <= 1;						@(posedge clk);
		rst <= 0;	serialIn <= 1'b1;	@(posedge clk);
					serialIn <= 1'b0;	@(posedge clk);
					serialIn <= 1'b1;	@(posedge clk);
					serialIn <= 1'b0;	@(posedge clk);
					serialIn <= 1'b1;	@(posedge clk);
					serialIn <= 1'b0;	@(posedge clk);
					serialIn <= 1'b1;	@(posedge clk);
					serialIn <= 1'b0;	@(posedge clk);
					serialIn <= 1'b1;	@(posedge clk);
					serialIn <= 1'b0;	@(posedge clk);
					serialIn <= 1'b1;	@(posedge clk);
					serialIn <= 1'b0;	@(posedge clk);
					serialIn <= 1'b1;	@(posedge clk);
										@(posedge clk);
		$finish;
	end

	// gtkwave filedump
	initial begin
		$dumpfile("spShiftReg.vcd");
		$dumpvars;
	end
endmodule
