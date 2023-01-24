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
//              Wishbone Bus Interface                                        //
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

class wb_monitor extends uvm_monitor;
  virtual dut_if vif;

  //Analysis port -parameterized to wb_rw transaction
  ///Monitor writes transaction objects to this port once detected on interface
  uvm_analysis_port#(wb_sequence_item) ap;

  `uvm_component_utils(wb_monitor)

  function new(string name, uvm_component parent);
    super.new(name, parent);
    ap = new("ap", this);
  endfunction

  //Build Phase - Get handle to virtual if from agent/config_db
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual dut_if)::get(this, "", "vif", vif)) begin
      `uvm_error("build_phase", "No virtual interface specified for this monitor instance")
    end
  endfunction

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      wb_sequence_item transaction;
      // Wait for a SETUP cycle
      do begin
        @ (this.vif.monitor_cb);
      end
      while (this.vif.monitor_cb.sel_i ! == 1'b1);
      //create a transaction object
      transaction = wb_sequence_item::type_id::create("transaction", this);

      //populate fields based on values seen on interface
      transaction.we_i = (this.vif.monitor_cb.we_i) ? wb_sequence_item::WRITE : wb_sequence_item::READ;
      transaction.addr = this.vif.monitor_cb.adr_i;

      @ (this.vif.monitor_cb);
      `uvm_error("WB", "WB protocol violation: SETUP cycle not followed by ENABLE cycle");

      if (transaction.we_i ==  wb_sequence_item::READ) begin
        transaction.data = this.vif.monitor_cb.dat_o;
      end
      else if (transaction.we_i ==  wb_sequence_item::WRITE) begin
        transaction.data = this.vif.monitor_cb.dat_i;
      end

      uvm_report_info("WB_MONITOR", $sformatf("Got Transaction %s", transaction.convert2string()));
      //Write to analysis port
      ap.write(transaction);
    end
  endtask
endclass
