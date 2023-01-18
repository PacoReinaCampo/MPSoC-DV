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
//              Peripheral-NTM for MPSoC                                      //
//              Neural Turing Machine for MPSoC                               //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2022-2025 by the author(s)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
////////////////////////////////////////////////////////////////////////////////
// Author(s):
//   Paco Reina Campo <pacoreinacampo@queenfield.tech>

`include "uvm_macros.svh"
import uvm_pkg::*;

`include "ntm_scalar_arithmetic_uvm_interface.sv"
`include "ntm_scalar_arithmetic_uvm_test.sv"

module ntm_scalar_arithmetic_uvm_testbench;
  bit clk;
  bit rst;

  always #2 clk = ~clk;

  initial begin
    //clk = 0;
    rst = 1;
    #5;
    rst = 0;
  end

  ntm_scalar_adder_if vif(clk, rst);

  ntm_scalar_adder dut(
    .clk(vif.clk),
    .rst(vif.rst),

    .in1 (vif.ip1),
    .in2 (vif.ip2),

  .out (vif.out)
  );

  initial begin
    // set interface in config_db
    uvm_config_db#(virtual ntm_scalar_adder_if)::set(uvm_root::get(), "*", "vif", vif);
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end

  initial begin
    run_test("base test");
  end
endmodule
