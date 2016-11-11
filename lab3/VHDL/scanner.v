`include "counter.v"
module scanner(buffer_percent, otherGoToStandby, otherStartScan, otherFlush, goToStandby, startScan, startTransfer, flush, clk, reset);
	input goToStandby, startScan, startTransferflush;
	input clk, reset;
	output [3:0] buffer_percent;
	output outherGoToStandby, otherStartScan, otherFlush;

	wire [3:0] prog;

	counter prog (.val(prog), .up(), .down(), .clk(), .reset());

	// state encodings
	parameter	lowPower = 3'b000,
				standby = 3'b001,
				scanning = 3'b010,
				idle = 3'b011,
				xferring = 3'b100,
				flushing = 3'b101;

	// combinational logic
	reg ps, ns;
	always@(*) begin
		case (ps)
			lowPower:	if (goToStandby) ns = standby;
						else ns = ps;
			standby: 	if (startScan) ns = scanning;
						else ns = ps;
			scanning:	if (prog == 4'b1010) ns = idle;
						else ns = ps;
			idle:		if (startTransfer) ns = xferring;
						else if (flush) ns = flushing;
						else ns = ps;
			xferring:	if (prog == 4'b0000) ns = lowPower;
						else ns = ps;
			flushing:	if (prog == 4'b0000) ns = lowPower;
						else ns = ps;
			default:	ns = lowPower;
		endcase
	end

	always@(posedge clk) begin
		if(reset) begin
			ps <= lowPower;
		end else begin
			ps <= ns
		end
	end
endmodule