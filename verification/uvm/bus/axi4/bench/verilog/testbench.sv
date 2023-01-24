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
//              MPSoC-RISCV / OR1K / MSP430 CPU                               //
//              General Purpose Input Output Bridge                           //
//              AMBA4 AXI-Lite Bus Interface                                  //
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
`include "axi4_sequence_item.svh"
`include "axi4_sequence.svh"
`include "axi4_sequencer.svh"
`include "axi4_driver.svh"
`include "axi4_monitor.svh"
`include "axi4_agent.svh"
`include "axi4_scoreboard.svh"
`include "axi4_subscriber.svh"
`include "axi4_enviroment.svh"
`include "axi4_test.svh"

module test;
  logic        clk;
  logic        rst;

  logic [10:0] aw_id;
  logic [31:0] aw_addr;
  logic [ 7:0] aw_len;
  logic [ 2:0] aw_size;
  logic [ 1:0] aw_burst;
  logic        aw_lock;
  logic [ 3:0] aw_cache;
  logic [ 2:0] aw_prot;
  logic [ 3:0] aw_qos;
  logic [ 3:0] aw_region;
  logic [10:0] aw_user;
  logic        aw_valid;
  logic        aw_ready;

  logic [10:0] ar_id;
  logic [31:0] ar_addr;
  logic [ 7:0] ar_len;
  logic [ 2:0] ar_size;
  logic [ 1:0] ar_burst;
  logic        ar_lock;
  logic [ 3:0] ar_cache;
  logic [ 2:0] ar_prot;
  logic [ 3:0] ar_qos;
  logic [ 3:0] ar_region;
  logic [10:0] ar_user;
  logic        ar_valid;
  logic        ar_ready;

  logic [31:0] dw_data;
  logic [10:0] dw_strb;
  logic        dw_last;
  logic [10:0] dw_user;
  logic        dw_valid;
  logic        dw_ready;

  logic [10:0] dr_id;
  logic [31:0] dr_data;
  logic [ 1:0] dr_resp;
  logic        dr_last;
  logic [10:0] dr_user;
  logic        dr_valid;
  logic        dr_ready;

  logic [10:0] b_id;
  logic [ 1:0] b_resp;
  logic [10:0] b_user;
  logic        b_valid;
  logic        b_ready;

  dut_if axi4_if();

  axi4_slave dut(.dif(axi4_if));

  initial begin
    axi4_if.clk = 0;
  end

  //Generate a clock
  always begin
    #10 axi4_if.clk = ~axi4_if.clk;
  end

  initial begin
    axi4_if.rst = 0;
    repeat (1) @(posedge axi4_if.clk);
    axi4_if.rst = 1;
  end

  initial begin
    uvm_config_db#(virtual dut_if)::set( null, "uvm_test_top", "vif", axi4_if);
    run_test("axi4_test");
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
