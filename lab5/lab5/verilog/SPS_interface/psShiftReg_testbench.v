module psShiftReg_testbench();
	reg 		clk, rst,
				load, bit_clk;
	reg [7:0]	parallelIn;
	wire		serialOut;
	wire [10:0]	data;

	// set up clock
	parameter PERIOD = 10;
	initial clk = 0;
	always begin
		#(PERIOD/2);
		clk = ~clk;
	end

	psShiftReg dut (.data(data), .serialOut(serialOut), .parallelIn(parallelIn), .load(load), .bit_clk(bit_clk), .clk(clk), .rst(rst));

	// begin simulation
	initial begin
		rst <= 1;	parallelIn <= 8'b10101010;	@(posedge clk);
		rst <= 0;	load <= 0;	bit_clk <= 0;	@(posedge clk);
					load <= 1;					@(posedge clk);
					load <= 0;					@(posedge clk);
								bit_clk <= 1;	@(posedge clk);
								bit_clk <= 0;	@(posedge clk);
												@(posedge clk);
								bit_clk <= 1;	@(posedge clk);
								bit_clk <= 0;	@(posedge clk);
												@(posedge clk);
								bit_clk <= 1;	@(posedge clk);
								bit_clk <= 0;	@(posedge clk);
												@(posedge clk);
								bit_clk <= 1;	@(posedge clk);
								bit_clk <= 0;	@(posedge clk);
												@(posedge clk);
								bit_clk <= 1;	@(posedge clk);
								bit_clk <= 0;	@(posedge clk);
												@(posedge clk);
								bit_clk <= 1;	@(posedge clk);
								bit_clk <= 0;	@(posedge clk);
												@(posedge clk);
								bit_clk <= 1;	@(posedge clk);
								bit_clk <= 0;	@(posedge clk);
												@(posedge clk);
								bit_clk <= 1;	@(posedge clk);
								bit_clk <= 0;	@(posedge clk);
												@(posedge clk);
								bit_clk <= 1;	@(posedge clk);
								bit_clk <= 0;	@(posedge clk);
												@(posedge clk);
								bit_clk <= 1;	@(posedge clk);
								bit_clk <= 0;	@(posedge clk);
												@(posedge clk);
								bit_clk <= 1;	@(posedge clk);
								bit_clk <= 0;	@(posedge clk);
												@(posedge clk);
		$finish;
	end

	// gtkwave filedump
	initial begin
		$dumpfile("psShiftReg.vcd");
		$dumpvars;
	end
endmodule
