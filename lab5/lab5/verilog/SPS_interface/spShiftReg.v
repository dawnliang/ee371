module spShiftReg(data, parallelOut, serialIn, clk, rst);
	input			clk, rst,		// bit_clk
					serialIn;
	output [7:0]	parallelOut;

	output reg [9:0] data;
	initial data = 10'b1111111111;

	always@(posedge clk) begin
		if (rst) data <= 10'b1111111111;
		else data <= {data[8:0], serialIn};
	end

	assign parallelOut = data[8:1];
endmodule
