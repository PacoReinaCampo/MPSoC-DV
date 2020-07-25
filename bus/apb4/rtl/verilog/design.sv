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
//              AMBA4 APB-Lite Bus Interface                                  //
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
  logic        rst_n;
  logic [ 7:0] paddr;
  logic        pwrite;
  logic        penable;
  logic        psel;
  logic [31:0] prdata;
  logic [31:0] pwdata;
endinterface

module apb4_slave(dutintf dif);
  logic [31:0] mem [256];
  logic [ 1:0] apb4_st;

  const logic [1:0] SETUP = 0;
  const logic [1:0] W_ENABLE = 1;
  const logic [1:0] R_ENABLE = 2;

  // SETUP -> ENABLE
  always @(negedge dif.rst_n or posedge dif.clk) begin
    if (dif.rst_n == 0) begin
      apb4_st <= 0;
      dif.prdata <= 0;
    end
    else begin
      case (apb4_st)
        SETUP : begin
          // clear the prdata
          dif.prdata <= 0;
          // Move to ENABLE when the psel is asserted
          if (dif.psel && !dif.penable) begin
            if (dif.pwrite) begin
              apb4_st <= W_ENABLE;
            end
            else begin
              apb4_st <= R_ENABLE;
            end
          end
        end
        W_ENABLE : begin
          // write pwdata to memory
          if (dif.psel && dif.penable && dif.pwrite) begin
            mem[dif.paddr] <= dif.pwdata;
          end
          // return to SETUP
          apb4_st <= SETUP;
        end
        R_ENABLE : begin
          // read prdata from memory
          if (dif.psel && dif.penable && !dif.pwrite) begin
            dif.prdata <= mem[dif.paddr];
          end
          // return to SETUP
          apb4_st <= SETUP;
        end
      endcase
    end
  end
endmodule
