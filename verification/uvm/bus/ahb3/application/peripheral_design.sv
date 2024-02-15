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
//              Peripheral-NTM for MPSoC                                      //
//              Neural Turing Machine for MPSoC                               //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2022-2025 by the author(s)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
////////////////////////////////////////////////////////////////////////////////
// Author(s):
//   Paco Reina Campo <pacoreinacampo@queenfield.tech>

import peripheral_ahb3_pkg::*;

module peripheral_design #(
  parameter MEMORY_SIZE       = 0,    // Memory in Bytes
  parameter MEMORY_DEPTH      = 256,  // Memory depth
  parameter HADDR_SIZE        = 8,
  parameter HDATA_SIZE        = 32,
  parameter TECHNOLOGY        = "GENERIC",
  parameter REGISTERED_OUTPUT = "NO"
) (
  input hresetn,
  input hclk,

  // AHB Slave Interfaces (receive data from AHB Masters)
  // AHB Masters connect to these ports
  input                       hsel,
  input      [HADDR_SIZE-1:0] haddr,
  input      [HDATA_SIZE-1:0] hwdata,
  output reg [HDATA_SIZE-1:0] hrdata,
  input                       hwrite,
  input      [           2:0] hsize,
  input      [           2:0] hburst,
  input      [           3:0] hprot,
  input      [           1:0] htrans,
  input                       hmastlock,
  output reg                  hreadyout,
  input                       hready,
  output                      hresp
);

  //////////////////////////////////////////////////////////////////////////////
  // Constants
  //////////////////////////////////////////////////////////////////////////////

  localparam BE_SIZE = (HADDR_SIZE + 7) / 8;

  localparam MEMORY_SIZE_DEPTH = 8 * MEMORY_SIZE / HDATA_SIZE;
  localparam REAL_MEMORY_DEPTH = MEMORY_DEPTH > MEMORY_SIZE_DEPTH ? MEMORY_DEPTH : MEMORY_SIZE_DEPTH;
  localparam MEMORY_ABITS = $clog2(REAL_MEMORY_DEPTH);
  localparam MEMORY_ABITS_LSB = $clog2(BE_SIZE);

  //////////////////////////////////////////////////////////////////////////////
  // Variables
  //////////////////////////////////////////////////////////////////////////////

  genvar i;

  logic                  we;
  logic [BE_SIZE   -1:0] be;
  logic [HADDR_SIZE-1:0] waddr;
  logic                  contention;
  logic                  ready;

  logic [HDATA_SIZE-1:0] dout;

  // memory array
  logic [HDATA_SIZE-1:0] memory_array[2**MEMORY_ABITS -1:0];

  //////////////////////////////////////////////////////////////////////////////
  // Functions
  //////////////////////////////////////////////////////////////////////////////

  function [BE_SIZE-1:0] gen_be;
    input [2:0] hsize;
    input [HADDR_SIZE-1:0] haddr;

    logic [127:0] full_be;
    logic [  6:0] haddr_masked;
    logic [  6:0] address_offset;

    // get number of active lanes for a 1024bit databus (max width) for this hsize
    case (hsize)
      HSIZE_B1024: full_be = 128'hffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff;
      HSIZE_B512:  full_be = 128'h0000_0000_0000_0000_ffff_ffff_ffff_ffff;
      HSIZE_B256:  full_be = 128'h0000_0000_0000_0000_0000_0000_ffff_ffff;
      HSIZE_B128:  full_be = 128'h0000_0000_0000_0000_0000_0000_0000_ffff;
      HSIZE_DWORD: full_be = 128'h0000_0000_0000_0000_0000_0000_0000_00ff;
      HSIZE_WORD:  full_be = 128'h0000_0000_0000_0000_0000_0000_0000_000f;
      HSIZE_HWORD: full_be = 128'h0000_0000_0000_0000_0000_0000_0000_0003;
      default:     full_be = 128'h0000_0000_0000_0000_0000_0000_0000_0001;
    endcase

    // What are the lesser bits in haddr?
    case (HDATA_SIZE)
      1024:    address_offset = 7'b111_1111;
      0512:    address_offset = 7'b011_1111;
      0256:    address_offset = 7'b001_1111;
      0128:    address_offset = 7'b000_1111;
      0064:    address_offset = 7'b000_0111;
      0032:    address_offset = 7'b000_0011;
      0016:    address_offset = 7'b000_0001;
      default: address_offset = 7'b000_0000;
    endcase

    // generate masked address
    haddr_masked = haddr & address_offset;

    // create byte-enable
    gen_be       = full_be[BE_SIZE-1:0] << haddr_masked;
  endfunction  // gen_be

  //////////////////////////////////////////////////////////////////////////////
  // Body
  //////////////////////////////////////////////////////////////////////////////

  // generate internal write signal
  // This causes read/write contention, which is handled by memory
  always @(posedge hclk) begin
    if (hready) begin
      we <= hsel & hwrite & (htrans != HTRANS_BUSY) & (htrans != HTRANS_IDLE);
    end else begin
      we <= 1'b0;
    end
  end

  // decode Byte-Enables
  always @(posedge hclk) begin
    if (hready) begin
      be <= gen_be(hsize, haddr);
    end
  end

  // store write address
  always @(posedge hclk) begin
    if (hready) begin
      waddr <= haddr;
    end
  end

  // Is there read/write contention on the memory?
  assign contention = (waddr[MEMORY_ABITS_LSB +: MEMORY_ABITS] == haddr[MEMORY_ABITS_LSB +: MEMORY_ABITS]) & we & hsel & hready & ~hwrite & (htrans != HTRANS_BUSY) & (htrans != HTRANS_IDLE);

  // if all bytes were written contention is/can be handled by memory
  // otherwise stall a cycle (forced by N3S)
  // We could do an exception for N3S here, but this file should be technology agnostic
  assign ready      = ~(contention & ~&be);

  // Hookup Memory Wrapper
  // Use two-port memory, due to pipelined AHB bus;
  //   the actual write to memory is 1 cycle late, causing read/write overlap
  // This assumes there are input registers on the memory

  // write side
  generate
    for (i = 0; i < (HDATA_SIZE + 7) / 8; i = i + 1) begin : write
      if (i * 8 + 8 > HDATA_SIZE) begin
        always @(posedge hclk) begin
          if (we && be[i]) begin
            memory_array[waddr[MEMORY_ABITS_LSB+:MEMORY_ABITS]][HDATA_SIZE-1:i*8] <= hwdata[HDATA_SIZE-1:i*8];
          end
        end
      end else begin
        always @(posedge hclk) begin
          if (we && be[i]) begin
            memory_array[haddr[MEMORY_ABITS_LSB+:MEMORY_ABITS]][i*8+:8] <= hwdata[i*8+:8];
          end
        end
      end
    end
  endgenerate

  // read side

  // per Altera's recommendations. Prevents bypass logic
  always @(posedge hclk) begin
    dout <= memory_array[waddr[MEMORY_ABITS_LSB+:MEMORY_ABITS]];
  end

  // AHB bus response
  assign hresp = HRESP_OKAY;  // always OK

  generate
    if (REGISTERED_OUTPUT == "NO") begin
      always @(posedge hclk, negedge hresetn) begin
        if (!hresetn) begin
          hreadyout <= 1'b1;
        end else begin
          hreadyout <= ready;
        end
      end
      always @* begin
        hrdata = dout;
      end
    end else begin
      always @(posedge hclk, negedge hresetn) begin
        if (!hresetn) begin
          hreadyout <= 1'b1;
        end else if (htrans == HTRANS_NONSEQ && !hwrite) begin
          hreadyout <= 1'b0;
        end else begin
          hreadyout <= 1'b1;
        end
      end
      always @(posedge hclk) begin
        if (hready) begin
          hrdata <= dout;
        end
      end
    end
  endgenerate
endmodule
