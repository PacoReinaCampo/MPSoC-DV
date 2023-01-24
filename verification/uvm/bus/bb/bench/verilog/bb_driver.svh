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

class bb_driver extends uvm_driver#(bb_sequence_item);
  `uvm_component_utils(bb_driver)

  virtual dut_if vif;
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual dut_if)::get(this, "", "vif", vif)) begin
      `uvm_error("build_phase", "driver virtual interface failed")
    end
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);

    this.vif.master_cb.per_en <= 0;

    forever begin
      bb_sequence_item transaction;
      @ (this.vif.master_cb);
      //First get an item from sequencer
      seq_item_port.get_next_item(transaction);
      @ (this.vif.master_cb);
      uvm_report_info("BB_DRIVER ", $sformatf("Got Transaction %s", transaction.convert2string()));
      //Decode the BB Command and call either the read/write function
      case (transaction.per_we)
        bb_sequence_item::READ:  drive_read(transaction.addr, transaction.data);  
        bb_sequence_item::WRITE: drive_write(transaction.addr, transaction.data);
      endcase
      //Handshake DONE back to sequencer
      seq_item_port.item_done();
    end
  endtask

  virtual protected task drive_read(input bit [31:0] addr, output logic [31:0] data);
    this.vif.master_cb.per_addr <= addr;
    this.vif.master_cb.per_we <= 0;
    @ (this.vif.master_cb);
    this.vif.master_cb.per_en <= 1;
    @ (this.vif.master_cb);
    data = this.vif.master_cb.per_din;
    this.vif.master_cb.per_en <= 0;
  endtask

  virtual protected task drive_write(input bit [31:0] addr, input bit [31:0] data);
    this.vif.master_cb.per_addr <= addr;
    this.vif.master_cb.per_dout <= data;
    this.vif.master_cb.per_we   <= 1;
    @ (this.vif.master_cb);
    this.vif.master_cb.per_en   <= 1;
    @ (this.vif.master_cb);
    this.vif.master_cb.per_en   <= 0;
  endtask
endclass
