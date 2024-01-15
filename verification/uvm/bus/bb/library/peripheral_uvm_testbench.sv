`define PERIPHERAL_UVM_ADDR_WIDTH 16

`include "peripheral_uvm_pkg.sv"
`include "peripheral_uvm_if.sv"

module peripheral_uvm_testbench;
  import uvm_pkg::*;
  import peripheral_uvm_pkg::*;
  `include "peripheral_uvm_test_library.sv"

peripheral_uvm_if vif ();  // SystemVerilog Interface

  peripheral_design dut (
    vif.sig_request[0],
    vif.sig_grant[0],
    vif.sig_request[1],
    vif.sig_grant[1],
    vif.sig_clock,
    vif.sig_reset,
    vif.sig_addr,
    vif.sig_size,
    vif.sig_read,
    vif.sig_write,
    vif.sig_start,
    vif.sig_bip,
    vif.sig_data,
    vif.sig_wait,
    vif.sig_error
  );

  initial begin
    uvm_config_db#(virtual peripheral_uvm_if)::set(uvm_root::get(), "*", "vif", vif);
    run_test();
  end

  initial begin
    vif.sig_reset <= 1'b1;
    vif.sig_clock <= 1'b1;
    #51 vif.sig_reset = 1'b0;
  end

  // Generate Clock
  always #5 vif.sig_clock = ~vif.sig_clock;

endmodule
