`include "clock_divider.v"
`include "innerWaterLvl.v"
`include "poundOccupied.v"
module overall(arrivGate, deptGate, insideWaterLvl, poundOccupied, incr, decr, arrivOutsideLvl, deptOutsideLvl, fiveMinTillArrival, gateCtrl, clock, reset);
	output [3:0] insideWaterLvl; // LEDs
	output arrivGate, deptGate; // LEDs
	output poundOccupied; // LED

	input [3:0] arrivOutsideLvl, deptOutsideLvl; // SWs
	input incr, decr, fiveMinTillArrival, gateCtrl; // KEYs
	input clock, reset; // internal, SW

	// clock divider
	wire clk;
	clock_divider #(0) cDiv (clock, clk); // using non-0/1th bit causes gate errors..

	// gates
	wire diffOkArr, diffOkDept;
	assign diffOkArr = (insideWaterLvl == arrivOutsideLvl);
	assign diffOkDept = (insideWaterLvl == deptOutsideLvl);
	assign arrivGate = gateCtrl && (fiveMinTillArrival && ~poundOccupied && diffOkArr);
	assign deptGate = gateCtrl && diffOkDept;

	// lock occupied
	poundOccupied occup(.out(poundOccupied), .arrivalGate(arrivGate), .departureGate(deptGate), .clk(clk), .reset(reset));

	wire sealed;
	assign sealed = ~(arrivGate || deptGate);

	// controlling lock water levels
	reg [3:0] max, min;
	always@(*) begin
		if (arrivOutsideLvl > deptOutsideLvl) begin
			max = arrivOutsideLvl;
			min = deptOutsideLvl;
		end else begin
			max = deptOutsideLvl;
			min = arrivOutsideLvl;
		end
	end

	innerWaterLvl inner (.out(insideWaterLvl), .enable(sealed), .up(incr), .down(decr), .max(max), .min(min), .clk(clk), .reset(reset));
endmodule