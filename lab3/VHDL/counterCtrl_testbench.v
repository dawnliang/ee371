`include "counterCtrl.v"
module counterCtrl_testbench();
	reg [2:0] state;
	reg clk, reset;
	wire [3:0] val;

	counterCtrl dut (.val(val), .state(state), .clk(clk), .reset(reset));

	// set up clock
	parameter CLOCK_PERIOD = 10;
	initial clk = 0;
	always begin
		#(CLOCK_PERIOD/2);
		clk = ~clk;
	end

	initial begin
		reset <= 1;						@(posedge clk);
										@(posedge clk);
		reset <= 0;	state <= 3'b000;	@(posedge clk); // lowPower
										@(posedge clk);
										@(posedge clk);
					state <= 3'b001;	@(posedge clk); // standby
										@(posedge clk);
										@(posedge clk);
					state <= 3'b010;	@(posedge clk); // scanning
										@(posedge clk);
										@(posedge clk);
										@(posedge clk);
										@(posedge clk);
										@(posedge clk);
										@(posedge clk);
										@(posedge clk);
										@(posedge clk);
										@(posedge clk);
					state <= 3'b011;	@(posedge clk); // idle
										@(posedge clk);
										@(posedge clk);
					state <= 3'b100;	@(posedge clk); // xfer
										@(posedge clk);
										@(posedge clk);
										@(posedge clk);
										@(posedge clk);
										@(posedge clk);
					state <= 3'b101;	@(posedge clk); // flush
										@(posedge clk);
										@(posedge clk);
										@(posedge clk);
										@(posedge clk);
										@(posedge clk);
										@(posedge clk);
		$finish;
	end

	// gtkwave filedump
	initial begin
		$dumpfile("counterCtrl.vcd");
		$dumpvars;
	end
endmodule