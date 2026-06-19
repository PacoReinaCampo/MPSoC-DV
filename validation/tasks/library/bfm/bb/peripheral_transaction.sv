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

class peripheral_transaction;
  // Global Signals
  bit             aresetn;  // Active LOW

  // Write Address Channel
  bit      [ 3:0] awid;     // Address Write ID
  rand bit [31:0] awadr;    // Write Address
  bit      [ 3:0] awlen;    // Burst Length
  bit      [ 2:0] awsize;   // Burst Size
  bit      [ 1:0] awburst;  // Burst Type
  bit      [ 1:0] awlock;   // Lock Type
  bit      [ 3:0] awcache;  // Cache Type
  bit      [ 2:0] awprot;   // Protection Type
  bit             awvalid;  // Write Address Valid
  bit             awready;  // Write Address Ready

  // Write Data Channel
  bit      [ 3:0] wid;     // Write ID
  rand bit [31:0] wrdata;  // Write Data
  bit      [ 3:0] wstrb;   // Write Strobes
  bit             wlast;   // Write Last
  bit             wvalid;  // Write Valid
  bit             wready;  // Write Ready

  // Write Response CHannel
  bit       [3:0] bid;     // Response ID
  bit       [1:0] bresp;   // Write Response
  bit             bvalid;  // Write Response Valid
  bit             bready;  // Response Ready

  // Read Address Channel
  bit      [ 3:0] arid;     // Read Address ID
  rand bit [31:0] araddr;   // Read Address
  bit      [ 3:0] arlen;    // Burst Length
  bit      [ 2:0] arsize;   // Burst Size
  bit      [ 1:0] arlock;   // Lock Type
  bit      [ 3:0] arcache;  // Cache Type
  bit      [ 2:0] arprot;   // Protection Type
  bit             arvalid;  // Read Address Valid
  bit             arready;  // Read Address Ready

  // Read Data Channel
  bit      [ 3:0] rid;     // Read ID
  bit      [31:0] rdata;   // Read Data
  bit      [ 1:0] rresp;   // Read Response
  bit             rlast;   // Read Last
  bit             rvalid;  // Read Valid
  bit             rready;  // Read Ready

  // Constraints
  constraint awadr_c {awadr inside {[32'h00000000 : 32'hFFFFFFFF]};}
  constraint wrdata_c {wrdata inside {[32'h00000000 : 32'hFFFFFFFF]};}
  constraint araddr_c {araddr inside {[32'h00000000 : 32'hFFFFFFFF]};}
endclass
