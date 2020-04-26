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

    input      [MASTERS-1:0][ADDR_WIDTH-1:0] m_addr_i,
    input      [MASTERS-1:0][DATA_WIDTH-1:0] m_din_i,
    input      [MASTERS-1:0]                 m_en_i,
    input      [MASTERS-1:0]                 m_we_i,

    output reg [MASTERS-1:0][DATA_WIDTH-1:0] m_dout_o,

    output reg              [ADDR_WIDTH-1:0] s_addr_o,
    output reg              [DATA_WIDTH-1:0] s_din_o,
    output reg                               s_en_o,
    output reg                               s_we_o,

    input                   [DATA_WIDTH-1:0] s_dout_i,

    input                                    bus_hold,
    output reg                               bus_hold_ack
  );

  ////////////////////////////////////////////////////////////////
  //
  // Variables
  //

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

  ////////////////////////////////////////////////////////////////
  //
  // Module Body
  //

  // It is masked with the bus_hold_ack to hold back the arbitration
  // as long as the bus is held
  assign grant = arb_grant & {MASTERS{!bus_hold_ack}};

  always @(*) begin
    if (|(m_cyc_i & prev_grant)) begin
      // The bus is not released this cycle
      m_req        = prev_grant;
      bus_hold_ack = 1'b0;
    end 
    else begin
      m_req        = m_cyc_i;
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
    s_addr_o = {ADDR_WIDTH{1'bx}};
    s_din_o  = {DATA_WIDTH{1'bx}};
    s_en_o   = 3'bx;
    s_we_o   = 1'bx;

    for (i = 0; i < MASTERS; i = i + 1) begin
      m_dat_o[i] = s_dat_i;

      if (grant[i]) begin
        s_addr_o = m_addr_i [i];
        s_din_o  = m_din_i  [i];
        s_en_o   = m_en_i   [i];
        s_we_o   = m_we_i   [i];
      end
    end
  end
endmodule
