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
//              AMBA4 APB-Lite Bus Interface                                  //
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

class apb4_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(apb4_scoreboard)
  
  uvm_analysis_imp#(apb4_sequence_item, apb4_scoreboard) monitor_export;
  
  apb4_sequence_item exp_queue[$];
  
  bit [31:0] sc_mem [0:256];
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
    monitor_export = new("monitor_export", this);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    foreach(sc_mem[i]) sc_mem[i] = i;
  endfunction
  
  // write task - recives the pkt from monitor and pushes into queue
  function void write(apb4_sequence_item transaction);
    //transaction.print();
    exp_queue.push_back(transaction);
  endfunction 
  
  virtual task run_phase(uvm_phase phase);
    //super.run_phase(phase);
    apb4_sequence_item expdata;
    
    forever begin
      wait(exp_queue.size() > 0);
      expdata = exp_queue.pop_front();
      
      if(expdata.pwrite ==  apb4_sequence_item::WRITE) begin
        sc_mem[expdata.addr] = expdata.data;
        `uvm_info("APB4_SCOREBOARD", $sformatf("------ :: WRITE DATA       :: ------"), UVM_LOW)
        `uvm_info("", $sformatf("Addr: %0h", expdata.addr), UVM_LOW)
        `uvm_info("", $sformatf("Data: %0h", expdata.data), UVM_LOW)        
      end
      else if(expdata.pwrite ==  apb4_sequence_item::READ) begin
        if(sc_mem[expdata.addr] ==  expdata.data) begin
          `uvm_info("APB4_SCOREBOARD", $sformatf("------ :: READ DATA Match :: ------"), UVM_LOW)
          `uvm_info("", $sformatf("Addr: %0h", expdata.addr), UVM_LOW)
          `uvm_info("", $sformatf("Expected Data: %0h Actual Data: %0h", sc_mem[expdata.addr], expdata.data), UVM_LOW)
        end
        else begin
          `uvm_error("APB4_SCOREBOARD", "------ :: READ DATA MisMatch :: ------")
          `uvm_info("", $sformatf("Addr: %0h", expdata.addr), UVM_LOW)
          `uvm_info("", $sformatf("Expected Data: %0h Actual Data: %0h", sc_mem[expdata.addr], expdata.data), UVM_LOW)
        end
      end
    end
  endtask 
endclass
