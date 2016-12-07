module overall(HEX0, HEX1, HEX2, HEX3, LED, serialOut, serialIn, clk, rst);
	input 	clk, rst,	// 50 MHz clk
				serialIn;
	output	serialOut;
	output [7:0] LED;
	output [6:0] HEX0, HEX1, HEX2, HEX3;

	wire charReceived, charSent;
	wire load, transmitEnable;
	wire serialOut, serialIn;
	wire [7:0]	parallelIn, parallelOut,
				scanner_in, scanner_out;
	wire readyToTransfer, startScanning, transfer;
	SPS_interface sps (.charReceived(charReceived), .charSent(charSent), .parallelOut(parallelOut), .serialOut(serialOut), .parallelIn(parallelIn), .serialIn(serialIn), .load(load), .transmitEnable(transmitEnable), .clk(clk), .rst(rst));
	scannerIO scanners (.data_out(scanner_out), .data_in(scanner_in), .readyToTransfer(readyToTransfer), .startScanning(startScanning), .transfer(transfer), .clk(clk), .rst(rst));

	wire [1:0] scannerCtrl, SPSCtrl, framingSPS;
	assign startScanning = scannerCtrl[0];
	assign transfer = scannerCtrl[1];
	assign load = SPSCtrl[0];
	assign transmitEnable = SPSCtrl[1];
	assign framingSPS = {charSent, charReceived};
	
	nios2 nios (.in_scanner_export(scanner_out), .out_scanner_export(scanner_in), .ctrl_scanner_export(scannerCtrl), .readytotransfer_export(readyToTransfer),
					.in_sps_export(parallelOut), .out_sps_export(parallelIn), .ctrl_sps_export(SPSCtrl), .framing_sps_export(framingSPS),
					.clk_clk(clk), .reset_reset_n(rst));
	
	// display received data on HEX
	displayToHex hex01 (.fourBitData(parallelIn[3:0]), .HEX(HEX0));
	displayToHex hex02 (.fourBitData(parallelIn[7:4]), .HEX(HEX1));
	displayToHex hex11 (.fourBitData(parallelOut[3:0]), .HEX(HEX2));
	displayToHex hex12 (.fourBitData(parallelOut[7:4]), .HEX(HEX3));
	
	// display scanner signals on LED[2:0]
	assign LED[0] = readyToTransfer;
	assign LED[1] = startScanning;
	assign LED[2] = transfer;
	
	// display SPS signals on LED[7:5]
	assign LED[7] = charReceived;
	assign LED[6] = charSent;
	assign LED[5] = transmitEnable;
endmodule
