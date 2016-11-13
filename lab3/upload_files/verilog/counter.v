// EE371 Lab3 Autumn 2016
// Authors: Dawn Liang, Jun Park, William Li
// Date: 13 Nov 2016
//
// counter that counts every clock edge up/down to a min/max (0/10)
// resets to 0
module counter(val, up, down, clk, reset);
	output [3:0] val;
	input up, down, clk, reset;

	// combinational logic: count every clock edge
	// min/max set at 0/10
	reg [3:0] ps, ns;
	always@(*) begin
		if (up && ~down && (ps < 4'b1010)) begin
			ns = ps + 1'b1;
		end else if (down && ~up && (ps > 4'b0)) begin
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
			ps <= 4'b0;
		end else begin
			ps <= ns;
		end
	end
endmodule
