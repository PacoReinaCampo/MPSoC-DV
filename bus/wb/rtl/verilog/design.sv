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

interface dut_if;
  logic        clk;
  logic        rst;
  logic [31:0] adr_i;
  logic        stb_i;
  logic        cyc_i;
  logic [ 3:0] sel_i;
  logic        we_i;
  logic [ 2:0] cti_i;
  logic [ 1:0] bte_i;
  logic [31:0] dat_i;
  logic        err_o;
  logic        ack_o;
  logic [31:0] dat_o;
  logic        rty_o;
  
  //Master Clocking block - used for Drivers
  clocking master_cb @(posedge clk);
    output adr_i;
    output stb_i;
    output cyc_i;
    output sel_i;
    output we_i;
    output cti_i;
    output bte_i;
    output dat_i;
    input  err_o;
    input  ack_o;
    input  dat_o;
    input  rty_o;
  endclocking: master_cb

  //Slave Clocking Block - used for any Slave BFMs
  clocking slave_cb @(posedge clk);
    input  adr_i;
    input  stb_i;
    input  cyc_i;
    input  sel_i;
    input  we_i;
    input  cti_i;
    input  bte_i;
    input  dat_i;
    output err_o;
    output ack_o;
    output dat_o;
    output rty_o;
  endclocking: slave_cb

  //Monitor Clocking block - For sampling by monitor components
  clocking monitor_cb @(posedge clk);
    input adr_i;
    input stb_i;
    input cyc_i;
    input sel_i;
    input we_i;
    input cti_i;
    input bte_i;
    input dat_i;
    input err_o;
    input ack_o;
    input dat_o;
    input rty_o;
  endclocking: monitor_cb

  modport master(clocking master_cb);
  modport slave(clocking slave_cb);
  modport passive(clocking monitor_cb);
endinterface

module wb_slave(dut_if dif);
  logic [31:0] mem [0:256];
  logic [ 1:0] wb_st;

  const logic [1:0] SETUP=0;
  const logic [1:0] W_ENABLE=1;
  const logic [1:0] R_ENABLE=2;
  
  always @(posedge dif.clk or negedge dif.rst) begin
    if (dif.rst==0) begin
      wb_st <=0;
      dif.dat_o <=0;
      dif.pready <=1;
      for(int i=0;i<256;i++) mem[i]=i;
    end
    else begin
      case (wb_st)
        SETUP: begin
          dif.dat_o <= 0;
          if (dif.sel_i) begin
            if (dif.we_i) begin
              wb_st <= W_ENABLE;
            end
            else begin
              wb_st <= R_ENABLE;
              dif.dat_o <= mem[dif.adr_i];
            end
          end
        end
        W_ENABLE: begin
          if (dif.sel_i && dif.we_i) begin
            mem[dif.adr_i] <= dif.dat_i;
          end
          wb_st <= SETUP;
        end
        R_ENABLE: begin
          wb_st <= SETUP;
        end
      endcase
    end
  end
endmodule
