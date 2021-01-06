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

class msp430_driver extends uvm_driver #(msp430_transaction);

  `uvm_component_utils(msp430_driver)

  virtual msp430_interface msp430_vif;

  // Analysis port to broadcast input values to scoreboard
  uvm_analysis_port #(msp430_transaction) driver2scoreboard_port;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  bit drv_clk;

  function void build_phase(uvm_phase phase);
    // Get interface reference from config database
    if(!uvm_config_db#(virtual msp430_interface)::get(this, "", "msp430_vif", msp430_vif)) begin
      `uvm_error("", "uvm_config_db::get failed")
    end

    drv_clk = 1'b0;

    driver2scoreboard_port = new("driver2scoreboard",this);
  endfunction 

  task run_phase(uvm_phase phase);
    reg [15:0] mem [0:18];

    int count = 0;

    //Set initial instructions.txt file
    mem[0]=16'h9A35;
    mem[1]=16'h9A7F;
    mem[2]=16'h9A85;
    mem[3]=16'h9AC0;
    mem[4]=16'h9B0B;
    mem[5]=16'h9B73;
    mem[6]=16'h9BBC;
    mem[7]=16'h9BC1;
    mem[8]=16'h9C04;
    mem[9]=16'h9C40;
    mem[10]=16'h9C81;
    mem[11]=16'h9CEB;
    mem[12]=16'h9D11;
    mem[13]=16'h9D40;
    mem[14]=16'h9D82;
    mem[15]=16'h9DD4;
    mem[16]=16'h0000;
    mem[17]=16'h0000;
    mem[18]=16'h0000;

    // Now drive normal traffic
    forever begin
      @(msp430_vif.driver_if_mp.driver_cb) begin 
        if(count < 19) begin
          msp430_vif.driver_if_mp.driver_cb.bb_ext_dout_o <= mem[count];
          count++;
        end
        else begin
          seq_item_port.get_next_item(req);
          msp430_vif.driver_if_mp.driver_cb.bb_ext_dout_o <= req.instrn;
          driver2scoreboard_port.write(req);
          seq_item_port.item_done();
          count = 0;
        end
      end
    end
  endtask
endclass: msp430_driver
