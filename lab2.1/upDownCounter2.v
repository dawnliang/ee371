module upDownCounter(out, up, down, enable, clk, reset);
	output [3:0] out;
	input up, down, enable, clk, reset;
	
	reg [3:0] val;

	assign out = val;

	always @(posedge clk) begin
		if (reset)
			val <= 4'b0000;
		else begin
			if (enable) begin 			// not paused
				if(up && ~down && (val < 4'b1111)) begin 			// count up
					val <= val + 1'b1;
				end else if (down && ~up && (val > 4'b0000)) begin // count down
					val <= val - 1'b1;
				end else begin 										// don't count
					val <= val;
				end
			end else begin 				// paused
				val <= val;
			end
		end
	end
endmodule

