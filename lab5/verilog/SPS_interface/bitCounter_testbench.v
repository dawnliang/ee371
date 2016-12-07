`include "bitCounter.v"
module bitCounter_testbench();
	reg		clk, rst,
			enable;
	wire	endFrame, bit_clk;
	wire [3:0] frameProgress;

	// set up clock
	parameter PERIOD = 10;
	initial clk = 0;
	always begin
		#(PERIOD/2);
		clk = ~clk;
	end

	bitCounter #(11) dut (.frameProgress(frameProgress), .endFrame(endFrame), .bit_clk(bit_clk), .enable(enable), .clk(clk), .rst(rst));

	// begin simulation
	initial begin
		rst <= 1;					@(posedge clk);
		rst <= 0;	enable <= 0;	@(posedge clk);
					enable <= 1;	@(posedge clk); // bsc = 0, bic = 0
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 5
									@(posedge clk);
									@(posedge clk); // bic = 1
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 10
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 15
									@(posedge clk); // bsc = 0
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 5
									@(posedge clk);
									@(posedge clk); // bic = 2
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 10
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 15
									@(posedge clk); // bsc = 0
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 5
									@(posedge clk);
									@(posedge clk); // bic = 3
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 10
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 15
									@(posedge clk); // bsc = 0
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 5
									@(posedge clk);
									@(posedge clk); // bic = 4
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 10
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 15
									@(posedge clk); // bsc = 0
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 5
									@(posedge clk);
									@(posedge clk); // bic = 5
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 10
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 15
									@(posedge clk); // bsc = 0
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 5
									@(posedge clk);
									@(posedge clk); // bic = 6
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 10
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 15
									@(posedge clk); // bsc = 0
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 5
									@(posedge clk);
									@(posedge clk); // bic = 7
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 10
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 15
									@(posedge clk); // bsc = 0
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 5
									@(posedge clk);
									@(posedge clk); // bic = 8
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 10
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 15
									@(posedge clk); // bsc = 0
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 5
									@(posedge clk);
									@(posedge clk); // bic = 9
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 10
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 15
									@(posedge clk); // bsc = 0
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 5
									@(posedge clk);
									@(posedge clk); // bic = 10, 0 depending on param
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 10
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 15
									@(posedge clk); // bsc = 0
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 5
									@(posedge clk);
									@(posedge clk); // bic = 0, 1 depending on param
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 10
									@(posedge clk);
					enable <= 0;	@(posedge clk);
									@(posedge clk);
		$finish;
	end

	// gtkwave filedump
	initial begin
		$dumpfile("bitCounter.vcd");
		$dumpvars;
	end
endmodule
