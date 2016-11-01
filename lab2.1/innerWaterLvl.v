module innerWaterLvl(out, enable, up, down, max, min, clk, reset);
	input enable, up, down, clk, reset;
	input [3:0] max, min;
	output [3:0] out;

	reg [3:0] ps, ns;

	always@(*) begin
		if (enable) begin
			if (up && ~down && (ps < max)) begin
				ns = ps + 1'b1;
			end else if (down && ~up && (ps > min)) begin
				ns = ps - 1'b1;
			end else begin
				ns = ps;
			end
		end else begin
			ns = ps;
		end
	end

	assign out = ps;

	always@(posedge clk) begin
		if (reset) begin
			ps <= 4'b0;
		end else begin
			ps <= ns;
		end
	end
endmodule
