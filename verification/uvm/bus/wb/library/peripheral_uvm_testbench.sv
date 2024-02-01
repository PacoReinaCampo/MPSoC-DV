`define PERIPHERAL_UVM_ADDR_WIDTH 16

`include "peripheral_uvm_pkg.sv"
`include "peripheral_uvm_if.sv"

module peripheral_uvm_testbench;
  import uvm_pkg::*;
  import peripheral_uvm_pkg::*;
  `include "peripheral_uvm_test_library.sv"

  // SystemVerilog Interface
  peripheral_uvm_if vif ();

  peripheral_design dut (
    vif.clk,
    vif.rst,

    vif.adr_i,
    vif.dat_i,
    vif.sel_i,
    vif.we_i,
    vif.bte_i,
    vif.cti_i,
    vif.cyc_i,
    vif.stb_i,

    vif.ack_o,
    vif.err_o,
    vif.dat_o,

    vif.sig_read,
    vif.sig_write
  );

  initial begin
    // Passing the interface handle to lower heirarchy using set method
    uvm_config_db#(virtual peripheral_uvm_if)::set(uvm_root::get(), "*", "vif", vif);

    // Enable wave dump
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end

  // Calling TestCase
  initial begin
    run_test();
  end

  // Generate Reset
  initial begin
    vif.rst <= 1'b1;
    #50;
    vif.rst <= 1'b0;
  end

  // Generate Clock
  always #5 vif.clk = ~vif.clk;

  initial begin
    vif.clk <= 1'b1;
  end

endmodule
