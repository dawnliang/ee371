// Implements a simple Nios II system for the DE-series board.
// Inputs: SW7−0 are parallel port inputs to the Nios II system
// CLOCK_50 is the system clock
// KEY0 is the active-low system reset
// Outputs: LEDG7−0 are parallel port outputs from the Nios II system
module lights (CLOCK_50, SW, KEY, LEDG);
input CLOCK_50;
input [7:0] SW;
input [0:0] KEY;
output [7:0] LEDG;
// Instantiate the Nios II system module generated by the Qsys tool:
//switchesqsys NiosII (
//.clk_clk(CLOCK_50),
//.reset_reset_n(KEY),
//.switches_export(SW),
//.leds_export(LEDG));
wire [3:0]out;

    /*switchesqsys u0 (
        .clk_clk                 (CLOCK_50),                 //              clk.clk
        .reset_reset_n           (KEY),           //            reset.reset_n
        .switches_export         (SW),         //         switches.export
        .leds_export             (LEDG),             //             leds.export
        .readytodownload1_export (0), // readytodownload1.export
        .outsignal_export        (out),        //        outsignal.export
        .curbyte1_export         (0),         //         curbyte1.export
        .readytodownload2_export (0), // readytodownload2.export
        .curbyte2_export         (0)          //         curbyte2.export
    );*/
	 
	 
	 
	 switchesqsys u0 (
			.clk_clk                 (CLOCK_50),                 //              clk.clk
        .reset_reset_n           (KEY),           //            reset.reset_n
        .switches_export         (SW),         //         switches.export
        .leds_export             (LEDG),             //             leds.export
        .readytodownload1_export (0), // readytodownload1.export
        .outsignal_export        (out),        //        outsignal.export
        .curbyte1_export         (0),         //         curbyte1.export
        .readytodownload2_export (0), // readytodownload2.export
        .curbyte2_export         (0),         //         curbyte2.export
		  .stroberead1_export      (0),      //      stroberead1.export
        .stroberead2_export      (0)       //      stroberead2.export
    );

endmodule


//switchesqsys u0 (
//        .clk_clk         (<connected-to-clk_clk>),         //      clk.clk
//        .reset_reset_n   (<connected-to-reset_reset_n>),   //    reset.reset_n
//        .switches_export (<connected-to-switches_export>), // switches.export
//        .leds_export     (<connected-to-leds_export>)      //     leds.export
//    );