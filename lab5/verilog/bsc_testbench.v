// testbench for bsc module
`include "bsc.v"
module bsc_testbench();
	reg clk, rst, enable;
	wire [3:0] bitProgress;

	// device under test
	bsc dut (.bitProgress(bitProgress), .enable(enable), .clk(clk), .rst(rst));

	// set up clock
	parameter PERIOD = 10;
	initial clk = 0;
	always begin
		#(PERIOD/2);
		clk = ~clk;
	end

	// begin simulation
	initial begin
		rst <= 1;					@(posedge clk);
		rst <= 0;	enable <= 0;	@(posedge clk); 
					enable <= 1;	@(posedge clk); // 0
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
					enable <= 1;	@(posedge clk); // 0
		rst <= 1;					@(posedge clk); // 0
									@(posedge clk);
		$finish;
	end

	// gtkwave filedump
	initial begin
		$dumpfile("bsc.vcd");
		$dumpvars;
	end
endmodule
