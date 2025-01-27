
class mux_rd_mon extends uvm_monitor;

	`uvm_component_utils(mux_rd_mon)

	virtual mux_intf.RD_MON_MP vif;

	mux_config m_cfg;

	uvm_analysis_port#(mux_rd_xtn) monitor_port;

	function new(string name="mux_rd_mon", uvm_component parent);
		super.new(name, parent);
	endfunction: new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);

		if(!uvm_config_db#(mux_config)::get(this, "", "mux_config", m_cfg))
			`uvm_fatal(get_type_name(), "FAILED TO GET CONFIG")

		monitor_port = new("monitor_port", this);	
	endfunction: build_phase

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);

		this.vif = m_cfg.vif;
	endfunction: connect_phase

	task run_phase(uvm_phase phase);
		super.run_phase(phase);

		forever begin
			collect_data();
		end
	endtask: run_phase

	task collect_data();
		
		mux_rd_xtn mon_data;
		mon_data = mux_rd_xtn::type_id::create("mon_data");
		
		@(vif.rd_mon_cb);
		mon_data.out = vif.rd_mon_cb.out;

		m_cfg.rd_mon_cnt++;
		`uvm_info(get_type_name(), $sformatf("\n\nDATA[%0d] KEPT BY THE RD_MON:",m_cfg.rd_mon_cnt), UVM_LOW)
		mon_data.print();
		monitor_port.write(mon_data);
	endtask: collect_data

endclass: mux_rd_mon
