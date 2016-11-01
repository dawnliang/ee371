`include "upDownCounter.v"
module upDownCounter_testbench;
	wire [3:0] out;
	reg up, down, enable, clk, reset;	
	
	upDownCounter dut(.out(out), .up(up), .down(down), .enable(enable), .clk(clk), .reset(reset));
	
	// set up clock
	parameter CLOCK_PERIOD = 10; 
	initial clk = 1;

	always begin 
		#(CLOCK_PERIOD/2);
		clk = ~clk; 
	end  
	
	initial begin
		$display("reset, up, down, enable, out");
		$monitor("%b\t %b\t  %b\t  %b\t %b\t", reset, up, down, enable, out);
		
		reset <= 1;											@(posedge clk);
		reset <= 0;											@(posedge clk);
					up <= 0;	down <= 0;	enable <= 1;	@(posedge clk);
															@(posedge clk);
															@(posedge clk);
					up <= 1;								@(posedge clk); // start counting up
															@(posedge clk); // 1
															@(posedge clk);
															@(posedge clk);
															@(posedge clk);
															@(posedge clk); // 5
															@(posedge clk);
															@(posedge clk);
											enable <= 0;	@(posedge clk);
															@(posedge clk);
															@(posedge clk); // 10
											enable <= 1;	@(posedge clk);
															@(posedge clk);
															@(posedge clk);
															@(posedge clk);
															@(posedge clk); // 15
															@(posedge clk);
															@(posedge clk);
															@(posedge clk);
															@(posedge clk);
								down <= 1;					@(posedge clk);
															@(posedge clk);
					up <= 0;								@(posedge clk);
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
															@(posedge clk);
															@(posedge clk);
															@(posedge clk);
															@(posedge clk);

 		$finish; // finish simulation
	end 
	
	// file for gtkwave
	initial begin
		// these two files support gtkwave and are required
		$dumpfile("upDownCounter_testbench.vcd");
		$dumpvars;
	end
endmodule 
