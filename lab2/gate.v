// EE371 Lab2 Autumn 2016
// authors: William Li, Dawn Liang, Jun Park
// date: 02 November 2016
// 
// temporary separate gate module for testing combinational logic
module gate(doorOpen, fiveMinTillArriv, diffOk, whatGate, poundOccu, ctrl, reset);
	output doorOpen;
	input fiveMinTillArriv, diffOk, whatGate, poundOccu, ctrl, reset;
	
	assign doorOpen = ctrl && ((~whatGate && diffOk) || 			// departure gate logic
		(whatGate && diffOk && ~poundOccu && fiveMinTillArriv));	// arrival gate logic
endmodule
