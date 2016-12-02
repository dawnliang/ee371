`include "clock_divider.v"
`include "bitCounter.v"
`include "spShiftReg.v"
`include "psShiftReg.v"
module SPS_interface(LED, SW, dataOut, dataIn, clk, rst);
	input clk, rst;			// 50MHz clock & KEY0 rst
	// 10-bit data frames packaged as {start, 8-bit data, stop}
	input dataIn;			// serial input stream
	output dataOut;			// serial output stream

	input SW;				// which parallel data bus to monitor
	output [9:0] LED;		// led monitoring of parallel data bus

	// to get 16x data rate clock (= 153600 Hz), use clock 8 195312.5 Hz
	wire [31:0] divided_clocks;
	wire final_clock;
	clock_divider cdiv (.clk(clk), .divided_clocks(divided_clocks));
	assign final_clock = divided_clocks[8];

	// buffers between boards - acts as a diode
	wire sDataIn, sDataOut;
	buf bufin (dataIn, sDataIn);
	buf bufout (sDataOut, dataOut);

	// NIOS II
	wire [9:0] pDataIn, pDataOut;	// data lines
	wire charReceived, charSent;	// input ctrl signals to nios
	// nios2 (.pDataOut(pDataOut), .transmitEnable(transmitEnable), .load(load), .pDataIn(pDataIn), .charReceived(charReceived), charSent(charSent));


	// SERIAL DATA IN TO NIOS II

	// start bit detect
	reg enable;
	initial enable = 0;

	always@(*) begin
		case(enable)
			0: begin
				if (sDataIn == 1) enable = 1;	// at start bit, turn on bit counting
				else enable = 0;
			end
			1: begin
				if (charReceived) enable = 0;	// at stop bit, turn off bit counting
				else enable = 1;
			end
			default: enable = 0;
		endcase
	end

	bitCounter countIn (.bitClock(bit_clkIn), .nextChar(charReceived), .enable(enable), .clk(final_clock), .rst(rst));

	// shift register data buffer
	spShiftReg spIn (.parallelOut(pDataIn), .serialIn(sDataIn), .clk(bit_clkIn), .rst(rst));


	// PARALLEL DATA OUT OF NIOS II

	// transmission ctrl signals from nios
	wire load, transmitEnable;
	bitCounter countOut (.bitClock(bit_clkOut), .nextChar(charSent), .enable(transmitEnable), .clk(final_clock), .rst(rst));

	// shift register data buffer
	psShiftReg psOut(.serialOut(sDataOut), .parallelIn(pDataOut), .load(load), .clk(bit_clkOut), .rst(rst));

	// display parallel data bus on LEDs
	reg data_display;
	initial data_display = 10'b0;

	always@(*) begin
		if (SW == 1) data_display = pDataIn;	// SW on = show input data
		else data_display = pDataOut;			// SW off = show output data
	end

	assign LED = data_display;
endmodule

// testbench for SPS_interface module
module SPS_interface_testbench();
	reg clk, rst;
	reg SW, dataIn;
	wire dataOut;
	wire [9:0] LED;

	// set up clock
	parameter PERIOD = 10;
	initial clk = 0;
	always begin
		#(PERIOD/2);
		clk = ~clk;
	end

	// device under test
	SPS_interface dut (.LED(LED), .SW(SW), .dataOut(dataOut), .dataIn(dataIn), .clk(clk), .rst(rst));

	// begin simulation
	initial begin
		rst <= 1;						@(posedge clk);
		rst <= 0; SW <= 0; dataIn <= 0;	@(posedge clk);
										@(posedge clk);
										@(posedge clk);
		$finish;
	end

	// gtkwave filedump
	initial begin
		$dumpfile("SPS_interface.vcd");
		$dumpvars;
	end
endmodule