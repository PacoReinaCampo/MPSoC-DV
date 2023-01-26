class slave_sequence extends uvm_sequence #(slave_sequence_item);
  `uvm_object_utils(slave_sequence)

  //------------------------------------------
  // METHODS
  //------------------------------------------

  // Standard UVM Methods:
  extern function new(string name = "slave_sequence");
  extern task body();
endclass

//-----------------  constructor new method  -------------------//
function slave_sequence::new(string name = "slave_sequence");
  super.new(name);
endfunction

task slave_sequence::body();
  repeat (req.NO_OF_TRANS) begin

    req = slave_sequence_item::type_id::create("req");
    req.WRITE_DATA_TRANS++;
    start_item(req);
    //assert(req.randomize() with {AWID==req.WRITE_DATA_TRANS;});

    assert (req.randomize());
    `uvm_info("SLAVE_WR_SEQUENCE", $sformatf("printing from slave sequence \n   %s", req.sprint()), UVM_LOW)
    finish_item(req);
  end
endtask
