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

interface peripheral_design_if (
  input logic aclk
);

  // Global Signals
  logic        aresetn; // Active LOW

  // Write Address Channel
  logic [ 3:0] awid;     // Address Write ID
  logic [31:0] awadr;    // Write Address
  logic [ 3:0] awlen;    // Burst Length
  logic [ 2:0] awsize;   // Burst Size
  logic [ 1:0] awburst;  // Burst Type
  logic [ 1:0] awlock;   // Lock Type
  logic [ 3:0] awcache;  // Cache Type
  logic [ 2:0] awprot;   // Protection Type
  logic        awvalid;  // Write Address Valid
  logic        awready;  // Write Address Ready

  // Write Data Channel
  logic [ 3:0] wid;     // Write ID
  logic [31:0] wrdata;  // Write Data
  logic [ 3:0] wstrb;   // Write Strobes
  logic        wlast;   // Write Last
  logic        wvalid;  // Write Valid
  logic        wready;  // Write Ready

  // Write Response CHannel
  logic [3:0] bid;     // Response ID
  logic [1:0] bresp;   // Write Response
  logic       bvalid;  // Write Response Valid
  logic       bready;  // Response Ready

  // Read Address Channel
  logic [ 3:0] arid;     // Read Address ID
  logic [31:0] araddr;   // Read Address
  logic [ 3:0] arlen;    // Burst Length
  logic [ 2:0] arsize;   // Burst Size
  logic [ 1:0] arlock;   // Lock Type
  logic [ 3:0] arcache;  // Cache Type
  logic [ 2:0] arprot;   // Protection Type
  logic        arvalid;  // Read Address Valid
  logic        arready;  // Read Address Ready

  // Read Data Channel
  logic [ 3:0] rid;     // Read ID
  logic [31:0] rdata;   // Read Data
  logic [ 1:0] rresp;   // Read Response
  logic        rlast;   // Read Last
  logic        rvalid;  // Read Valid
  logic        rready;  // Read Ready
endinterface
