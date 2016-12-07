	nios2 u0 (
		.clk_clk                (<connected-to-clk_clk>),                //             clk.clk
		.reset_reset_n          (<connected-to-reset_reset_n>),          //           reset.reset_n
		.ctrl_sps_export        (<connected-to-ctrl_sps_export>),        //        ctrl_sps.export
		.framing_sps_export     (<connected-to-framing_sps_export>),     //     framing_sps.export
		.readytotransfer_export (<connected-to-readytotransfer_export>), // readytotransfer.export
		.ctrl_scanner_export    (<connected-to-ctrl_scanner_export>),    //    ctrl_scanner.export
		.in_scanner_export      (<connected-to-in_scanner_export>),      //      in_scanner.export
		.out_scanner_export     (<connected-to-out_scanner_export>),     //     out_scanner.export
		.out_sps_export         (<connected-to-out_sps_export>),         //         out_sps.export
		.in_sps_export          (<connected-to-in_sps_export>)           //          in_sps.export
	);

