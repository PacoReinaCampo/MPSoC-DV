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
//              Multi Processor System on Chip                                //
//              AMBA3 AHB-Lite Bus Interface                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

/* Copyright (c) 2019-2020 by the author(s)
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
 *   Francisco Javier Reina Campo <frareicam@gmail.com>
 */

module bootrom #(
   parameter PLEN = 32,
   parameter XLEN = 32
)
  (
    input clk,
    input rst,

    input                 ahb3_hsel_i,
    input      [PLEN-1:0] ahb3_haddr_i,
    input      [XLEN-1:0] ahb3_hwdata_i,
    input                 ahb3_hwrite_i,
    input      [     2:0] ahb3_hsize_i,
    input      [     2:0] ahb3_hburst_i,
    input      [     3:0] ahb3_hprot_i,
    input      [     1:0] ahb3_htrans_i,
    input                 ahb3_hmastlock_i,

    output reg [XLEN-1:0] ahb3_hrdata_o,
    output                ahb3_hready_o,
    output                ahb3_hresp_o
 );

  ////////////////////////////////////////////////////////////////
  //
  // Module Body
  //

   assign ahb3_hready_o = 1'b0;
   assign ahb3_hresp_o  = 1'b0;

   always @(*) begin
      case(ahb3_haddr_i[7:2])
        `include "bootrom_code.v"
        default: ahb3_hrdata_o = 32'hx;
      endcase
   end
endmodule
