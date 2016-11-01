`include "clock_divider.v"
`include "innerWaterLvl.v"
`include "gate.v"
`include "poundOccupied.v"
module overall(arrivGate, deptGate, insideWaterLvl, poundOccupied, incr, decr, arrivOutsideLvl, deptOutsideLvl, fiveMinTillArrival, clock, reset);
	output [3:0] insideWaterLvl; // LEDs
	output arrivGate, deptGate; // LEDs
	output poundOccupied; // LED

	input [3:0] arrivOutsideLvl, deptOutsideLvl; // SWs
	input incr, decr, fiveMinTillArrival; // KEYs
	input clock, reset; // internal, SW

	wire diffOkArr, diffOkDept;

	clock_divider #(24) cDiv (clock, clk);

	wire doorOpen = arrivGate || deptGate;

	reg [3:0] max, min;
	initial begin
		if (arrivOutsideLvl > deptOutsideLvl) begin
			assign max = arrivOutsideLvl;
			assign min = deptOutsideLvl;
		end else begin
			assign max = deptOutsideLvl;
			assign min = arrivOutsideLvl;
		end
	end

	innerWaterLvl inner (.out(insideWaterLvl), .enable(doorOpen), .up(incr), .down(decr), .max(max), .min(min), .clk(clk), .reset(reset));
	
	gate arriv(.doorOpen(arrivGate), .fiveMinTillArriv(fiveMinTillArrival), .diffOk(diffOkArr), .whatGate(1'b1), .poundOccu(poundOccupied), .reset(reset));
	gate dept(.doorOpen(deptGate), .fiveMinTillArriv(fiveMinTillArrival), .diffOk(diffOkDept), .whatGate(1'b0), .poundOccu(poundOccupied), .reset(reset));

	poundOccupied occup(.canalState(poundOccupied), .arrivalGate(arrivGate), .departureGate(deptGate), .clk(clk), .reset(reset));
endmodule