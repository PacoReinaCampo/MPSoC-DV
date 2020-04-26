/////////////////////////////////////////////////////////////////////////////////
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
//              MPSoC-MSP430 CPU                                              //
//              Multi Processor System on Chip                                //
//              Blackbone Bus Interface                                       //
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

module bb_sram_sp #(
  // Memory size in bytes
  parameter MEM_SIZE_BYTE = 'hx,

  // VMEM file used to initialize the memory in simulation
  parameter MEM_FILE = "sram.vmem",

  // address width
  parameter AW = $clog2(MEM_SIZE_BYTE),

  // data width (must be multiple of 8 for byte selects to work)
  // Valid values: 32,16 and 8
  parameter DW = 32,

  // byte select width
  localparam SW = (DW == 32) ? 4 :
                  (DW == 16) ? 2 :
                  (DW ==  8) ? 1 : 'hx,

  // Allowed values:
  //   * PLAIN
  parameter MEM_IMPL_TYPE = "PLAIN",

  /*
   * +--------------+--------------+
   * | word address | byte in word |
   * +--------------+--------------+
   *     WORD_AW         BYTE_AW
   *        +----- AW -----+
   */

  localparam BYTE_AW = SW >> 1,
  localparam WORD_AW = AW - BYTE_AW
)
  (
    // BB SLAVE interface
    input  [AW-1:0] bb_addr_i,
    input  [DW-1:0] bb_din_i,
    input           bb_en_i,
    input           bb_we_i,

    output [DW-1:0] bb_dout_o,

    input           bb_clk_i,
    input           bb_rst_i
  );

  ////////////////////////////////////////////////////////////////
  //
  // Variables
  //

  // Beginning of automatic wires (for undeclared instantiated-module outputs)
  wire [WORD_AW-1:0]   sram_waddr;             // From bb_ram of bb2sram.v
  wire                 sram_ce;                // From bb_ram of bb2sram.v
  wire [DW     -1:0]   sram_din;               // From bb_ram of bb2sram.v
  wire [DW     -1:0]   sram_dout;              // From sp_ram of sram_sp.v
  wire [SW     -1:0]   sram_sel;               // From bb_ram of bb2sram.v
  wire                 sram_we;                // From bb_ram of bb2sram.v
  // End of automatics

  ////////////////////////////////////////////////////////////////
  //
  // Module Body
  //

  bb2sram #(
    .AW (AW),
    .DW (DW)
  )
  bb_ram (
    .bb_clk_i                 (bb_clk_i),
    .bb_rst_i                 (bb_rst_i),

    .sram_ce                  (sram_ce),
    .sram_we                  (sram_we),
    .sram_waddr               (sram_waddr),
    .sram_din                 (sram_din[DW-1:0]),
    .sram_sel                 (sram_sel[SW-1:0]),

    .bb_addr_i                (bb_addr_i[AW-1:0]),
    .bb_din_i                 (bb_din_i[DW-1:0]),
    .bb_en_i                  (bb_en_i),
    .bb_we_i                  (bb_we_i),

    .bb_dout_o                (bb_dout_o[DW-1:0]),

    .sram_dout                (sram_dout[DW-1:0])
  );

  sram_sp #(
    .DW            (DW),
    .AW            (AW),
    .MEM_SIZE_BYTE (MEM_SIZE_BYTE),
    .WORD_AW       (WORD_AW),
    .MEM_IMPL_TYPE (MEM_IMPL_TYPE),
    .MEM_FILE      (MEM_FILE)
  )
  sp_ram (
    .clk   (bb_clk_i),
    .rst   (bb_rst_i),

    // Outputs
    .dout  (sram_dout[DW-1:0]),

    // Inputs
    .ce    (sram_ce),
    .we    (sram_we),
    .oe    (1'b1),
    .waddr (sram_waddr),
    .din   (sram_din),
    .sel   (sram_sel)
  );
endmodule
