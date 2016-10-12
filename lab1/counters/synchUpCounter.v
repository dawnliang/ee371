module synchUpCounter(out, clk, rst);
	output logic [3:0] out;
	input logic clk, rst;
	logic Q0, Q1, Q2, Q3, D0, D1, D2, D3, E;

	assign E = 1;

	DFlipFlop d0(.q(Q0), .qBar(), .D(D3), .clk(clk), .rst(rst));
	DFlipFlop d1(.q(Q1), .qBar(), .D(D0), .clk(clk), .rst(rst));
	DFlipFlop d2(.q(Q2), .qBar(), .D(D1), .clk(clk), .rst(rst));
	DFlipFlop d3(.q(Q3), .qBar(), .D(D2), .clk(clk), .rst(rst));

	assign D0 = Q0 ^. E;
	assign D1 = Q1 ^. (E & D0);
	assign D2 = Q2 ^. (E & D1);
	assign D3 <= Q3 ^. (E & D2);
	
	assign out = {Q3, Q2, Q1, Q0};
endmodule

module DFlipFlop(q, qBar, D, clk, rst);
	input D, clk, rst;
	output q, qBar;
	reg q;
	
	not n1 (qBar, q);
	always@ (negedge rst or posedge clk) begin
		if(!rst)
			q = 0;
		else
			q = D;
	end
endmodule