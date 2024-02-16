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

class peripheral_uvm_driver extends uvm_driver #(peripheral_uvm_sequence_item);
  // Virtual Interface
  virtual peripheral_design_if vif;

  // Utility declaration
  `uvm_component_utils(peripheral_uvm_driver)

  // Constructor
  function new(string name = "peripheral_uvm_driver", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  // Build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual peripheral_design_if)::get(this, "", "vif", vif)) begin
      `uvm_fatal(get_type_name(), "Not set at top level");
    end
  endfunction

  // Run phase
  task run_phase(uvm_phase phase);
    forever begin
      // Driver to the DUT
      seq_item_port.get_next_item(req);

      // Single Write Transaction
      write_phase_single();

      // Single Read Transaction
      read_phase_single();

      seq_item_port.item_done();
    end
  endtask

  // Task: Single Write Transaction
  task write_phase_single;
    begin
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
      vif.wrdata  <= req.wrdata;
      vif.wstrb   <= 4'hF;
      vif.wlast   <= 1;
      @(posedge vif.wready);

      // Response Phase
      vif.wid    <= 0;
      vif.wvalid <= 0;
      vif.wrdata <= 'bX;
      vif.wstrb  <= 0;
      vif.wlast  <= 0;
    end
  endtask

  // Task: Single Read Transaction
  task read_phase_single;
    begin
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
