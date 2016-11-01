//`include "absDiff.v" 
module gate(doorOpen, fiveMinTillArriv, diffOk, whatGate, poundOccu, reset);
	output doorOpen;
	input fiveMinTillArriv, diffOk, whatGate, poundOccu, reset; 

	/*reg ps, ns; //present state, next state
	parameter CLOSED=1'b0, OPEN=1'b1; 
	
	always@(*) begin
		case(ps) begin
			CLOSED: if ((~whatGate && poundOccu && diffOk) || (whatGate && diffOk && ~poundOccu && fiveMinTillArriv)) begin
						ns = OPEN;
					    doorOpen = 1; //output along the edge of the mealy fsm				
					end else begin
						ns = CLOSED;
						doorOpen = 0; 
					end				
			OPEN:   ns = CLOSED;  //we assume no delay time for doors to open or close and 
				    doorOpen = 0; //no delay time for the boat to enter through the door	
		endcase
	endmodule
	
	always@(*) begin
		if (reset) begin
			ps <= CLOSED; 
		end else begin
			ps <= ns; 
		end
	end */	
	
	assign doorOpen = (~whatGate && poundOccu && diffOk) || (whatGate && diffOk && ~poundOccu && fiveMinTillArriv); 
	
endmodule 
