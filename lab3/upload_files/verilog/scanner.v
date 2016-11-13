// EE371 Lab3 Autumn 2016
// Authors: Dawn Liang, William Li, Jun Park
// Date: 13 Nov 2016
// 
// scanner module including FSM and counter for control and memory systems
// outputs current state & buffer progress, and control signals for other
// scanner
module scanner(buffer_progress, state, readyToTransfer, otherGoToStandby, otherStartScan, otherFlush,
				whichScanner, initialOn, goToStandby, startScan, startTransfer, flush, clk, reset);
	input clk, reset;
	input initialOn, goToStandby, startScan, startTransfer, flush, whichScanner;

	output readyToTransfer, otherGoToStandby, otherStartScan, otherFlush;
	output [3:0] buffer_progress;
	output [2:0] state;
	
	parameter scanning = 3'b010;

	scannerState statedet (.state(state), .whichScanner(whichScanner), .initialOn(initialOn), .goToStandby(goToStandby), .startScan(startScan),
		.prog(buffer_progress), .startTransfer(startTransfer), .flush(flush), .clk(clk), .reset(reset));
	counterCtrl prog (.val(buffer_progress), .state(state), .clk(clk), .reset(reset));

	assign readyToTransfer = (buffer_progress == 5 && state == scanning);
	assign otherGoToStandby = (buffer_progress == 8 && state == scanning);
	assign otherStartScan = (buffer_progress == 9 && state == scanning);
	assign otherFlush = (buffer_progress == 5 && state == scanning);
endmodule
