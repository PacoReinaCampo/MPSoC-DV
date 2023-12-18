`include "uvm_macros.svh"
import uvm_pkg::*;

`include "peripheral_uvm_agent.sv"
`include "peripheral_uvm_coverage.sv"
`include "peripheral_uvm_environment.sv"
`include "peripheral_uvm_interface.sv"
`include "peripheral_uvm_sequence.sv"
`include "peripheral_uvm_test.sv"

module peripheral_uvm_testbench;
  // Declaration of Local Fields
  parameter cycle = 10;

  bit clk;
  bit reset;

  // clock generation
  initial begin
    clk = 0;
    forever #(cycle / 2) clk = ~clk;
  end

  // reset Generation : change may required while generating reset for
  //                    synchronous/Asynchronous or Active low/Active high
  initial begin
    reset = 1;
    #(cycle * 5) reset = 0;
  end

  // creatinng instance of interface, inorder to connect DUT and testcase
  peripheral_uvm_interface peripheral_uvm_intf (
    clk,
    reset
  );

  // peripheral_adder DUT Instantation
  peripheral_adder dut_instantiation (
    .x   (peripheral_uvm_intf.x),
    .y   (peripheral_uvm_intf.y),
    .cin (peripheral_uvm_intf.cin),
    .sum (peripheral_uvm_intf.sum),
    .cout(peripheral_uvm_intf.cout)
  );

  // starting the execution uvm phases
  initial begin
    run_test();
  end

  // Set the Interface instance Using Configuration Database
  initial begin
    uvm_config_db#(virtual peripheral_uvm_interface)::set(uvm_root::get(), "*", "intf", peripheral_uvm_intf);
  end

endmodule
