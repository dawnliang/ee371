`include "upDownCounter.v"
module adjustWater(insideLvl, incr, decr, arrOutsideLvl, deptOutsideLvl, diffOkArr, diffOkDept, clk, reset);
	input clk, reset;
	input incr, decr;
	input [3:0] arrOutsideLvl, deptOutsideLvl;

	output diffOkArr, diffOkDept;

	output [3:0] insideLvl;

	upDownCounter counter (.out(insideLvl), .up(incr), .down(decr), .diffOkArriv(diffOkArr), .diffOkDept(diffOkDept), .clk(clk), .reset(reset));

	assign diffOkArr = arrOutsideLvl[3:0] == insideLvl[3:0];
	assign diffOkDept = deptOutsideLvl[3:0] == insideLvl[3:0];
endmodule
