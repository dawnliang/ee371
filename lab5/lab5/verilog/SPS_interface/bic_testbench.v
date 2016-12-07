module bic_testbench();
	reg		clk, rst,
			enable;
	wire	endFrame;
	wire [3:0] frameProgress;

	// set up clock
	parameter PERIOD = 10;
	initial clk = 0;
	always begin
		#(PERIOD/2);
		clk = ~clk;
	end

	bic #(11) dut (.frameProgress(frameProgress), .endFrame(endFrame), .enable(enable), .clk(clk), .rst(rst));

	// begin simulation
	initial begin
		rst <= 1;					@(posedge clk);
		rst <= 0;	enable <= 0;	@(posedge clk);
					enable <= 1;	@(posedge clk); // 0
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // 5
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk); // 10
									@(posedge clk);
					enable <= 0;	@(posedge clk);
									@(posedge clk);
		$finish;
	end

	// gtkwave filedump
	initial begin
		$dumpfile("bic.vcd");
		$dumpvars;
	end
endmodule
