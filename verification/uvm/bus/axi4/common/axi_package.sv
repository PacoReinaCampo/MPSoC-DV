package axi_package;
  import uvm_pkg::*;

  `include "uvm_macros.svh"

  `include "master_agent.sv"
  `include "master_driver.sv"
  `include "master_enviroment.sv"
  `include "master_monitor.sv"
  `include "master_object.sv"
  `include "master_sequence.sv"
  `include "master_sequence_item.sv"
  `include "master_sequencer.sv"

  `include "slave_agent.sv"
  `include "slave_driver.sv"
  `include "slave_enviroment.sv"
  `include "slave_monitor.sv"
  `include "slave_object.sv"
  `include "slave_sequence.sv"
  `include "slave_sequence_item.sv"
  `include "slave_sequencer.sv"

  `include "axi_enviroment.sv"
  `include "axi_object.sv"
  `include "axi_scoreboard.sv"
  `include "axi_test.sv"
endpackage