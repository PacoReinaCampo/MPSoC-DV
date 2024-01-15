////////////////////////////////////////////////////////////////////////////////
//
// CLASS: peripheral_uvm_slave_agent
//
////////////////////////////////////////////////////////////////////////////////

class peripheral_uvm_slave_agent extends uvm_agent;

  peripheral_uvm_slave_driver    driver;
  peripheral_uvm_slave_sequencer sequencer;
  peripheral_uvm_slave_monitor   monitor;

  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_component_utils_begin(peripheral_uvm_slave_agent)
  `uvm_component_utils_end

  // new - constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  // build_phase
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    monitor = peripheral_uvm_slave_monitor::type_id::create("monitor", this);
    if (get_is_active() == UVM_ACTIVE) begin
      driver    = peripheral_uvm_slave_driver::type_id::create("driver", this);
      sequencer = peripheral_uvm_slave_sequencer::type_id::create("sequencer", this);
    end
  endfunction : build_phase

  // connect_phase
  function void connect_phase(uvm_phase phase);
    if (get_is_active() == UVM_ACTIVE) begin
      driver.seq_item_port.connect(sequencer.seq_item_export);
      sequencer.addr_ph_port.connect(monitor.addr_ph_imp);
    end
  endfunction : connect_phase

endclass : peripheral_uvm_slave_agent
