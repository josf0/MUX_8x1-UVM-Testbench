package mux_pkg;
	
	`include "uvm_macros.svh"
	import uvm_pkg::*;

	`include "mux_config.sv"

	`include "mux_wr_xtn.sv"
	`include "mux_wr_seqs.sv"
	`include "mux_wr_seqr.sv"
	`include "mux_wr_drv.sv"
	`include "mux_wr_mon.sv"
	`include "mux_wr_agent.sv"
	
	`include "mux_rd_xtn.sv"
	`include "mux_rd_mon.sv"
	`include "mux_rd_agent.sv"

	`include "mux_scoreboard.sv"

	`include "mux_env.sv"
	`include "mux_test.sv"

endpackage: mux_pkg
