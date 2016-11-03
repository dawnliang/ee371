// EE371 Lab2 Autumn 2016
// authors: William Li, Dawn Liang, Jun Park
// date: 02 November 2016
// 
// innerWaterLvl module: enable-counter that counts up/down based on inputs,
//   to max/min values
module innerWaterLvl(out, enable, up, down, max, min, clk, reset);
	input enable, up, down, clk, reset;
	input [3:0] max, min;
	output [3:0] out;

	// combinational logic
	// if enabled & not at max/min, count up/down based on input
	// otherwise don't count
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

	// output logic
	assign out = ps;

	// sequential logic
	always@(posedge clk) begin
		if (reset) begin
			ps <= 4'b0;
		end else begin
			ps <= ns;
		end
	end
endmodule
