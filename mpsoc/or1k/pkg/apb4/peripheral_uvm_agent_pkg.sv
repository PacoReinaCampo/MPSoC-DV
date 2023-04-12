`ifndef PERIPHERAL_UVM_AGENT_PKG
`define PERIPHERAL_UVM_AGENT_PKG

package peripheral_uvm_agent_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"

  // include Agent components : driver, monitor, sequencer
  `include "peripheral_uvm_defines.sv"
  `include "peripheral_uvm_transaction.sv"
  `include "peripheral_uvm_sequencer.sv"
  `include "peripheral_uvm_driver.sv"
  `include "peripheral_uvm_monitor.sv"
  `include "peripheral_uvm_agent.sv"

endpackage

`endif
