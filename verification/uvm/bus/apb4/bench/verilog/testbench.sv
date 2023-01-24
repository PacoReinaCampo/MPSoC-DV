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
//              AMBA4 APB-Lite Bus Interface                                  //
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
`include "apb4_sequence_item.svh"
`include "apb4_sequence.svh"
`include "apb4_sequencer.svh"
`include "apb4_driver.svh"
`include "apb4_monitor.svh"
`include "apb4_agent.svh"
`include "apb4_scoreboard.svh"
`include "apb4_subscriber.svh"
`include "apb4_enviroment.svh"
`include "apb4_test.svh"

module test;
  logic        pclk;
  logic        prst;
  logic [31:0] paddr;
  logic        psel;
  logic        penable;
  logic        pwrite;
  logic [31:0] prdata;
  logic [31:0] pwdata;

  dut_if apb4_if();

  apb4_slave dut(.dif(apb4_if));

  initial begin
    apb4_if.pclk = 0;
  end

  //Generate a clock
  always begin
    #10 apb4_if.pclk = ~apb4_if.pclk;
  end

  initial begin
    apb4_if.prst = 0;
    repeat (1) @(posedge apb4_if.pclk);
    apb4_if.prst = 1;
  end

  initial begin
    uvm_config_db#(virtual dut_if)::set( null, "uvm_test_top", "vif", apb4_if);
    run_test("apb4_test");
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
