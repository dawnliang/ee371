module SPS_interface(LED, SW, dataOut, dataIn, clk, rst);
	input clk, rst;			// 50MHz clock & KEY0 rst
	// 10-bit data frames packaged as {start, 8-bit data, stop}
	input dataIn;			// serial input stream
	output dataOut;			// serial output stream

	input SW;				// which parallel data bus to monitor
	output [7:0] LED;		// led monitoring of parallel data bus

	// to get 16x data rate clock (= 153600 Hz), use clock 8: 195312.5 Hz
	wire [31:0] divided_clocks;
	wire final_clock;
	clock_divider cdiv (.clk(clk), .divided_clocks(divided_clocks));
	assign final_clock = divided_clocks[8];

	// data lines
	wire sDataIn, sDataOut;
	wire [7:0] pDataIn, pDataOut;
	wire charReceived, charSent;	// input ctrl signals to nios
	
	wire [7:0] inToScanner, outOfScanner;
	wire readyToTransfer, startScanning, transfer;

	// buffers between boards - acts as a diode
	buf bufin (dataIn, sDataIn);
	buf bufout (sDataOut, dataOut);

	// NIOS II & SPS interface
	spIn niosIn (.parallelOut(pDataIn), .charReceived(charReceived), .serialIn(sDataIn), .clk(final_clock), .rst(rst));
	psOut niosOut (.serialOut(sDataOut), .charSent(charSent), .parallelIn(pDataOut), .load(load), .transmitEnable(transmitEnable), .clk(final_clock), .rst(rst));

	nios2 nios (.pdataout_export(pDataOut), .transmitenable_export(transmitEnable), .load_export(load), .pdatain_export(pDataIn),
					.charreceived_export(charReceived), .charsent_export(charSent),
					.intoscanner_export(inToScanner), .outofscanner_export(outOfScanner),
					.readytotransfer_export(readyToTransfer), .startscanning_export(startScanning), .transfer_export(transfer),
					.clk_clk(clk), .reset_reset_n(rst));
	
	// scanners subsystem
	scannerIO scanners (.data_in(inToScanner), .data_out(outOfScanner), .readyToTransfer(readyToTransfer), .startScanning(startScanning), .transfer(transfer),
								.clk(clk), .rst(rst));

	// display parallel data bus on LEDs
	reg [7:0] data_display;
	initial data_display = 8'b0;

	always@(*) begin
		if (SW == 1) data_display = pDataIn;	// SW on = show input data
		else data_display = pDataOut;			// SW off = show output data
	end

	assign LED = data_display;
endmodule
