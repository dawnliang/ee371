module rippleUpCounter(out, clk, rst);
	output logic [3:0] out;
	input logic clk, rst;
	logic Q0, Q1, Q2, Q3, clkTemp1, clkTemp2, clkTemp3, clkTemp4;
	
	DFlipFlop d0(.q(Q0), .qBar(clkTemp1), .D(clkTemp1), .clk(clk), .rst(rst));
	DFlipFlop d1(.q(Q1), .qBar(clkTemp2), .D(clkTemp2), .clk(clkTemp1), .rst(rst));
	DFlipFlop d2(.q(Q2), .qBar(clkTemp3), .D(clkTemp3), .clk(clkTemp2), .rst(rst));
	DFlipFlop d3(.q(Q3), .qBar(clkTemp4), .D(clkTemp4), .clk(clkTemp3), .rst(rst));
	
	assign out = {Q3, Q2, Q1, Q0}; //not {Q0, Q1, Q2, Q3};
endmodule


module rippleUpCounter_testbench;
	logic [3:0] out;
	logic clk, rst;

	rippleUpCounter dut(.out, .clk, .rst);
	
	parameter PERIOD = 100; // period = length of clock
	initial begin
		clk <= 0;
		forever #(PERIOD/2) clk = ~clk;
	end
	
	initial begin
		rst=0; @(posedge clk);;
		rst=1; @(posedge clk);;
	end
endmodule
	