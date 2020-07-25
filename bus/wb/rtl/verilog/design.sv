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
//              MPSoC-RISCV CPU                                               //
//              General Purpose Input Output Bridge                           //
//              Wishbone Bus Interface                                        //
//              Universal Verification Methodology                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

/* Copyright (c) 2018-2019 by the author(s)
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

interface dutintf;
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
endinterface

module wb_slave(dutintf dif);
  logic [31:0] mem [256];
  logic [ 1:0] wb_st;

  const logic [1:0] SETUP = 0;
  const logic [1:0] W_ENABLE = 1;
  const logic [1:0] R_ENABLE = 2;

  // SETUP -> ENABLE
  always @(negedge dif.rst or posedge dif.clk) begin
    if (dif.rst == 0) begin
      wb_st <= 0;
      dif.dat_o <= 0;
    end
    else begin
      case (wb_st)
        SETUP : begin
          // clear the dat_o
          dif.dat_o <= 0;
          // Move to ENABLE when the sel_i is asserted
          if (dif.sel_i &&) begin
            if (dif.we_i) begin
              wb_st <= W_ENABLE;
            end
            else begin
              wb_st <= R_ENABLE;
            end
          end
        end
        W_ENABLE : begin
          // write dat_i to memory
          if (dif.sel_i && dif.we_i) begin
            mem[dif.adr_i] <= dif.dat_i;
          end
          // return to SETUP
          wb_st <= SETUP;
        end
        R_ENABLE : begin
          // read dat_o from memory
          if (dif.sel_i && !dif.we_i) begin
            dif.dat_o <= mem[dif.adr_i];
          end
          // return to SETUP
          wb_st <= SETUP;
        end
      endcase
    end
  end
endmodule
