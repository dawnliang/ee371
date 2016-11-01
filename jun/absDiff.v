module absDiff(out, a, b); 
	output reg [3:0] out;
	input [3:0] a, b;

	reg [3:0] temp;

	always@(*) begin
		temp = (a-b); 
		if (temp[3] == 1) begin //if difference is negative 
		  out = (~temp)+1'b1;
		end else begin
	      out = temp;
		end 
	end


endmodule


