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
//              Debug Controller Simulation Model                             //
//              AMBA3 AHB-Lite Bus Interface                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

/* Copyright (c) 2017-2018 by the author(s)
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

`include "riscv_mpsoc_pkg.sv"

module riscv_htif #(
  parameter XLEN=32
)
  (
    input             rstn,
    input             clk,

    output            host_csr_req,
    input             host_csr_ack,
    output            host_csr_we,
    input  [XLEN-1:0] host_csr_tohost,
    output [XLEN-1:0] host_csr_fromhost
  );

  ////////////////////////////////////////////////////////////////
  //
  // Variables
  //
  integer watchdog_cnt;

  ////////////////////////////////////////////////////////////////
  //
  // Functions
  //
  function string hostcode_to_string;
    input integer hostcode;

    case (hostcode)
      1337: hostcode_to_string = "OTHER EXCEPTION";
    endcase
  endfunction

  ////////////////////////////////////////////////////////////////
  //
  // Module body
  //

  //Generate watchdog counter
  always @(posedge clk,negedge rstn) begin
    if (!rstn) watchdog_cnt <= 0;
    else       watchdog_cnt <= watchdog_cnt + 1;
  end

  always @(posedge clk) begin
    if (watchdog_cnt > 200_000 || host_csr_tohost[0] == 1'b1) begin
      $display("\n");
      $display("*****************************************************");
      $display("* RISC-V test bench finished");
      if (host_csr_tohost[0] == 1'b1) begin
        if (~|host_csr_tohost[XLEN-1:1])
          $display("* PASSED %0d", host_csr_tohost);
        else
          $display ("* FAILED: code: 0x%h (%0d: %s)", host_csr_tohost >> 1, host_csr_tohost >> 1, hostcode_to_string(host_csr_tohost >> 1) );
      end
      else
        $display ("* FAILED: watchdog count reached (%0d) @%0t", watchdog_cnt, $time);
      $display("*****************************************************");
      $display("\n");

      $finish();
    end
  end
endmodule
