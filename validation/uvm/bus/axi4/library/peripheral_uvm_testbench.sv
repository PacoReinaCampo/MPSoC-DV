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
    vif.aresetn <= 1'b0;
    #50;
    vif.aresetn <= 1'b1;
  end

  // Generate Clock
  always #5 vif.aclk = ~vif.aclk;

  initial begin
    vif.aclk <= 1'b0;
  end

endmodule
