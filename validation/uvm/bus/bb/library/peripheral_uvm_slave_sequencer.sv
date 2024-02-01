////////////////////////////////////////////////////////////////////////////////
// CLASS: peripheral_uvm_slave_sequencer
////////////////////////////////////////////////////////////////////////////////

class peripheral_uvm_slave_sequencer extends uvm_sequencer #(peripheral_uvm_transfer);

  // TLM port to peek the address phase from the slave monitor
  uvm_blocking_peek_port #(peripheral_uvm_transfer) addr_ph_port;

  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_component_utils(peripheral_uvm_slave_sequencer)

  function new(string name, uvm_component parent);
    super.new(name, parent);
    addr_ph_port = new("addr_ph_port", this);
  endfunction : new

endclass : peripheral_uvm_slave_sequencer
