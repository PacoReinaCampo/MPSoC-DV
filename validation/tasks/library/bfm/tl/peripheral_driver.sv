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

import peripheral_axi4_pkg::*;

class peripheral_driver;
  // Interface instantiation
  virtual peripheral_design_if vif;

  mailbox generator_to_driver;

  // Transaction method instantiation
  peripheral_transaction transaction;

  // Constructor
  function new(mailbox generator_to_driver, virtual peripheral_design_if vif);
    this.generator_to_driver = generator_to_driver;

    this.vif = vif;
  endfunction

  task run;
    forever begin
      // Driver to the DUT      
      generator_to_driver.get(transaction);

      // Operate in a synchronous manner
      @(posedge vif.aclk);

      // Address Phase
      vif.awid    <= 0;
      vif.awadr   <= AXI_ADDRESS_TEST;
      vif.awvalid <= 1;
      vif.awlen   <= AXI_BURST_LENGTH_1;
      vif.awsize  <= AXI_BURST_SIZE_WORD;
      vif.awburst <= AXI_BURST_TYPE_FIXED;
      vif.awlock  <= AXI_LOCK_NORMAL;
      vif.awcache <= 0;
      vif.awprot  <= AXI_PROTECTION_NORMAL;
      @(posedge vif.awready);

      // Data Phase
      vif.awvalid <= 0;
      vif.awadr   <= 'bX;
      vif.wid     <= 0;
      vif.wvalid  <= 1;
      vif.wrdata  <= transaction.wrdata;
      vif.wstrb   <= 4'hF;
      vif.wlast   <= 1;
      @(posedge vif.wready);

      // Response Phase
      vif.wid    <= 0;
      vif.wvalid <= 0;
      vif.wrdata <= 'bX;
      vif.wstrb  <= 0;
      vif.wlast  <= 0;

      // Address Phase
      vif.arid    <= 0;
      vif.araddr  <= AXI_ADDRESS_TEST;
      vif.arvalid <= 1;
      vif.arlen   <= AXI_BURST_LENGTH_1;
      vif.arsize  <= AXI_BURST_SIZE_WORD;
      vif.arlock  <= AXI_LOCK_NORMAL;
      vif.arcache <= 0;
      vif.arprot  <= AXI_PROTECTION_NORMAL;
      vif.rready  <= 0;
      @(posedge vif.arready);

      // Data Phase
      vif.arvalid <= 0;
      vif.rready  <= 1;
      @(posedge vif.rvalid);

      vif.rready <= 0;
      @(negedge vif.rvalid);

      vif.araddr <= 'bx;
    end
  endtask
endclass
