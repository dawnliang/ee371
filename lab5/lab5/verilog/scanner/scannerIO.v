// scannerIO
module scannerIO(s1_data_out, s2_data_out, s1_state, s2_state, data_out, data_in, readyToTransfer, startScanning, transfer, clk, rst);
	input			clk, rst,					// 50MHz clk
					startScanning, transfer;
	input [7:0]		data_in;
	output [7:0]	data_out;
	output 			readyToTransfer;
	output [2:0]	s1_state, s2_state;

	// state encodings
	parameter LOWPOWER = 3'b000;
	parameter STANDBY = 3'b001;
	parameter SCANNING = 3'b010;
	parameter IDLE = 3'b011;
	parameter TRANSFER = 3'b100;
	parameter FLUSHING = 3'b101;

	// clock divider
	// wire [31:0] divided_clocks;
	// clock_divider cdiv (.divided_clocks(divided_clocks), .clk(clk));
	// assign final_clock = divided_clocks[22];

	// scanner subsystem
	output [7:0]	s1_data_out, s2_data_out;
	wire [3:0]	s1_buffer_progress, s2_buffer_progress;
	wire		s1_readyToTransfer, s2_readyToTransfer,
				s1_otherGoToStandby, s2_otherGoToStandby,
				s1_otherStartScan, s2_otherStartScan,
				s1_otherFlush, s2_otherFlush;

	scanner s1 (.data_out(s1_data_out), .buffer_progress(s1_buffer_progress), .state(s1_state), .readyToTransfer(s1_readyToTransfer), .otherGoToStandby(s1_otherGoToStandby), .otherStartScan(s1_otherStartScan), .otherFlush(s1_otherFlush),
				.data_in(data_in), .whichScanner(1'b1), .initialOn(startScanning), .goToStandby(s2_otherGoToStandby), .startScan(s2_otherStartScan), .startTransfer(transfer), .flush(s2_otherFlush), .clk(clk), .reset(rst));
	scanner s2 (.data_out(s2_data_out), .buffer_progress(s2_buffer_progress), .state(s2_state), .readyToTransfer(s2_readyToTransfer), .otherGoToStandby(s2_otherGoToStandby), .otherStartScan(s2_otherStartScan), .otherFlush(s2_otherFlush),
				.data_in(data_in), .whichScanner(1'b0), .initialOn(startScanning), .goToStandby(s1_otherGoToStandby), .startScan(s1_otherStartScan), .startTransfer(transfer), .flush(s1_otherFlush), .clk(clk), .reset(rst));

	// if either scanner is ready to transfer
	assign readyToTransfer = (s1_readyToTransfer || s2_readyToTransfer);

	// output the data of the transferring scanner
	reg [7:0] data_tgl;
	initial data_tgl = 8'b11111111;
	always@(*) begin
		if (s1_state == TRANSFER) data_tgl = s1_data_out;
		else if (s2_state == TRANSFER) data_tgl = s2_data_out;
		else data_tgl = 8'b11111111;
	end
	assign data_out = data_tgl;
endmodule
