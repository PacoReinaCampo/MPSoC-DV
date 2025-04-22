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
  bit clk_i;

  // Clock Generation
  always #1 clk_i = ~clk_i;

  initial begin
    clk_i = 0;
  end

  // Creatinng instance of interface, in order to connect DUT and testcase
  peripheral_uvm_interface vif (clk_i);

  // Peripheral_adder DUT Instantation
  peripheral_spram_axi4 #(
    .AXI_ID_WIDTH  (AXI_ID_WIDTH),
    .AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),
    .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
    .AXI_STRB_WIDTH(AXI_STRB_WIDTH),
    .AXI_USER_WIDTH(AXI_USER_WIDTH)
  ) axi4_spram (
    .clk_i (vif.clk_i),  // Clock
    .rst_ni(vif.rst_ni), // Asynchronous reset active low

    .axi_aw_id    (vif.axi_aw_id),
    .axi_aw_addr  (vif.axi_aw_addr),
    .axi_aw_len   (vif.axi_aw_len),
    .axi_aw_size  (vif.axi_aw_size),
    .axi_aw_burst (vif.axi_aw_burst),
    .axi_aw_lock  (vif.axi_aw_lock),
    .axi_aw_cache (vif.axi_aw_cache),
    .axi_aw_prot  (vif.axi_aw_prot),
    .axi_aw_qos   (vif.axi_aw_qos),
    .axi_aw_region(vif.axi_aw_region),
    .axi_aw_user  (vif.axi_aw_user),
    .axi_aw_valid (vif.axi_aw_valid),
    .axi_aw_ready (vif.axi_aw_ready),

    .axi_ar_id    (vif.axi_ar_id),
    .axi_ar_addr  (vif.axi_ar_addr),
    .axi_ar_len   (vif.axi_ar_len),
    .axi_ar_size  (vif.axi_ar_size),
    .axi_ar_burst (vif.axi_ar_burst),
    .axi_ar_lock  (vif.axi_ar_lock),
    .axi_ar_cache (vif.axi_ar_cache),
    .axi_ar_prot  (vif.axi_ar_prot),
    .axi_ar_qos   (vif.axi_ar_qos),
    .axi_ar_region(vif.axi_ar_region),
    .axi_ar_user  (vif.axi_ar_user),
    .axi_ar_valid (vif.axi_ar_valid),
    .axi_ar_ready (vif.axi_ar_ready),

    .axi_w_data (vif.axi_w_data),
    .axi_w_strb (vif.axi_w_strb),
    .axi_w_last (vif.axi_w_last),
    .axi_w_user (vif.axi_w_user),
    .axi_w_valid(vif.axi_w_valid),
    .axi_w_ready(vif.axi_w_ready),

    .axi_r_id   (vif.axi_r_id),
    .axi_r_data (vif.axi_r_data),
    .axi_r_resp (vif.axi_r_resp),
    .axi_r_last (vif.axi_r_last),
    .axi_r_user (vif.axi_r_user),
    .axi_r_valid(vif.axi_r_valid),
    .axi_r_ready(vif.axi_r_ready),

    .axi_b_id   (vif.axi_b_id),
    .axi_b_resp (vif.axi_b_resp),
    .axi_b_user (vif.axi_b_user),
    .axi_b_valid(vif.axi_b_valid),
    .axi_b_ready(vif.axi_b_ready),

    .req_o (vif.req_o),
    .we_o  (vif.we_o),
    .addr_o(vif.addr_o),
    .be_o  (vif.be_o),
    .data_o(vif.data_o),
    .data_i(vif.data_i)
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
