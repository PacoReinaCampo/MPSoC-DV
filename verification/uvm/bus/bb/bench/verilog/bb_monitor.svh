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
//              Blackbone Bus Interface                                       //
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

class bb_monitor extends uvm_monitor;
  virtual dut_if vif;

  //Analysis port -parameterized to bb_rw transaction
  ///Monitor writes transaction objects to this port once detected on interface
  uvm_analysis_port#(bb_transaction) ap;

  `uvm_component_utils(bb_monitor)

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
      bb_transaction tr;
      // Wait for a SETUP cycle
      do begin
        @ (this.vif.monitor_cb);
      end
      while (this.vif.monitor_cb.per_en !== 1'b0);
      //create a transaction object
      tr = bb_transaction::type_id::create("tr", this);

      //populate fields based on values seen on interface
      tr.per_we = (this.vif.monitor_cb.per_we) ? bb_transaction::WRITE : bb_transaction::READ;
      tr.addr = this.vif.monitor_cb.per_addr;

      @ (this.vif.monitor_cb);
      if (this.vif.monitor_cb.per_en !== 1'b1) begin
        `uvm_error("BB", "BB protocol violation: SETUP cycle not followed by ENABLE cycle");
      end

      if (tr.per_we == bb_transaction::READ) begin
        tr.data = this.vif.monitor_cb.per_din;
      end
      else if (tr.per_we == bb_transaction::WRITE) begin
        tr.data = this.vif.monitor_cb.per_dout;
      end

      uvm_report_info("BB_MONITOR", $sformatf("Got Transaction %s",tr.convert2string()));
      //Write to analysis port
      ap.write(tr);
    end
  endtask
endclass
