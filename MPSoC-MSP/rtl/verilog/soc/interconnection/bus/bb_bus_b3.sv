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

module wb_bus_b3 #(
  /* User parameters */
  // Set the number of masters and slaves
  parameter MASTERS = 2,
  parameter SLAVES = 1,

  // Set bus address and data width in bits
  // DATA_WIDTH must be a multiple of 8 (full bytes)!
  parameter DATA_WIDTH = 32,
  parameter ADDR_WIDTH = 32,

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
  parameter S9_RANGE_MATCH = 1'b0,

  /* Derived local parameters */
  // Width of byte select registers
  localparam SEL_WIDTH = DATA_WIDTH >> 3
)
  (
    /* Ports */
    input clk_i,
    input rst_i,

    input  [MASTERS-1:0][ADDR_WIDTH-1:0] m_addr_i,
    input  [MASTERS-1:0][ADDR_WIDTH-1:0] m_din_i,
    input  [MASTERS-1:0]                 m_en_i,
    input  [MASTERS-1:0]                 m_we_i,

    output [MASTERS-1:0][DATA_WIDTH-1:0] m_dout_o,

    output [SLAVES-1:0][ADDR_WIDTH-1:0] s_addr_o,
    output [SLAVES-1:0][DATA_WIDTH-1:0] s_dout_o,
    output [SLAVES-1:0]                 s_en_o,
    output [SLAVES-1:0]                 s_we_o,

    input  [SLAVES-1:0][DATA_WIDTH-1:0] s_din_i,

    // The snoop port forwards all write accesses on their success for
    // one cycle.
    output             [DATA_WIDTH-1:0] snoop_addr_o,
    output                              snoop_en_o,

    input                               bus_hold,
    output                              bus_hold_ack
  );

  ////////////////////////////////////////////////////////////////
  //
  // Variables
  //

  wire [ADDR_WIDTH-1:0] bus_adr;
  wire [DATA_WIDTH-1:0] bus_wdat;
  wire                  bus_cyc;
  wire                  bus_we;

  wire [DATA_WIDTH-1:0] bus_rdat;

  ////////////////////////////////////////////////////////////////
  //
  // Module Body
  //

  wb_mux #(
    .MASTERS    (MASTERS),
    .ADDR_WIDTH (ADDR_WIDTH),
    .DATA_WIDTH (DATA_WIDTH)
  )
  u_mux (
    .clk_i                         (clk_i),
    .rst_i                         (rst_i),

    // Masters
    .s_addr_o                      (bus_adr),
    .s_dout_o                      (bus_wdat),
    .s_en_o                        (bus_cyc),
    .s_we_o                        (bus_we),
    .s_din_i                       (bus_rdat),

    // Slaves
    .m_addr_i                      (m_addr_i),
    .m_din_i                       (m_din_i),
    .m_en_i                        (m_en_i),
    .m_we_i                        (m_we_i),
    .m_dout_o                      (m_dout_o),

    .bus_hold_ack                  (bus_hold_ack),
    .bus_hold                      (bus_hold)
  );

  wb_decode #(
    .SLAVES(SLAVES),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_WIDTH(DATA_WIDTH),
    .S0_ENABLE(S0_ENABLE),
    .S0_RANGE_WIDTH(S0_RANGE_WIDTH),
    .S0_RANGE_MATCH(S0_RANGE_MATCH),
    .S1_ENABLE(S1_ENABLE),
    .S1_RANGE_WIDTH(S1_RANGE_WIDTH),
    .S1_RANGE_MATCH(S1_RANGE_MATCH),
    .S2_ENABLE(S2_ENABLE),
    .S2_RANGE_WIDTH(S2_RANGE_WIDTH),
    .S2_RANGE_MATCH(S2_RANGE_MATCH),
    .S3_ENABLE(S3_ENABLE),
    .S3_RANGE_WIDTH(S3_RANGE_WIDTH),
    .S3_RANGE_MATCH(S3_RANGE_MATCH),
    .S4_ENABLE(S4_ENABLE),
    .S4_RANGE_WIDTH(S4_RANGE_WIDTH),
    .S4_RANGE_MATCH(S4_RANGE_MATCH),
    .S5_ENABLE(S5_ENABLE),
    .S5_RANGE_WIDTH(S5_RANGE_WIDTH),
    .S5_RANGE_MATCH(S5_RANGE_MATCH),
    .S6_ENABLE(S6_ENABLE),
    .S6_RANGE_WIDTH(S6_RANGE_WIDTH),
    .S6_RANGE_MATCH(S6_RANGE_MATCH),
    .S7_ENABLE(S7_ENABLE),
    .S7_RANGE_WIDTH(S7_RANGE_WIDTH),
    .S7_RANGE_MATCH(S7_RANGE_MATCH),
    .S8_ENABLE(S8_ENABLE),
    .S8_RANGE_WIDTH(S8_RANGE_WIDTH),
    .S8_RANGE_MATCH(S8_RANGE_MATCH),
    .S9_ENABLE(S9_ENABLE),
    .S9_RANGE_WIDTH(S9_RANGE_WIDTH),
    .S9_RANGE_MATCH(S9_RANGE_MATCH)
  )
  u_decode (
    .clk_i                      (clk_i),
    .rst_i                      (rst_i),

    // Masters
    .m_addr_i                   (bus_adr),
    .m_din_i                    (bus_wdat),
    .m_en_i                     (bus_cyc),
    .m_we_i                     (bus_we),
    .m_dout_o                   (bus_rdat),

    // Slaves
    .s_addr_o                   (s_addr_o),
    .s_dout_o                   (s_dout_o),
    .s_en_o                     (s_en_o),
    .s_we_o                     (s_we_o),
    .s_din_i                    (s_din_i)
  );

  // Snoop address comes direct from master bus
  assign snoop_addr_o = bus_adr;
  // Snoop on acknowledge and write. Mask with strobe to be sure
  // there actually is a something happing and no dangling signals
  // and always ack'ing slaves.
  assign snoop_en_o = bus_ack & bus_stb & bus_we;
endmodule
