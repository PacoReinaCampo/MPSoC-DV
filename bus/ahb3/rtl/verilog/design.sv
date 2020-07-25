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
//              AMBA3 AHB-Lite Bus Interface                                  //
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
  logic        rst_n;
  logic        hclk;
  logic        hsel;
  logic [31:0] haddr;
  logic [31:0] hwdata;
  logic [31:0] hrdata;
  logic        hwrite;
  logic [ 2:0] hsize;
  logic [ 2:0] hburst;
  logic [ 3:0] hprot;
  logic [ 1:0] htrans;
  logic        hmastlock;
  logic        hready;
  logic        hresp;
endinterface

module ahb3_slave(dutintf dif);
  logic [31:0] mem [256];
  logic [ 1:0] ahb3_st;

  const logic [1:0] SETUP = 0;
  const logic [1:0] W_ENABLE = 1;
  const logic [1:0] R_ENABLE = 2;

  // SETUP -> ENABLE
  always @(negedge dif.rst_n or posedge dif.hclk) begin
    if (dif.rst_n == 0) begin
      ahb3_st <= 0;
      dif.hrdata <= 0;
    end
    else begin
      case (ahb3_st)
        SETUP : begin
          // clear the hrdata
          dif.hrdata <= 0;
          // Move to ENABLE when the hsel is asserted
          if (dif.hsel && !dif.hready) begin
            if (dif.hwrite) begin
              ahb3_st <= W_ENABLE;
            end
            else begin
              ahb3_st <= R_ENABLE;
            end
          end
        end
        W_ENABLE : begin
          // write hwdata to memory
          if (dif.hsel && dif.hready && dif.hwrite) begin
            mem[dif.haddr] <= dif.hwdata;
          end
          // return to SETUP
          ahb3_st <= SETUP;
        end
        R_ENABLE : begin
          // read hrdata from memory
          if (dif.hsel && dif.hready && !dif.hwrite) begin
            dif.hrdata <= mem[dif.haddr];
          end
          // return to SETUP
          ahb3_st <= SETUP;
        end
      endcase
    end
  end
endmodule
