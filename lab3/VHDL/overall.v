`include "scanner.v"
module overall(scan1_state, scan1_prog, scan2_state, scan2_prog,
				scan1_state_display, scan1_prog1_display, scan1_prog2_display, scan1_readyToTransfer,
				scan2_state_display, scan2_prog1_display, scan2_prog2_display, scan2_readyToTransfer,
					initialOn, startTransfer, clk, reset);
	input clk, reset;					// 50MHz clock, SW[0]
	input initialOn, startTransfer;		// KEY[0], KEY[1]

	output reg [6:0]	scan1_state_display, scan1_prog1_display, scan1_prog2_display, // HEX 2:0
						scan2_state_display, scan2_prog1_display, scan2_prog2_display; // HEX 5:3
	output scan1_readyToTransfer, scan2_readyToTransfer;	// LED[0], LED[1]

	// HEX encodings    6543210
	parameter	HEXS = 7'b0010010,	// S s stands for Scanning state
				HEXt = 7'b0000111,	// t t stands for transferring state
				HEXF = 7'b0001110,	// F F stands for Flushing state
				HEXd = 7'b0100001,	// d d stands for idle state
				HEXb = 7'b1111100;	// b b stands for standby state

	parameter	HEXOFF = 7'b1111111,// All segments are turned off
				HEXON = 7'b0000000;	// All segments are turned on

	parameter 	HEX0 = 7'b1000000,	// 0
				HEX1 = 7'b1111001,	// 1
				HEX2 = 7'b0100100,	// 2
				HEX3 = 7'b0110000,	// 3
				HEX4 = 7'b0011001,	// 4
				HEX5 = 7'b0010010,	// 5
				HEX6 = 7'b0000010,	// 6
				HEX7 = 7'b1111000,	// 7
				HEX8 = 7'b0000000,	// 8
				HEX9 = 7'b0010000;	// 9

	// state encodings
	parameter	lowPower = 3'b000,
				standby = 3'b001,
				scanning = 3'b010,
				idle = 3'b011,
				xferring = 3'b100,
				flushing = 3'b101;

	// 50 MHz clock division
	// wire [31:0] divided_clocks;
	// clock_divider cdiv (.divided_clocks(divided_clocks), .clk(clk));
	// reg final_clock = divided_clocks[22];

	// connecting wires
	output [3:0] scan1_prog, scan2_prog;
	output [2:0] scan1_state, scan2_state;
	wire 	scan1_otherGoToStandby, scan1_otherStartScan, scan1_otherFlush,
			scan2_otherGoToStandby, scan2_otherStartScan, scan2_otherFlush;

	// 2 scanners
	scanner scan1 (.buffer_progress(scan1_prog), .state(scan1_state), .readyToTransfer(scan1_readyToTransfer),
		.otherGoToStandby(scan1_otherGoToStandby), .otherStartScan(scan1_otherStartScan), .otherFlush(scan1_otherFlush),
		.whichScanner(1'b1), .initialOn(initialOn), .goToStandby(scan2_otherGoToStandby), .startScan(scan2_otherStartScan),
		.startTransfer(startTransfer), .flush(scan2_otherFlush), .clk(clk), .reset(reset));
	scanner scan2 (.buffer_progress(scan2_prog), .state(scan2_state), .readyToTransfer(scan2_readyToTransfer),
		.otherGoToStandby(scan2_otherGoToStandby), .otherStartScan(scan2_otherStartScan), .otherFlush(scan2_otherFlush),
		.whichScanner(1'b0), .initialOn(initialOn), .goToStandby(scan1_otherGoToStandby), .startScan(scan1_otherStartScan),
		.startTransfer(startTransfer), .flush(scan1_otherFlush), .clk(clk), .reset(reset));

	// output logic
	always@(*) begin
		case (scan1_state)
			lowPower:	begin
							scan1_state_display = HEXOFF;
							scan1_prog1_display = HEXOFF;
							scan1_prog2_display = HEXOFF;
						end
			standby:	begin
							scan1_state_display = HEXb;
							scan1_prog1_display = HEX0;
							scan1_prog2_display = HEX0;
						end
			scanning:	begin
							scan1_state_display = HEXS;
							case (scan1_prog)
							4'b0:		begin 					// 0
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX0;
										end
							4'b0001:	begin 					// 1
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX1;
										end
							4'b0010:	begin 					// 2
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX2;
										end
							4'b0011:	begin 					// 3
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX3;
										end
							4'b0100:	begin 					// 4
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX4;
										end
							4'b0101:	begin 					// 5
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX5;
										end
							4'b0110:	begin 					// 6
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX6;
										end
							4'b0111:	begin 					// 7
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX7;
										end
							4'b1000:	begin 					// 8
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX8;
										end
							4'b1001:	begin 					// 9
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX9;
										end
							4'b1010:	begin 					// 10
											scan1_prog1_display = HEX1;
											scan1_prog2_display = HEX0;
										end
							default:	begin
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX0;
										end
							endcase
						end
			idle:		begin
							scan1_state_display = HEXd;
							scan1_prog1_display = HEX1;
							scan1_prog2_display = HEX0;
						end
			xferring:	begin
							scan1_state_display = HEXt;
							case (scan1_prog)
							4'b0:		begin 					// 0
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX0;
										end
							4'b0001:	begin 					// 1
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX1;
										end
							4'b0010:	begin 					// 2
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX2;
										end
							4'b0011:	begin 					// 3
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX3;
										end
							4'b0100:	begin 					// 4
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX4;
										end
							4'b0101:	begin 					// 5
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX5;
										end
							4'b0110:	begin 					// 6
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX6;
										end
							4'b0111:	begin 					// 7
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX7;
										end
							4'b1000:	begin 					// 8
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX8;
										end
							4'b1001:	begin 					// 9
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX9;
										end
							4'b1010:	begin 					// 10
											scan1_prog1_display = HEX1;
											scan1_prog2_display = HEX0;
										end
							default:	begin
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX0;
										end
							endcase
						end
			flushing:	begin
							scan1_state_display = HEXF;
							case (scan1_prog)
							4'b0:		begin 					// 0
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX0;
										end
							4'b0001:	begin 					// 1
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX1;
										end
							4'b0010:	begin 					// 2
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX2;
										end
							4'b0011:	begin 					// 3
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX3;
										end
							4'b0100:	begin 					// 4
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX4;
										end
							4'b0101:	begin 					// 5
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX5;
										end
							4'b0110:	begin 					// 6
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX6;
										end
							4'b0111:	begin 					// 7
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX7;
										end
							4'b1000:	begin 					// 8
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX8;
										end
							4'b1001:	begin 					// 9
											scan1_prog1_display = HEX0;
											scan1_prog2_display = HEX9;
										end
							4'b1010:	begin 					// 10
											scan1_prog1_display = HEX1;
											scan1_prog2_display = HEX0;
										end
							default:	begin
											scan1_prog1_display = HEXOFF;
											scan1_prog2_display = HEXOFF;
										end
							endcase
						end
				default:	begin
								scan1_state_display = HEXOFF;
								scan1_prog1_display = HEXOFF;
								scan1_prog2_display = HEXOFF;
							end
		endcase

		case (scan2_state)
			lowPower:	begin
							scan2_state_display = HEXOFF;
							scan2_prog1_display = HEXOFF;
							scan2_prog2_display = HEXOFF;
						end
			standby:	begin
							scan2_state_display = HEXb;
							scan2_prog1_display = HEX0;
							scan2_prog2_display = HEX0;
						end
			scanning:	begin
							scan2_state_display = HEXS;
							case (scan2_prog)
							4'b0:		begin 					// 0
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX0;
										end
							4'b0001:	begin 					// 1
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX1;
										end
							4'b0010:	begin 					// 2
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX2;
										end
							4'b0011:	begin 					// 3
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX3;
										end
							4'b0100:	begin 					// 4
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX4;
										end
							4'b0101:	begin 					// 5
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX5;
										end
							4'b0110:	begin 					// 6
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX6;
										end
							4'b0111:	begin 					// 7
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX7;
										end
							4'b1000:	begin 					// 8
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX8;
										end
							4'b1001:	begin 					// 9
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX9;
										end
							4'b1010:	begin 					// 10
											scan2_prog1_display = HEX1;
											scan2_prog2_display = HEX0;
										end
							default:	begin
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX0;
										end
							endcase
						end
			idle:		begin
							scan2_state_display = HEXd;
							scan2_prog1_display = HEX1;
							scan2_prog2_display = HEX0;
						end
			xferring:	begin
							scan2_state_display = HEXt;
							case (scan2_prog)
							4'b0:		begin 					// 0
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX0;
										end
							4'b0001:	begin 					// 1
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX1;
										end
							4'b0010:	begin 					// 2
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX2;
										end
							4'b0011:	begin 					// 3
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX3;
										end
							4'b0100:	begin 					// 4
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX4;
										end
							4'b0101:	begin 					// 5
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX5;
										end
							4'b0110:	begin 					// 6
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX6;
										end
							4'b0111:	begin 					// 7
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX7;
										end
							4'b1000:	begin 					// 8
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX8;
										end
							4'b1001:	begin 					// 9
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX9;
										end
							4'b1010:	begin 					// 10
											scan2_prog1_display = HEX1;
											scan2_prog2_display = HEX0;
										end
							default:	begin
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX0;
										end
							endcase
						end
			flushing:	begin
							scan2_state_display = HEXF;
							case (scan2_prog)
							4'b0:		begin 					// 0
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX0;
										end
							4'b0001:	begin 					// 1
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX1;
										end
							4'b0010:	begin 					// 2
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX2;
										end
							4'b0011:	begin 					// 3
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX3;
										end
							4'b0100:	begin 					// 4
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX4;
										end
							4'b0101:	begin 					// 5
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX5;
										end
							4'b0110:	begin 					// 6
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX6;
										end
							4'b0111:	begin 					// 7
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX7;
										end
							4'b1000:	begin 					// 8
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX8;
										end
							4'b1001:	begin 					// 9
											scan2_prog1_display = HEX0;
											scan2_prog2_display = HEX9;
										end
							4'b1010:	begin 					// 10
											scan2_prog1_display = HEX1;
											scan2_prog2_display = HEX0;
										end
							default:	begin
											scan2_prog1_display = HEXOFF;
											scan2_prog2_display = HEXOFF;
										end
							endcase
						end
				default:	begin
								scan2_state_display = HEXOFF;
								scan2_prog1_display = HEXOFF;
								scan2_prog2_display = HEXOFF;
							end
		endcase
	end
endmodule