`include "absDiff.v"
module absDiff_testbench;
	wire [4:0] out;
	reg [4:0] a, b;

	absDiff dut(.out(out), .a(a), .b(b));
	parameter delay = 10;
	
	initial begin
		$display("\t\t out\t a\t b\t Time");
		$monitor("\t\t %b\t  %b\t  %b\t", out, a, b, $time);
	end

	initial begin
		a = 5'b00000; b = 5'b00000; #delay; 
		a = 5'b00011; b = 5'b00001; #delay; 
		a = 5'b00100; b = 5'b00011; #delay; 
		a = 5'b00111; b = 5'b01000; #delay;
		a = 5'b01111; b = 5'b01110; #delay;
		a = 5'b00110; b = 5'b01111; #delay;
	end
	
	// file for gtkwave
	initial begin
		// these two files support gtkwave and are required
		$dumpfile("absDiff.vcd");
		$dumpvars;
	end
endmodule 

