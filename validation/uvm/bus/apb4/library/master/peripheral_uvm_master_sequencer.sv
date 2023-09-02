////////////////////////////////////////////////////////////////////////////////
//
// CLASS: peripheral_uvm_master_sequencer
//
////////////////////////////////////////////////////////////////////////////////

class peripheral_uvm_master_sequencer extends uvm_sequencer #(peripheral_uvm_transfer);

  `uvm_component_utils(peripheral_uvm_master_sequencer)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

endclass : peripheral_uvm_master_sequencer
