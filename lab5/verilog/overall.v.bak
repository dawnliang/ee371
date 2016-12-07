`include "SPS_interface/SPS_interface.v"
`include "scanner/scannerIO.v"
module overall(clk, rst);
	input 	clk, rst,	// 50 MHz clk
			serialIn;
	output	serialOut;

	// clock division
	wire [31:0] divided_clocks;
	clock_divider cdiv (.divided_clocks(divided_clocks), .clk(clk));

	wire charReceived, charSent;
	wire load, transmitEnable;
	wire serialOut, serialIn;
	wire [7:0]	parallelIn, parallelOut,
				scanner_in, scanner_out;
	wire readyToTransfer, startScanning, transfer;
	SPS_interface sps (.charReceived(charReceived), .charSent(charSent), .parallelOut(parallelOut), .serialOut(serialOut), .parallelIn(parallelIn), .serialIn(serialIn), .load(load), .transmitEnable(transmitEnable), .clk(divided_clocks[8]), .rst(rst));
	scannerIO scanners (.data_out(scanner_out), .data_in(scanner_in), .readyToTransfer(readyToTransfer), .startScanning(startScanning), .transfer(transfer), .clk(clk), .rst(rst));

	nios2 nios ();
endmodule
