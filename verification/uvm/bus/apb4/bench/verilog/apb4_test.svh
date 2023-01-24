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

class apb4_test extends uvm_test;
  //Register with factory
  `uvm_component_utils(apb4_test);

  apb4_enviroment enviroment;
  virtual dut_if vif;

  function new(string name = "apb4_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  //Build phase - Construct the enviroment class using factory
  //Get the virtual interface handle from Test and then set it config db for the enviroment component
  function void build_phase(uvm_phase phase);
    enviroment = apb4_enviroment::type_id::create("enviroment", this);

    if (!uvm_config_db#(virtual dut_if)::get(this, "", "vif", vif)) begin
      `uvm_fatal("build_phase", "No virtual interface specified for this test instance")
    end 
    uvm_config_db#(virtual dut_if)::set( this, "enviroment", "vif", vif);
  endfunction

  //Run phase - Create an apb4_sequence and start it on the apb4_sequencer
  task run_phase( uvm_phase phase );
    apb4_sequence apb4_seq;
    apb4_seq = apb4_sequence::type_id::create("apb4_seq");
    phase.raise_objection( this, "Starting apb4_base_seqin main phase" );
    $display("%t Starting sequence apb4_seq run_phase", $time);
    apb4_seq.start(enviroment.agent.sequencer);
    #100ns;
    phase.drop_objection( this, "Finished apb4_seq in main phase" );
  endtask
endclass
