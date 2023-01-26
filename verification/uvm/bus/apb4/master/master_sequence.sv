class master_sequence extends uvm_sequence #(master_sequence_item);
  `uvm_object_utils(master_sequence)

  //------------------------------------------
  // METHODS
  //------------------------------------------

  // Standard UVM Methods:
  extern function new(string name = "master_sequence");
  extern task body();
endclass

//-----------------  constructor new method  -------------------//
function master_sequence::new(string name = "master_sequence");
  super.new(name);
endfunction

task master_sequence::body();
  repeat (req.NO_OF_TRANS) begin
    req = master_sequence_item::type_id::create("req");

    req.WRITE_DATA_TRANS++;

    start_item(req);
    //assert(req.randomize() with {AWID==req.WRITE_DATA_TRANS;});

    assert (req.randomize());
    `uvm_info("MASTER_WR_SEQUENCE", $sformatf("printing from master sequence \n %s", req.sprint()), UVM_LOW)
    finish_item(req);
  end
endtask
