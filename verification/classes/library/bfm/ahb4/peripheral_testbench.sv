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

`include "peripheral_interface.sv"
`include "peripheral_test.sv"

import peripheral_axi4_pkg::*;

module peripheral_testbench;
  bit aclk;

  // Clock declaration
  always #1 aclk = ~aclk;

  initial begin
    aclk = 0;
  end

  // Interface instantiation
  add_if vif (aclk);

  // DUT instantiation
  peripheral_bfm_slave_generic_axi4 dut (
    // Global Signals
    .aclk   (vif.aclk),
    .aresetn(vif.aresetn),

    // Write Address Channel
    .awid   (vif.awid),
    .awadr  (vif.awadr),
    .awlen  (vif.awlen),
    .awsize (vif.awsize),
    .awburst(vif.awburst),
    .awlock (vif.awlock),
    .awcache(vif.awcache),
    .awprot (vif.awprot),
    .awvalid(vif.awvalid),
    .awready(vif.awready),

    // Write Data Channel
    .wid   (vif.wid),
    .wrdata(vif.wrdata),
    .wstrb (vif.wstrb),
    .wlast (vif.wlast),
    .wvalid(vif.wvalid),
    .wready(vif.wready),

    // Write Response Channel
    .bid   (vif.bid),
    .bresp (vif.bresp),
    .bvalid(vif.bvalid),
    .bready(vif.bready),

    // Read Address Channel
    .arid   (vif.arid),
    .araddr (vif.araddr),
    .arlen  (vif.arlen),
    .arsize (vif.arsize),
    .arlock (vif.arlock),
    .arcache(vif.arcache),
    .arprot (vif.arprot),
    .arvalid(vif.arvalid),
    .arready(vif.arready),

    // Read Data Channel
    .rid   (vif.rid),
    .rdata (vif.rdata),
    .rresp (vif.rresp),
    .rlast (vif.rlast),
    .rvalid(vif.rvalid),
    .rready(vif.rready)
  );

  // Calling TestCase
  peripheral_test t1 (vif);

  initial begin
    // Enable wave dump
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end
endmodule
