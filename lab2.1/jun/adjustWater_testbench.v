`include "adjustWater2.v"
module adjustWater2_testbench;
	wire [3:0] insideWaterLvl;					 //while proper water difference is not met keep adjusting water level 
	wire diffOkInArr, diffOkInDept; 				 //otherwise stop adjusting aka stop counting up or down
	reg up, down, enable, clk, reset;  
	//reg up, down, clk, reset;
   // wire enable; 	
	reg [3:0] arrOutsideLvl, deptOutsideLvl;	

	adjustWater2 dut(.insideWaterLvl(insideWaterLvl), .diffOkInArr(diffOkInArr), .diffOkInDept(diffOkInDept), .up(up), 
	                 .down(down), .enable(enable), .arrOutsideLvl(arrOutsideLvl), .deptOutsideLvl(deptOutsideLvl), .clk(clk), .reset(reset));
	
	parameter delay = 10; 
	initial begin
		clk = 0; 
	end 
		  
	always begin 
		#delay clk =  ! clk; 
	end  
	
	initial begin
		$display("1.arrOutsideLvl 2.deptOutsideLvl 3.enable 4.up, 5.down 6.insideWaterLvl, 7.diffOkInArr, 8.diffOkInDept");
		$monitor("%b\t %b\t  %b\t  %b\t %b\t %b\t %b\t %b\t", 
		         arrOutsideLvl, deptOutsideLvl, enable, up, down, insideWaterLvl, diffOkInArr, diffOkInDept);

		reset <= 1; 							     					            		  #delay; 
		reset <= 0; 													            		  #delay;
	    $display("EndReset1");
		arrOutsideLvl <= 4'b0100; deptOutsideLvl <= 4'b1000; enable <= 1; up <= 1; down <= 0; #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;			  
		reset <= 1; 							     					            		  #delay; 
		reset <= 0; 													            		  #delay;
		$display("EndReset2");															      #delay;
		arrOutsideLvl <= 4'b1111; deptOutsideLvl <= 4'b0110; enable <= 1; up <= 1; down <= 0; #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;	
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;	
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;	
																							  #delay;
																							  #delay;
																							  #delay;																						  
        reset <= 1; 							     					            		  #delay; 																						  
																							  #delay;
																							  #delay;																						  
        reset <= 1; 							     					            		  #delay; 
		reset <= 0;																			  #delay;
		$display("EndReset3");                                                                #delay;
	    arrOutsideLvl <= 4'b1111; deptOutsideLvl <= 4'b1010; enable <= 1; up <= 1; down <= 0; #delay;
																							  #delay;
																							  #delay;
															 								  #delay;
																							  #delay;
																							  #delay;
															 enable <= 0;					  #delay;
																							  #delay;	
																							  #delay;
																							  #delay;
																							  #delay;	
																							  #delay;
															 enable <= 1;					  #delay;	
															                                  #delay;
																							  #delay;
																							  #delay;
        reset <= 1; 							     					            		  #delay; 
		reset <= 0;																			  #delay;
		$display("EndReset4");                                                                #delay;
		arrOutsideLvl <= 4'b1000; deptOutsideLvl <= 4'b1001; enable <= 1; up <= 1; down <= 0; #delay;
																							  #delay;
																							  #delay;
															 								  #delay;
																							  #delay;
																							  #delay;
																				              #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;	
																							  #delay;
																							  #delay;
																							  #delay;	
																							  #delay;
		arrOutsideLvl <= 4'b0101; deptOutsideLvl <= 4'b0000; enable <= 1; up <= 0; down <= 1; #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;
																							  #delay;																							  
																							  #delay;		
															 enable <= 1; up <= 1; down <= 1; #delay;
																							  #delay;		
																							  #delay;	
		
 		$finish; // finish simulation
	end 
	
	// file for gtkwave
	initial begin
		// these two files support gtkwave and are required
		$dumpfile("adjustWater2.vcd");
		$dumpvars;
	end	
endmodule 

