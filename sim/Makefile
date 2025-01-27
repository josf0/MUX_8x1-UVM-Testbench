# Makefile for Router UVM Project
RTL = ../rtl/* ../intf/*
INC = +incdir+../tb +incdir+../test +incdir+../src_agent +incdir+../dst_agent
SVTB1 = ../tb/mux_top.sv
SVTB2 = ../test/mux_pkg.sv
work = work #library name

FSDB_PATH = /home/cad/eda/SYNOPSYS/VERDI_2022/verdi/T-2022.06-SP1/share/PLI/VCS/LINUX64


# Make targets for SV compilation using VCS
sv_cmp:
	vcs -l vcs.log -timescale=1ns/1ps -assert svaext -cm line+tgl+fsm+branch+cond -sverilog +v2k -ntb_opts uvm -debug_access+all -full64 -kdb -lca -P $(FSDB_PATH)/novas.tab $(FSDB_PATH)/pli.a $(RTL) $(INC) $(SVTB2) $(SVTB1) $(SVTB3)


# Make targets for running each testcases
run_test_base: clean sv_cmp
	./simv -a vcs.log +fsdbfile+wavebase.fsdb -cm_dir ./mem_covbase +ntb_random_seed_automatic +UVM_TESTNAME=mux_test
	urg -dir mem_covbase.vdb -format both -report urgReportbase	

run_test_all: clean sv_cmp
	./simv -a vcs.log +fsdbfile+waveall.fsdb -cm_dir ./mem_covall +ntb_random_seed_automatic +UVM_TESTNAME=all_test
	urg -dir mem_covall.vdb -format both -report urgReportall	


# Make targets to call for regress
test_base:
	./simv -a vcs.log +fsdbfile+wavebase.fsdb -cm_dir ./mem_covbase +ntb_random_seed=18745248 +UVM_TESTNAME=mux_test
	urg -dir mem_covbase.vdb -format both -report urgReportbase	

test_all:
	./simv -a vcs.log +fsdbfile+waveall.fsdb -cm_dir ./mem_covall +ntb_random_seed=18745248 +UVM_TESTNAME=all_test
	urg -dir mem_covall.vdb -format both -report urgReportall	

# Make target to merge the coverage reports
report:
	urg -dir mem_covbase.vdb mem_covall.vdb -dbname merged_dir/merged_test -format both -report urgReport


# Make targets for regression test
regress: clean sv_cmp test_base test_all report


# Make target to open the coverage report inside VCS GUI
cov:
	verdi -cov -covdir merged_dir.vdb


# Make targets for opening the waveform
view_wave_base: 
	verdi -ssf wavebase.fsdb


# Make target to clean the compilation files
clean:
	rm -fr simv* csrc* *.tmp *.vpd *.vdb *.key *.log *hdrs.h urgReport* *.fsdb* novas* verdi* vdCovLog
	clear


# Help prints all the available make targets
help:
	@echo "=============================================================================="
	@echo ""
	@echo "THIS IS THE MAKEFILE HELP"
	@echo ""
	@echo "run_test_base 		: Runs the base test and prints the baseology"
	@echo "regress 		: Runs the regression testing and merges the reports"
	@echo "cov 			: Show the coverage report on Verdi GUI"
	@echo "view_wave_base		: Shows the waveform of run_test_base"
	@echo "clean			: Clears the compilation and log files"
	@echo ""
	@echo "=============================================================================="

