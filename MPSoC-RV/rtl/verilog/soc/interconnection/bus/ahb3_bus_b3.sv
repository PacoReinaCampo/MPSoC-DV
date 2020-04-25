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

module ahb3_bus_b3 #(
  /* User parameters */
  // Set the number of masters and slaves
  parameter MASTERS = 2,
  parameter SLAVES  = 1,

  // Set bus address and data width in bits
  // XLEN must be a multiple of 8 (full bytes)!
  parameter XLEN = 32,
  parameter PLEN = 32,

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
  localparam SW = XLEN >> 3
)
  (
    /* Ports */
    input clk_i,
    input rst_i,

    input  [MASTERS-1:0]           m_hsel_i,
    input  [MASTERS-1:0][PLEN-1:0] m_haddr_i,
    input  [MASTERS-1:0][PLEN-1:0] m_hwdata_i,
    input  [MASTERS-1:0]           m_hwrite_i,
    input  [MASTERS-1:0][     2:0] m_hsize_i,
    input  [MASTERS-1:0][     2:0] m_hburst_i,
    input  [MASTERS-1:0][SW  -1:0] m_hprot_i,
    input  [MASTERS-1:0][     1:0] m_htrans_i,
    input  [MASTERS-1:0]           m_hmastlock_i,

    output [MASTERS-1:0][XLEN-1:0] m_hrdata_o,
    output [MASTERS-1:0]           m_hready_o,
    output [MASTERS-1:0]           m_hresp_o,

    output [SLAVES-1:0]           s_hsel_o,
    output [SLAVES-1:0][PLEN-1:0] s_haddr_o,
    output [SLAVES-1:0][XLEN-1:0] s_hwdata_o,
    output [SLAVES-1:0]           s_hwrite_o,
    output [SLAVES-1:0][     2:0] s_hsize_o,
    output [SLAVES-1:0][     2:0] s_hburst_o,
    output [SLAVES-1:0][SW  -1:0] s_hprot_o,
    output [SLAVES-1:0][     1:0] s_htrans_o,
    output [SLAVES-1:0]           s_hmastlock_o,

    input  [SLAVES-1:0][XLEN-1:0] s_hrdata_i,
    input  [SLAVES-1:0]           s_hready_i,
    input  [SLAVES-1:0]           s_hresp_i,

    // The snoop port forwards all write accesses on their success for
    // one cycle.
    output [XLEN-1:0] snoop_adr_o,
    output            snoop_en_o,

    input  bus_hold,
    output bus_hold_ack
  );

  ////////////////////////////////////////////////////////////////
  //
  // Variables
  //

  wire            bus_hsel;
  wire [PLEN-1:0] bus_haddr;
  wire [XLEN-1:0] bus_hwdata;
  wire            bus_hwrite;
  wire [     2:0] bus_hsize;
  wire [     2:0] bus_hburst;
  wire [SW  -1:0] bus_hprot;
  wire [     1:0] bus_htrans;
  wire            bus_hmastlock;

  wire [XLEN-1:0] bus_hrdata;
  wire            bus_hready;
  wire            bus_hresp;

  ////////////////////////////////////////////////////////////////
  //
  // Module Body
  //

  ahb3_mux #(
    .MASTERS (MASTERS),
    .PLEN    (PLEN),
    .XLEN    (XLEN)
  )
  u_mux (
    .clk_i         (clk_i),
    .rst_i         (rst_i),

    // Masters
    .m_hsel_i      (m_hsel_i),
    .m_haddr_i     (m_haddr_i),
    .m_hwdata_i    (m_hwdata_i),
    .m_hwrite_i    (m_hwrite_i),
    .m_hsize_i     (m_hsize_i),
    .m_hburst_i    (m_hburst_i),
    .m_hprot_i     (m_hprot_i),
    .m_htrans_i    (m_htrans_i),
    .m_hmastlock_i (m_hmastlock_i),

    .m_hrdata_o    (m_hrdata_o),
    .m_hready_o    (m_hready_o),
    .m_hresp_o     (m_hresp_o),

    // Slaves
    .s_hsel_o      (bus_hsel),
    .s_haddr_o     (bus_haddr),
    .s_hwdata_o    (bus_hwdata),
    .s_hwrite_o    (bus_hwrite),
    .s_hsize_o     (bus_hsize),
    .s_hburst_o    (bus_hburst),
    .s_hprot_o     (bus_hprot),
    .s_htrans_o    (bus_htrans),
    .s_hmastlock_o (bus_hmastlock),

    .s_hrdata_i    (bus_hrdata),
    .s_hready_i    (bus_hready),
    .s_hresp_i     (bus_hresp),

    .bus_hold_ack  (bus_hold_ack),
    .bus_hold      (bus_hold)
  );

  ahb3_decode #(
    .SLAVES(SLAVES),
    .PLEN(PLEN),
    .XLEN(XLEN),
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
    .clk_i         (clk_i),
    .rst_i         (rst_i),

    // Masters
    .m_hsel_i      (bus_hsel),
    .m_haddr_i     (bus_haddr),
    .m_hwdata_i    (bus_hwdata),
    .m_hwrite_i    (bus_hwrite),
    .m_hsize_i     (bus_hsize),
    .m_hburst_i    (bus_hburst),
    .m_hprot_i     (bus_hprot),
    .m_htrans_i    (bus_htrans),
    .m_hmastlock_i (bus_hmastlock),

    .m_hrdata_o    (bus_hrdata),
    .m_hready_o    (bus_hready),
    .m_hresp_o     (bus_hresp),


    // Slaves
    .s_hsel_o      (s_hsel_o),
    .s_haddr_o     (s_haddr_o),
    .s_hwdata_o    (s_hwdata_o),
    .s_hwrite_o    (s_hwrite_o),
    .s_hsize_o     (s_hsize_o),
    .s_hburst_o    (s_hburst_o),
    .s_hprot_o     (s_hprot_o),
    .s_htrans_o    (s_htrans_o),
    .s_hmastlock_o (s_hmastlock_o),

    .s_hrdata_i    (s_hrdata_i),
    .s_hready_i    (s_hready_i),
    .s_hresp_i     (s_hresp_i)
  );

  // Snoop address comes direct from master bus
  assign snoop_adr_o = bus_haddr;
  // Snoop on acknowledge and write. Mask with strobe to be sure
  // there actually is a something happing and no dangling signals
  // and always ack'ing slaves.
  assign snoop_en_o = bus_hready & bus_hsel & bus_hwrite;
endmodule
