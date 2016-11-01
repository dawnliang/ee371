module poundOccupied(out, arrivalGate, departureGate, clk, reset);
	output out;
	input  arrivalGate, departureGate;
	input  clk, reset; 

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

	assign out = ps; 

	always @(posedge clk) begin
		if (reset) begin
			ps <= 0;
		end else begin
			ps <= ns;
		end
	end
endmodule