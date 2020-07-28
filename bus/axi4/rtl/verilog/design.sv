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
//              AMBA4 AXI-Lite Bus Interface                                  //
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
  logic        clk;
  logic        rst;

  logic [10:0] aw_id;
  logic [31:0] aw_addr;
  logic [ 7:0] aw_len;
  logic [ 2:0] aw_size;
  logic [ 1:0] aw_burst;
  logic        aw_lock;
  logic [ 3:0] aw_cache;
  logic [ 2:0] aw_prot;
  logic [ 3:0] aw_qos;
  logic [ 3:0] aw_region;
  logic [10:0] aw_user;
  logic        aw_valid;
  logic        aw_ready;

  logic [10:0] ar_id;
  logic [31:0] ar_addr;
  logic [ 7:0] ar_len;
  logic [ 2:0] ar_size;
  logic [ 1:0] ar_burst;
  logic        ar_lock;
  logic [ 3:0] ar_cache;
  logic [ 2:0] ar_prot;
  logic [ 3:0] ar_qos;
  logic [ 3:0] ar_region;
  logic [10:0] ar_user;
  logic        ar_valid;
  logic        ar_ready;

  logic [31:0] dw_data;
  logic [10:0] dw_strb;
  logic        dw_last;
  logic [10:0] dw_user;
  logic        dw_valid;
  logic        dw_ready;

  logic [10:0] dr_id;
  logic [31:0] dr_data;
  logic [ 1:0] dr_resp;
  logic        dr_last;
  logic [10:0] dr_user;
  logic        dr_valid;
  logic        dr_ready;

  logic [10:0] b_id;
  logic [ 1:0] b_resp;
  logic [10:0] b_user;
  logic        b_valid;
  logic        b_ready;
  
  //Master Clocking block - used for Drivers
  clocking master_cb @(posedge clk);
    output aw_id;
    output aw_addr;
    output aw_len;
    output aw_size;
    output aw_burst;
    output aw_lock;
    output aw_cache;
    output aw_prot;
    output aw_qos;
    output aw_region;
    output aw_user;
    output aw_valid;
    input  aw_ready;

    output ar_id;
    output ar_addr;
    output ar_len;
    output ar_size;
    output ar_burst;
    output ar_lock;
    output ar_cache;
    output ar_prot;
    output ar_qos;
    output ar_region;
    output ar_user;
    output ar_valid;
    input  ar_ready;

    output dw_data;
    output dw_strb;
    output dw_last;
    output dw_user;
    output dw_valid;
    input  dw_ready;

    input  dr_id;
    input  dr_data;
    input  dr_resp;
    input  dr_last;
    input  dr_user;
    input  dr_valid;
    output dr_ready;

    input  b_id;
    input  b_resp;
    input  b_user;
    input  b_valid;
    output b_ready;
  endclocking: master_cb

  //Slave Clocking Block - used for any Slave BFMs
  clocking slave_cb @(posedge clk);
    input  aw_id;
    input  aw_addr;
    input  aw_len;
    input  aw_size;
    input  aw_burst;
    input  aw_lock;
    input  aw_cache;
    input  aw_prot;
    input  aw_qos;
    input  aw_region;
    input  aw_user;
    input  aw_valid;
    output aw_ready;

    input  ar_id;
    input  ar_addr;
    input  ar_len;
    input  ar_size;
    input  ar_burst;
    input  ar_lock;
    input  ar_cache;
    input  ar_prot;
    input  ar_qos;
    input  ar_region;
    input  ar_user;
    input  ar_valid;
    output ar_ready;

    input  dw_data;
    input  dw_strb;
    input  dw_last;
    input  dw_user;
    input  dw_valid;
    output dw_ready;

    output dr_id;
    output dr_data;
    output dr_resp;
    output dr_last;
    output dr_user;
    output dr_valid;
    input  dr_ready;

    output b_id;
    output b_resp;
    output b_user;
    output b_valid;
    input  b_ready;
  endclocking: slave_cb

  //Monitor Clocking block - For sampling by monitor components
  clocking monitor_cb @(posedge clk);
    input aw_id;
    input aw_addr;
    input aw_len;
    input aw_size;
    input aw_burst;
    input aw_lock;
    input aw_cache;
    input aw_prot;
    input aw_qos;
    input aw_region;
    input aw_user;
    input aw_valid;
    input aw_ready;

    input ar_id;
    input ar_addr;
    input ar_len;
    input ar_size;
    input ar_burst;
    input ar_lock;
    input ar_cache;
    input ar_prot;
    input ar_qos;
    input ar_region;
    input ar_user;
    input ar_valid;
    input ar_ready;

    input dw_data;
    input dw_strb;
    input dw_last;
    input dw_user;
    input dw_valid;
    input dw_ready;

    input dr_id;
    input dr_data;
    input dr_resp;
    input dr_last;
    input dr_user;
    input dr_valid;
    input dr_ready;

    input b_id;
    input b_resp;
    input b_user;
    input b_valid;
    input b_ready;
  endclocking: monitor_cb

  modport master(clocking master_cb);
  modport slave(clocking slave_cb);
  modport passive(clocking monitor_cb);
endinterface

module axi4_slave(dut_if dif);
  logic [31:0] mem [0:256];
  logic [ 1:0] axi4_st;

  const logic [1:0] SETUP=0;
  const logic [1:0] W_ENABLE=1;
  const logic [1:0] R_ENABLE=2;
  
  always @(posedge dif.clk or negedge dif.rst) begin
    if (dif.rst==0) begin
      axi4_st <=0;
      dif.prdata <=0;
      dif.pready <=1;
      for(int i=0;i<256;i++) mem[i]=i;
    end
    else begin
      case (axi4_st)
        SETUP: begin
          dif.prdata <= 0;
          if (dif.psel && !dif.penable) begin
            if (dif.pwrite) begin
              axi4_st <= W_ENABLE;
            end
            else begin
              axi4_st <= R_ENABLE;
              dif.prdata <= mem[dif.paddr];
            end
          end
        end
        W_ENABLE: begin
          if (dif.psel && dif.penable && dif.pwrite) begin
            mem[dif.paddr] <= dif.pwdata;
          end
          axi4_st <= SETUP;
        end
        R_ENABLE: begin
          axi4_st <= SETUP;
        end
      endcase
    end
  end
endmodule
