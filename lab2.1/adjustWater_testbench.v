`include "adjustWater.v"
module adjustWater_testbench();
	reg clk, reset, up, down;
	wire diffOkArr, diffOkDept;
	reg [3:0] arrOutsideLvl, deptOutsideLvl;
	wire [3:0] insideLvl;

	adjustWater dut(.insideLvl(insideLvl), .incr(up), .decr(down), .arrOutsideLvl(arrOutsideLvl), .deptOutsideLvl(deptOutsideLvl), .diffOkArr(diffOkArr), .diffOkDept(diffOkDept), .clk(clk), .reset(reset));

	// set up clock
	parameter CLOCK_PERIOD = 10; 
	initial clk = 1;

	always begin 
		#(CLOCK_PERIOD/2);
		clk = ~clk; 
	end

	initial begin
		$display("1.arrOutsideLvl 2.deptOutsideLvl 3.up, 4.down 5.insideWaterLvl, 6.diffOkArr, 7.diffOkDept");
		$monitor("%b\t %b\t  %b\t  %b\t %b\t %b\t %b\t", 
		         arrOutsideLvl, deptOutsideLvl, up, down, diffOkArr, diffOkDept);

		reset <= 1;															@(posedge clk);
		reset <= 0;															@(posedge clk);
					arrOutsideLvl <= 4'b0000;	deptOutsideLvl <= 4'b1101;	@(posedge clk);
																			@(posedge clk);
					up <= 1'b1;	down <= 1'b0;								@(posedge clk);
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
																			@(posedge clk);
																			@(posedge clk);
					up <= 1'b0;	down <= 1'b1;								@(posedge clk);
												arrOutsideLvl <= 4'b1000;	@(posedge clk);
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

		$finish; // finish simulation
	end


	// file for gtkwave
	initial begin
		// these two files support gtkwave and are required
		$dumpfile("adjustWater_testbench.vcd");
		$dumpvars;
	end
endmodule
