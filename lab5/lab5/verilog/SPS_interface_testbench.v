// testbench for SPS_interface module
module SPS_interface_testbench();
	reg clk, rst;
	reg SW, dataIn;
	wire dataOut;
	wire [9:0] LED;

	// set up clock
	parameter PERIOD = 10;
	initial clk = 0;
	always begin
		#(PERIOD/2);
		clk = ~clk;
	end

	// device under test
	SPS_interface dut (.LED(LED), .SW(SW), .dataOut(dataOut), .dataIn(dataIn), .clk(clk), .rst(rst));

	// begin simulation
	initial begin
		rst <= 1;						@(posedge clk);
		rst <= 0; SW <= 0; dataIn <= 0;	@(posedge clk);
										@(posedge clk);
										@(posedge clk);
		$finish;
	end

	// gtkwave filedump
	initial begin
		$dumpfile("SPS_interface.vcd");
		$dumpvars;
	end
endmodule
