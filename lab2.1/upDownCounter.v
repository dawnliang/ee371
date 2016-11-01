module upDownCounter(out, up, down, diffOkArriv, diffOkDept, clk, reset);
	output [3:0] out;
	input up, down, clk, reset, diffOkArriv, diffOkDept;
	
	reg [3:0] val;
	reg enable;
	wire start, stop;

	assign start = up || down;
	assign stop = diffOkDept || diffOkArriv;

	assign out = val;

	always @(posedge clk) begin
		if (reset) begin
			val <= 4'b0000;
			enable <= 0;
		end else begin
			case(enable)
				0:	if (start) begin
						enable <= 1;
						if(up && ~down && (val < 4'b1111)) begin 			// count up
							val <= val + 1'b1;
						end else if (down && ~up && (val > 4'b0000)) begin // count down
							val <= val - 1'b1;
						end else begin 										// don't count
							val <= val;
						end
					end else begin
						val <= val;
					end
				1:	if (stop) begin
						enable <= 0;
						val <= val;
					end else begin
						if(up && ~down && (val < 4'b1111)) begin 			// count up
							val <= val + 1'b1;
						end else if (down && ~up && (val > 4'b0000)) begin // count down
							val <= val - 1'b1;
						end else begin 										// don't count
							val <= val;
						end
					end
			endcase
		end
	end
endmodule

