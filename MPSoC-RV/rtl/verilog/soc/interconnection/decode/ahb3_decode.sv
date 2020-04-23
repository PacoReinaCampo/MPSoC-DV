/* Copyright (c) 2013-2017 by the author(s)
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
 *
 * This is a generic slave selector for the Wishbone bus (B3). The
 * number of slaves is configurable and up to ten slaves can be
 * connected with a configurable memory map.
 *
 * Instantiation example:
 *  wb_sselect
 *   #(.XLEN(32), .PLEN(32),
 *     .SLAVES(2),
 *     .S0_ENABLE (1), .S0_RANGE_WIDTH(1), .S0_RANGE_MATCH(1'b0),
 *     .S1_ENABLE (1), .S1_RANGE_WIDTH(4), .S1_RANGE_MATCH(4'he))
 *  sselect(.clk_i(clk), rst_i(rst),
 *      .s_haddr_o({m_haddr_o[3],..,m_haddr_o[0]},
 *      ...
 *      );
 *
 * XLEN and PLEN are defined in bits. XLEN must be
 * full bytes (i.e., multiple of 8)!
 *
 * The ports are flattened. That means, that all slaves share the bus
 * signal ports. With four slaves and a data width of 32 bit the
 * s_hmastlock_o port is 4 bit wide and the s_hwdata_o is 128 (=4*32) bit wide.
 * The signals are arranged from right to left, meaning the s_hwdata_o is
 * defined as [XLEN*SLAVES-1:0] and each port s is assigned to
 * [(s+1)*XLEN-1:s*XLEN].
 *
 * The memory map is defined with the S?_RANGE_WIDTH and
 * S?_RANGE_MATCH parameters. The WIDTH sets the number of most
 * significant bits (i.e., those from the left) that are relevant to
 * define the memory range. The MATCH accordingly sets the value of
 * those bits of the address that define the memory range.
 *
 * Example (32 bit addresses):
 *  Slave 0: 0x00000000-0x7fffffff
 *  Slave 1: 0x80000000-0xbfffffff
 *  Slave 2: 0xe0000000-0xe0ffffff
 *
 * Slave 0 is defined by the uppermost bit, which is 0 for this
 * address range. Slave 1 is defined by the uppermost two bit, that
 * are 10 for the memory range. Slave 2 is defined by 8 bit which are
 * e0 for the memory range.
 *
 * This results in:
 *  S0_RANGE_WIDTH(1), S0_RANGE_MATCH(1'b0)
 *  S1_RANGE_WIDTH(2), S1_RANGE_MATCH(2'b10)
 *  S2_RANGE_WIDTH(8), S2_RANGE_MATCH(8'he0)
 *
 *
 * Finally, the slaves can be individually masked to ease
 * instantiation using the Sx_ENABLE parameter. By defaults all slaves
 * are enabled (and selected as long as x < SLAVES).
 *
 * Author(s):
 *   Stefan Wallentowitz <stefan.wallentowitz@tum.de>
 */

module ahb3_decode #(
  /* User parameters */
  // Set the number of slaves
  parameter SLAVES = 1,

  // Set bus address and data width in bits
  // XLEN must be a multiple of 8 (full bytes)!
  parameter XLEN = 32,
  parameter PLEN = 32,

  /* Derived local parameters */
  // Width of byte select registers
  localparam SW = XLEN >> 3,

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
    input clk_i,
    input rst_i,

    input                 m_hsel_i,
    input      [PLEN-1:0] m_haddr_i,
    input      [XLEN-1:0] m_hwdata_i,
    input                 m_hwrite_i,
    input      [     2:0] m_hsize_i,
    input      [     2:0] m_hburst_i,
    input      [SW  -1:0] m_hprot_i,
    input      [     1:0] m_htrans_i,
    input                 m_hmastlock_i,

    output reg [XLEN-1:0] m_hrdata_o,
    output                m_hready_o,
    output                m_hresp_o,

    output reg [SLAVES-1:0]           s_hsel_o,
    output reg [SLAVES-1:0][PLEN-1:0] s_haddr_o,
    output reg [SLAVES-1:0][XLEN-1:0] s_hwdata_o,
    output reg [SLAVES-1:0]           s_hwrite_o,
    output reg [SLAVES-1:0][     2:0] s_hsize_o,
    output reg [SLAVES-1:0][     2:0] s_hburst_o,
    output reg [SLAVES-1:0][SW  -1:0] s_hprot_o,
    output reg [SLAVES-1:0][     1:0] s_htrans_o,
    output reg [SLAVES-1:0]           s_hmastlock_o,

    input      [SLAVES-1:0][XLEN-1:0] s_hrdata_i,
    input      [SLAVES-1:0]           s_hready_i,
    input      [SLAVES-1:0]           s_hresp_i
  );

  wire [SLAVES-1:0]               s_select;

  // Generate the slave select signals based on the master bus
  // address and the memory range parameters
  generate
    if (SLAVES > 0)
      assign s_select[0] = S0_ENABLE & (m_haddr_i[PLEN-1 -: S0_RANGE_WIDTH] == S0_RANGE_MATCH[S0_RANGE_WIDTH-1:0]);
    if (SLAVES > 1)
      assign s_select[1] = S1_ENABLE & (m_haddr_i[PLEN-1 -: S1_RANGE_WIDTH] == S1_RANGE_MATCH[S1_RANGE_WIDTH-1:0]);
    if (SLAVES > 2)
      assign s_select[2] = S2_ENABLE & (m_haddr_i[PLEN-1 -: S2_RANGE_WIDTH] == S2_RANGE_MATCH[S2_RANGE_WIDTH-1:0]);
    if (SLAVES > 3)
      assign s_select[3] = S3_ENABLE & (m_haddr_i[PLEN-1 -: S3_RANGE_WIDTH] == S3_RANGE_MATCH[S3_RANGE_WIDTH-1:0]);
    if (SLAVES > 4)
      assign s_select[4] = S4_ENABLE & (m_haddr_i[PLEN-1 -: S4_RANGE_WIDTH] == S4_RANGE_MATCH[S4_RANGE_WIDTH-1:0]);
    if (SLAVES > 5)
      assign s_select[5] = S5_ENABLE & (m_haddr_i[PLEN-1 -: S5_RANGE_WIDTH] == S5_RANGE_MATCH[S5_RANGE_WIDTH-1:0]);
    if (SLAVES > 6)
      assign s_select[6] = S6_ENABLE & (m_haddr_i[PLEN-1 -: S6_RANGE_WIDTH] == S6_RANGE_MATCH[S6_RANGE_WIDTH-1:0]);
    if (SLAVES > 7)
      assign s_select[7] = S7_ENABLE & (m_haddr_i[PLEN-1 -: S7_RANGE_WIDTH] == S7_RANGE_MATCH[S7_RANGE_WIDTH-1:0]);
    if (SLAVES > 8)
      assign s_select[8] = S8_ENABLE & (m_haddr_i[PLEN-1 -: S8_RANGE_WIDTH] == S8_RANGE_MATCH[S8_RANGE_WIDTH-1:0]);
    if (SLAVES > 9)
      assign s_select[9] = S9_ENABLE & (m_haddr_i[PLEN-1 -: S9_RANGE_WIDTH] == S9_RANGE_MATCH[S9_RANGE_WIDTH-1:0]);
  endgenerate

  // If two s_select are high or none, we might have an bus error
  wire bus_error;
  assign bus_error = ~^s_select;

  reg m_ack, m_err, m_rty;

  // Mux the slave bus based on the slave select signal (one hot!)
  always @(*) begin : bus_s_mux
    integer i;
    m_hrdata_o = {XLEN{1'b0}};
    m_ack = 1'b0;
    m_err = 1'b0;
    m_rty = 1'b0;
    for (i = 0; i < SLAVES; i = i + 1) begin
      s_haddr_o  [i] = m_haddr_i;
      s_hwdata_o [i] = m_hwdata_i;
      s_hwrite_o [i] = m_hwrite_i;
      s_hburst_o [i] = m_hburst_i;
      s_hprot_o  [i] = m_hprot_i;
      s_htrans_o [i] = m_htrans_i;

      s_hsel_o      [i] = m_hsel_i      & s_select[i];
      s_hmastlock_o [i] = m_hmastlock_i & s_select[i];

      if (s_select[i]) begin
        m_hrdata_o = s_hrdata_i [i];
        m_ack      = s_hready_i [i];
        m_err      = s_hresp_i  [i];
      end
    end
  end

  assign m_hready_o = m_ack & !bus_error;
  assign m_hresp_o  = m_err |  bus_error;
endmodule
