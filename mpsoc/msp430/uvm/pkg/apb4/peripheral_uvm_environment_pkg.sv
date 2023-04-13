`ifndef PERIPHERAL_UVM_ENVIRONMENT_PKG
`define PERIPHERAL_UVM_ENVIRONMENT_PKG

package peripheral_uvm_environment_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"

  // importing packages : agent, ref model, register ...
  import peripheral_uvm_agent_pkg::*;
  import peripheral_uvm_reference_model_pkg::*;

  // include top env files 
  `include "peripheral_uvm_coverage.sv"
  `include "peripheral_uvm_scoreboard.sv"
  `include "peripheral_uvm_environment.sv"

endpackage

`endif
