class mux_wr_drv extends uvm_driver#(mux_wr_xtn);

	`uvm_component_utils(mux_wr_drv)

	virtual mux_intf.WR_DRV_MP vif;

	mux_config m_cfg;

	function new(string name="mux_wr_drv", uvm_component parent);
		super.new(name, parent);
	endfunction: new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);

		if(!uvm_config_db#(mux_config)::get(this, "", "mux_config", m_cfg))
			`uvm_fatal(get_type_name(), "FAILED TO GET CONFIG")
	endfunction: build_phase

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);

		this.vif = m_cfg.vif;
	endfunction: connect_phase

	task run_phase(uvm_phase phase);
		super.run_phase(phase);

		forever begin
			seq_item_port.get_next_item(req);
			send_to_dut(req);
			seq_item_port.item_done();
		end
	endtask: run_phase

	task send_to_dut(mux_wr_xtn req);
		@(vif.wr_drv_cb);
		vif.wr_drv_cb.in 	<= req.in;
		vif.wr_drv_cb.sel	<= req.sel;
		m_cfg.wr_drv_cnt++;
		`uvm_info(get_type_name(), $sformatf("\n\nDATA[%0d] SENT FROM THE WR_DRV:",m_cfg.wr_drv_cnt), UVM_LOW)
		req.print();
	endtask: send_to_dut

endclass: mux_wr_drv
