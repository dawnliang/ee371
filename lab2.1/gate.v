module gate(doorOpen, fiveMinTillArriv, diffOk, whatGate, poundOccu, reset);
	output doorOpen;
	input fiveMinTillArriv, diffOk, whatGate, poundOccu, reset;
	
	assign doorOpen = (~whatGate && poundOccu && diffOk) || (whatGate && diffOk && ~poundOccu && fiveMinTillArriv);	
endmodule
