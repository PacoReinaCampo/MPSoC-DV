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
//              PU RISCV / OR1K / MSP430                                      //
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

class riscv_monitor extends uvm_monitor;
  // register the monitor in the UVM factory
  `uvm_component_utils(riscv_monitor)

  int count;

  // Declare virtual interface
  virtual riscv_interface riscv_vif;

  // Analysis port to broadcast results to scoreboard 
  uvm_analysis_port #(riscv_transaction) monitor2scoreboard_port;

  // Analysis port to broadcast results to subscriber 
  uvm_analysis_port #(riscv_transaction) aport;
    
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    // Get interface reference from config database
    if(!uvm_config_db#(virtual riscv_interface)::get(this, "", "riscv_vif", riscv_vif)) begin
      `uvm_error("", "uvm_config_db::get failed")
    end

    monitor2scoreboard_port = new("monitor2scoreboard",this);
    aport = new("aport",this);
  endfunction

  task run_phase(uvm_phase phase);
    riscv_transaction pu_transaction;
    pu_transaction = new ("transaction");
    count = 0;
    fork
      forever begin
        @(riscv_vif.monitor_if_mp.monitor_cb.ahb3_ext_hwdata_i) begin
          if(count<17) begin
            count++;
          end
          else begin
            pu_transaction.debug_ring_in  = riscv_vif.monitor_if_mp.monitor_cb.debug_ring_in;
            pu_transaction.debug_ring_out = riscv_vif.monitor_if_mp.monitor_cb.debug_ring_out;

            pu_transaction.debug_ring_in_ready  = riscv_vif.monitor_if_mp.monitor_cb.debug_ring_in_ready;
            pu_transaction.debug_ring_out_ready = riscv_vif.monitor_if_mp.monitor_cb.debug_ring_out_ready;

            pu_transaction.ahb3_ext_hsel_i      = riscv_vif.monitor_if_mp.monitor_cb.ahb3_ext_hsel_i;
            pu_transaction.ahb3_ext_haddr_i     = riscv_vif.monitor_if_mp.monitor_cb.ahb3_ext_haddr_i;
            pu_transaction.ahb3_ext_hwdata_i    = riscv_vif.monitor_if_mp.monitor_cb.ahb3_ext_hwdata_i;
            pu_transaction.ahb3_ext_hwrite_i    = riscv_vif.monitor_if_mp.monitor_cb.ahb3_ext_hwrite_i;
            pu_transaction.ahb3_ext_hsize_i     = riscv_vif.monitor_if_mp.monitor_cb.ahb3_ext_hsize_i;
            pu_transaction.ahb3_ext_hburst_i    = riscv_vif.monitor_if_mp.monitor_cb.ahb3_ext_hburst_i;
            pu_transaction.ahb3_ext_hprot_i     = riscv_vif.monitor_if_mp.monitor_cb.ahb3_ext_hprot_i;
            pu_transaction.ahb3_ext_htrans_i    = riscv_vif.monitor_if_mp.monitor_cb.ahb3_ext_htrans_i;
            pu_transaction.ahb3_ext_hmastlock_i = riscv_vif.monitor_if_mp.monitor_cb.ahb3_ext_hmastlock_i;

            pu_transaction.ahb3_ext_hrdata_o = riscv_vif.monitor_if_mp.monitor_cb.ahb3_ext_hrdata_o;
            pu_transaction.ahb3_ext_hready_o = riscv_vif.monitor_if_mp.monitor_cb.ahb3_ext_hready_o;
            pu_transaction.ahb3_ext_hresp_o  = riscv_vif.monitor_if_mp.monitor_cb.ahb3_ext_hresp_o;

            // Flits from NoC->tiles
            pu_transaction.link_in_flit  = riscv_vif.monitor_if_mp.monitor_cb.link_in_flit;
            pu_transaction.link_in_last  = riscv_vif.monitor_if_mp.monitor_cb.link_in_last;
            pu_transaction.link_in_valid = riscv_vif.monitor_if_mp.monitor_cb.link_in_valid;
            pu_transaction.link_in_ready = riscv_vif.monitor_if_mp.monitor_cb.link_in_ready;

            // Flits from tiles->NoC
            pu_transaction.link_out_flit  = riscv_vif.monitor_if_mp.monitor_cb.link_out_flit;
            pu_transaction.link_out_last  = riscv_vif.monitor_if_mp.monitor_cb.link_out_last;
            pu_transaction.link_out_valid = riscv_vif.monitor_if_mp.monitor_cb.link_out_valid;
            pu_transaction.link_out_ready = riscv_vif.monitor_if_mp.monitor_cb.link_out_ready;

            // Send transaction to Scoreboard
            monitor2scoreboard_port.write(pu_transaction);

            // Send transaction to subscriber
            aport.write(pu_transaction);
            count = 0;
          end
        end
      end
    join
  endtask : run_phase
endclass : riscv_monitor
