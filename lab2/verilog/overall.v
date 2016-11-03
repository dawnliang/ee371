// EE371 Lab2 Autumn 2016
// authors: William Li, Dawn Liang, Jun Park
// date: 02 November 2016
// 
// top-level module for lock control system
// manages I/O's, handles control signals & connects submodules
// 
// DE1-SOC BOARD I/O's
//   LED[0] poundOccupied
//   LED[4:1] insideWaterLvl
//   LED[5] deptGate
//   LED[6] arrivGate
//   SW[3:0] arrivOutsideLvl
//   SW[7:4] deptOutsideLvl
//   SW[8] fiveMinTillArrival
//   SW[9] reset
//   KEY0 decr
//   KEY1 incr
//   KEY2 gateCtrl
module overall(arrivGate, deptGate, insideWaterLvl, poundOccupied, incr, decr, arrivOutsideLvl, deptOutsideLvl, fiveMinTillArrival, gateCtrl, clock, reset);
	output [3:0] insideWaterLvl; // LED[4:1]
	output arrivGate, deptGate; // LED[6], LED[5]
	output poundOccupied; // LED[0]

	input [3:0] arrivOutsideLvl, deptOutsideLvl; // SW[3:0], SW[7:4]
	input incr, decr, gateCtrl; // KEY[1], KEY[0], KEY[2]
	input fiveMinTillArrival; // SW[8]
	input reset; // SW[9]

	input clock; // internal 50MHz clock

	// CLOCK DIVIDER
	wire [31:0] clks;
	clock_divider cDiv (clock, clks);
	wire clk;
	assign clk = clks[22];

	// LOCK STATE (OCCUPIED/UNOCCUPIED)
	poundOccupied occup(.out(poundOccupied), .arrivalGate(arrivGate), .departureGate(deptGate), .clk(clk), .reset(reset));

	// CONTROLLING GATES
	wire diffOkArr, diffOkDept;
	assign diffOkArr = (insideWaterLvl == arrivOutsideLvl);
	assign diffOkDept = (insideWaterLvl == deptOutsideLvl);
	assign arrivGate = ~gateCtrl && (fiveMinTillArrival && ~poundOccupied && diffOkArr);
	assign deptGate = ~gateCtrl && diffOkDept;

	wire sealed;
	assign sealed = ~(arrivGate || deptGate);

	// CONTROLLING LOCK WATER LEVELS

	// determine bounds for innerWaterLvl counter
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