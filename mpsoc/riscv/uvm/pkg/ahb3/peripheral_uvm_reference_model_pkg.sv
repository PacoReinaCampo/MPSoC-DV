`ifndef PERIPHERAL_UVM_REFERENCE_MODEL_PKG
`define PERIPHERAL_UVM_REFERENCE_MODEL_PKG

package peripheral_uvm_reference_model_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"

  // importing packages : agent, ref model, register ...
  import peripheral_uvm_agent_pkg::*;

  // include ref model files 
  `include "peripheral_uvm_reference_model.sv"

endpackage

`endif
