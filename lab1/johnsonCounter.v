module johnsonCounter(out, clk, rst);
	output logic [3:0] out;
	input logic clk, rst;
	logic q0, q1, q2, q3, a0, a1, a2, a3;

	DFlipFlop d0(.q(q0), .qBar(a0), .D(q3), .clk(clk), .rst(rst));
	DFlipFlop d1(.q(q1), .qBar(a1), .D(q0), .clk(clk), .rst(rst));
	DFlipFlop d2(.q(q2), .qBar(a2), .D(q1), .clk(clk), .rst(rst));
	DFlipFlop d3(.q(q3), .qBar(a3), .D(q2), .clk(clk), .rst(rst));
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

module johnsonCounter_testbench;
	logic [3:0] out;
	logic clk, rst;

	johnsonCounter dut(out, clk, rst);

	parameter PERIOD = 100; // period = length of clock
	initial begin
		clk <= 0;
		forever #(PERIOD/2) clk = ~clk;
	end

	initial begin
		rst=0; @(posedge clk);
		rst=1; @(posedge clk);
	end
endmodule