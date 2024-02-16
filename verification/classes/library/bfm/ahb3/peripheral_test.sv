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

`include "peripheral_transaction.sv"
`include "peripheral_generator.sv"
`include "peripheral_driver.sv"
`include "peripheral_monitor.sv"
`include "peripheral_scoreboard.sv"
`include "peripheral_agent.sv"
`include "peripheral_environment.sv"

program peripheral_test (
  // Interface instantiation
  add_if vif
);

  // Environment method instantiation
  peripheral_environment environment;

  initial begin
    // Create environment method
    environment = new(vif);

    apply_reset();

    environment.agent.generator.count = 5;

    environment.run();
  end

  task apply_reset();
    // Global Signals
    vif.aresetn <= 0;  // Active LOW

    // Write Address Channel
    vif.awid <= 0;     // Address Write ID
    vif.awadr <= 0;    // Write Address
    vif.awlen <= 0;    // Burst Length
    vif.awsize <= 0;   // Burst Size
    vif.awburst <= 0;  // Burst Type
    vif.awlock <= 0;   // Lock Type
    vif.awcache <= 0;  // Cache Type
    vif.awprot <= 0;   // Protection Type
    vif.awvalid <= 0;  // Write Address Valid

    // Write Data Channel
    vif.wid <= 0;     // Write ID
    vif.wrdata <= 0;  // Write Data
    vif.wstrb <= 0;   // Write Strobes
    vif.wlast <= 0;   // Write Last
    vif.wvalid <= 0;  // Write Valid

    // Write Response CHannel
    vif.bready <= 0;  // Response Ready

    // Read Address Channel
    vif.arid <= 0;     // Read Address ID
    vif.araddr <= 0;   // Read Address
    vif.arlen <= 0;    // Burst Length
    vif.arsize <= 0;   // Burst Size
    vif.arlock <= 0;   // Lock Type
    vif.arcache <= 0;  // Cache Type
    vif.arprot <= 0;   // Protection Type
    vif.arvalid <= 0;  // Read Address Valid

    // Read Data Channel
    vif.rready <= 0;  // Read Ready

    repeat (5) @(posedge vif.aclk);

    vif.aresetn <= 1;  // Inactive HIGH
  endtask
endprogram
