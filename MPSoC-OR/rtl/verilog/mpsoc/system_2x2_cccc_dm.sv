import dii_package::dii_flit;
import optimsoc_config::*;

module system_2x2_cccc_dm #(
  parameter X = 2,
  parameter Y = 2,

  parameter config_t CONFIG = 'x
)
  (
    input clk,
    input rst,

    glip_channel c_glip_in,
    glip_channel c_glip_out,

    output [3:0][31:0] wb_ext_adr_i,
    output [3:0]       wb_ext_cyc_i,
    output [3:0][31:0] wb_ext_dat_i,
    output [3:0][ 3:0] wb_ext_sel_i,
    output [3:0]       wb_ext_stb_i,
    output [3:0]       wb_ext_we_i,
    output [3:0]       wb_ext_cab_i,
    output [3:0] [2:0] wb_ext_cti_i,
    output [3:0][ 1:0] wb_ext_bte_i,
    input  [3:0]       wb_ext_ack_o,
    input  [3:0]       wb_ext_rty_o,
    input  [3:0]       wb_ext_err_o,
    input  [3:0][31:0] wb_ext_dat_o
  );

  dii_flit [1:0] debug_ring_in  [0:3];
  dii_flit [1:0] debug_ring_out [0:3];

  logic [1:0] debug_ring_in_ready  [0:3];
  logic [1:0] debug_ring_out_ready [0:3];

  logic rst_sys;
  logic rst_cpu;

  debug_interface #(
    .SYSTEM_VENDOR_ID         (2),
    .SYSTEM_DEVICE_ID         (2),
    .NUM_MODULES              (CONFIG.DEBUG_NUM_MODS),
    .MAX_PKT_LEN              (CONFIG.DEBUG_MAX_PKT_LEN),
    .SUBNET_BITS              (CONFIG.DEBUG_SUBNET_BITS),
    .LOCAL_SUBNET             (CONFIG.DEBUG_LOCAL_SUBNET),
    .DEBUG_ROUTER_BUFFER_SIZE (CONFIG.DEBUG_ROUTER_BUFFER_SIZE)
  )
  u_debuginterface (
    .clk            (clk),
    .rst            (rst),
    .sys_rst        (rst_sys),
    .cpu_rst        (rst_cpu),
    .glip_in        (c_glip_in),
    .glip_out       (c_glip_out),
    .ring_out       (debug_ring_in[0]),
    .ring_out_ready (debug_ring_in_ready[0]),
    .ring_in        (debug_ring_out[2]),
    .ring_in_ready  (debug_ring_out_ready[2])
  );

  // We are routing the debug in a meander
  assign debug_ring_in[1] = debug_ring_out[0];
  assign debug_ring_out_ready[0] = debug_ring_in_ready[1];
  assign debug_ring_in[3] = debug_ring_out[1];
  assign debug_ring_out_ready[1] = debug_ring_in_ready[3];
  assign debug_ring_in[2] = debug_ring_out[3];
  assign debug_ring_out_ready[3] = debug_ring_in_ready[2];

  localparam FLIT_WIDTH = CONFIG.NOC_FLIT_WIDTH;
  localparam CHANNELS   = CONFIG.NOC_CHANNELS;

  // Flits from NoC->tiles
  wire [3:0][CHANNELS-1:0][FLIT_WIDTH-1:0] link_in_flit;
  wire [3:0][CHANNELS-1:0]                 link_in_last;
  wire [3:0][CHANNELS-1:0]                 link_in_valid;
  wire [3:0][CHANNELS-1:0]                 link_in_ready;

  // Flits from tiles->NoC
  wire [3:0][CHANNELS-1:0][FLIT_WIDTH-1:0] link_out_flit;
  wire [3:0][CHANNELS-1:0]                 link_out_last;
  wire [3:0][CHANNELS-1:0]                 link_out_valid;
  wire [3:0][CHANNELS-1:0]                 link_out_ready;

  noc_mesh2d #(
    .FLIT_WIDTH (FLIT_WIDTH),
    .CHANNELS   (CHANNELS),

    .ENABLE_VCHANNELS (CONFIG.NOC_ENABLE_VCHANNELS),

    .X (X),
    .Y (X)
  )
  u_noc (
    .*,
    .in_flit   (link_out_flit),
    .in_last   (link_out_last),
    .in_valid  (link_out_valid),
    .in_ready  (link_out_ready),
    .out_flit  (link_in_flit),
    .out_last  (link_in_last),
    .out_valid (link_in_valid),
    .out_ready (link_in_ready)
  );

  genvar i;
  generate
    for (i=0; i<4; i=i+1) begin : gen_ct
      compute_tile_dm #(
        .CONFIG       (CONFIG),
        .ID           (i),
        .COREBASE     (i*CONFIG.CORES_PER_TILE),
        .DEBUG_BASEID ((CONFIG.DEBUG_LOCAL_SUBNET << (16 - CONFIG.DEBUG_SUBNET_BITS)) + 1 + (i*CONFIG.DEBUG_MODS_PER_TILE))
      )
      u_ct (
        .clk                        (clk),
        .rst_dbg                    (rst),
        .rst_cpu                    (rst_cpu),
        .rst_sys                    (rst_sys),

        .debug_ring_in              (debug_ring_in        [i]),
        .debug_ring_in_ready        (debug_ring_in_ready  [i]),
        .debug_ring_out             (debug_ring_out       [i]),
        .debug_ring_out_ready       (debug_ring_out_ready [i]),

        .wb_ext_ack_o               (wb_ext_ack_o [i]),
        .wb_ext_rty_o               (wb_ext_rty_o [i]),
        .wb_ext_err_o               (wb_ext_err_o [i]),
        .wb_ext_dat_o               (wb_ext_dat_o [i]),
        .wb_ext_adr_i               (wb_ext_adr_i [i]),
        .wb_ext_cyc_i               (wb_ext_cyc_i [i]),
        .wb_ext_dat_i               (wb_ext_dat_i [i]),
        .wb_ext_sel_i               (wb_ext_sel_i [i]),
        .wb_ext_stb_i               (wb_ext_stb_i [i]),
        .wb_ext_we_i                (wb_ext_we_i  [i]),
        .wb_ext_cab_i               (wb_ext_cab_i [i]),
        .wb_ext_cti_i               (wb_ext_cti_i [i]),
        .wb_ext_bte_i               (wb_ext_bte_i [i]),

        .noc_in_ready               (link_in_ready  [i]),
        .noc_out_flit               (link_out_flit  [i]),
        .noc_out_last               (link_out_last  [i]),
        .noc_out_valid              (link_out_valid [i]),

        .noc_in_flit                (link_in_flit   [i]),
        .noc_in_last                (link_in_last   [i]),
        .noc_in_valid               (link_in_valid  [i]),
        .noc_out_ready              (link_out_ready [i])
      );
    end
  endgenerate
endmodule
