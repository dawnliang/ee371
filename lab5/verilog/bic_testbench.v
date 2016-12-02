// testbench for bic module
`include "bic.v"
module bic_testbench();
	reg clk, rst;
	reg enable;
	wire nextChar;

	// device under test
	bic dut (.nextChar(nextChar), .enable(enable), .clk(clk), .rst(rst));

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
		rst <= 0;	enable <= 1;	@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // 9
									@(posedge clk); // 0
					enable <= 0;	@(posedge clk); // no more data, go back to 0
									@(posedge clk);

		$finish;
	end

	// gtkwave filedump
	initial begin
		$dumpfile("bic.vcd");
		$dumpvars;
	end
endmodule
