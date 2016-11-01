`include "clkDivider.v"
`include "adjustWater.v"
`include "gate.v"
`include "poundOccupied.v"
module overall(arrivGate, deptGate, insideWaterLvl, poundOccupied, incr, decr, arrivOutsideLvl, deptOutsideLvl, fiveMinTillArrival, clock, reset);
	output [3:0] arrivGate, deptGate, insideWaterLvl; // LEDs
	output poundOccupied; // LED

	input [3:0] arrivOutsideLvl, deptOutsideLvl; // LEDs
	input incr, decr, fiveMinTillArrival; // KEYs
	input clock, reset; // internal, SW

	wire diffOkArr, diffOkDept;

	clkDivider cDiv(clock, clk);

	adjustWater adj(.insideLvl(insideWaterLvl), .incr(incr), .decr(decr), .arrOutsideLvl(arrivOutsideLvl), .deptOutsideLvl(deptOutsideLvl), .diffOkArr(diffOkArr), .diffOkDept(diffOkDept), .clk(clk), .reset(reset));
	
	gate arrivGate(.doorOpen(arrivGate), .fiveMinTillArriv(fiveMinTillArrival), .diffOk(diffOkArr), .whatGate(1), .poundOccu(poundOccupied), .reset(reset));
	gate deptGate(.doorOpen(deptGate), .fiveMinTillArriv(fiveMinTillArrival), .diffOk(diffOkDept), .whatGate(0), .poundOccu(poundOccupied), .reset(reset));

	poundOccupied occup(.canalState(poundOccupied), .arrivalGate(arrivGate), .departureGate(deptGate), .clk(clk), .reset(reset));
endmodule