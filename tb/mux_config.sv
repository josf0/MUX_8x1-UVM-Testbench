class mux_config extends uvm_object;

	`uvm_object_utils(mux_config)

	function new(string name="mux_config");
		super.new(name);
	endfunction: new

	// Variables for agent components
	virtual mux_intf vif;

	int wr_drv_cnt = 0;
	int wr_mon_cnt = -1;
	int rd_mon_cnt = -1;

	// Variables for scoreboard
	int sb_wr_mon 	= -1;
	int sb_rd_mon 	= -1;
	int sb_matched 	= -1;
	int sb_mismatch = 0;

endclass: mux_config
