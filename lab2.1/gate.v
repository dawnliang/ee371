module gate(doorOpen, fiveMinTillArriv, diffOk, whatGate, poundOccu, ctrl, reset);
	output doorOpen;
	input fiveMinTillArriv, diffOk, whatGate, poundOccu, ctrl, reset;

	// add something to count to 5
	
	assign doorOpen = ctrl && ((~whatGate && diffOk) || (whatGate && diffOk && ~poundOccu && fiveMinTillArriv));
endmodule
