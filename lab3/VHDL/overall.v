module overall(clk, reset);
	input clk, reset;

	// HEX encodings    6543210
	parameter	HEXS = 7'b0010010,	// S s stands for Scanning state
				HEXt = 7'b0000111,	// t t stands for transferring state
				HEXF = 7'b0001110,	// F F stands for Flushing state
				HEXd = 7'b0100001,	// d d stands for idle state
				HEXb = 7'b1111100;	// b b stands for standby state

	parameter	HEXOFF = 7'b1111111,	// All segments are turned off to indicate Lowpower state
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

	parameter 	speed0 = 2'b00,		// 1x clock
				speed1 = 2'b01,		// 2x clock
				speed2 = 2'b10,		// 4x clock
				speed3 = 2'b11;		// 8x clock

	// clock division
	wire [31:0] divided_clocks;
	clock_divider clks (divided_clocks, clk);

	wire speed;

	// choosing clock speeds
	reg final_clock;
	always@(*) begin
		case(speed)
			speed0: final_clock = divided_clocks[0];
			speed1: final_clock = divided_clocks[1];
			speed2: final_clock = divided_clocks[2];
			speed3: final_clock = divided_clocks[3];
			default: final_clock = divided_clocks[0];
		endcase
	end

	counter(up, down, clk, reset);
endmodule