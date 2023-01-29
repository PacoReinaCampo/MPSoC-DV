class peripheral_agent extends uvm_agent;
  `uvm_component_utils(peripheral_agent)
  function new(string name = "peripheral_agent", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  peripheral_driver driver;  // Driver handle
  peripheral_monitor monitor;  // Monitor handle

  uvm_sequencer #(peripheral_sequence_item) sequencer;  // Sequencer Handle

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    sequencer = uvm_sequencer#(peripheral_sequence_item)::type_id::create("sequencer", this);
    driver = peripheral_driver::type_id::create("driver", this);
    monitor = peripheral_monitor::type_id::create("monitor", this);
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    driver.seq_item_port.connect(sequencer.seq_item_export);
  endfunction
endclass
