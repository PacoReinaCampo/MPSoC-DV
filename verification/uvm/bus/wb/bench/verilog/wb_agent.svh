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

class wb_agent extends uvm_agent;
  //Agent will have the sequencer, driver and monitor components for the WB interface
  wb_sequencer sqr;
  wb_driver drv;
  wb_monitor mon;

  virtual dut_if vif;

  `uvm_component_utils_begin(wb_agent)
  `uvm_field_object(sqr, UVM_ALL_ON)
  `uvm_field_object(drv, UVM_ALL_ON)
  `uvm_field_object(mon, UVM_ALL_ON)
  `uvm_component_utils_end

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  //Build phase of agent - construct sequencer, driver and monitor
  //get handle to virtual interface from env (parent) config_db
  //and pass handle down to srq/driver/monitor
  virtual function void build_phase(uvm_phase phase);
    sqr = wb_sequencer::type_id::create("sqr", this);
    drv = wb_driver::type_id::create("drv", this);
    mon = wb_monitor::type_id::create("mon", this);

    if (!uvm_config_db#(virtual dut_if)::get(this, "", "vif", vif)) begin
      `uvm_fatal("build phase", "No virtual interface specified for this agent instance")
    end
    uvm_config_db#(virtual dut_if)::set( this, "sqr", "vif", vif);
    uvm_config_db#(virtual dut_if)::set( this, "drv", "vif", vif);
    uvm_config_db#(virtual dut_if)::set( this, "mon", "vif", vif);
  endfunction

  //Connect - driver and sequencer port to export
  virtual function void connect_phase(uvm_phase phase);
    drv.seq_item_port.connect(sqr.seq_item_export);
    uvm_report_info("WB_AGENT", "connect_phase, Connected driver to sequencer");
  endfunction
endclass
