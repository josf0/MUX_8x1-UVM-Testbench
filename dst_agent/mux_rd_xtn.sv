class mux_rd_xtn extends uvm_sequence_item;

	`uvm_object_utils(mux_rd_xtn)

	function new(string name="mux_rd_xtn");
		super.new(name);
	endfunction: new

	bit out;

	function void do_print(uvm_printer printer);
		
		printer.print_field("OUT", this.out, 8, UVM_BIN);

	endfunction: do_print

endclass: mux_rd_xtn
