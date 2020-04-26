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

module bb2sram #(
  // Memory parameters
  // data width (word size)
  // Valid values: 32, 16 and 8
  parameter DW = 32,

  // address width
  parameter AW = 32,

  // byte select width
  localparam SW = (DW == 32) ? 4 :
  (DW == 16) ? 2 :
  (DW ==  8) ? 1 : 'hx,

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
    // BB ports
    input  [AW-1:0] bb_addr_i,
    input  [DW-1:0] bb_din_i,
    input           bb_en_i,
    input           bb_we_i,

    output [DW-1:0] bb_dout_o,

    input           bb_clk_i,
    input           bb_rst_i,

    // generic RAM ports
    output               sram_ce,
    output               sram_we,
    output [WORD_AW-1:0] sram_waddr,
    output [DW     -1:0] sram_din,
    output [SW     -1:0] sram_sel,
    input  [DW     -1:0] sram_dout
  );

  ////////////////////////////////////////////////////////////////
  //
  // Variables
  //

  wire [WORD_AW-1:0] word_addr_in;

  reg [WORD_AW-1:0]         word_addr_reg;
  reg [WORD_AW-1:0]         word_addr;

  // Register to indicate if the cycle is a Wishbone B3-registered feedback
  // type access
  reg                  bb_b3_trans;
  wire                 bb_b3_trans_start, bb_b3_trans_stop;

  // Register to use for counting the addresses when doing burst accesses
  reg [WORD_AW-1:0]    burst_adr_counter;
  wire                 using_burst_adr;

  ////////////////////////////////////////////////////////////////
  //
  // Module Body
  //

  assign word_addr_in = bb_din_i[AW-1:BYTE_AW];

  // assignments from bb to memory
  assign sram_ce    = 1'b1;
  assign sram_we    = bb_we_i;
  assign sram_waddr = (bb_we_i) ? word_addr_reg : word_addr;
  assign sram_din   = bb_din_i;
  assign sram_sel   = {SW{1'b0}};

  assign bb_dout_o = sram_dout;

  // Logic to detect if there's a burst access going on
  assign bb_b3_trans_start = !bb_b3_trans;

  assign bb_b3_trans_stop  = bb_b3_trans;

  always @(posedge bb_clk_i) begin
    if (bb_rst_i) begin
      bb_b3_trans <= 0;
    end
    else if (bb_b3_trans_start) begin
      bb_b3_trans <= 1;
    end
    else if (bb_b3_trans_stop) begin
      bb_b3_trans <= 0;
    end
  end

  // Burst address generation logic
  always @(*) begin
    if (bb_rst_i) begin
      burst_adr_counter = 0;
    end
    else begin
      burst_adr_counter = word_addr_reg;
      if (bb_b3_trans_start) begin
        burst_adr_counter = word_addr_in;
      end
      else if (bb_b3_trans) begin
        burst_adr_counter = word_addr_reg;
      end
    end
  end

  assign using_burst_adr = bb_b3_trans;

  // Address logic
  always @(*) begin
    if (using_burst_adr) begin
      word_addr = burst_adr_counter;
    end
    else if (bb_en_i) begin
      word_addr = word_addr_in;
    end
    else begin
      word_addr = word_addr_reg;
    end
  end

  // Address registering logic
  always @(posedge bb_clk_i) begin
    if (bb_rst_i) begin
      word_addr_reg <= {WORD_AW{1'bx}};
    end
    else begin
      word_addr_reg <= word_addr;
    end
  end
endmodule
