// testbench for bic module
module bic_testbench();
	reg clk, rst;
	reg enable;
	wire nextChar;
	wire [3:0] whichBit;

	// device under test
	bic #(11) dut (.nextChar(nextChar), .whichBit(whichBit), .enable(enable), .clk(clk), .rst(rst));

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
									@(posedge clk);
									@(posedge clk);
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