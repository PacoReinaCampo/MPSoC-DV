`include "peripheral_uvm_example_scoreboard.sv"
`include "peripheral_uvm_master_sequence_library.sv"
`include "peripheral_uvm_example_master_sequence_library.sv"
`include "peripheral_uvm_slave_sequence_library.sv"

////////////////////////////////////////////////////////////////////////////////
// CLASS: peripheral_uvm_example_testbench
////////////////////////////////////////////////////////////////////////////////

class peripheral_uvm_example_testbench extends uvm_env;

  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_component_utils(peripheral_uvm_example_testbench)

  // peripheral_uvm environment
  peripheral_uvm_environment        ubus0;

  // Scoreboard to check the memory operation of the slave.
  peripheral_uvm_example_scoreboard scoreboard0;

  // new
  function new(string name, uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  // build_phase
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    uvm_config_db#(int)::set(this, "ubus0", "num_masters", 1);
    uvm_config_db#(int)::set(this, "ubus0", "num_slaves", 1);

    ubus0       = peripheral_uvm_environment::type_id::create("ubus0", this);
    scoreboard0 = peripheral_uvm_example_scoreboard::type_id::create("scoreboard0", this);
  endfunction : build_phase

  function void connect_phase(uvm_phase phase);
    // Connect slave0 monitor to scoreboard
    ubus0.slaves[0].monitor.item_collected_port.connect(scoreboard0.item_collected_export);
  endfunction : connect_phase

  function void end_of_elaboration_phase(uvm_phase phase);
    // Set up slave address map for ubus0 (basic default)
    ubus0.set_slave_address_map("slaves[0]", 0, 16'hffff);
  endfunction : end_of_elaboration_phase

endclass : peripheral_uvm_example_testbench
