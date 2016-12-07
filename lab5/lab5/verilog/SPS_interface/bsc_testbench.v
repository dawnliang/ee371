module bsc_testbench();
	reg		clk, rst,
			enable;
	wire	bit_clk;
	wire [3:0] bitProgress;

	// set up clock
	parameter PERIOD = 10;
	initial clk = 0;
	always begin
		#(PERIOD/2);
		clk = ~clk;
	end

	bsc dut (.bitProgress(bitProgress), .bit_clk(bit_clk), .enable(enable), .clk(clk), .rst(rst));

	// begin simulation
	initial begin
		rst <= 1;					@(posedge clk);
		rst <= 0;	enable <= 0;	@(posedge clk); // 0
					enable <= 1;	@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // 5
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // 10
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // 15
									@(posedge clk); // 0
					enable <= 0;	@(posedge clk);
									@(posedge clk);

		$finish;
	end

	// gtkwave dump
	initial begin
		$dumpfile("bsc.vcd");
		$dumpvars;
	end
endmodule
