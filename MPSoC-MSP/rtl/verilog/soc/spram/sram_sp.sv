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

module sram_sp #(
  parameter MEM_SIZE_BYTE = 'hx,

  // address width
  parameter PLEN = 32,

  // data width (word size)
  // Valid values: 32, 16 and 8
  parameter XLEN = 32,

  // type of the memory implementation
  parameter MEM_IMPL_TYPE = "PLAIN",
  // VMEM memory file to load in simulation
  parameter MEM_FILE = "sram.vmem",

  // byte select width (must be a power of two)
  localparam SW = (XLEN == 32) ? 4 :
                  (XLEN == 16) ? 2 :
                  (XLEN ==  8) ? 1 : 'hx,

  // word address width
  parameter WORD_AW = PLEN - (SW >> 1)
)
  (
    input                clk,   // Clock
    input                rst,   // Reset
    input                ce,    // Chip enable input
    input                we,    // Write enable input
    input                oe,    // Output enable input
    input  [WORD_AW-1:0] waddr, // word address
    input  [XLEN   -1:0] din,   // input data bus
    input  [SW     -1:0] sel,   // select bytes
    output [XLEN   -1:0] dout   // output data bus
  );

  ////////////////////////////////////////////////////////////////
  //
  // Module Body
  //

  // ensure that parameters are set to allowed values
  initial begin
    if (XLEN % 8 != 0) begin
      $display("sram_sp: the data port width (parameter XLEN) must be a multiple of 8");
      $stop;
    end

    if ((1 << $clog2(SW)) != SW) begin
      $display("sram_sp: the byte select width (paramter SW = XLEN/8) must be a power of two");
      $stop;
    end
  end

  // validate the memory address (check if it's inside the memory size bounds)
  `ifdef OPTIMSOC_SRAM_VALIDATE_ADDRESS
  logic [PLEN-1:0] addr;
  assign addr = {waddr, (PLEN - WORD_AW)'{1'b0}};
  always @(posedge clk) begin
    if (addr > MEM_SIZE_BYTE) begin
      $display("sram_sp: access to out-of-bounds memory address detected! Trying to access byte address 0x%x, MEM_SIZE_BYTE is %d bytes.", addr, MEM_SIZE_BYTE);
      $stop;
    end
  end
  `endif

  generate
    if (MEM_IMPL_TYPE == "PLAIN") begin : gen_sram_sp_impl
      sram_sp_impl_plain #(
        .PLEN                     (PLEN),
        .WORD_AW                  (WORD_AW),
        .XLEN                     (XLEN),
        .MEM_SIZE_BYTE            (MEM_SIZE_BYTE),
        .MEM_FILE                 (MEM_FILE)
      )
      u_impl (
        // Outputs
        .dout                (dout[XLEN-1:0]),
        // Inputs
        .clk                 (clk),
        .rst                 (rst),
        .ce                  (ce),
        .we                  (we),
        .oe                  (oe),
        .waddr               (waddr),
        .din                 (din[XLEN-1:0]),
        .sel                 (sel[SW-1:0])
      );
    end
    else begin
      // $display("Unsupported memory type: ", MEM_IMPL_TYPE);
      // $stop;
    end
  endgenerate
endmodule
