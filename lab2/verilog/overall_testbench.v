// EE371 Lab2 Autumn 2016
// authors: William Li, Dawn Liang, Jun Park
// date: 02 November 2016
// 
// testbench for overall module: tests normal operating conditions
// failure test cases: no fiveMinTillArrival signal, incr & decr pressed
`include "overall.v"
module overall_testbench();
	reg clk, reset;
	reg incr, decr, fiveMinTillArrival, gateCtrl;
	reg [3:0] arrivOutsideLvl, deptOutsideLvl;

	wire arrivGate, deptGate, poundOccupied;
	wire [3:0] insideWaterLvl;

	// connect I/Os
	overall dut (.arrivGate(arrivGate), .deptGate(deptGate),
		.insideWaterLvl(insideWaterLvl), .poundOccupied(poundOccupied), .incr(incr),
		.decr(decr), .arrivOutsideLvl(arrivOutsideLvl), .deptOutsideLvl(deptOutsideLvl),
		.fiveMinTillArrival(fiveMinTillArrival), .gateCtrl(gateCtrl), .clock(clk), .reset(reset));

	// set up clock
	parameter CLOCK_PERIOD = 5;
	initial clk = 1;
	always begin
		#(CLOCK_PERIOD/2);
		clk = ~clk;
	end

	// start simulation
	initial begin
		reset <= 1;																	@(posedge clk);
																					@(posedge clk);
		reset <= 0;	arrivOutsideLvl <= 4'b0100; deptOutsideLvl <= 4'b0000;
					incr <= 0; decr <= 0;	fiveMinTillArrival <= 0; gateCtrl <= 0;	@(posedge clk);
											gateCtrl <= 1;							@(posedge clk);
																					@(posedge clk);
											gateCtrl <= 0;							@(posedge clk);
											fiveMinTillArrival <= 1;				@(posedge clk);
																					@(posedge clk);
					incr <= 1;														@(posedge clk);
																					@(posedge clk);
																					@(posedge clk);
																					@(posedge clk);
																					@(posedge clk);
																					@(posedge clk);
																					@(posedge clk);
																					@(posedge clk);
																					@(posedge clk);
											fiveMinTillArrival <= 1;				@(posedge clk);
											gateCtrl <= 1;							@(posedge clk);
																					@(posedge clk);
											gateCtrl <= 0;							@(posedge clk);
																					@(posedge clk);
					decr <= 1;														@(posedge clk);
					incr <= 0;														@(posedge clk);
																					@(posedge clk);
																					@(posedge clk);
																					@(posedge clk);
																					@(posedge clk);
																					@(posedge clk);
																					@(posedge clk);
																					@(posedge clk);
																					@(posedge clk);
																					@(posedge clk);
																					@(posedge clk);
																					@(posedge clk);
																					@(posedge clk);
											gateCtrl <= 1;							@(posedge clk);
											gateCtrl <= 0;							@(posedge clk);
																					@(posedge clk);
																					@(posedge clk);
		$finish;
	end

	// gtkwave filedump
	initial begin
		$dumpfile("overall.vcd");
		$dumpvars;
	end
endmodule
