
module nios2 (
	clk_clk,
	reset_reset_n,
	ctrl_sps_export,
	framing_sps_export,
	readytotransfer_export,
	ctrl_scanner_export,
	in_scanner_export,
	out_scanner_export,
	out_sps_export,
	in_sps_export);	

	input		clk_clk;
	input		reset_reset_n;
	output	[1:0]	ctrl_sps_export;
	input	[1:0]	framing_sps_export;
	input		readytotransfer_export;
	output	[1:0]	ctrl_scanner_export;
	input	[7:0]	in_scanner_export;
	output	[7:0]	out_scanner_export;
	output	[7:0]	out_sps_export;
	input	[7:0]	in_sps_export;
endmodule
