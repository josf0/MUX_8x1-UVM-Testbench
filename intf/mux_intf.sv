interface mux_intf(input clock);

	logic [7:0] in;
	logic [2:0] sel;
	logic out;

	clocking wr_drv_cb @(posedge clock);
		default input #3 output #0;

		output in;
		output sel;
	endclocking: wr_drv_cb

	clocking wr_mon_cb @(posedge clock);
		default input #3 output #0;

		input in;
		input sel;
	endclocking: wr_mon_cb

	clocking rd_mon_cb @(posedge clock);
		default input #3 output #0;

		input out;
	endclocking: rd_mon_cb

	modport WR_DRV_MP (clocking wr_drv_cb);
	modport WR_MON_MP (clocking wr_mon_cb);
	modport RD_MON_MP (clocking rd_mon_cb);

endinterface: mux_intf
