module RippleUpCounter4Bit(clk, rst);
	input clk, rst;
	logic q1, q2, q3, q4;
	logic w1, w2, w3, w4;
	
	DFlipFlop ff1 (.q(w1), .qBar(q1), .D(w1), .clk, .rst);
	DFlipFlop ff2 (.q(w2), .qBar(q2), .D(w2), .clk(q1), .rst);
	DFlipFlop ff3 (.q(w3), .qBar(q3), .D(w3), .clk(q2), .rst);
	DFlipFlop ff4 (.q(w4), .qBar(q4), .D(w4), .clk(q3), .rst);
endmodule

module DFlipFlop(q, qBar, D, clk, rst);
	input D, clk, rst;
	output q, qBar;
	reg q;
	
	not n1 (qBar, q);

	always@ (negedge rst or posedge clk)
	begin
		if(!rst)
			q = 0;
		else
			q = D;
	end
endmodule
