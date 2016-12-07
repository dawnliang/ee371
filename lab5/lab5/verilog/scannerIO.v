module scannerIO(data_in, data_out, readyToTransfer, startScanning, transfer, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LED, SW, clk, rst);
	input clk, rst;
	input [7:0] SW;
	input [3:0] KEY;
	output [9:0] LED;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	
	input startScanning, transfer;
	input [7:0] data_in;
	output readyToTransfer;
	output [7:0] data_out;
	
	wire [31:0] divided_clocks;
	clock_divider cdiv (.clk(clk), .divided_clocks(divided_clocks));
	wire final_clock = divided_clocks[22];
	
	// state encodings
	parameter LOWPOWER = 3'b000;
	parameter STANDBY = 3'b001;
	parameter SCANNING = 3'b010;
	parameter IDLE = 3'b011;
	parameter TRANSFER = 3'b100;
	parameter FLUSHING = 3'b101;

	// scanner i/o signals
	reg [7:0] s1_data_in, s2_data_in;
	wire [7:0] s2_data_out, s1_data_out;
	wire [2:0] s1_state, s2_state;
	wire [3:0] s1_buffer_progress, s2_buffer_progress;

	// scanner/scanner interaction signals
	wire	s1_readyToTransfer, s2_readyToTransfer,
			s1_otherGoToStandby, s2_otherGoToStandby,
			s1_otherStartScan, s2_otherStartScan,
			s1_otherFlush, s2_otherFlush;

	// scanner/processor interaction signals
	wire startScanning, transfer, readyToTransfer;
	
	assign readyToTransfer = s1_readyToTransfer || s2_readyToTransfer;	// if either scanner is ready to transfer
	assign LED[9] = readyToTransfer;
	
	reg [7:0] d_out;
	always@(*) begin																		// transfer data from currently transferring scanner
		if (s1_state == TRANSFER) d_out = s1_data_out;
		else if (s2_state == TRANSFER) d_out = s2_data_out;
		else d_out = 7'b0;
		
		if (s1_state == SCANNING) s1_data_in = data_in;
		else s1_data_in = 7'b0;
		if (s2_state == SCANNING) s2_data_in = data_in;
		else s2_data_in = 7'b0;
	end
	assign data_out = d_out;

	// scanner subsystem
	scanner s1 (.data_out(s1_data_out), .buffer_progress(s1_buffer_progress), .state(s1_state), .readyToTransfer(s1_readyToTransfer),
		.otherGoToStandby(s1_otherGoToStandby), .otherStartScan(s1_otherStartScan), .otherFlush(s1_otherFlush),
		.data_in(s1_data_in), .whichScanner(1), .initialOn(startScanning), .goToStandby(s2_otherGoToStandby),
		.startScan(s2_otherStartScan), .startTransfer(transfer), .flush(s2_otherFlush), .clk(final_clock), .reset(~rst));
	scanner s2 (.data_out(s2_data_out), .buffer_progress(s2_buffer_progress), .state(s2_state), .readyToTransfer(s2_readyToTransfer),
		.otherGoToStandby(s2_otherGoToStandby), .otherStartScan(s2_otherStartScan), .otherFlush(s2_otherFlush),
		.data_in(s2_data_in), .whichScanner(0), .initialOn(startScanning), .goToStandby(s1_otherGoToStandby),
		.startScan(s1_otherStartScan), .startTransfer(transfer), .flush(s1_otherFlush), .clk(final_clock), .reset(~rst));

	// display ctrl & status lines to red LEDs
															// s1
															// lowPower = no LED
	// assign LED[4] = (s1_state == STANDBY); 	// standby = LED4
	// assign LED[3] = (s1_state == SCANNING); 	// scanning = LED3
	// assign LED[2] = (s1_state == IDLE); 		// idle = LED2
	// assign LED[1] = (s1_state == TRANSFER); 	// transferring = LED1
	// assign LED[0] = (s1_state == FLUSHING); 	// flushing = LED0

															// s2
															// lowPower = no LED
	// assign LED[9] = (s2_state == STANDBY); 	// standby = LED4
	// assign LED[8] = (s2_state == SCANNING); 	// scanning = LED3
	// assign LED[7] = (s2_state == IDLE); 		// idle = LED2
	// assign LED[6] = (s2_state == TRANSFER); 	// transferring = LED1
	// assign LED[5] = (s2_state == FLUSHING); 	// flushing = LED0
	
	// display the input data & transfer data onto HEX displays
	displayToHex h0 (.data(s2_data_in[3:0]), .HEX(HEX0));
	displayToHex h1 (.data(s2_data_in[7:4]), .HEX(HEX1));
	displayToHex h2 (.data(s1_data_in[3:0]), .HEX(HEX2));
	displayToHex h3 (.data(s1_data_in[7:4]), .HEX(HEX3));
	displayToHex h4 (.data(data_out[3:0]), .HEX(HEX4));
	displayToHex h5 (.data(data_out[7:4]), .HEX(HEX5));
endmodule
