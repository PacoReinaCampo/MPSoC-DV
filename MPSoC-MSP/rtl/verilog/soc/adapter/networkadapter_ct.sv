/////////////////////////////////////////////////////////////////////////////////
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
//              MPSoC-MSP430 CPU                                              //
//              Multi Processor System on Chip                                //
//              Blackbone Bus Interface                                       //
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

import optimsoc_config::*;

module networkadapter_ct #(
  parameter AW = 32,
  parameter DW = 32,

  parameter config_t CONFIG = 'x,

  parameter TILEID   = 'x,
  parameter COREBASE = 'x,

  localparam CHANNELS   = CONFIG.NOC_CHANNELS,
  localparam FLIT_WIDTH = CONFIG.NOC_FLIT_WIDTH
)
  (
    `ifdef OPTIMSOC_CLOCKDOMAINS
    `ifdef OPTIMSOC_CDC_DYNAMIC
    output [2:0]          cdc_conf,
    output                cdc_enable,
    `endif
    `endif

    input                                 clk,
    input                                 rst,

    input  [CHANNELS-1:0][FLIT_WIDTH-1:0] noc_in_flit,
    input  [CHANNELS-1:0]                 noc_in_last,
    input  [CHANNELS-1:0]                 noc_in_valid,
    output [CHANNELS-1:0]                 noc_in_ready,

    output [CHANNELS-1:0][FLIT_WIDTH-1:0] noc_out_flit,
    output [CHANNELS-1:0]                 noc_out_last,
    output [CHANNELS-1:0]                 noc_out_valid,
    input  [CHANNELS-1:0]                 noc_out_ready,

    output [AW-1:0]                       wbm_addr_o,
    output [DW-1:0]                       wbm_din_o,
    output                                wbm_en_o,
    output                                wbm_we_o,

    input  [DW-1:0]                       wbm_dout_i,

    input  [AW-1:0]                       wbs_addr_i,
    input  [DW-1:0]                       wbs_din_i,
    input                                 wbs_en_i,
    input                                 wbs_we_i,

    output [DW-1:0]                       wbs_dout_o,

    output [   1:0]                       irq
  );

  ////////////////////////////////////////////////////////////////
  //
  // Constans
  //

  // Those are the actual channels from the modules
  localparam C_MPSIMPLE_REQ = 0;
  localparam C_MPSIMPLE_RES = 1;
  localparam C_DMA_REQ      = 2;
  localparam C_DMA_RES      = 3;
  localparam MODCHANNELS    = 4;

  // The different interfaces at the bus slave
  //  slave 0: configuration
  //           NABASE + 0x000000
  //  slave 1: mp_simple
  //           NABASE + 0x100000
  //  slave 2: dma
  //           NABASE + 0x200000
  // If a slave is not present there is a gap

  localparam ID_CONF     = 0;
  localparam ID_MPSIMPLE = 1;
  localparam ID_DMA      = 2;
  localparam SLAVES      = 3; // This is the number of maximum slaves

  ////////////////////////////////////////////////////////////////
  //
  // Variables
  //

  wire [MODCHANNELS-1:0]                 mod_out_ready;
  wire [MODCHANNELS-1:0]                 mod_out_valid;
  wire [MODCHANNELS-1:0]                 mod_out_last;
  wire [MODCHANNELS-1:0][FLIT_WIDTH-1:0] mod_out_flit;
  wire [MODCHANNELS-1:0]                 mod_in_ready;
  wire [MODCHANNELS-1:0]                 mod_in_valid;
  wire [MODCHANNELS-1:0]                 mod_in_last;
  wire [MODCHANNELS-1:0][FLIT_WIDTH-1:0] mod_in_flit;

  wire [SLAVES-1:0][  23:0]              wbif_addr_i;
  wire [SLAVES-1:0][DW-1:0]              wbif_din_i;
  wire [SLAVES-1:0]                      wbif_en_i;
  wire [SLAVES-1:0]                      wbif_we_i;

  wire [SLAVES-1:0][DW-1:0]              wbif_dout_o;

  ////////////////////////////////////////////////////////////////
  //
  // Module Body
  //

  wb_decode #(
    .SLAVES         (3),
    .DATA_WIDTH     (DW),
    .ADDR_WIDTH     (24),
    .S0_RANGE_WIDTH (4),
    .S0_RANGE_MATCH (4'h0),
    .S1_RANGE_WIDTH (4),
    .S1_RANGE_MATCH (4'h1),
    .S2_RANGE_WIDTH (4),
    .S2_RANGE_MATCH (4'h2)
  )
  u_slavedecode (
    .clk_i (clk),
    .rst_i (rst),

    .m_addr_i (wbs_addr_i[23:0]),
    .m_din_i  (wbs_din_i),
    .m_en_i   (wbs_en_i),
    .m_we_i   (wbs_we_i),

    .m_dout_o (wbs_dout_o),

    .s_addr_o (wbif_addr_i),
    .s_din_o  (wbif_din_i),
    .s_en_o   (wbif_en_i),
    .s_we_o   (wbif_we_i),

    .s_dout_i (wbif_dout_o)
  );

  networkadapter_conf #(
    .CONFIG                (CONFIG),
    .TILEID                (TILEID),
    .COREBASE              (COREBASE)
  )
  u_conf (
    `ifdef OPTIMSOC_CLOCKDOMAINS
    `ifdef OPTIMSOC_CDC_DYNAMIC
    .cdc_conf                     (cdc_conf[2:0]),
    .cdc_enable                   (cdc_enable),
    `endif
    `endif
    .clk                          (clk),
    .rst                          (rst),

    .addr                         (wbs_addr_i[15:0]),
    .din                          (wbif_dat_i[ID_CONF]),
    .en                           (wbs_en_i),
    .we                           (wbs_we_i),

    .dout                         (wbif_dat_o[ID_CONF])
  );

  // just wire them statically for the moment
  assign wbif_rty_o[ID_MPSIMPLE] = 1'b0;

  mpi_wb #(
    .NOC_FLIT_WIDTH (CONFIG.NOC_FLIT_WIDTH),
    .SIZE           (16),
    .N              (2)
  )
  u_mpi (
    .*,
    .noc_out_flit  ({mod_out_flit [C_MPSIMPLE_RES],mod_out_flit [C_MPSIMPLE_REQ]}),
    .noc_out_last  ({mod_out_last [C_MPSIMPLE_RES],mod_out_last [C_MPSIMPLE_REQ]}),
    .noc_out_valid ({mod_out_valid[C_MPSIMPLE_RES],mod_out_valid[C_MPSIMPLE_REQ]}),
    .noc_out_ready ({mod_out_ready[C_MPSIMPLE_RES],mod_out_ready[C_MPSIMPLE_REQ]}),

    .noc_in_flit   ({mod_in_flit [C_MPSIMPLE_RES],mod_in_flit [C_MPSIMPLE_REQ]}),
    .noc_in_last   ({mod_in_last [C_MPSIMPLE_RES],mod_in_last [C_MPSIMPLE_REQ]}),
    .noc_in_valid  ({mod_in_valid[C_MPSIMPLE_RES],mod_in_valid[C_MPSIMPLE_REQ]}),
    .noc_in_ready  ({mod_in_ready[C_MPSIMPLE_RES],mod_in_ready[C_MPSIMPLE_REQ]}),

    .wb_dout_o     (wbif_dout_o[ID_MPSIMPLE]),

    .wb_addr_i     ({8'h0,wbif_addr_i[ID_MPSIMPLE]}),
    .wb_dout_i     (wbif_dout_i[ID_MPSIMPLE]),
    .wb_en_i       (wbif_en_i[ID_MPSIMPLE]),
    .wb_we_i       (wbif_we_i[ID_MPSIMPLE]),

    .irq           (irq[0])
  );

  generate
    if (CONFIG.NA_ENABLE_DMA) begin
      wire [3:0] irq_dma;
      assign irq[1] = |irq_dma;

      wire [1:0][CONFIG.NOC_FLIT_WIDTH+1:0] dma_in_flit,dma_out_flit;
      assign dma_in_flit[0] = {mod_in_last[C_DMA_REQ],1'b0,mod_in_flit[C_DMA_REQ]};
      assign dma_in_flit[1] = {mod_in_last[C_DMA_RES],1'b0,mod_in_flit[C_DMA_RES]};
      assign mod_out_last[C_DMA_REQ] = dma_out_flit[0][CONFIG.NOC_FLIT_WIDTH+1];
      assign mod_out_flit[C_DMA_REQ] = dma_out_flit[0][CONFIG.NOC_FLIT_WIDTH-1:0];
      assign mod_out_last[C_DMA_RES] = dma_out_flit[1][CONFIG.NOC_FLIT_WIDTH+1];
      assign mod_out_flit[C_DMA_RES] = dma_out_flit[1][CONFIG.NOC_FLIT_WIDTH-1:0];

      mpsoc_dma_wb_top #(
        .TILEID        (TILEID),
        .TABLE_ENTRIES (CONFIG.NA_DMA_ENTRIES)
      )
      u_dma (
        .clk                     (clk),
        .rst                     (rst),

        .noc_in_req_flit         (dma_in_flit[0]),
        .noc_in_req_valid        (mod_in_valid[C_DMA_REQ]),
        .noc_in_req_ready        (mod_in_ready[C_DMA_REQ]),

        .noc_in_res_flit         (dma_in_flit[1]),
        .noc_in_res_valid        (mod_in_valid[C_DMA_RES]),
        .noc_in_res_ready        (mod_in_ready[C_DMA_RES]),

        .noc_out_req_flit        (dma_out_flit[0]),
        .noc_out_req_valid       (mod_out_valid[C_DMA_REQ]),
        .noc_out_req_ready       (mod_out_ready[C_DMA_REQ]),

        .noc_out_res_flit        (dma_out_flit[1]),
        .noc_out_res_valid       (mod_out_valid[C_DMA_RES]),
        .noc_out_res_ready       (mod_out_ready[C_DMA_RES]),

        .wb_if_addr_i            ({8'h0,wbif_addr_i[ID_DMA]}),
        .wb_if_dout_i            (wbif_dout_i[ID_DMA]),
        .wb_if_en_i              (wbif_en_i[ID_DMA]),
        .wb_if_we_i              (wbif_we_i[ID_DMA]),

        .wb_if_dout_o            (wbif_dout_o[ID_DMA]),

        .wb_addr_o               (wbm_addr_o),
        .wb_dout_o               (wbm_dout_o),
        .wb_en_o                 (wbm_en_o),
        .wb_we_o                 (wbm_we_o),

        .wb_dout_i               (wbm_dout_i),

        .irq                     (irq_dma)
      );
    end
    else begin
      assign irq[1] = 1'b0;
    end
  endgenerate

  wire [1:0][FLIT_WIDTH-1:0] muxed_flit;
  wire [1:0]                 muxed_last,muxed_valid,muxed_ready;

  noc_mux #(
    .FLIT_WIDTH (FLIT_WIDTH),
    .CHANNELS   (2)
  )
  u_mux0 (
    .*,
    .in_flit   ({mod_out_flit [C_MPSIMPLE_REQ], mod_out_flit [C_DMA_REQ]}),
    .in_last   ({mod_out_last [C_MPSIMPLE_REQ], mod_out_last [C_DMA_REQ]}),
    .in_valid  ({mod_out_valid[C_MPSIMPLE_REQ], mod_out_valid[C_DMA_REQ]}),
    .in_ready  ({mod_out_ready[C_MPSIMPLE_REQ], mod_out_ready[C_DMA_REQ]}),
    .out_flit  (muxed_flit[0]),
    .out_last  (muxed_last[0]),
    .out_valid (muxed_valid[0]),
    .out_ready (muxed_ready[0])
  );

  noc_mux #(
    .FLIT_WIDTH(FLIT_WIDTH),.CHANNELS(2)
  )
  u_mux1 (
    .*,
    .in_flit   ({mod_out_flit [C_MPSIMPLE_RES], mod_out_flit [C_DMA_RES]}),
    .in_last   ({mod_out_last [C_MPSIMPLE_RES], mod_out_last [C_DMA_RES]}),
    .in_valid  ({mod_out_valid[C_MPSIMPLE_RES], mod_out_valid[C_DMA_RES]}),
    .in_ready  ({mod_out_ready[C_MPSIMPLE_RES], mod_out_ready[C_DMA_RES]}),
    .out_flit  (muxed_flit[1]),
    .out_last  (muxed_last[1]),
    .out_valid (muxed_valid[1]),
    .out_ready (muxed_ready[1])
  );

  noc_buffer #(
    .FLIT_WIDTH (FLIT_WIDTH),
    .DEPTH      (4)
  )
  u_outbuffer0 (
    .*,
    .in_flit     (muxed_flit[0]),
    .in_last     (muxed_last[0]),
    .in_valid    (muxed_valid[0]),
    .in_ready    (muxed_ready[0]),
    .out_flit    (noc_out_flit[0]),
    .out_last    (noc_out_last[0]),
    .out_valid   (noc_out_valid[0]),
    .out_ready   (noc_out_ready[0]),
    .packet_size ()
  );

  noc_buffer #(
    .FLIT_WIDTH (FLIT_WIDTH),
    .DEPTH      (4)
  )
  u_outbuffer1 (
    .*,
    .in_flit     (muxed_flit[1]),
    .in_last     (muxed_last[1]),
    .in_valid    (muxed_valid[1]),
    .in_ready    (muxed_ready[1]),
    .out_flit    (noc_out_flit[1]),
    .out_last    (noc_out_last[1]),
    .out_valid   (noc_out_valid[1]),
    .out_ready   (noc_out_ready[1]),
    .packet_size ()
  );

  wire [1:0][FLIT_WIDTH-1:0] inbuffer_flit;
  wire [1:0]                 inbuffer_last;
  wire [1:0]                 inbuffer_valid;
  wire [1:0]                 inbuffer_ready;

  noc_buffer #(
    .FLIT_WIDTH (FLIT_WIDTH),
    .DEPTH      (4)
  )
  u_inbuffer0 (
    .*,
    .in_flit     (noc_in_flit[0]),
    .in_last     (noc_in_last[0]),
    .in_valid    (noc_in_valid[0]),
    .in_ready    (noc_in_ready[0]),
    .out_flit    (inbuffer_flit[0]),
    .out_last    (inbuffer_last[0]),
    .out_valid   (inbuffer_valid[0]),
    .out_ready   (inbuffer_ready[0]),
    .packet_size ()
  );

  noc_demux #(
    .FLIT_WIDTH (FLIT_WIDTH),
    .CHANNELS (2),
    .MAPPING  ({ 48'h0,8'h2,8'h1 })
  )
  u_demux0 (
    .*,
    .in_flit                    (inbuffer_flit[0]),
    .in_last                    (inbuffer_last[0]),
    .in_valid                   (inbuffer_valid[0]),
    .in_ready                   (inbuffer_ready[0]),
    .out_flit                   ({mod_in_flit [C_DMA_REQ], mod_in_flit [C_MPSIMPLE_REQ]}),
    .out_last                   ({mod_in_last [C_DMA_REQ], mod_in_last [C_MPSIMPLE_REQ]}),
    .out_valid                  ({mod_in_valid[C_DMA_REQ], mod_in_valid[C_MPSIMPLE_REQ]}),
    .out_ready                  ({mod_in_ready[C_DMA_REQ], mod_in_ready[C_MPSIMPLE_REQ]})
  );

  noc_buffer #(
    .FLIT_WIDTH (FLIT_WIDTH),
    .DEPTH      (4)
  )
  u_inbuffer1 (
    .*,
    .in_flit     (noc_in_flit[1]),
    .in_last     (noc_in_last[1]),
    .in_valid    (noc_in_valid[1]),
    .in_ready    (noc_in_ready[1]),
    .out_flit    (inbuffer_flit[1]),
    .out_last    (inbuffer_last[1]),
    .out_valid   (inbuffer_valid[1]),
    .out_ready   (inbuffer_ready[1]),
    .packet_size ()
  );

  noc_demux #(
    .FLIT_WIDTH (FLIT_WIDTH),
    .CHANNELS   (2),
    .MAPPING    ({ 48'h0,8'h2,8'h1 })
  )
  u_demux1 (
    .*,
    .in_flit    (inbuffer_flit[1]),
    .in_last    (inbuffer_last[1]),
    .in_valid   (inbuffer_valid[1]),
    .in_ready   (inbuffer_ready[1]),
    .out_flit   ({mod_in_flit [C_DMA_RES], mod_in_flit [C_MPSIMPLE_RES]}),
    .out_last   ({mod_in_last [C_DMA_RES], mod_in_last [C_MPSIMPLE_RES]}),
    .out_valid  ({mod_in_valid[C_DMA_RES], mod_in_valid[C_MPSIMPLE_RES]}),
    .out_ready  ({mod_in_ready[C_DMA_RES], mod_in_ready[C_MPSIMPLE_RES]})
  );
endmodule
