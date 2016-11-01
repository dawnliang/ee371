`include "clock_divider.v"
`include "innerWaterLvl.v"
`include "gate.v"
`include "poundOccupied.v"
module overall(arrivGate, deptGate, insideWaterLvl, poundOccupied, incr, decr, arrivOutsideLvl, deptOutsideLvl, fiveMinTillArrival, gateCtrl, clock, reset);
	output [3:0] insideWaterLvl; // LEDs
	output arrivGate, deptGate; // LEDs
	output poundOccupied; // LED

	input [3:0] arrivOutsideLvl, deptOutsideLvl; // SWs
	input incr, decr, fiveMinTillArrival, gateCtrl; // KEYs
	input clock, reset; // internal, SW

	// clock divider
	clock_divider #(1) cDiv (clock, clk);

	// gates
	wire diffOkArr, diffOkDept;
	assign diffOkArr = (insideWaterLvl == arrivOutsideLvl);
	assign diffOkDept = (insideWaterLvl == deptOutsideLvl);
	gate arriv (.doorOpen(arrivGate), .fiveMinTillArriv(fiveMinTillArrival), .diffOk(diffOkArr), .whatGate(1'b1), .poundOccu(poundOccupied), .ctrl(gateCtrl), .reset(reset));
	gate dept (.doorOpen(deptGate), .fiveMinTillArriv(fiveMinTillArrival), .diffOk(diffOkDept), .whatGate(1'b0), .poundOccu(poundOccupied), .ctrl(gateCtrl), .reset(reset));

	// lock occupied
	poundOccupied occup(.out(poundOccupied), .arrivalGate(arrivGate), .departureGate(deptGate), .clk(clk), .reset(reset));

	wire doorOpen;
	assign doorOpen = arrivGate || deptGate;

	// controlling lock water levels
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
endmodule