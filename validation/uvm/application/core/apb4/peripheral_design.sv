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

module peripheral_design (
  input             PCLK,
  input             PRESETn,
  input      [31:0] PADDR,
  input             PWRITE,
  input             PSEL,
  input             PENABLE,
  input      [31:0] PWDATA,
  output reg [31:0] PRDATA,
  output reg        PREADY,
  output            PSLVERR
);

  localparam IDLE     = 2'b00;
  localparam W_ENABLE = 2'b01;
  localparam R_ENABLE = 2'b10;

  // Internal Signals
  reg [31:0] memory [0:128];

  reg [ 1:0] state;

  assign PSLVERR = 1'b0;

  always @(posedge PRESETn or posedge PCLK) begin
    if (PRESETn == 0) begin
      state  <= IDLE;
      PRDATA <= 0;
      PREADY <= 0;
    end else begin
      case (state)
        IDLE: begin
          if (PSEL & PENABLE) begin
            if (PWRITE) begin
              state <= W_ENABLE;
            end else begin
              state <= R_ENABLE;
            end
          end

          PRDATA <= 0;
        end
        W_ENABLE: begin
          if (PSEL & PENABLE && PWRITE) begin
            memory[PADDR] <= PWDATA;
            PREADY        <= 1;
          end

          state <= IDLE;
        end
        R_ENABLE: begin
          if (PSEL & PENABLE && !PWRITE) begin
            PRDATA <= memory[PADDR];
            PREADY <= 1;
          end

          state <= IDLE;
        end
        default: begin
          state <= IDLE;
        end
      endcase
    end
  end
endmodule  // peripheral_design
