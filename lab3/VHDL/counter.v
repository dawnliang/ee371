module counter(val, up, down, clk, reset);
	output [3:0] val;
	input up, down, clk, reset;

	// combinational logic to count every clock edge
	// min/max set at 0/10
	reg [3:0] ps, ns;
	always@(*) begin
		if (up && ~down && (ps < 4'b1010)) begin
			ns = ps + 1'b1;
		end else if (down && ~up && (ps > 4'b0000)) begin
			ns = ps - 1'b1;
		end else begin
			ns = ps;
		end
	end

	// output logic
	assign val = ps;
	
	// sequential logic; reset & next state
	always@(posedge clk) begin
		if (reset) begin
			ps <= 0;
		end else begin
			ps <= ns;
		end
	end
endmodule