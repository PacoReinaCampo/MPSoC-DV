package peripheral_uvm_pkg;

  import uvm_pkg::*;

  `include "uvm_macros.svh"

  typedef uvm_config_db#(virtual peripheral_uvm_if) ubus_vif_config;
  typedef virtual peripheral_uvm_if ubus_vif;

  `include "peripheral_uvm_transfer.sv"

  `include "peripheral_uvm_master_monitor.sv"
  `include "peripheral_uvm_master_sequencer.sv"
  `include "peripheral_uvm_master_driver.sv"
  `include "peripheral_uvm_master_agent.sv"

  `include "peripheral_uvm_slave_monitor.sv"
  `include "peripheral_uvm_slave_sequencer.sv"
  `include "peripheral_uvm_slave_driver.sv"
  `include "peripheral_uvm_slave_agent.sv"

  `include "peripheral_uvm_bus_monitor.sv"

  `include "peripheral_uvm_environment.sv"

endpackage : peripheral_uvm_pkg
