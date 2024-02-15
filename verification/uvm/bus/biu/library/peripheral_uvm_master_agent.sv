////////////////////////////////////////////////////////////////////////////////
// CLASS: peripheral_uvm_master_agent
////////////////////////////////////////////////////////////////////////////////

class peripheral_uvm_master_agent extends uvm_agent;

  protected int                            master_id;

  peripheral_uvm_master_driver             driver;
  uvm_sequencer #(peripheral_uvm_transfer) sequencer;
  peripheral_uvm_master_monitor            monitor;

  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_component_utils_begin(peripheral_uvm_master_agent)
    `uvm_field_int(master_id, UVM_DEFAULT)
  `uvm_component_utils_end

  // new - constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  // build_phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    monitor = peripheral_uvm_master_monitor::type_id::create("monitor", this);

    if (get_is_active() == UVM_ACTIVE) begin
      sequencer = uvm_sequencer#(peripheral_uvm_transfer)::type_id::create("sequencer", this);
      driver    = peripheral_uvm_master_driver::type_id::create("driver", this);
    end
  endfunction : build_phase

  // connect_phase
  function void connect_phase(uvm_phase phase);
    if (get_is_active() == UVM_ACTIVE) begin
      driver.seq_item_port.connect(sequencer.seq_item_export);
    end
  endfunction : connect_phase

endclass : peripheral_uvm_master_agent
