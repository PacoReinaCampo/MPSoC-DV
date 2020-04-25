////////////////////////////////////////////////////////////////////////////////
//                                            __ _      _     _               //
//                                           / _(_)    | |   | |              //
//                __ _ _   _  ___  ___ _ __ | |_ _  ___| | __| |              //
//               / _` | | | |/ _ \/ _ \ '_ \|  _| |/ _ \ |/ _` |              //
//              | (_| | |_| |  __/  __/ | | | | | |  __/ | (_| |              //
//               \__, |\__,_|\___|\___|_| |_|_| |_|\___|_|\__,_|              //
//                  | |                                                       //
//                  |_|                                                       //
//                                                                            //
//                                                                            //
//              MPSoC-OR1K CPU                                                //
//              Multi Processor System on Chip                                //
//              Wishbone Bus Interface                                        //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

/* Copyright (c) 2019-2020 by the author(s)
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 * =============================================================================
 * Author(s):
 *   Francisco Javier Reina Campo <frareicam@gmail.com>
 */

import dii_package::dii_flit;
import optimsoc_config::*;

module or1k_mpsoc4d #(
  parameter AW = 32,
  parameter DW = 32,

  parameter X = 2,
  parameter Y = 2,
  parameter Z = 2,
  parameter T = 2,

  localparam NODES = X*Y*Z*T,

  parameter config_t CONFIG = 'x
)
  (
    input clk,
    input rst,

    glip_channel c_glip_in,
    glip_channel c_glip_out,

    output [NODES-1:0][AW-1:0] wb_ext_adr_i,
    output [NODES-1:0]         wb_ext_cyc_i,
    output [NODES-1:0][DW-1:0] wb_ext_dat_i,
    output [NODES-1:0][   3:0] wb_ext_sel_i,
    output [NODES-1:0]         wb_ext_stb_i,
    output [NODES-1:0]         wb_ext_we_i,
    output [NODES-1:0]         wb_ext_cab_i,
    output [NODES-1:0][   2:0] wb_ext_cti_i,
    output [NODES-1:0][   1:0] wb_ext_bte_i,
    input  [NODES-1:0]         wb_ext_ack_o,
    input  [NODES-1:0]         wb_ext_rty_o,
    input  [NODES-1:0]         wb_ext_err_o,
    input  [NODES-1:0][DW-1:0] wb_ext_dat_o
  );

  ////////////////////////////////////////////////////////////////
  //
  // Constans
  //

  localparam FLIT_WIDTH = CONFIG.NOC_FLIT_WIDTH;
  localparam CHANNELS   = CONFIG.NOC_CHANNELS;

  ////////////////////////////////////////////////////////////////
  //
  // Variables
  //

  dii_flit [1:0] debug_ring_in  [0:NODES-1];
  dii_flit [1:0] debug_ring_out [0:NODES-1];

  logic [1:0] debug_ring_in_ready  [0:NODES-1];
  logic [1:0] debug_ring_out_ready [0:NODES-1];

  logic rst_sys;
  logic rst_cpu;

  genvar i;

  // Flits from NoC->tiles
  wire [NODES-1:0][CHANNELS-1:0][FLIT_WIDTH-1:0] link_in_flit;
  wire [NODES-1:0][CHANNELS-1:0]                 link_in_last;
  wire [NODES-1:0][CHANNELS-1:0]                 link_in_valid;
  wire [NODES-1:0][CHANNELS-1:0]                 link_in_ready;

  // Flits from tiles->NoC
  wire [NODES-1:0][CHANNELS-1:0][FLIT_WIDTH-1:0] link_out_flit;
  wire [NODES-1:0][CHANNELS-1:0]                 link_out_last;
  wire [NODES-1:0][CHANNELS-1:0]                 link_out_valid;
  wire [NODES-1:0][CHANNELS-1:0]                 link_out_ready;

  ////////////////////////////////////////////////////////////////
  //
  // Module Body
  //

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

  noc_mesh4d #(
    .FLIT_WIDTH (FLIT_WIDTH),
    .CHANNELS   (CHANNELS),

    .ENABLE_VCHANNELS (CONFIG.NOC_ENABLE_VCHANNELS),

    .X (X),
    .Y (Y),
    .Z (Z),
    .T (T)
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
  generate
    for (i=0; i<NODES; i=i+1) begin : gen_ct
      or1k_tile #(
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
