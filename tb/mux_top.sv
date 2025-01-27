module mux_top;

	`include "uvm_macros.svh"
	import uvm_pkg::*;
	import mux_pkg::*;

	bit clock;
	initial
		forever #(5) clock = ~clock;

	mux_intf intf(clock);

	mux_8x1 DUV(
		.in(intf.in),
		.sel(intf.sel),
		.out(intf.out)
	);

	initial begin

	    `ifdef VCS
     		$fsdbDumpvars(0, mux_top);
    	`endif
		uvm_config_db#(virtual mux_intf)::set(null, "*", "vif", intf);

		run_test();
	end

	property valid_out;
		@(posedge clock) $changed(DUV.sel) |-> (DUV.out == (DUV.in[DUV.sel]));
	endproperty

	VALID_OUT: assert property(valid_out);
	COV_VALID_OUT: cover property(valid_out);

endmodule: mux_top
