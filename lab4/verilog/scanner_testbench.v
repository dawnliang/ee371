// EE371 Lab3 Autumn 2016
// Authors: Dawn Liang, William Li, Jun Park
// Date: 13 Nov 2016
//
// testbench for scanner module: tests normal operationg conditions
`include "scanner.v"
module scanner_testbench();
	reg clk, reset;
	reg initialOn, goToStandby, startScan, startTransfer, flush;
	wire readyToTransfer, otherGoToStandby, otherStartScan, otherFlush;
	wire [3:0] buffer_progress;
	wire [2:0] state;
	wire [7:0] data_in, data_out;
	assign data_in = buffer_progress;

	// set up clock
	parameter CLOCK_PERIOD = 10;
	initial clk = 0;
	always begin
		#(CLOCK_PERIOD/2);
		clk = ~clk;
	end

	scanner dut (.buffer_progress(buffer_progress), .state(state), .readyToTransfer(readyToTransfer),
		.otherGoToStandby(otherGoToStandby), .otherStartScan(otherStartScan), .otherFlush(otherFlush),
		.data_out(data_out), .data_in(data_in), .whichScanner(1'b1),
		.initialOn(initialOn), .goToStandby(goToStandby), .startScan(startScan), .startTransfer(startTransfer), .flush(flush),
		.clk(clk), .reset(reset));

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