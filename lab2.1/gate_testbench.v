`include "gate.v"
module gate_testbench;
	wire doorOpen;
	reg fiveMinTillArriv, diffOk, whatGate, poundOccu, ctrl, reset; 	
	
	gate dut(.doorOpen(doorOpen), .fiveMinTillArriv(fiveMinTillArriv), .diffOk(diffOk), .whatGate(whatGate), .poundOccu(poundOccu), .ctrl(ctrl), .reset(reset)); 
	
	parameter delay = 10; 
	initial begin
		reset = 0; #delay;
		reset = 1; #delay;

		$display("whatGate ctrl poundOccu 5minTA diffOk ");
		$monitor("%b\t %b\t  %b\t  %b\t %b\t $b\t", whatGate, ctrl, poundOccu, fiveMinTillArriv, diffOk, doorOpen);
		
		whatGate = 0; ctrl = 0; poundOccu = 0; fiveMinTillArriv = 0; diffOk = 0; #delay;
		whatGate = 0; ctrl = 0; poundOccu = 0; fiveMinTillArriv = 0; diffOk = 1; #delay;
		whatGate = 0; ctrl = 0; poundOccu = 0; fiveMinTillArriv = 1; diffOk = 0; #delay;
		whatGate = 0; ctrl = 0; poundOccu = 0; fiveMinTillArriv = 1; diffOk = 1; #delay;
		whatGate = 0; ctrl = 0; poundOccu = 1; fiveMinTillArriv = 0; diffOk = 0; #delay;
		whatGate = 0; ctrl = 0; poundOccu = 1; fiveMinTillArriv = 0; diffOk = 1; #delay;
		whatGate = 0; ctrl = 0; poundOccu = 1; fiveMinTillArriv = 1; diffOk = 0; #delay;
		whatGate = 0; ctrl = 0; poundOccu = 1; fiveMinTillArriv = 1; diffOk = 1; #delay;
		whatGate = 0; ctrl = 1; poundOccu = 0; fiveMinTillArriv = 0; diffOk = 0; #delay;
		whatGate = 0; ctrl = 1; poundOccu = 0; fiveMinTillArriv = 0; diffOk = 1; #delay;
		whatGate = 0; ctrl = 1; poundOccu = 0; fiveMinTillArriv = 1; diffOk = 0; #delay;
		whatGate = 0; ctrl = 1; poundOccu = 0; fiveMinTillArriv = 1; diffOk = 1; #delay;
		whatGate = 0; ctrl = 1; poundOccu = 1; fiveMinTillArriv = 0; diffOk = 0; #delay;
		whatGate = 0; ctrl = 1; poundOccu = 1; fiveMinTillArriv = 0; diffOk = 1; #delay;
		whatGate = 0; ctrl = 1; poundOccu = 1; fiveMinTillArriv = 1; diffOk = 0; #delay;
		whatGate = 0; ctrl = 1; poundOccu = 1; fiveMinTillArriv = 1; diffOk = 1; #delay;
		whatGate = 1; ctrl = 0; poundOccu = 0; fiveMinTillArriv = 0; diffOk = 0; #delay;
		whatGate = 1; ctrl = 0; poundOccu = 0; fiveMinTillArriv = 0; diffOk = 1; #delay;
		whatGate = 1; ctrl = 0; poundOccu = 0; fiveMinTillArriv = 1; diffOk = 0; #delay;
		whatGate = 1; ctrl = 0; poundOccu = 0; fiveMinTillArriv = 1; diffOk = 1; #delay;
		whatGate = 1; ctrl = 0; poundOccu = 1; fiveMinTillArriv = 0; diffOk = 0; #delay;
		whatGate = 1; ctrl = 0; poundOccu = 1; fiveMinTillArriv = 0; diffOk = 1; #delay;
		whatGate = 1; ctrl = 0; poundOccu = 1; fiveMinTillArriv = 1; diffOk = 0; #delay;
		whatGate = 1; ctrl = 0; poundOccu = 1; fiveMinTillArriv = 1; diffOk = 1; #delay;
		whatGate = 1; ctrl = 1; poundOccu = 0; fiveMinTillArriv = 0; diffOk = 0; #delay;
		whatGate = 1; ctrl = 1; poundOccu = 0; fiveMinTillArriv = 0; diffOk = 1; #delay;
		whatGate = 1; ctrl = 1; poundOccu = 0; fiveMinTillArriv = 1; diffOk = 0; #delay;
		whatGate = 1; ctrl = 1; poundOccu = 0; fiveMinTillArriv = 1; diffOk = 1; #delay;
		whatGate = 1; ctrl = 1; poundOccu = 1; fiveMinTillArriv = 0; diffOk = 0; #delay;
		whatGate = 1; ctrl = 1; poundOccu = 1; fiveMinTillArriv = 0; diffOk = 1; #delay;
		whatGate = 1; ctrl = 1; poundOccu = 1; fiveMinTillArriv = 1; diffOk = 0; #delay;
		whatGate = 1; ctrl = 1; poundOccu = 1; fiveMinTillArriv = 1; diffOk = 1; #delay;
			
 		$finish; // finish simulation
	end 
	
	// file for gtkwave
	initial begin
		$dumpfile("gate.vcd");
		$dumpvars;
	end
endmodule 

