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

//Include UVM files
`include "uvm_macros.svh"
`include "uvm_pkg.sv"
import uvm_pkg::*;

//Include common files
`include "msp430_sequence.svh"
`include "msp430_driver.svh"
`include "msp430_monitor.svh"
`include "msp430_scoreboard.svh"
`include "msp430_subscriber.svh"
`include "msp430_agent.svh"
`include "msp430_env.svh"
`include "msp430_test.svh"

import dii_package::dii_flit;
import opensocdebug::mmsp430_trace_exec;
import optimsoc_config::*;
import optimsoc_functions::*;

module test;

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

  // Instantiate interface
  msp430_interface msp430_if();

  // Instantiate dut
  msp430_tile #(
    .CONFIG       (CONFIG),
    .ID           (0),
    .MEM_FILE     ("ct.vmem"),
    .DEBUG_BASEID ((CONFIG.DEBUG_LOCAL_SUBNET << (16 - CONFIG.DEBUG_SUBNET_BITS)) + 1)
  )
  dut (
    .clk                        ( msp430_if.clk     ),
    .rst_dbg                    ( msp430_if.rst     ),
    .rst_cpu                    ( msp430_if.rst_cpu ),
    .rst_sys                    ( msp430_if.rst_sys ),

    .debug_ring_in              ( msp430_if.debug_ring_in        ),
    .debug_ring_in_ready        ( msp430_if.debug_ring_in_ready  ),
    .debug_ring_out             ( msp430_if.debug_ring_out       ),
    .debug_ring_out_ready       ( msp430_if.debug_ring_out_ready ),

    .bb_ext_addr_i              ( msp430_if.bb_ext_addr_i ),
    .bb_ext_din_i               ( msp430_if.bb_ext_din_i  ),
    .bb_ext_en_i                ( msp430_if.bb_ext_en_i   ),
    .bb_ext_we_i                ( msp430_if.bb_ext_en_i   ),

    .bb_ext_dout_o              ( msp430_if.bb_ext_dout_o ),

    .noc_in_ready               ( msp430_if.link_in_ready  ),
    .noc_out_flit               ( msp430_if.link_out_flit  ),
    .noc_out_last               ( msp430_if.link_out_last  ),
    .noc_out_valid              ( msp430_if.link_out_valid ),

    .noc_in_flit                ( msp430_if.link_in_flit   ),
    .noc_in_last                ( msp430_if.link_in_last   ),
    .noc_in_valid               ( msp430_if.link_in_valid  ),
    .noc_out_ready              ( msp430_if.link_out_ready )
  );

  //Clock generation
  always #5 msp430_if.clk = ~msp430_if.clk;
  
  initial begin
    msp430_if.clk = 0;
  end

  initial begin
    // Place the interface into the UVM configuration database
    uvm_config_db#(virtual msp430_interface)::set(null, "*", "msp430_vif", msp430_if);
    
    // Start the test
    run_test();
  end

  initial begin
    $vcdpluson();
  end
endmodule
