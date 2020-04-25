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

import optimsoc_functions::*;

module ahb3_sram_sp #(
  // Memory size in bytes
  parameter MEM_SIZE_BYTE = 'hx,

  // VMEM file used to initialize the memory in simulation
  parameter MEM_FILE = "sram.vmem",

  // address width
  parameter PLEN = $clog2(MEM_SIZE_BYTE),

  // data width (must be multiple of 8 for byte selects to work)
  // Valid values: 32,16 and 8
  parameter XLEN = 32,

  // byte select width
  localparam SW = (XLEN == 32) ? 4 :
  (XLEN == 16) ? 2 :
  (XLEN ==  8) ? 1 : 'hx,

  // Allowed values:
  //   * PLAIN
  parameter MEM_IMPL_TYPE = "PLAIN",

  /*
   * +--------------+--------------+
   * | word address | byte in word |
   * +--------------+--------------+
   *     WORD_AW         BYTE_AW
   *        +---- PLEN ----+
   */

  localparam BYTE_AW = SW >> 1,
  localparam WORD_AW = PLEN - BYTE_AW
)
  (
    // AHB3 SLAVE interface
    input             ahb3_hsel_i,
    input  [PLEN-1:0] ahb3_haddr_i,
    input  [XLEN-1:0] ahb3_hwdata_i,
    input             ahb3_hwrite_i,
    input  [     2:0] ahb3_hsize_i,
    input  [     2:0] ahb3_hburst_i,
    input  [SW  -1:0] ahb3_hprot_i,
    input  [     1:0] ahb3_htrans_i,
    input             ahb3_hmastlock_i,

    output [XLEN-1:0] ahb3_hrdata_o,
    output            ahb3_hready_o,
    output            ahb3_hresp_o,

    input             ahb3_clk_i,
    input             ahb3_rst_i
  );

  ////////////////////////////////////////////////////////////////
  //
  // Variables
  //

  // Beginning of automatic wires (for undeclared instantiated-module outputs)
  wire [WORD_AW-1:0]   sram_waddr;             // From ahb3_ram of ahb32sram.v
  wire                 sram_ce;                // From ahb3_ram of ahb32sram.v
  wire [XLEN   -1:0]   sram_din;               // From ahb3_ram of ahb32sram.v
  wire [XLEN   -1:0]   sram_dout;              // From sp_ram of sram_sp.v
  wire [SW     -1:0]   sram_sel;               // From ahb3_ram of ahb32sram.v
  wire                 sram_we;                // From ahb3_ram of ahb32sram.v
  // End of automatics

  ////////////////////////////////////////////////////////////////
  //
  // Module Body
  //

  ahb32sram #(
    .PLEN (PLEN),
    .XLEN (XLEN)
  )
  ahb3_ram (
    .ahb3_clk_i                 (ahb3_clk_i),
    .ahb3_rst_i                 (ahb3_rst_i),

    .sram_ce                    (sram_ce),
    .sram_we                    (sram_we),
    .sram_waddr                 (sram_waddr),
    .sram_din                   (sram_din[XLEN-1:0]),
    .sram_sel                   (sram_sel[SW-1:0]),

    .ahb3_hsel_i                (ahb3_hsel_i),
    .ahb3_haddr_i               (ahb3_haddr_i[PLEN-1:0]),
    .ahb3_hwdata_i              (ahb3_hwdata_i[XLEN-1:0]),
    .ahb3_hwrite_i              (ahb3_hwrite_i),
    .ahb3_hburst_i              (ahb3_hburst_i[2:0]),
    .ahb3_hprot_i               (ahb3_hprot_i[SW-1:0]),
    .ahb3_htrans_i              (ahb3_htrans_i[1:0]),
    .ahb3_hmastlock_i           (ahb3_hmastlock_i),

    .ahb3_hrdata_o              (ahb3_hrdata_o[XLEN-1:0]),
    .ahb3_hready_o              (ahb3_hready_o),
    .ahb3_hresp_o               (ahb3_hresp_o),

    .sram_dout                  (sram_dout[XLEN-1:0])
  );

  sram_sp #(
    .XLEN          (XLEN),
    .PLEN          (PLEN),
    .MEM_SIZE_BYTE (MEM_SIZE_BYTE),
    .WORD_AW       (WORD_AW),
    .MEM_IMPL_TYPE (MEM_IMPL_TYPE),
    .MEM_FILE      (MEM_FILE)
  )
  sp_ram (
    .clk   (ahb3_clk_i),
    .rst   (ahb3_rst_i),

    // Outputs
    .dout  (sram_dout[XLEN-1:0]),

    // Inputs
    .ce    (sram_ce),
    .we    (sram_we),
    .oe    (1'b1),
    .waddr (sram_waddr),
    .din   (sram_din),
    .sel   (sram_sel)
  );
endmodule
