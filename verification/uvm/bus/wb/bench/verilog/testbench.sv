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
//              Wishbone Bus Interface                                        //
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
`include "wb_transaction.svh"
`include "wb_sequence.svh"
`include "wb_sequencer.svh"
`include "wb_driver.svh"
`include "wb_monitor.svh"
`include "wb_agent.svh"
`include "wb_scoreboard.svh"
`include "wb_subscriber.svh"
`include "wb_env.svh"
`include "wb_test.svh"

module test;
  logic        clk;
  logic        rst;
  logic [31:0] adr_i;
  logic        stb_i;
  logic        cyc_i;
  logic [ 3:0] sel_i;
  logic        we_i;
  logic [ 2:0] cti_i;
  logic [ 1:0] bte_i;
  logic [31:0] dat_i;
  logic        err_o;
  logic        ack_o;
  logic [31:0] dat_o;
  logic        rty_o;

  dut_if wb_if();

  wb_slave dut(.dif(wb_if));

  initial begin
    wb_if.clk=0;
  end

  //Generate a clock
  always begin
    #10 wb_if.clk = ~wb_if.clk;
  end

  initial begin
    wb_if.rst=0;
    repeat (1) @(posedge wb_if.clk);
    wb_if.rst=1;
  end

  initial begin
    uvm_config_db#(virtual dut_if)::set( null, "uvm_test_top", "vif", wb_if);
    run_test("wb_test");
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
