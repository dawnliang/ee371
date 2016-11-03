// BOARD I/O's
// 
// LED[0] poundOccupied
// LED[4:1] insideWaterLvl
// LED[5] deptGate
// LED[6] arrivGate
// 
// SW[3:0] arrivOutsideLvl
// SW[7:4] deptOutsideLvl
//
// KEY0 decr
// KEY1 incr
// KEY2 gateCtrl

module overall(arrivGate, deptGate, insideWaterLvl, poundOccupied, incr, decr, arrivOutsideLvl, deptOutsideLvl, fiveMinTillArrival, gateCtrl, clock, reset);
	output [3:0] insideWaterLvl;
	output arrivGate, deptGate;
	output poundOccupied;

	input [3:0] arrivOutsideLvl, deptOutsideLvl;
	input incr, decr, fiveMinTillArrival, gateCtrl;
	input clock, reset;

	// clock divider
	wire [31:0] clks;
	clock_divider cDiv (clock, clks); // using non-0/1th bit causes gate errors..
	wire clk;
	assign clk = clks[22];

	// gates
	wire diffOkArr, diffOkDept;
	assign diffOkArr = (insideWaterLvl == arrivOutsideLvl);
	assign diffOkDept = (insideWaterLvl == deptOutsideLvl);
	assign arrivGate = ~gateCtrl && (fiveMinTillArrival && ~poundOccupied && diffOkArr);
	assign deptGate = ~gateCtrl && diffOkDept;

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

	innerWaterLvl inner (.out(insideWaterLvl), .enable(sealed), .up(~incr), .down(~decr), .max(max), .min(min), .clk(clk), .reset(reset));
endmodule