`include "peripheral_uvm_example_testbench.sv"

// Base Test
class peripheral_uvm_example_base_test extends uvm_test;

  `uvm_component_utils(peripheral_uvm_example_base_test)

  peripheral_uvm_example_testbench peripheral_uvm_example_testbench0;
  uvm_table_printer                printer;
  bit                              test_pass                          = 1;

  function new(string name = "peripheral_uvm_example_base_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // Enable transaction recording for everything
    uvm_config_db#(int)::set(this, "*", "recording_detail", UVM_FULL);
    // Create the tb
    peripheral_uvm_example_testbench0 = peripheral_uvm_example_testbench::type_id::create("ubus_example_tb0", this);
    // Create a specific depth printer for printing the created topology
    printer                           = new();
    printer.knobs.depth               = 3;
  endfunction : build_phase

  function void end_of_elaboration_phase(uvm_phase phase);
    // Set verbosity for the bus monitor for this demo
    if (peripheral_uvm_example_testbench0.ubus0.bus_monitor != null) begin
      peripheral_uvm_example_testbench0.ubus0.bus_monitor.set_report_verbosity_level(UVM_FULL);
    end
    `uvm_info(get_type_name(), $sformatf("Printing the test topology :\n%s", this.sprint(printer)), UVM_LOW)
  endfunction : end_of_elaboration_phase

  task run_phase(uvm_phase phase);
    // set a drain-time for the environment if desired
    phase.phase_done.set_drain_time(this, 50);
  endtask : run_phase

  function void extract_phase(uvm_phase phase);
    if (peripheral_uvm_example_testbench0.scoreboard0.sbd_error) begin
      test_pass = 1'b0;
    end
  endfunction  // void

  function void report_phase(uvm_phase phase);
    if (test_pass) begin
      `uvm_info(get_type_name(), "** UVM TEST PASSED **", UVM_NONE)
    end else begin
      `uvm_error(get_type_name(), "** UVM TEST FAIL **")
    end
  endfunction

endclass : peripheral_uvm_example_base_test

// Read Modify Write Read Test
class test_read_modify_write extends peripheral_uvm_example_base_test;

  `uvm_component_utils(test_read_modify_write)

  function new(string name = "test_read_modify_write", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    begin
      uvm_config_db#(uvm_object_wrapper)::set(this, "peripheral_uvm_example_testbench0.ubus0.masters[0].sequencer.run_phase", "default_sequence", read_modify_write_seq::type_id::get());
      uvm_config_db#(uvm_object_wrapper)::set(this, "peripheral_uvm_example_testbench0.ubus0.slaves[0].sequencer.run_phase", "default_sequence", slave_memory_seq::type_id::get());
      // Create the tb
      super.build_phase(phase);
    end
  endfunction : build_phase

endclass : test_read_modify_write

// Large word read/write test
class test_r8_w8_r4_w4 extends peripheral_uvm_example_base_test;

  `uvm_component_utils(test_r8_w8_r4_w4)

  function new(string name = "test_r8_w8_r4_w4", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    begin
      super.build_phase(phase);
      uvm_config_db#(uvm_object_wrapper)::set(this, "peripheral_uvm_example_testbench0.ubus0.masters[0].sequencer.run_phase", "default_sequence", r8_w8_r4_w4_seq::type_id::get());
      uvm_config_db#(uvm_object_wrapper)::set(this, "peripheral_uvm_example_testbench0.ubus0.slaves[0].sequencer.run_phase", "default_sequence", slave_memory_seq::type_id::get());
    end
  endfunction : build_phase

endclass : test_r8_w8_r4_w4

// 2 Master, 4 Slave test
class test_2m_4s extends peripheral_uvm_example_base_test;

  `uvm_component_utils(test_2m_4s)

  function new(string name = "test_2m_4s", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    loop_read_modify_write_seq lrmw_seq;

    begin
      // Overides to the peripheral_uvm_example_testbench build_phase()
      // Set the topology to 2 masters, 4 slaves
      uvm_config_db#(int)::set(this, "peripheral_uvm_example_testbench0.ubus0", "num_masters", 2);
      uvm_config_db#(int)::set(this, "peripheral_uvm_example_testbench0.ubus0", "num_slaves", 4);

      // Control the number of RMW loops
      uvm_config_db#(int)::set(this, "peripheral_uvm_example_testbench0.ubus0.masters[0].sequencer.loop_read_modify_write_seq", "itr", 6);
      uvm_config_db#(int)::set(this, "peripheral_uvm_example_testbench0.ubus0.masters[1].sequencer.loop_read_modify_write_seq", "itr", 8);

      // Define the sequences to run in the run phase
      uvm_config_db#(uvm_object_wrapper)::set(this, "*.ubus0.masters[0].sequencer.main_phase", "default_sequence", loop_read_modify_write_seq::type_id::get());
      lrmw_seq = loop_read_modify_write_seq::type_id::create();
      uvm_config_db#(uvm_sequence_base)::set(this, "peripheral_uvm_example_testbench0.ubus0.masters[1].sequencer.main_phase", "default_sequence", lrmw_seq);

      for (int i = 0; i < 4; i++) begin
        string slname;
        $swrite(slname, "peripheral_uvm_example_testbench0.ubus0.slaves[%0d].sequencer", i);
        uvm_config_db#(uvm_object_wrapper)::set(this, {slname, ".run_phase"}, "default_sequence", slave_memory_seq::type_id::get());
      end

      // Create the tb
      super.build_phase(phase);
    end
  endfunction : build_phase

  function void connect_phase(uvm_phase phase);
    // Connect other slaves monitor to scoreboard
    peripheral_uvm_example_testbench0.ubus0.slaves[1].monitor.item_collected_port.connect(peripheral_uvm_example_testbench0.scoreboard0.item_collected_export);
    peripheral_uvm_example_testbench0.ubus0.slaves[2].monitor.item_collected_port.connect(peripheral_uvm_example_testbench0.scoreboard0.item_collected_export);
    peripheral_uvm_example_testbench0.ubus0.slaves[3].monitor.item_collected_port.connect(peripheral_uvm_example_testbench0.scoreboard0.item_collected_export);
  endfunction : connect_phase

  function void end_of_elaboration_phase(uvm_phase phase);
    // Set up slave address map for ubus0 (slaves[0] is overwritten here)
    peripheral_uvm_example_testbench0.ubus0.set_slave_address_map("slaves[0]", 16'h0000, 16'h3fff);
    peripheral_uvm_example_testbench0.ubus0.set_slave_address_map("slaves[1]", 16'h4000, 16'h7fff);
    peripheral_uvm_example_testbench0.ubus0.set_slave_address_map("slaves[2]", 16'h8000, 16'hBfff);
    peripheral_uvm_example_testbench0.ubus0.set_slave_address_map("slaves[3]", 16'hC000, 16'hFfff);
    super.end_of_elaboration_phase(phase);
  endfunction : end_of_elaboration_phase

endclass : test_2m_4s
