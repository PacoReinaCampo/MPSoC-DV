// Adder RTL verified with UVM
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
  bit aclk;

  // Clock Generation
  always #1 aclk = ~aclk;

  initial begin
    aclk = 0;
  end

  // Creatinng instance of interface, in order to connect DUT and testcase
  peripheral_uvm_interface vif (aclk);

  // Peripheral_adder DUT Instantation
  peripheral_design dut (
    // Global Signals
    .aclk   (vif.aclk),
    .aresetn(vif.aresetn),

    // Write Address Channel
    .awid   (vif.awid),
    .awadr  (vif.awadr),
    .awlen  (vif.awlen),
    .awsize (vif.awsize),
    .awburst(vif.awburst),
    .awlock (vif.awlock),
    .awcache(vif.awcache),
    .awprot (vif.awprot),
    .awvalid(vif.awvalid),
    .awready(vif.awready),

    // Write Data Channel
    .wid   (vif.wid),
    .wrdata(vif.wrdata),
    .wstrb (vif.wstrb),
    .wlast (vif.wlast),
    .wvalid(vif.wvalid),
    .wready(vif.wready),

    // Write Response Channel
    .bid   (vif.bid),
    .bresp (vif.bresp),
    .bvalid(vif.bvalid),
    .bready(vif.bready),

    // Read Address Channel
    .arid   (vif.arid),
    .araddr (vif.araddr),
    .arlen  (vif.arlen),
    .arsize (vif.arsize),
    .arlock (vif.arlock),
    .arcache(vif.arcache),
    .arprot (vif.arprot),
    .arvalid(vif.arvalid),
    .arready(vif.arready),

    // Read Data Channel
    .rid   (vif.rid),
    .rdata (vif.rdata),
    .rresp (vif.rresp),
    .rlast (vif.rlast),
    .rvalid(vif.rvalid),
    .rready(vif.rready)
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
