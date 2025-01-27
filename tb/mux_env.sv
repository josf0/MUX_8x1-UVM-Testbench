class mux_env extends uvm_env;

	`uvm_component_utils(mux_env)

	mux_wr_agent wr_agnth;
	mux_rd_agent rd_agnth;

	mux_scoreboard sbh;

	function new(string name="mux_env", uvm_component parent);
		super.new(name, parent);
	endfunction: new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);

		wr_agnth 	= mux_wr_agent::type_id::create("wr_agnth", this);
		rd_agnth 	= mux_rd_agent::type_id::create("rd_agnth", this);
		sbh			= mux_scoreboard::type_id::create("sbh", this);
	endfunction: build_phase

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);

		wr_agnth.monh.monitor_port.connect(sbh.wr_fifoh.analysis_export);
		rd_agnth.monh.monitor_port.connect(sbh.rd_fifoh.analysis_export);
	endfunction: connect_phase

endclass: mux_env
