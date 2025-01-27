class mux_scoreboard extends uvm_scoreboard;

	`uvm_component_utils(mux_scoreboard)

	uvm_tlm_analysis_fifo#(mux_wr_xtn) wr_fifoh;
	uvm_tlm_analysis_fifo#(mux_rd_xtn) rd_fifoh;

	mux_wr_xtn wr_mon_data;
	mux_rd_xtn rd_mon_data;

	mux_wr_xtn wr_cov_data;
	mux_rd_xtn rd_cov_data;

	mux_config m_cfg;

	covergroup wr_covgrp;
		IN: coverpoint wr_cov_data.in{
				wildcard bins IN_0 = {8'b????_???1};
				wildcard bins IN_1 = {8'b????_??1?};
				wildcard bins IN_2 = {8'b????_?1??};
				wildcard bins IN_3 = {8'b????_1???};
				wildcard bins IN_4 = {8'b???1_????};
				wildcard bins IN_5 = {8'b??1?_????};
				wildcard bins IN_6 = {8'b?1??_????};
				wildcard bins IN_7 = {8'b1???_????};
				bins DEFAULT = default;
			}
		SEL: coverpoint wr_cov_data.sel{
				bins SEL[8] = {[0:7]};
			}
		CROSS_IN_SEL: cross IN, SEL;
	endgroup
	covergroup rd_covgrp;
		OUT: coverpoint rd_cov_data.out{
				bins OUT_0 = {1'b0};
				bins OUT_1 = {1'b1};
			}
	endgroup

	function new(string name="mux_scoreboard", uvm_component parent);
		super.new(name, parent);

		wr_covgrp = new();
		rd_covgrp = new();
	endfunction: new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);

		if(!uvm_config_db#(mux_config)::get(this, "", "mux_config", m_cfg))
			`uvm_fatal(get_type_name(), "FAILED TO GET CONFIG")

		wr_fifoh = new("wr_fifoh", this);
		rd_fifoh = new("rd_fifoh", this);
	endfunction: build_phase

	task run_phase(uvm_phase phase);
		super.run_phase(phase);

		forever begin
			begin: wr_mon
				wr_mon_data = mux_wr_xtn::type_id::create("wr_mon_data");
				wr_cov_data = mux_wr_xtn::type_id::create("wr_cov_data");

				wr_fifoh.get(wr_mon_data);
				m_cfg.sb_wr_mon++;
				`uvm_info(get_type_name(), $sformatf("\n\nSB DATA[%0d] FROM THE WR_MON:",m_cfg.sb_wr_mon), UVM_LOW)
				wr_mon_data.print();
				
				wr_cov_data = wr_mon_data;
				wr_covgrp.sample();
			end
			begin: rd_mon
				rd_mon_data = mux_rd_xtn::type_id::create("rd_mon_data");
				rd_cov_data = mux_rd_xtn::type_id::create("rd_cov_data");

				rd_fifoh.get(rd_mon_data);
				m_cfg.sb_rd_mon++;
				`uvm_info(get_type_name(), $sformatf("\n\nSB DATA[%0d] FROM THE RD_MON:",m_cfg.sb_rd_mon), UVM_LOW)
				rd_mon_data.print();
				
				rd_cov_data = rd_mon_data;
				rd_covgrp.sample();

				compare(wr_mon_data, rd_mon_data);
			end
		end

	endtask: run_phase

	function void compare(mux_wr_xtn wr_data, mux_rd_xtn rd_data);
		case(wr_data.sel)
				
			3'd0: begin
				if(wr_data.in[0] != rd_data.out)
					begin
						`uvm_info(get_type_name(), "DATA MISMATCH", UVM_LOW)
						m_cfg.sb_mismatch++;
					end
				else
					begin
						`uvm_info(get_type_name(), "DATA MATCHED", UVM_LOW)
						m_cfg.sb_matched++;
					end
			end
			3'd1: begin
				if(wr_data.in[1] != rd_data.out)
					begin
						`uvm_info(get_type_name(), "DATA MISMATCH", UVM_LOW)
						m_cfg.sb_mismatch++;
					end
				else
					begin
						`uvm_info(get_type_name(), "DATA MATCHED", UVM_LOW)
						m_cfg.sb_matched++;
					end
			end
			3'd2: begin
				if(wr_data.in[2] != rd_data.out)
					begin
						`uvm_info(get_type_name(), "DATA MISMATCH", UVM_LOW)
						m_cfg.sb_mismatch++;
					end
				else
					begin
						`uvm_info(get_type_name(), "DATA MATCHED", UVM_LOW)
						m_cfg.sb_matched++;
					end
			end
			3'd3: begin
				if(wr_data.in[3] != rd_data.out)
					begin
						`uvm_info(get_type_name(), "DATA MISMATCH", UVM_LOW)
						m_cfg.sb_mismatch++;
					end
				else
					begin
						`uvm_info(get_type_name(), "DATA MATCHED", UVM_LOW)
						m_cfg.sb_matched++;
					end
			end
			3'd4: begin
				if(wr_data.in[4] != rd_data.out)
					begin
						`uvm_info(get_type_name(), "DATA MISMATCH", UVM_LOW)
						m_cfg.sb_mismatch++;
					end
				else
					begin
						`uvm_info(get_type_name(), "DATA MATCHED", UVM_LOW)
						m_cfg.sb_matched++;
					end
			end
			3'd5: begin
				if(wr_data.in[5] != rd_data.out)
					begin
						`uvm_info(get_type_name(), "DATA MISMATCH", UVM_LOW)
						m_cfg.sb_mismatch++;
					end
				else
					begin
						`uvm_info(get_type_name(), "DATA MATCHED", UVM_LOW)
						m_cfg.sb_matched++;
					end
			end
			3'd6: begin
				if(wr_data.in[6] != rd_data.out)
					begin
						`uvm_info(get_type_name(), "DATA MISMATCH", UVM_LOW)
						m_cfg.sb_mismatch++;
					end
				else
					begin
						`uvm_info(get_type_name(), "DATA MATCHED", UVM_LOW)
						m_cfg.sb_matched++;
					end
			end
			default: begin
				if(wr_data.in[7] != rd_data.out)
						begin
							`uvm_info(get_type_name(), "DATA MISMATCH", UVM_LOW)
							m_cfg.sb_mismatch++;
						end
				else
					begin
						`uvm_info(get_type_name(), "DATA MATCHED", UVM_LOW)
						m_cfg.sb_matched++;
					end
			end
		endcase

	endfunction: compare

	function void report_phase(uvm_phase phase);
		super.report_phase(phase);
		`uvm_info(get_type_name(), $sformatf("\n\n----SCOREBOARD REPORT----\n\nData from wr_mon 	= %0d\nData from rd_mon 	= %0d\nData matched 		= %0d\nData mismatched		= %0d", m_cfg.sb_wr_mon, m_cfg.sb_rd_mon, m_cfg.sb_matched, m_cfg.sb_mismatch), UVM_LOW)
	endfunction: report_phase

endclass: mux_scoreboard







