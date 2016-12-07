module psShiftReg(data, serialOut, parallelIn, load, bit_clk, clk, rst);
	input			clk, rst,		// 16xdata rate clk
					bit_clk, load;	// bit_clk
	input [7:0]		parallelIn;
	output			serialOut;

	output reg [10:0] data;
	initial data = 11'b11111111111;

	reg [10:0] temp;
	initial temp = 11'b11111111111;
	
	always@(*) begin
		if (load) begin
			temp[0] = 1'b1;
			temp[1] = 1'b0;
			temp[9:2] = parallelIn;
			temp[10] = 1'b1;
		end
		
		if (bit_clk) temp <= {1'b1, temp[10:1]};
		else temp <= temp;
	end

	always@(posedge clk) begin
		if (rst) data <= 11'b11111111111;
		else data <= temp;
	end

	assign serialOut = data[0];
endmodule
