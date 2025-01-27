class mux_wr_seqr extends uvm_sequencer#(mux_wr_xtn);

	`uvm_component_utils(mux_wr_seqr)

	function new(string name="mux_wr_seqr", uvm_component parent);
		super.new(name, parent);
	endfunction: new

endclass: mux_wr_seqr
