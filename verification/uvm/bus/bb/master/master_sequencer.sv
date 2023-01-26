class master_sequencer extends uvm_sequencer #(master_sequence_item);
  // Factory registration using `uvm_component_utils
  `uvm_component_utils(master_sequencer)

  //------------------------------------------
  // METHODS
  //------------------------------------------

  // Standard UVM Methods:
  extern function new(string name = "master_sequencer",uvm_component parent);
endclass

//-----------------  constructor new method  -------------------//
function master_sequencer::new(string name="master_sequencer",uvm_component parent);
  super.new(name,parent);
endfunction
