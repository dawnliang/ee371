// EE371 Lab2 Autumn 2016
// authors: William Li, Dawn Liang, Jun Park
// date: 02 November 2016
//
// FSM to keep track of the state of the lock; whether it is currently occupied
module poundOccupied(out, arrivalGate, departureGate, clk, reset);
	output out;
	input  arrivalGate, departureGate;
	input  clk, reset; 

	// comb logic
	// 1 = occupied, 0 = unoccupied
	reg ps, ns;
	always@(*) begin
		case (ps)
			0:	if (arrivalGate)
					ns = 1;
				else
					ns = 0;

			1:  if (departureGate)
					ns = 0;
				else
					ns = 1;
		endcase
	end

	// output logic
	assign out = ps; 

	// sequential logic
	always @(posedge clk) begin
		if (reset) begin
			ps <= 0;
		end else begin
			ps <= ns;
		end
	end
endmodule