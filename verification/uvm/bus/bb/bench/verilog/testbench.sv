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
//              Blackbone Bus Interface                                       //
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
`include "bb_sequence_item.svh"
`include "bb_sequence.svh"
`include "bb_sequencer.svh"
`include "bb_driver.svh"
`include "bb_monitor.svh"
`include "bb_agent.svh"
`include "bb_scoreboard.svh"
`include "bb_subscriber.svh"
`include "bb_enviroment.svh"
`include "bb_test.svh"

module test;
  logic        mclk;
  logic        mrst;
  logic [31:0] per_addr;
  logic        per_en;
  logic        per_we;
  logic [31:0] per_dout;
  logic [31:0] per_din;

  dut_if bb_if();

  bb_slave dut(.dif(bb_if));

  initial begin
    bb_if.mclk = 0;
  end

  //Generate a clock
  always begin
    #10 bb_if.mclk = ~bb_if.mclk;
  end

  initial begin
    bb_if.mrst = 0;
    repeat (1) @(posedge bb_if.mclk);
    bb_if.mrst = 1;
  end

  initial begin
    uvm_config_db#(virtual dut_if)::set( null, "uvm_test_top", "vif", bb_if);
    run_test("bb_test");
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
