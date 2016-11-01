`include "poundOccupied.v"
module poundOccupied_testbench;
	wire canalState;
	reg arrivalGate, departureGate, clk, reset;
	
	poundOccupied dut (.canalState(canalState), .arrivalGate(arrivalGate), .departureGate(departureGate), .clk(clk), .reset(reset));
	
	parameter delay = 10;
	initial begin
		clk = 0;
	end
	
	always begin	
		#delay clk = ! clk;
	end
	
	
	initial begin	
		$display("reset, clk, arrivalGate, departureGate, canalState");
		$monitor("%b\t %b\t %b\t %b\t %b\t", reset, clk, arrivalGate, departureGate, canalState);

																
			reset <= 0;												@(posedge clk);
																	@(posedge clk);
																	@(posedge clk);
			reset <= 1;		arrivalGate <= 0; departureGate <= 0;	@(posedge clk);
																	@(posedge clk);
			reset <= 0;		arrivalGate <= 1; departureGate <= 0;	@(posedge clk);
							arrivalGate <= 0; departureGate <= 0;	@(posedge clk);
							arrivalGate <= 0; departureGate <= 1;	@(posedge clk);
																	@(posedge clk);
																	@(posedge clk);
																	@(posedge clk);
																	@(posedge clk);	
																	@(posedge clk);																	
		$finish;
	end
	
	initial begin
		$dumpfile("poundOccupied.vcd");
		$dumpvars;
	end
endmodule


	