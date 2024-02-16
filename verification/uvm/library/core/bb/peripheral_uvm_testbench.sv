// Adder RTL verified with UVM
`include "uvm_macros.svh"
import uvm_pkg::*;

`include "peripheral_uvm_agent.sv"
`include "peripheral_uvm_coverage.sv"
`include "peripheral_uvm_environment.sv"
`include "peripheral_uvm_interface.sv"
`include "peripheral_uvm_sequence.sv"
`include "peripheral_uvm_test.sv"

import peripheral_bb_pkg::*;

module peripheral_uvm_testbench;
  // Declaration of Local Fields
  bit ram_clk;

  // Clock Generation
  always #1 ram_clk = ~ram_clk;

  initial begin
    ram_clk = 0;
  end

  // Creatinng instance of interface, in order to connect DUT and testcase
  peripheral_uvm_interface vif (ram_clk);

  // BlackBone Memory DUT Instantation
  peripheral_spram_bb #(
    .AW      (AW),       // Address bus
    .DW      (DW),       // Data bus
    .MEM_SIZE(MEM_SIZE)  // Memory size in bytes
  ) bb_spram (
    .ram_clk (vif.ram_clk),  // RAM clock

    .ram_addr(vif.ram_addr),  // RAM address
    .ram_dout(vif.ram_dout),  // RAM data output
    .ram_din (vif.ram_din),   // RAM data input
    .ram_cen (vif.ram_cen),   // RAM chip enable (low active)
    .ram_wen (vif.ram_wen)    // RAM write enable (low active)
  );

  // Starting the execution uvm phases
  initial begin
    run_test();
  end

  initial begin
    // Set the Interface instance Using Configuration Database
    uvm_config_db#(virtual peripheral_uvm_interface)::set(uvm_root::get(), "*", "intf", vif);

    // Enable wave dump
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end

endmodule
