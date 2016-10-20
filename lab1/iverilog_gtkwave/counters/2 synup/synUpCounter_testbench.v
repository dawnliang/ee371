`include "synUpCounter.v"

module synUpCounter_testbench;
	wire [3:0] out;
	reg clk, rst;

	synUpCounter dut(.out(out), .clk(clk), .rst(rst));
	
	//-------------------------------------------------------
   parameter delay = 4; 
   
   initial begin
     clk = 0; 
     rst = 0; 
   end 
      
   always begin 
     #delay clk =  ! clk; 
   end  

	//-------------------------------------------------------
	initial // Response
	begin
		$display("\t\t out\t clk\t reset\t Time ");
		$monitor("\t\t %b\t  %b\t  %b\t", out, clk, rst, $time);
	end
	
	
	
	initial // Stimulus
	begin
		rst = 0; #delay;
		rst = 1; #delay;
		#delay;
		#delay;
		#delay;
		#delay;
		#delay;
		#delay;
		#delay;
		$finish; // finish simulation
	end 
	
	// file for gtkwave
	initial begin
		// these two files support gtkwave and are required
		$dumpfile("syn.vcd");
		$dumpvars;
	end
endmodule
