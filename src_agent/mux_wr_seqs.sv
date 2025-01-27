class mux_wr_seqs extends uvm_sequence#(mux_wr_xtn);

	`uvm_object_utils(mux_wr_seqs)

	function new(string name="mux_wr_seqs");
		super.new(name);
	endfunction: new

	task body();
		super.body();

		repeat (1) begin
			req = mux_wr_xtn::type_id::create("req");

			start_item(req);
			assert(req.randomize);
			finish_item(req);
		end

	endtask: body

endclass: mux_wr_seqs

class all_test_seqs extends mux_wr_seqs;

	`uvm_object_utils(all_test_seqs)

	function new(string name="all_test_seqs");
		super.new(name);
	endfunction: new

	task body();

		repeat (128) begin
			req = mux_wr_xtn::type_id::create("req");

			start_item(req);
			assert(req.randomize);
			finish_item(req);
		end

	endtask: body

endclass: all_test_seqs

