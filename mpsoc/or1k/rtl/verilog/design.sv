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
//              PU RISCV / OR1K / MSP430                                      //
//              Universal Verification Methodology                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

/* Copyright (c) 2020-2021 by the author(s)
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
 *   Paco Reina Campo <pacoreinacampo@queenfield.tech>
 */

import dii_package::dii_flit;
import opensocdebug::mor1kx_trace_exec;
import optimsoc_config::*;
import optimsoc_functions::*;

interface or1k_interface;
  parameter AW = 32;
  parameter DW = 32;

  // Simulation parameters
  parameter USE_DEBUG = 0;
  parameter integer NUM_CORES = 1;
  parameter integer LMEM_SIZE = 128*1024*1024;

  localparam base_config_t
  BASE_CONFIG = '{NUMTILES: 1,
                  NUMCTS: 1,
                  CTLIST: {{63{16'hx}}, 16'h0},
                  CORES_PER_TILE: NUM_CORES,
                  GMEM_SIZE: 0,
                  GMEM_TILE: 0,
                  NOC_ENABLE_VCHANNELS: 0,
                  LMEM_SIZE: LMEM_SIZE,
                  LMEM_STYLE: PLAIN,
                  ENABLE_BOOTROM: 0,
                  BOOTROM_SIZE: 0,
                  ENABLE_DM: 1,
                  DM_BASE: 32'h0,
                  DM_SIZE: LMEM_SIZE,
                  ENABLE_PGAS: 0,
                  PGAS_BASE: 0,
                  PGAS_SIZE: 0,
                  CORE_ENABLE_FPU: 0,
                  CORE_ENABLE_PERFCOUNTERS: 0,
                  NA_ENABLE_MPSIMPLE: 1,
                  NA_ENABLE_DMA: 1,
                  NA_DMA_GENIRQ: 1,
                  NA_DMA_ENTRIES: 4,
                  USE_DEBUG: 1'(USE_DEBUG),
                  DEBUG_STM: 1,
                  DEBUG_CTM: 1,
                  DEBUG_DEM_UART: 1,
                  DEBUG_SUBNET_BITS: 6,
                  DEBUG_LOCAL_SUBNET: 0,
                  DEBUG_ROUTER_BUFFER_SIZE: 4,
                  DEBUG_MAX_PKT_LEN: 12
                  };

  localparam config_t CONFIG = derive_config(BASE_CONFIG);

  localparam CHANNELS   = CONFIG.NOC_CHANNELS;
  localparam FLIT_WIDTH = CONFIG.NOC_FLIT_WIDTH;

  logic clk;
  logic rst;
  logic rst_cpu;
  logic rst_sys;

  dii_flit [1:0] debug_ring_in;
  dii_flit [1:0] debug_ring_out;

  logic [1:0] debug_ring_in_ready;
  logic [1:0] debug_ring_out_ready;

  logic [AW-1:0] wb_ext_adr_i;
  logic          wb_ext_cyc_i;
  logic [DW-1:0] wb_ext_dat_i;
  logic [   3:0] wb_ext_sel_i;
  logic          wb_ext_stb_i;
  logic          wb_ext_we_i;
  logic          wb_ext_cab_i;
  logic [   2:0] wb_ext_cti_i;
  logic [   1:0] wb_ext_bte_i;
  logic          wb_ext_ack_o;
  logic          wb_ext_rty_o;
  logic          wb_ext_err_o;
  logic [DW-1:0] wb_ext_dat_o;

  // Flits from NoC->tiles
  logic [CHANNELS-1:0][FLIT_WIDTH-1:0] link_in_flit;
  logic [CHANNELS-1:0]                 link_in_last;
  logic [CHANNELS-1:0]                 link_in_valid;
  logic [CHANNELS-1:0]                 link_in_ready;

  // Flits from tiles->NoC
  logic [CHANNELS-1:0][FLIT_WIDTH-1:0] link_out_flit;
  logic [CHANNELS-1:0]                 link_out_last;
  logic [CHANNELS-1:0]                 link_out_valid;
  logic [CHANNELS-1:0]                 link_out_ready;
  
  clocking driver_cb @(posedge clk);
    output clk;
    output rst;
    output rst_cpu;
    output rst_sys;

    output debug_ring_in;
    input  debug_ring_out;

    input  debug_ring_in_ready;
    output debug_ring_out_ready;

    input  wb_ext_adr_i;
    input  wb_ext_cyc_i;
    input  wb_ext_dat_i;
    input  wb_ext_sel_i;
    input  wb_ext_stb_i;
    input  wb_ext_we_i;
    input  wb_ext_cab_i;
    input  wb_ext_cti_i;
    input  wb_ext_bte_i;

    output wb_ext_ack_o;
    output wb_ext_rty_o;
    output wb_ext_err_o;
    output wb_ext_dat_o;

    // Flits from NoC->tiles
    output link_in_flit;
    output link_in_last;
    output link_in_valid;
    input  link_in_ready;

    // Flits from tiles->NoC
    input  link_out_flit;
    input  link_out_last;
    input  link_out_valid;
    output link_out_ready;
  endclocking : driver_cb

  clocking monitor_cb @(posedge clk);
    input  clk;
    input  rst;
    input  rst_cpu;
    input  rst_sys;

    input  debug_ring_in;
    output debug_ring_out;

    output debug_ring_in_ready;
    input  debug_ring_out_ready;

    output wb_ext_adr_i;
    output wb_ext_cyc_i;
    output wb_ext_dat_i;
    output wb_ext_sel_i;
    output wb_ext_stb_i;
    output wb_ext_we_i;
    output wb_ext_cab_i;
    output wb_ext_cti_i;
    output wb_ext_bte_i;

    input  wb_ext_ack_o;
    input  wb_ext_rty_o;
    input  wb_ext_err_o;
    input  wb_ext_dat_o;

    // Flits from NoC->tiles
    input  link_in_flit;
    input  link_in_last;
    input  link_in_valid;
    output link_in_ready;

    // Flits from tiles->NoC
    output link_out_flit;
    output link_out_last;
    output link_out_valid;
    input  link_out_ready;
  endclocking : monitor_cb

  modport driver_if_mp(clocking driver_cb);
  modport monitor_if_mp(clocking monitor_cb);
endinterface
