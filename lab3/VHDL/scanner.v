`include "scannerState.v"
`include "counterCtrl.v"
module scanner(buffer_progress, state, readyToTransfer, otherGoToStandby, otherStartScan, otherFlush,
				whichScanner, initialOn, goToStandby, startScan, startTransfer, flush, clk, reset);
	input clk, reset;
	input initialOn, goToStandby, startScan, startTransfer, flush, whichScanner;

	output readyToTransfer, otherGoToStandby, otherStartScan, otherFlush;
	output [3:0] buffer_progress;
	output [2:0] state;

	scannerState statedet (.state(state), .whichScanner(whichScanner), .initialOn(initialOn), .goToStandby(goToStandby), .startScan(startScan),
		.prog(buffer_progress), .startTransfer(startTransfer), .flush(flush), .clk(clk), .reset(reset));
	counterCtrl prog (.val(buffer_progress), .state(state), .clk(clk), .reset(reset));

	assign readyToTransfer = (buffer_progress == 5 && state == 3'b010);
	assign otherGoToStandby = (buffer_progress == 8 && state == 3'b010);
	assign otherStartScan = (buffer_progress == 9 && state == 3'b010);
	assign otherFlush = (buffer_progress == 5 && state == 3'b010);
endmodule