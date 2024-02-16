interface peripheral_uvm_interface (
    input logic clk_i
);

  logic                        rst_ni;  // Asynchronous reset active low

  logic [AXI_ID_WIDTH    -1:0] axi_aw_id;
  logic [AXI_ADDR_WIDTH  -1:0] axi_aw_addr;
  logic [                 7:0] axi_aw_len;
  logic [                 2:0] axi_aw_size;
  logic [                 1:0] axi_aw_burst;
  logic                        axi_aw_lock;
  logic [                 3:0] axi_aw_cache;
  logic [                 2:0] axi_aw_prot;
  logic [                 3:0] axi_aw_qos;
  logic [                 3:0] axi_aw_region;
  logic [AXI_USER_WIDTH  -1:0] axi_aw_user;
  logic                        axi_aw_valid;
  logic                        axi_aw_ready;

  logic [AXI_ID_WIDTH    -1:0] axi_ar_id;
  logic [AXI_ADDR_WIDTH  -1:0] axi_ar_addr;
  logic [                 7:0] axi_ar_len;
  logic [                 2:0] axi_ar_size;
  logic [                 1:0] axi_ar_burst;
  logic                        axi_ar_lock;
  logic [                 3:0] axi_ar_cache;
  logic [                 2:0] axi_ar_prot;
  logic [                 3:0] axi_ar_qos;
  logic [                 3:0] axi_ar_region;
  logic [AXI_USER_WIDTH  -1:0] axi_ar_user;
  logic                        axi_ar_valid;
  logic                        axi_ar_ready;

  logic [AXI_DATA_WIDTH  -1:0] axi_w_data;
  logic [AXI_STRB_WIDTH  -1:0] axi_w_strb;
  logic                        axi_w_last;
  logic [AXI_USER_WIDTH  -1:0] axi_w_user;
  logic                        axi_w_valid;
  logic                        axi_w_ready;

  logic [AXI_ID_WIDTH    -1:0] axi_r_id;
  logic [AXI_DATA_WIDTH  -1:0] axi_r_data;
  logic [                 1:0] axi_r_resp;
  logic                        axi_r_last;
  logic [AXI_USER_WIDTH  -1:0] axi_r_user;
  logic                        axi_r_valid;
  logic                        axi_r_ready;

  logic [AXI_ID_WIDTH    -1:0] axi_b_id;
  logic [                 1:0] axi_b_resp;
  logic [AXI_USER_WIDTH  -1:0] axi_b_user;
  logic                        axi_b_valid;
  logic                        axi_b_ready;

  logic                        req_o;
  logic                        we_o;
  logic [AXI_ADDR_WIDTH  -1:0] addr_o;
  logic [AXI_DATA_WIDTH/8-1:0] be_o;
  logic [AXI_DATA_WIDTH  -1:0] data_o;
  logic [AXI_DATA_WIDTH  -1:0] data_i;

  // Clocking block and modport declaration for driver
  clocking dr_cb @(posedge clk_i);
    output                        rst_ni; // Asynchronous reset active low

    output [AXI_ID_WIDTH    -1:0] axi_aw_id;
    output [AXI_ADDR_WIDTH  -1:0] axi_aw_addr;
    output [                 7:0] axi_aw_len;
    output [                 2:0] axi_aw_size;
    output [                 1:0] axi_aw_burst;
    output                        axi_aw_lock;
    output [                 3:0] axi_aw_cache;
    output [                 2:0] axi_aw_prot;
    output [                 3:0] axi_aw_qos;
    output [                 3:0] axi_aw_region;
    output [AXI_USER_WIDTH  -1:0] axi_aw_user;
    output                        axi_aw_valid;
    input                         axi_aw_ready;

    output [AXI_ID_WIDTH    -1:0] axi_ar_id;
    output [AXI_ADDR_WIDTH  -1:0] axi_ar_addr;
    output [                 7:0] axi_ar_len;
    output [                 2:0] axi_ar_size;
    output [                 1:0] axi_ar_burst;
    output                        axi_ar_lock;
    output [                 3:0] axi_ar_cache;
    output [                 2:0] axi_ar_prot;
    output [                 3:0] axi_ar_qos;
    output [                 3:0] axi_ar_region;
    output [AXI_USER_WIDTH  -1:0] axi_ar_user;
    output                        axi_ar_valid;
    input                         axi_ar_ready;

    output [AXI_DATA_WIDTH  -1:0] axi_w_data;
    output [AXI_STRB_WIDTH  -1:0] axi_w_strb;
    output                        axi_w_last;
    output [AXI_USER_WIDTH  -1:0] axi_w_user;
    output                        axi_w_valid;
    input                         axi_w_ready;

    input  [AXI_ID_WIDTH    -1:0] axi_r_id;
    input  [AXI_DATA_WIDTH  -1:0] axi_r_data;
    input  [                 1:0] axi_r_resp;
    input                         axi_r_last;
    input  [AXI_USER_WIDTH  -1:0] axi_r_user;
    input                         axi_r_valid;
    output                        axi_r_ready;

    input  [AXI_ID_WIDTH    -1:0] axi_b_id;
    input  [                 1:0] axi_b_resp;
    input  [AXI_USER_WIDTH  -1:0] axi_b_user;
    input                         axi_b_valid;
    output                        axi_b_ready;

    input                         req_o;
    input                         we_o;
    input  [AXI_ADDR_WIDTH  -1:0] addr_o;
    input  [AXI_DATA_WIDTH/8-1:0] be_o;
    input  [AXI_DATA_WIDTH  -1:0] data_o;
    output [AXI_DATA_WIDTH  -1:0] data_i;
  endclocking

  modport DRV(clocking dr_cb, input clk_i);

  // Clocking block and modport declaration for monitor
  clocking rc_cb @(negedge clk_i);
    input                        rst_ni;  // Asynchronous reset active low

    input [AXI_ID_WIDTH    -1:0] axi_aw_id;
    input [AXI_ADDR_WIDTH  -1:0] axi_aw_addr;
    input [                 7:0] axi_aw_len;
    input [                 2:0] axi_aw_size;
    input [                 1:0] axi_aw_burst;
    input                        axi_aw_lock;
    input [                 3:0] axi_aw_cache;
    input [                 2:0] axi_aw_prot;
    input [                 3:0] axi_aw_qos;
    input [                 3:0] axi_aw_region;
    input [AXI_USER_WIDTH  -1:0] axi_aw_user;
    input                        axi_aw_valid;
    input                        axi_aw_ready;

    input [AXI_ID_WIDTH    -1:0] axi_ar_id;
    input [AXI_ADDR_WIDTH  -1:0] axi_ar_addr;
    input [                 7:0] axi_ar_len;
    input [                 2:0] axi_ar_size;
    input [                 1:0] axi_ar_burst;
    input                        axi_ar_lock;
    input [                 3:0] axi_ar_cache;
    input [                 2:0] axi_ar_prot;
    input [                 3:0] axi_ar_qos;
    input [                 3:0] axi_ar_region;
    input [AXI_USER_WIDTH  -1:0] axi_ar_user;
    input                        axi_ar_valid;
    input                        axi_ar_ready;

    input [AXI_DATA_WIDTH  -1:0] axi_w_data;
    input [AXI_STRB_WIDTH  -1:0] axi_w_strb;
    input                        axi_w_last;
    input [AXI_USER_WIDTH  -1:0] axi_w_user;
    input                        axi_w_valid;
    input                        axi_w_ready;

    input [AXI_ID_WIDTH    -1:0] axi_r_id;
    input [AXI_DATA_WIDTH  -1:0] axi_r_data;
    input [                 1:0] axi_r_resp;
    input                        axi_r_last;
    input [AXI_USER_WIDTH  -1:0] axi_r_user;
    input                        axi_r_valid;
    input                        axi_r_ready;

    input [AXI_ID_WIDTH    -1:0] axi_b_id;
    input [                 1:0] axi_b_resp;
    input [AXI_USER_WIDTH  -1:0] axi_b_user;
    input                        axi_b_valid;
    input                        axi_b_ready;

    input                        req_o;
    input                        we_o;
    input [AXI_ADDR_WIDTH  -1:0] addr_o;
    input [AXI_DATA_WIDTH/8-1:0] be_o;
    input [AXI_DATA_WIDTH  -1:0] data_o;
    input [AXI_DATA_WIDTH  -1:0] data_i;
  endclocking

  modport RCV(clocking rc_cb, input clk_i);
endinterface
