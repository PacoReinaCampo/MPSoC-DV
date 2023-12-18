class peripheral_uvm_sequencer extends uvm_sequencer #(peripheral_uvm_transaction);
  // Declaration of component utils to register with factory
  `uvm_component_utils(peripheral_uvm_sequencer)

  // Constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
endclass
