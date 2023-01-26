class slave_sequencer extends uvm_sequencer #(slave_sequence_item);
  // Factory registration using `uvm_component_utils
  `uvm_component_utils(slave_sequencer)

  //------------------------------------------
  // METHODS
  //------------------------------------------

  // Standard UVM Methods:
  extern function new(string name = "slave_sequencer", uvm_component parent);
endclass

//-----------------  constructor new method  -------------------//
function slave_sequencer::new(string name = "slave_sequencer", uvm_component parent);
  super.new(name, parent);
endfunction
