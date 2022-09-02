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
//              Master Slave Interface Tesbench                               //
//              AMBA3 AHB-Lite Bus Interface                                  //
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

module mpsoc_spram_synthesis #(
  //Memory parameters
  parameter DEPTH   = 256,
  parameter MEMFILE = "",

  //Wishbone parameters
  parameter DW = 32,
  parameter AW = $clog2(DEPTH)
)
  (
    input           wb_clk_i,
    input           wb_rst_i,

    input  [AW-1:0] wb_adr_i,
    input  [DW-1:0] wb_dat_i,
    input  [   3:0] wb_sel_i,
    input           wb_we_i,
    input  [   1:0] wb_bte_i,
    input  [   2:0] wb_cti_i,
    input           wb_cyc_i,
    input           wb_stb_i,

    output reg      wb_ack_o,
    output          wb_err_o,
    output [DW-1:0] wb_dat_o
  );

  //////////////////////////////////////////////////////////////////
  //
  // Module Body
  //

  //DUT WB
  mpsoc_wb_spram #(
    //Memory parameters
    .DEPTH   ( DEPTH   ),
    .MEMFILE ( MEMFILE ),

    //Wishbone parameters
    .AW ( AW ),
    .DW ( DW )
  )
  wb_spram (
    .wb_clk_i ( wb_clk_i ),
    .wb_rst_i ( wb_rst_i ),

    .wb_adr_i ( wb_adr_i ),
    .wb_dat_i ( wb_dat_i ),
    .wb_sel_i ( wb_sel_i ),
    .wb_we_i  ( wb_we_i  ),
    .wb_bte_i ( wb_bte_i ),
    .wb_cti_i ( wb_cti_i ),
    .wb_cyc_i ( wb_cyc_i ),
    .wb_stb_i ( wb_stb_i ),
    .wb_ack_o ( wb_ack_o ),
    .wb_err_o ( wb_err_o ),
    .wb_dat_o ( wb_dat_o )
  );
endmodule
