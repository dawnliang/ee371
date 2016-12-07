module psShiftReg(data, serialOut, parallelIn, load, bit_clk, clk, rst);
	input			clk, rst,		// 16xdata rate clk
					bit_clk, load;	// bit_clk
	input [7:0]		parallelIn;
	output			serialOut;

	output reg [10:0] data;
	initial data = 11'b11111111111;

	always@(*) begin
		if (load) begin
			data[0] = 1'b1;
			data[1] = 1'b0;
			data[9:2] = parallelIn;
			data[10] = 1'b1;
		end
	end

	always@(posedge clk) begin
		if (rst) data <= 11'b11111111111;
		else begin
			if (bit_clk) data <= {1'b1, data[10:1]};
			else data <= data;
		end
	end

	assign serialOut = data[0];
endmodule
