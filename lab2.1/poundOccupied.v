/*  EE 371 Lab 2
	Pound Occupied module 
	William Li, Jun Park, Dawn Liang

	poundOccupied module
*/

module poundOccupied(canalState, arrivalGate, departureGate, clk, reset);
	output canalState;
	input  arrivalGate;
	input  departureGate;
	input  clk;
	input  reset; 

	reg ps;
	reg ns; 

	parameter occupied = 1'b1, unoccupied = 1'b0;

	always@(*) begin
		case (ps)
			unoccupied: if (~arrivalGate && ~departureGate) ns = unoccupied;
						else if (arrivalGate && ~departureGate) ns = occupied;
						else ns = unoccupied;

			occupied:   if (~arrivalGate && ~departureGate) ns = occupied;
						else if (~arrivalGate && departureGate) ns = unoccupied;
						else ns = unoccupied;
		endcase
	end
	assign canalState = ps; 

	always @(posedge clk) begin
		if (reset) begin
			ps <= unoccupied;
		end else begin
			ps <= ns;
		end
	end
endmodule