

module synUpCounter_testbench;
	logic [3:0] out;
	logic clk, rst;

	synUpCounter dut(.out, .clk, .rst);
	
	parameter PERIOD = 100; // period = length of clock
	initial begin
		clk <= 0;
		forever #(PERIOD/2) clk = ~clk;
	end
	
	initial begin
		rst=0; @(posedge clk);
		rst=1; @(posedge clk);
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
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
		  		 @(posedge clk);
		rst=0; @(posedge clk);
			    @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
		$stop();
	end
endmodule
