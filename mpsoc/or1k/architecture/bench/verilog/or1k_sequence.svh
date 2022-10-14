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

class or1k_transaction extends uvm_sequence_item;
  `uvm_object_utils(or1k_transaction)

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

  rand bit [15:0] instrn;

  bit clk;
  bit rst;
  bit rst_cpu;
  bit rst_sys;

  dii_flit [1:0] debug_ring_in;
  dii_flit [1:0] debug_ring_out;

  bit [1:0] debug_ring_in_ready;
  bit [1:0] debug_ring_out_ready;

  bit [AW-1:0] wb_ext_adr_i;
  bit          wb_ext_cyc_i;
  bit [DW-1:0] wb_ext_dat_i;
  bit [   3:0] wb_ext_sel_i;
  bit          wb_ext_stb_i;
  bit          wb_ext_we_i;
  bit          wb_ext_cab_i;
  bit [   2:0] wb_ext_cti_i;
  bit [   1:0] wb_ext_bte_i;
  bit          wb_ext_ack_o;
  bit          wb_ext_rty_o;
  bit          wb_ext_err_o;
  bit [DW-1:0] wb_ext_dat_o;

  // Flits from NoC->tiles
  bit [CHANNELS-1:0][FLIT_WIDTH-1:0] link_in_flit;
  bit [CHANNELS-1:0]                 link_in_last;
  bit [CHANNELS-1:0]                 link_in_valid;
  bit [CHANNELS-1:0]                 link_in_ready;

  // Flits from tiles->NoC
  bit [CHANNELS-1:0][FLIT_WIDTH-1:0] link_out_flit;
  bit [CHANNELS-1:0]                 link_out_last;
  bit [CHANNELS-1:0]                 link_out_valid;
  bit [CHANNELS-1:0]                 link_out_ready;

  constraint input_constraint {
    //Cosntraint to prevent EOF operation
    instrn inside {[16'h0000:16'hEFFF]};
  }

  function new (string name = "");
    super.new(name);
  endfunction
endclass: or1k_transaction

class inst_sequence extends uvm_sequence#(or1k_transaction);
  `uvm_object_utils(inst_sequence)

  function new (string name = "");
    super.new(name);
  endfunction

  bit [15:0] inst;

  //or1k_transaction req;
  task body;
    req = or1k_transaction::type_id::create("req");
    start_item(req);

    if (!req.randomize()) begin
      `uvm_error("Instruction Sequence", "Randomize failed.");
    end

    inst = req.instrn;

    finish_item(req);
  endtask: body
endclass: inst_sequence

class or1k_sequence extends uvm_sequence#(or1k_transaction);
  `uvm_object_utils(or1k_sequence)

  function new (string name = "");
    super.new(name);
  endfunction

  inst_sequence inst_seq;

  task body;
    //LOOP relative to use case (say 256)
    for(int i =0;i<10000;i++) begin
      inst_seq = inst_sequence::type_id::create("inst_seq");
      inst_seq.start(m_sequencer);
    end
  endtask: body
endclass: or1k_sequence
