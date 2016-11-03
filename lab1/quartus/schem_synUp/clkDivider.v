module clkDivider(clk,clk_out);
	input clk;
	output reg clk_out;
	reg [31:0] counter;

	always @(posedge clk) begin
		if(counter==32'b00000010000000000000000000000000) begin
			counter<=32'b0;
			clk_out <= ~clk_out;
		end else begin
			counter<=counter+1;
		end
	end
endmodule

