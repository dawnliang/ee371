module synUpCounter(out, clk, rst);
	output [3:0] out;
	input clk, rst;
	
	wire Q0, Q1, Q2, Q3;
	wire D0, D1, D2, D3; 
	
	DFlipFlop dff0(.q(Q0), .qBar(), .D(D0), .clk(clk), .rst(rst));
	DFlipFlop dff1(.q(Q1), .qBar(), .D(D1), .clk(clk), .rst(rst));
	DFlipFlop dff2(.q(Q2), .qBar(), .D(D2), .clk(clk), .rst(rst));
	DFlipFlop dff3(.q(Q3), .qBar(), .D(D3), .clk(clk), .rst(rst));
	
	assign D0 = (~Q0)&rst;
	assign D1 = ((Q0&~Q1) | (Q1&~Q0))&rst;
	assign D2 = ((Q2&~Q1) | (Q2&~Q0) | (Q1&Q0&~Q2))&rst;
	assign D3 = ((Q3&~Q2) | (Q3&~Q1) | (Q3&~Q0) | (~Q3&Q2&Q1&Q0))&rst;  
	
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

