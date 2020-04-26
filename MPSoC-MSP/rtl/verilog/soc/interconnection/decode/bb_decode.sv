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

module wb_decode #(
  /* User parameters */
  // Set the number of slaves
  parameter SLAVES = 1,

  // Set bus address and data width in bits
  // DATA_WIDTH must be a multiple of 8 (full bytes)!
  parameter DATA_WIDTH = 32,
  parameter ADDR_WIDTH = 32,

  /* Derived local parameters */
  // Width of byte select registers
  localparam SEL_WIDTH = DATA_WIDTH >> 3,

  // Memory range definitions, see above
  // The number of parameters actually limits the number of slaves as
  // there is no generic way that is handled by all tools to define
  // variable width parameter arrays.
  parameter S0_ENABLE = 1,
  parameter S0_RANGE_WIDTH = 1,
  parameter S0_RANGE_MATCH = 1'b0,
  parameter S1_ENABLE = 1,
  parameter S1_RANGE_WIDTH = 1,
  parameter S1_RANGE_MATCH = 1'b0,
  parameter S2_ENABLE = 1,
  parameter S2_RANGE_WIDTH = 1,
  parameter S2_RANGE_MATCH = 1'b0,
  parameter S3_ENABLE = 1,
  parameter S3_RANGE_WIDTH = 1,
  parameter S3_RANGE_MATCH = 1'b0,
  parameter S4_ENABLE = 1,
  parameter S4_RANGE_WIDTH = 1,
  parameter S4_RANGE_MATCH = 1'b0,
  parameter S5_ENABLE = 1,
  parameter S5_RANGE_WIDTH = 1,
  parameter S5_RANGE_MATCH = 1'b0,
  parameter S6_ENABLE = 1,
  parameter S6_RANGE_WIDTH = 1,
  parameter S6_RANGE_MATCH = 1'b0,
  parameter S7_ENABLE = 1,
  parameter S7_RANGE_WIDTH = 1,
  parameter S7_RANGE_MATCH = 1'b0,
  parameter S8_ENABLE = 1,
  parameter S8_RANGE_WIDTH = 1,
  parameter S8_RANGE_MATCH = 1'b0,
  parameter S9_ENABLE = 1,
  parameter S9_RANGE_WIDTH = 1,
  parameter S9_RANGE_MATCH = 1'b0
)
  (
    /* Ports */
    input                                   clk_i,
    input                                   rst_i,

    input                  [ADDR_WIDTH-1:0] m_addr_i,
    input                  [DATA_WIDTH-1:0] m_din_i,
    input                                   m_en_i,
    input                                   m_we_i,

    output reg             [DATA_WIDTH-1:0] m_dout_o,

    output reg [SLAVES-1:0][ADDR_WIDTH-1:0] s_addr_o,
    output reg [SLAVES-1:0][DATA_WIDTH-1:0] s_dout_o,
    output reg [SLAVES-1:0]                 s_en_o,
    output reg [SLAVES-1:0]                 s_we_o,

    input      [SLAVES-1:0][DATA_WIDTH-1:0] s_din_i,
  );

  ////////////////////////////////////////////////////////////////
  //
  // Variables
  //

  wire [SLAVES-1:0] s_select;

  // If two s_select are high or none, we might have an bus error
  wire bus_error;

  ////////////////////////////////////////////////////////////////
  //
  // Module Body
  //

  // Generate the slave select signals based on the master bus
  // address and the memory range parameters
  generate
    if (SLAVES > 0)
      assign s_select[0] = S0_ENABLE & (m_addr_i[ADDR_WIDTH-1 -: S0_RANGE_WIDTH] == S0_RANGE_MATCH[S0_RANGE_WIDTH-1:0]);
    if (SLAVES > 1)
      assign s_select[1] = S1_ENABLE & (m_addr_i[ADDR_WIDTH-1 -: S1_RANGE_WIDTH] == S1_RANGE_MATCH[S1_RANGE_WIDTH-1:0]);
    if (SLAVES > 2)
      assign s_select[2] = S2_ENABLE & (m_addr_i[ADDR_WIDTH-1 -: S2_RANGE_WIDTH] == S2_RANGE_MATCH[S2_RANGE_WIDTH-1:0]);
    if (SLAVES > 3)
      assign s_select[3] = S3_ENABLE & (m_addr_i[ADDR_WIDTH-1 -: S3_RANGE_WIDTH] == S3_RANGE_MATCH[S3_RANGE_WIDTH-1:0]);
    if (SLAVES > 4)
      assign s_select[4] = S4_ENABLE & (m_addr_i[ADDR_WIDTH-1 -: S4_RANGE_WIDTH] == S4_RANGE_MATCH[S4_RANGE_WIDTH-1:0]);
    if (SLAVES > 5)
      assign s_select[5] = S5_ENABLE & (m_addr_i[ADDR_WIDTH-1 -: S5_RANGE_WIDTH] == S5_RANGE_MATCH[S5_RANGE_WIDTH-1:0]);
    if (SLAVES > 6)
      assign s_select[6] = S6_ENABLE & (m_addr_i[ADDR_WIDTH-1 -: S6_RANGE_WIDTH] == S6_RANGE_MATCH[S6_RANGE_WIDTH-1:0]);
    if (SLAVES > 7)
      assign s_select[7] = S7_ENABLE & (m_addr_i[ADDR_WIDTH-1 -: S7_RANGE_WIDTH] == S7_RANGE_MATCH[S7_RANGE_WIDTH-1:0]);
    if (SLAVES > 8)
      assign s_select[8] = S8_ENABLE & (m_addr_i[ADDR_WIDTH-1 -: S8_RANGE_WIDTH] == S8_RANGE_MATCH[S8_RANGE_WIDTH-1:0]);
    if (SLAVES > 9)
      assign s_select[9] = S9_ENABLE & (m_addr_i[ADDR_WIDTH-1 -: S9_RANGE_WIDTH] == S9_RANGE_MATCH[S9_RANGE_WIDTH-1:0]);
  endgenerate

  // If two s_select are high or none, we might have an bus error
  assign bus_error = ~^s_select;

  // Mux the slave bus based on the slave select signal (one hot!)
  always @(*) begin : bus_s_mux
    integer i;
    m_dout_o = {DATA_WIDTH{1'b0}};
    for (i = 0; i < SLAVES; i = i + 1) begin
      s_addr_o[i] = m_addr_i;
      s_dout_o[i] = m_din_i;
      s_we_o  [i] = m_we_i;

      s_en_o[i] = m_en_i & s_select[i];

      if (s_select[i]) begin
        m_dout_o = s_din_i[i];
      end
    end
  end
endmodule
