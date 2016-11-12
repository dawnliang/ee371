`include "scanner.v"
module scanner_testbench();
	reg clk, reset;
	reg initialOn, goToStandby, startScan, startTransfer, flush;
	wire otherGoToStandby, otherStartScan, otherFlush;
	wire [3:0] buffer_progress;
	wire [2:0] state;

	// set up clock
	parameter CLOCK_PERIOD = 10;
	initial clk = 0;
	always begin
		#(CLOCK_PERIOD/2);
		clk = ~clk;
	end

	scanner dut (.buffer_progress(buffer_progress), .state(state), .whichScanner(1'b0), .otherGoToStandby(otherGoToStandby),
		.otherStartScan(otherStartScan), .otherFlush(otherFlush), .initialOn(initialOn), .goToStandby(goToStandby),
		.startScan(startScan), .startTransfer(startTransfer), .flush(flush), .clk(clk), .reset(reset));

	initial begin
		reset <= 1;																							@(posedge clk);
																											@(posedge clk);
		reset <= 0;	initialOn <= 0;	goToStandby <= 0;	startScan <= 0;	startTransfer <= 0;	flush <= 0;		@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
									goToStandby <= 1;														@(posedge clk);
									goToStandby <= 0;														@(posedge clk);
																											@(posedge clk);
					initialOn <= 1;																			@(posedge clk);
					initialOn <= 0;																			@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																		startTransfer <= 1;					@(posedge clk);
																		startTransfer <= 0;					@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
									goToStandby <= 1;														@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
														startScan <= 1;										@(posedge clk);
									goToStandby <= 0;														@(posedge clk);
																											@(posedge clk);
														startScan <= 0;										@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																							flush <= 1;		@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																							flush <= 0;		@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
																											@(posedge clk);
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
		$dumpfile("scanner.vcd");
		$dumpvars;
	end
endmodule