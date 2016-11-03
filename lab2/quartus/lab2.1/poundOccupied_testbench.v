module poundOccupied_testbench;
	wire occupied;
	reg arrivalGate, departureGate, clk, reset;
	
	poundOccupied dut (.out(occupied), .arrivalGate(arrivalGate), .departureGate(departureGate), .clk(clk), .reset(reset));
	
	parameter CLOCK_PERIOD = 5;
	initial clk = 1;
	
	always begin	
		#(CLOCK_PERIOD/2) clk = ~clk;
	end
	
	
	initial begin	
		$display("reset, clk, arrivalGate, departureGate, canalState");
		$monitor("%b\t %b\t %b\t %b\t %b\t", reset, clk, arrivalGate, departureGate, occupied);

																
			reset <= 1;		arrivalGate <= 0; departureGate <= 0;	@(posedge clk);
			reset <= 0;												@(posedge clk);
											  departureGate <= 1;	@(posedge clk);
							arrivalGate <= 1; departureGate <= 0;	@(posedge clk);
							arrivalGate <= 0; 						@(posedge clk);
											  departureGate <= 1;	@(posedge clk);
																	@(posedge clk);																
		$finish;
	end
	
	initial begin
		$dumpfile("poundOccupied.vcd");
		$dumpvars;
	end
endmodule


	