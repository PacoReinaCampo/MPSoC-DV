`ifndef PERIPHERAL_UVM_SEQUENCE_LIST
`define PERIPHERAL_UVM_SEQUENCE_LIST

package peripheral_uvm_sequence_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import peripheral_uvm_agent_pkg::*;
  import peripheral_uvm_reference_model_pkg::*;
  import peripheral_uvm_environment_pkg::*;

  // including peripheral_adder test list
  `include "peripheral_uvm_sequence.sv"

endpackage

`endif
