class mux_rd_agent extends uvm_agent;

	`uvm_component_utils(mux_rd_agent)

	mux_rd_mon 	monh;

	function new(string name="mux_rd_agent", uvm_component parent);
		super.new(name, parent);
	endfunction: new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		
		monh 	= mux_rd_mon::type_id::create("monh", this);
	endfunction: build_phase

endclass: mux_rd_agent
