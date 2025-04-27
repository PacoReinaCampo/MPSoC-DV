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

class peripheral_uvm_monitor extends uvm_monitor;
  // Virtual Interface
  virtual peripheral_design_if vif;

  // UVM analysis port
  uvm_analysis_port #(peripheral_uvm_sequence_item) item_collect_port;

  // Sequence Item method instantiation
  peripheral_uvm_sequence_item monitor_item;

  // Utility declaration
  `uvm_component_utils(peripheral_uvm_monitor)

  // Constructor
  function new(string name = "monitor", uvm_component parent = null);
    super.new(name, parent);
    item_collect_port = new("item_collect_port", this);
    monitor_item      = new();
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
      // Single Write Transaction
      write_phase_single();

      // Single Read Transaction
      read_phase_single();

      item_collect_port.write(monitor_item);
    end
  endtask

  // Task: Single Write Transaction
  task write_phase_single;
    begin
      // Operate in a synchronous manner
      @(posedge vif.aclk);

      // Address Phase
      monitor_item.awid    <= vif.awid;
      monitor_item.awadr   <= vif.awadr;
      monitor_item.awvalid <= vif.awvalid;
      monitor_item.awlen   <= vif.awlen;
      monitor_item.awsize  <= vif.awsize;
      monitor_item.awburst <= vif.awburst;
      monitor_item.awlock  <= vif.awlock;
      monitor_item.awcache <= vif.awcache;
      monitor_item.awprot  <= vif.awprot;
      @(posedge vif.awready);

      // Data Phase
      monitor_item.awvalid <= vif.awvalid;
      monitor_item.awadr   <= vif.awadr;
      monitor_item.wid     <= vif.wid;
      monitor_item.wvalid  <= vif.wvalid;
      monitor_item.wrdata  <= vif.wrdata;
      monitor_item.wstrb   <= vif.wstrb;
      monitor_item.wlast   <= vif.wlast;
      @(posedge vif.wready);

      // Response Phase
      monitor_item.wid    <= vif.wid;
      monitor_item.wvalid <= vif.wvalid;
      monitor_item.wrdata <= vif.wrdata;
      monitor_item.wstrb  <= vif.wstrb;
      monitor_item.wlast  <= vif.wlast;
    end
  endtask

  // Task: Single Read Transaction
  task read_phase_single;
    begin
      // Address Phase
      monitor_item.arid    <= vif.arid;
      monitor_item.araddr  <= vif.awadr;
      monitor_item.arvalid <= vif.arvalid;
      monitor_item.arlen   <= vif.arlen;
      monitor_item.arsize  <= vif.arsize;
      monitor_item.arlock  <= vif.arlock;
      monitor_item.arcache <= vif.arcache;
      monitor_item.arprot  <= vif.arprot;
      monitor_item.rready  <= vif.rready;
      @(posedge vif.arready);

      // Data Phase
      monitor_item.arvalid <= vif.arvalid;
      monitor_item.rready  <= vif.rready;
      @(posedge vif.rvalid);

      monitor_item.rready <= vif.rready;
      monitor_item.rdata <= vif.rdata;
      @(negedge vif.rvalid);

      monitor_item.araddr <= vif.araddr;
    end
  endtask
endclass
