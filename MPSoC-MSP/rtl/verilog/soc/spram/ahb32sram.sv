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

module ahb32sram #(
  // Memory parameters
  // data width (word size)
  // Valid values: 32, 16 and 8
  parameter XLEN = 32,

  // address width
  parameter PLEN = 32,

  // byte select width
  localparam SW = (XLEN == 32) ? 4 :
                  (XLEN == 16) ? 2 :
                  (XLEN ==  8) ? 1 : 'hx,

  /*
   * +--------------+--------------+
   * | word address | byte in word |
   * +--------------+--------------+
   *     WORD_AW         BYTE_AW
   *        +----- PLEN -----+
   */

  localparam BYTE_AW = SW >> 1,
  localparam WORD_AW = PLEN - BYTE_AW
)
  (
    // AHB3 ports
    input             ahb3_hsel_i,
    input  [PLEN-1:0] ahb3_haddr_i,
    input  [XLEN-1:0] ahb3_hwdata_i,
    input  [     2:0] ahb3_hburst_i,
    input  [SW  -1:0] ahb3_hprot_i,
    input             ahb3_hwrite_i,
    input  [     1:0] ahb3_htrans_i,
    input             ahb3_hmastlock_i,

    output [XLEN-1:0] ahb3_hrdata_o,
    output            ahb3_hready_o,
    output            ahb3_hresp_o,

    input             ahb3_clk_i,
    input             ahb3_rst_i,

    // generic RAM ports
    output               sram_ce,
    output               sram_we,
    output [WORD_AW-1:0] sram_waddr,
    output [XLEN   -1:0] sram_din,
    output [SW     -1:0] sram_sel,
    input  [XLEN   -1:0] sram_dout
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
  reg                  ahb3_b3_trans;
  wire                 ahb3_b3_trans_start, ahb3_b3_trans_stop;

  // Register to use for counting the addresses when doing burst accesses
  reg [WORD_AW-1:0]    burst_adr_counter;
  reg [        2:0]    ahb3_hburst_i_r;
  reg [        1:0]    ahb3_htrans_i_r;
  wire                 using_burst_adr;
  wire                 burst_access_wrong_ahb3_adr;

  // Ack Logic
  reg     ahb3_ack;
  reg nxt_ahb3_ack;

  ////////////////////////////////////////////////////////////////
  //
  // Module Body
  //

  assign word_addr_in = ahb3_haddr_i[PLEN-1:BYTE_AW];

  // assignments from ahb3 to memory
  assign sram_ce    = 1'b1;
  assign sram_we    = ahb3_hwrite_i & ahb3_hready_o;
  assign sram_waddr = (ahb3_hwrite_i) ? word_addr_reg : word_addr;
  assign sram_din   = ahb3_hwdata_i;
  assign sram_sel   = ahb3_hprot_i;

  assign ahb3_hrdata_o = sram_dout;

  // Logic to detect if there's a burst access going on
  assign ahb3_b3_trans_start = ((ahb3_hburst_i == 3'b001)|(ahb3_hburst_i == 3'b010)) & ahb3_hsel_i & !ahb3_b3_trans;

  assign  ahb3_b3_trans_stop = (ahb3_hburst_i == 3'b111) & ahb3_hsel_i & ahb3_b3_trans & ahb3_hready_o;

  always @(posedge ahb3_clk_i) begin
    if (ahb3_rst_i) begin
      ahb3_b3_trans <= 0;
    end
    else if (ahb3_b3_trans_start) begin
      ahb3_b3_trans <= 1;
    end
    else if (ahb3_b3_trans_stop) begin
      ahb3_b3_trans <= 0;
    end
  end

  // Burst address generation logic
  always @(*) begin
    if (ahb3_rst_i) begin
      burst_adr_counter = 0;
    end
    else begin
      burst_adr_counter = word_addr_reg;
      if (ahb3_b3_trans_start) begin
        burst_adr_counter = word_addr_in;
      end
      else if ((ahb3_hburst_i_r == 3'b010) & ahb3_hready_o & ahb3_b3_trans) begin
        // Incrementing burst
        if (ahb3_htrans_i_r == 2'b00) begin // Linear burst
          burst_adr_counter = word_addr_reg + 1;
        end
        if (ahb3_htrans_i_r == 2'b01) begin // 4-beat wrap burst
          burst_adr_counter[1:0] = word_addr_reg[1:0] + 1;
        end
        if (ahb3_htrans_i_r == 2'b10) begin // 8-beat wrap burst
          burst_adr_counter[2:0] = word_addr_reg[2:0] + 1;
        end
        if (ahb3_htrans_i_r == 2'b11) begin // 16-beat wrap burst
          burst_adr_counter[3:0] = word_addr_reg[3:0] + 1;
        end
      end
      else if (!ahb3_hready_o & ahb3_b3_trans) begin
        burst_adr_counter = word_addr_reg;
      end
    end
  end


  // Register it locally
  always @(posedge ahb3_clk_i) begin
    ahb3_htrans_i_r <= ahb3_htrans_i;
  end

  always @(posedge ahb3_clk_i) begin
    ahb3_hburst_i_r <= ahb3_hburst_i;
  end

  assign using_burst_adr = ahb3_b3_trans;

  assign burst_access_wrong_ahb3_adr = (using_burst_adr & (word_addr_reg != word_addr_in));

  // Address logic
  always @(*) begin
    if (using_burst_adr) begin
      word_addr = burst_adr_counter;
    end
    else if (ahb3_hmastlock_i & ahb3_hsel_i) begin
      word_addr = word_addr_in;
    end
    else begin
      word_addr = word_addr_reg;
    end
  end

  // Address registering logic
  always @(posedge ahb3_clk_i) begin
    if (ahb3_rst_i) begin
      word_addr_reg <= {WORD_AW{1'bx}};
    end
    else begin
      word_addr_reg <= word_addr;
    end
  end

  assign ahb3_hready_o = ahb3_ack & ahb3_hsel_i & ~burst_access_wrong_ahb3_adr;

  always @(*) begin
    if (ahb3_hmastlock_i) begin
      if (ahb3_hburst_i == 3'b000) begin
        // Classic cycle acks
        if (ahb3_hsel_i) begin
          if (!ahb3_ack) begin
            nxt_ahb3_ack = 1;
          end
          else begin
            nxt_ahb3_ack = 0;
          end
        end
        else begin
          nxt_ahb3_ack = 0;
        end
      end
      else if ((ahb3_hburst_i == 3'b001) ||
               (ahb3_hburst_i == 3'b010)) begin
        // Increment/constant address bursts
        if (ahb3_hsel_i) begin
          nxt_ahb3_ack = 1;
        end
        else begin
          nxt_ahb3_ack = 0;
        end
      end
      else if (ahb3_hburst_i == 3'b111) begin
        // End of cycle
        if (ahb3_hsel_i) begin
          if (!ahb3_ack) begin
            nxt_ahb3_ack = 1;
          end
          else begin
            nxt_ahb3_ack = 0;
          end
        end
        else begin
          nxt_ahb3_ack = 0;
        end
      end
      else begin
        nxt_ahb3_ack = 0;
      end
    end
    else begin
      nxt_ahb3_ack = 0;
    end
  end

  always @(posedge ahb3_clk_i) begin
    if (ahb3_rst_i) begin
      ahb3_ack <= 1'b0;
    end
    else begin
      ahb3_ack <= nxt_ahb3_ack;
    end
  end

  assign ahb3_hresp_o = ahb3_ack & ahb3_hsel_i & (burst_access_wrong_ahb3_adr);
endmodule
