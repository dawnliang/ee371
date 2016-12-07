module displayToHex (data, HEX);
	input [3:0] data;
	output reg [6:0] HEX;

	// looking at the hex display, start from 12o'clock and count up by going clockwise (from 0 to 5). 
	// The segment at the center is the 6th segment (out of the seven segments labeled 0 to 6).
	// binary value 1'b0 turns on a segment, whereas binary value 1'b1 turns off a segment 
	//	         6543210 			     
	// HEX0 = 7'b0000000; all segments are turned on
	// HEX0 = 7'b1111111; all segments are turned off
	// data is sent most significant bit first says peckol 
	always@(*) begin
		case (data) 
			4'b0000: HEX = 7'b1000000; // 0		
			4'b0001: HEX = 7'b1111001; // 1
			4'b0010: HEX = 7'b0100100; // 2
			4'b0011: HEX = 7'b0110000; // 3
			4'b0100: HEX = 7'b0011001; // 4
			4'b0101: HEX = 7'b0010010; // 5
			4'b0110: HEX = 7'b0000010; // 6
			4'b0111: HEX = 7'b1111000; // 7
			4'b1000: HEX = 7'b0000000; // 8
			4'b1001: HEX = 7'b0010000; // 9
			4'b1010: HEX = 7'b0001000; //A
			4'b1011: HEX = 7'b0000011; //b
			4'b1100: HEX = 7'b1000110; //C
			4'b1101: HEX = 7'b0100001; //d
			4'b1110: HEX = 7'b0000110; //E
			4'b1111: HEX = 7'b0001110; //F
			default: HEX = 7'b1111111; 		//default all off
		endcase
	end
endmodule




