/*
	Testing module for synchronous counter generated via schematic entry

	Authors: William Li, Dawn Liang, Jun Park
	Date: 16 Oct 2016
*/
`include "shematicEntrySynUpCounter.v"

module schmSynUpCounter_testbench;
	wire Cout, Q0, Q1, Q2, Q3; 
	reg clk, rst, enable;

	shematicEntrySynUpCounter dut(.Cout, .Q0, .Q1, .Q2, .Q3, .rst, .clk, .enable);
	
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
		$display("\t\t Cout\t Q3\t Q2\t Q1\t Q0\t enable\t clk\t rst\t Time");
		$monitor("\t\t %b\t  %b\t  %b\t %b\t %b\t %b\t %b\t %b\t", Cout, Q3, Q2, Q1, Q0, enable, clk, rst, $time);
	end
	
	initial // Stimulus
	begin
		rst = 0; enable = 0; #delay;
		rst = 1; enable = 0; #delay;
					enable = 1; #delay;
					enable = 1; #delay;
					enable = 1; #delay;
					enable = 1; #delay;
					enable = 1; #delay;
					enable = 1; #delay;
					enable = 1; #delay;
					enable = 1; #delay;
					enable = 1; #delay;
					enable = 1; #delay;
					enable = 1; #delay;
					enable = 1; #delay;
					enable = 1; #delay;
					enable = 1; #delay;
					enable = 0; #delay;
					enable = 0; #delay;
					enable = 0; #delay;
					enable = 1; #delay;
					enable = 1; #delay;
					enable = 1; #delay;
					enable = 1; #delay;
					enable = 1; #delay;
					enable = 1; #delay;
					enable = 1; #delay;
					enable = 1; #delay;
		$finish; // finish simulation
	end 
	
	// file for gtkwave
	initial begin
		// these two files support gtkwave and are required
		$dumpfile("schm.vcd");
		$dumpvars;
	end
endmodule
