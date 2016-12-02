`include "bitCounter.v"
module bitCounter_testbench();
	reg clk, rst;
	reg enable;
	wire bitClock, nextChar;
	wire [3:0] whichBit;

	// set up clock
	parameter PERIOD = 10;
	initial clk = 0;
	always begin
		#(PERIOD/2);
		clk = ~clk;
	end

	// device under test
	bitCounter dut (.whichBit(whichBit), .bitClock(bit_clk), .nextChar(nextChar), .enable(enable), .clk(clk), .rst(rst));

	// begin simulation
	initial begin
		rst <= 1;					@(posedge clk);
		rst <= 0;	enable <= 0;	@(posedge clk);
					enable <= 1;	@(posedge clk); // bsc = 0; bic = 0
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 5;
									@(posedge clk);
									@(posedge clk); // bsc = 7; bic = 1
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 10;
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 15;
									@(posedge clk); // bsc = 0; bic = 1
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 5;
									@(posedge clk);
									@(posedge clk); // bsc = 7; bic = 2
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 10;
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 15;
									@(posedge clk); // bsc = 0; bic = 2
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 5;
									@(posedge clk);
									@(posedge clk); // bsc = 7; bic = 3
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 10;
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 15;
									@(posedge clk); // bsc = 0; bic = 3
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 5;
									@(posedge clk);
									@(posedge clk); // bsc = 7; bic = 4
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 10;
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 15;
									@(posedge clk); // bsc = 0; bic = 4
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 5;
									@(posedge clk);
									@(posedge clk); // bsc = 7; bic = 5
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 10;
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 15;
									@(posedge clk); // bsc = 0; bic = 5
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 5;
									@(posedge clk);
									@(posedge clk); // bsc = 7; bic = 6
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 10;
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 15;
									@(posedge clk); // bsc = 0; bic = 6
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 5;
									@(posedge clk);
									@(posedge clk); // bsc = 7; bic = 7
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 10;
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 15;
									@(posedge clk); // bsc = 0; bic = 7
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 5;
									@(posedge clk);
									@(posedge clk); // bsc = 7; bic = 8
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 10;
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 15;
									@(posedge clk); // bsc = 0; bic = 8
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 5;
									@(posedge clk);
									@(posedge clk); // bsc = 7; bic = 9
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 10;
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 15;
									@(posedge clk); // bsc = 0; bic = 9
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 5;
									@(posedge clk);
									@(posedge clk); // bsc = 7; bic = 0
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 10;
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 15;
									@(posedge clk); // bsc = 0; bic = 0
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 5;
									@(posedge clk);
									@(posedge clk); // bsc = 7; bic = 1
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // bsc = 10;
					enable <= 0;	@(posedge clk);
									@(posedge clk); // bsc = 0; bic = 0
		$finish;
	end

	// gtkwave filedump
	initial begin
		$dumpfile("bitCounter.vcd");
		$dumpvars;
	end
endmodule
