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
//              MPSoC-RISCV / OR1K / MSP430 CPU                               //
//              General Purpose Input Output Bridge                           //
//              Blackbone Bus Interface                                       //
//              Universal Verification Methodology                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

/* Copyright (c) 2020-2021 by the author(s)
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
 *   Paco Reina Campo <pacoreinacampo@queenfield.tech>
 */

interface dut_if;
  logic        mrst;
  logic        mclk;
  logic [ 7:0] per_addr;
  logic        per_we;
  logic        per_en;
  logic [31:0] per_dout;
  logic [31:0] per_din;
  
  //Master Clocking block - used for Drivers
  clocking master_cb @(posedge mclk);
    output per_addr;
    output per_we;
    output per_en;
    output per_dout;
    input  per_din;
  endclocking: master_cb

  //Slave Clocking Block - used for any Slave BFMs
  clocking slave_cb @(posedge mclk);
    input  per_addr;
    input  per_we;
    input  per_en;
    input  per_dout;
    output per_din;
  endclocking: slave_cb

  //Monitor Clocking block - For sampling by monitor components
  clocking monitor_cb @(posedge mclk);
    input per_addr;
    input per_we;
    input per_en;
    input per_dout;
    input per_din;
  endclocking: monitor_cb

  modport master(clocking master_cb);
  modport slave(clocking slave_cb);
  modport passive(clocking monitor_cb);
endinterface

module bb_slave(dut_if dif);
  logic [31:0] mem [0:256];
  logic [ 1:0] bb_st;

  const logic [1:0] SETUP=0;
  const logic [1:0] W_ENABLE=1;
  const logic [1:0] R_ENABLE=2;
  
  always @(posedge dif.mclk or negedge dif.mrst) begin
    if (dif.mrst==0) begin
      bb_st <=0;
      dif.per_din <=0;
      for(int i=0;i<256;i++) mem[i]=i;
    end
    else begin
      case (bb_st)
        SETUP: begin
          dif.per_din <= 0;
          if (!dif.per_en) begin
            if (dif.per_we) begin
              bb_st <= W_ENABLE;
            end
            else begin
              bb_st <= R_ENABLE;
              dif.per_din <= mem[dif.per_addr];
            end
          end
        end
        W_ENABLE: begin
          if (dif.per_en && dif.per_we) begin
            mem[dif.per_addr] <= dif.per_dout;
          end
          bb_st <= SETUP;
        end
        R_ENABLE: begin
          bb_st <= SETUP;
        end
      endcase
    end
  end
endmodule
