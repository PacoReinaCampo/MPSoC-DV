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
 * This is a generic wishbone bus multiplexer (B3). The number of
 * masters is configurable.
 *
 * DATA_WIDTH and ADDR_WIDTH are defined in bits. DATA_WIDTH must be
 * full bytes (i.e., multiple of 8)!
 *
 * The ports are flattened. That means, that all masters share the bus
 * signal ports. With four masters and a data width of 32 bit the
 * m_hmastlock_i port is 4 bit wide and the m_hwdata_i is 128 (=4*32) bit wide.
 * The signals are arranged from right to left, meaning the m_hwdata_i is
 * defined as [MASTERS-1:0][DATA_WIDTH-1:0] and each port m is assigned to
 * [(m+1)*DATA_WIDTH-1:m*DATA_WIDTH].
 *
 * Author(s):
 *   Stefan Wallentowitz <stefan.wallentowitz@tum.de>
 */

// TODO: * check bus hold signal correctness

module wb_mux #(
  /* User parameters */
  // Set the number of slaves
  parameter MASTERS = 1,

  // Set bus address and data width in bits
  // DATA_WIDTH must be a multiple of 8 (full bytes)!
  parameter DATA_WIDTH = 32,
  parameter ADDR_WIDTH = 32,

  /* Derived local parameters */
  // Width of byte select registers
  localparam SEL_WIDTH = DATA_WIDTH >> 3
)
  (
    /* Ports */
    input clk_i,
    input rst_i,

    input      [MASTERS-1:0][ADDR_WIDTH-1:0] m_haddr_i,
    input      [MASTERS-1:0][DATA_WIDTH-1:0] m_hwdata_i,
    input      [MASTERS-1:0]                 m_hmastlock_i,
    input      [MASTERS-1:0]                 m_hsel_i,
    input      [MASTERS-1:0][SEL_WIDTH -1:0] m_hprot_i,
    input      [MASTERS-1:0]                 m_hwrite_i,
    input      [MASTERS-1:0][           2:0] m_hburst_i,
    input      [MASTERS-1:0][           1:0] m_htrans_i,

    output reg [MASTERS-1:0][DATA_WIDTH-1:0] m_hrdata_o,
    output reg [MASTERS-1:0]                 m_hready_o,
    output reg [MASTERS-1:0]                 m_hresp_o,

    output reg              [ADDR_WIDTH-1:0] s_haddr_o,
    output reg              [DATA_WIDTH-1:0] s_hrdata_o,
    output reg                               s_hmastlock_o,
    output reg                               s_hsel_o,
    output reg              [SEL_WIDTH -1:0] s_hprot_o,
    output reg                               s_hwrite_o,
    output reg              [           2:0] s_hburst_o,
    output reg              [           1:0] s_htrans_o,

    input                   [DATA_WIDTH-1:0] s_hwdata_i,
    input                                    s_hready_i,
    input                                    s_hresp_i,

    input                                    bus_hold,
    output reg                               bus_hold_ack
  );

  // The granted master is one hot encoded
  wire [MASTERS-1:0]     grant;
  // The granted master from previous cycle (register)
  reg  [MASTERS-1:0]     prev_grant;

  // This is a net that masks the actual requests. The arbiter
  // selects a different master each cycle. Therefore we need to
  // actively control the return of the bus arbitration. That means
  // as long as the granted master still holds is cycle signal, we
  // mask out all other requests (be setting the requests to grant).
  // When the cycle signal is released, we set the request to all
  // masters cycle signals.
  reg [MASTERS-1:0] m_req;

  // This is the arbitration net from round robin
  wire [MASTERS-1:0] arb_grant;
  reg  [MASTERS-1:0] prev_arb_grant;

  // It is masked with the bus_hold_ack to hold back the arbitration
  // as long as the bus is held
  assign grant = arb_grant & {MASTERS{!bus_hold_ack}};

  always @(*) begin
    if (|(m_hmastlock_i & prev_grant)) begin
      // The bus is not released this cycle
      m_req        = prev_grant;
      bus_hold_ack = 1'b0;
    end 
    else begin
      m_req        = m_hmastlock_i;
      bus_hold_ack = bus_hold;
    end
  end

  // We register the grant signal. This is needed nevertheless for
  // fair arbitration (round robin)
  always @(posedge clk_i) begin
    if (rst_i) begin
      prev_arb_grant <= {{MASTERS-1{1'b0}},1'b1};
      prev_grant     <= {{MASTERS-1{1'b0}},1'b1};
    end
    else begin
      prev_arb_grant <= arb_grant;
      prev_grant     <= grant;
    end
  end

  arb_rr #(
    .N (MASTERS)
  )
  u_arbiter (
    // Outputs
    .nxt_gnt (arb_grant),

    // Inputs
    .en  (1'b1),
    .req (m_req),
    .gnt (prev_arb_grant)
  );

  // Mux the bus based on the grant signal which must be one hot!
  always @(*) begin : bus_m_mux
    integer i;
    s_haddr_o = {ADDR_WIDTH{1'bx}};
    s_hrdata_o = {DATA_WIDTH{1'bx}};
    s_hprot_o = {SEL_WIDTH{1'bx}};
    s_hwrite_o  = 1'bx;
    s_hburst_o = 3'bx;
    s_htrans_o = 2'bx;
    s_hmastlock_o = 1'b0;
    s_hsel_o = 1'b0;

    for (i = 0; i < MASTERS; i = i + 1) begin
      m_hrdata_o[i] = s_hwdata_i;
      m_hready_o[i] = grant[i] & s_hready_i;
      m_hresp_o[i] = grant[i] & s_hresp_i;

      if (grant[i]) begin
        s_haddr_o = m_haddr_i[i];
        s_hrdata_o = m_hwdata_i[i];
        s_hprot_o = m_hprot_i[i];
        s_hwrite_o  = m_hwrite_i [i];
        s_hburst_o = m_hburst_i[i];
        s_htrans_o = m_htrans_i[i];
        s_hmastlock_o = m_hmastlock_i[i];
        s_hsel_o = m_hsel_i[i];
      end
    end
  end
endmodule
