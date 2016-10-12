module johnsonUpCounter(out, clk, rst);
	output logic [3:0] out;
	input logic clk, rst;
	logic [3:0] temp; 
	
	always_ff@(negedge rst or posedge clk) begin
		if (rst == 0)
		begin
			temp <= 4'b0000;
		end
		else if (clk == 1'b1)
		begin
			temp <= {~temp[0], temp[3:1]}; // right shift and negate most signf bit
		end	
	end

	assign out = temp;
endmodule

module DFlipFlop(q, qBar, D, clk, rst);
	input D, clk, rst;
	output q, qBar;
	reg q;
	
	not n1 (qBar, q);
	always@ (negedge rst or posedge clk) begin
		if(!rst)
			q = 0;
		else
			q = D;
	end
endmodule