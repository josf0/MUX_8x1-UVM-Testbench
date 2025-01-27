class mux_wr_agent extends uvm_agent;

	`uvm_component_utils(mux_wr_agent)

	mux_wr_drv 	drvh;
	mux_wr_mon 	monh;
	mux_wr_seqr	seqrh;

	function new(string name="mux_wr_agent", uvm_component parent);
		super.new(name, parent);
	endfunction: new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		
		monh 	= mux_wr_mon::type_id::create("monh", this);
		drvh 	= mux_wr_drv::type_id::create("drvh", this);
		seqrh 	= mux_wr_seqr::type_id::create("seqrh", this);

	endfunction: build_phase

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);

		drvh.seq_item_port.connect(seqrh.seq_item_export);
	endfunction: connect_phase

endclass: mux_wr_agent
