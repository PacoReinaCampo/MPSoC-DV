`ifndef PERIPHERAL_UVM_TEST_LIST
`define PERIPHERAL_UVM_TEST_LIST

package peripheral_uvm_test_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import peripheral_uvm_environment_pkg::*;
  import peripheral_uvm_sequence_pkg::*;

  // including peripheral_adder test list
  `include "peripheral_uvm_test.sv"

endpackage

`endif
