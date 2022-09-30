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

class or1k_subscriber extends uvm_subscriber #(or1k_transaction);
  // Register subscriber in uvm factory
  `uvm_component_utils(or1k_subscriber)

  // Define variables to store read/write request and address
  bit [15:0] instruction;

  // Define covergroup and coverpoints
  covergroup cover_processor;
    coverpoint instruction {
      bins Addition       = {[16'h0000:16'h0FFF]};
      bins Subraction     = {[16'h1000:16'h1FFF]};
      bins Increment      = {[16'h3000:16'h3FFF]};
      bins Decrement      = {[16'h2000:16'h2FFF]};
      bins AND_NAND       = {[16'h4000:16'h4FFF]};
      bins OR_NOR         = {[16'h5000:16'h5FFF]};
      bins EXOR_EXNOR     = {[16'h6000:16'h6FFF]};
      bins Buff_Inv       = {[16'h7000:16'h7FFF]};
      bins Multiplication = {[16'h8000:16'h8FFF]};
      bins ShiftL_ShiftR  = {[16'hC000:16'hCFFF]};
      bins Load           = {[16'hA000:16'hAFFF]};
      bins Store          = {[16'hB000:16'hBFFF]};
      bins Move_MoveI     = {[16'h9000:16'h9FFF]};
      bins Jump           = {[16'hD000:16'hDFFF]};
      bins NOP            = {[16'hE000:16'hEFFF]};
    }
  endgroup

  // Declare virtual interface object
  virtual or1k_interface or1k_vif;

  // Declare analysis port to get transactions from monitor
  uvm_analysis_imp #(or1k_transaction,or1k_subscriber) aport;

  function new (string name, uvm_component parent);
    begin
      super.new(name,parent);

      // Call new for covergroup
      cover_processor = new();
    end
  endfunction

  function void build_phase(uvm_phase phase);
    // Get virtual interface reference from config database
    if(!uvm_config_db#(virtual or1k_interface)::get(this, "", "or1k_vif", or1k_vif)) begin
      `uvm_error("", "uvm_config_db::get failed")
    end

    // Instantiate analysis port
    aport = new("aport", this);
  endfunction 

  // Write function for the analysis port
  function void write(or1k_transaction t);
    instruction = t.wb_ext_dat_o;
    cover_processor.sample();
  endfunction
endclass
