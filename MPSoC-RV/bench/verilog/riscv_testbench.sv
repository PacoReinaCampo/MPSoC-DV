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
//              TestBench                                                     //
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

module riscv_testbench; 

  //core parameters
  parameter XLEN             = 64;
  parameter PLEN             = 64  ;        //64bit address bus
  parameter PC_INIT          = 'h8000_0000; //Start here after reset
  parameter BASE             = PC_INIT;     //offset where to load program in memory
  parameter INIT_FILE        = "test.hex";
  parameter MEM_LATENCY      = 1;
  parameter WRITEBUFFER_SIZE = 4;
  parameter HAS_U            = 1;
  parameter HAS_S            = 1;
  parameter HAS_H            = 1;
  parameter HAS_MMU          = 1;
  parameter HAS_FPU          = 1;
  parameter HAS_RVA          = 1;
  parameter HAS_RVM          = 1;
  parameter MULT_LATENCY     = 1;
  parameter CORES            = 1;

  parameter HTIF             = 0; //Host-interface
  parameter TOHOST           = 32'h80001000;
  parameter UART_TX          = 32'h80001080;

  //caches
  parameter ICACHE_SIZE      = 64;
  parameter DCACHE_SIZE      = 64;

  parameter PMA_CNT          = 4;

  //////////////////////////////////////////////////////////////////
  //
  // Constants
  //
  localparam MULLAT = MULT_LATENCY > 4 ? 4 : MULT_LATENCY;

  //////////////////////////////////////////////////////////////////
  //
  // Variables
  //
  genvar           p;

  logic            HCLK,
                   HRESETn;

  //PMA configuration
  logic [PMA_CNT-1:0][    13:0] pma_cfg;
  logic [PMA_CNT-1:0][PLEN-1:0] pma_adr;

  //Instruction interface
  logic            ins_HSEL;
  logic [PLEN-1:0] ins_HADDR;
  logic [XLEN-1:0] ins_HRDATA;
  logic [XLEN-1:0] ins_HWDATA; //always 0
  logic            ins_HWRITE; //always 0
  logic [     2:0] ins_HSIZE;
  logic [     2:0] ins_HBURST;
  logic [     3:0] ins_HPROT;
  logic [     1:0] ins_HTRANS;
  logic            ins_HMASTLOCK;
  logic            ins_HREADY;
  logic            ins_HRESP;

  //Data interface
  logic            dat_HSEL;
  logic [PLEN-1:0] dat_HADDR;
  logic [XLEN-1:0] dat_HWDATA;
  logic [XLEN-1:0] dat_HRDATA;
  logic            dat_HWRITE;
  logic [     2:0] dat_HSIZE;
  logic [     2:0] dat_HBURST;
  logic [     3:0] dat_HPROT;
  logic [     1:0] dat_HTRANS;
  logic            dat_HMASTLOCK;
  logic            dat_HREADY;
  logic            dat_HRESP;

  //Debug Interface
  logic            dbp_bp,
                   dbg_stall,
                   dbg_strb,
                   dbg_ack,
                   dbg_we;
  logic [PLEN-1:0] dbg_addr;
  logic [XLEN-1:0] dbg_dati,
                   dbg_dato;

  //Host Interface
  logic            host_csr_req,
                   host_csr_ack,
                   host_csr_we;
  logic [XLEN-1:0] host_csr_tohost,
                   host_csr_fromhost;

  //Unified memory interface
  logic [1:0][     1:0] mem_htrans;
  logic [1:0][     2:0] mem_hburst;
  logic [1:0]           mem_hready,
                        mem_hresp;
  logic [1:0][PLEN-1:0] mem_haddr;
  logic [1:0][XLEN-1:0] mem_hwdata,
                        mem_hrdata;
  logic [1:0][     2:0] mem_hsize;
  logic [1:0]           mem_hwrite;

  ////////////////////////////////////////////////////////////////
  //
  // Module Body
  //

  //Define PMA regions

  //crt.0 (ROM) region
  assign pma_adr[0] = TOHOST >> 2;
  assign pma_cfg[0] = {`MEM_TYPE_MAIN, 8'b1111_1000, `AMO_TYPE_NONE, `TOR};

  //TOHOST region
  assign pma_adr[1] = ((TOHOST >> 2) & ~'hf) | 'h7;
  assign pma_cfg[1] = {`MEM_TYPE_IO, 8'b0100_0000, `AMO_TYPE_NONE, `NAPOT};

  //UART-Tx region
  assign pma_adr[2] = UART_TX >> 2;
  assign pma_cfg[2] = {`MEM_TYPE_IO, 8'b0100_0000, `AMO_TYPE_NONE, `NA4};

  //RAM region
  assign pma_adr[3] = 1 << 31;
  assign pma_cfg[3] = {`MEM_TYPE_MAIN, 8'b1111_0000, `AMO_TYPE_NONE, `TOR};

  //Hookup Device Under Test
  riscv_pu #(
    .XLEN             ( XLEN             ),
    .PLEN             ( PLEN             ), //31bit address bus
    .PC_INIT          ( PC_INIT          ),
    .HAS_USER         ( HAS_U            ),
    .HAS_SUPER        ( HAS_S            ),
    .HAS_HYPER        ( HAS_H            ),
    .HAS_RVA          ( HAS_RVA          ),
    .HAS_RVM          ( HAS_RVM          ),
    .MULT_LATENCY     ( MULLAT           ),

    .PMA_CNT          ( PMA_CNT          ),
    .ICACHE_SIZE      ( ICACHE_SIZE      ),
    .ICACHE_WAYS      ( 1                ),
    .DCACHE_SIZE      ( DCACHE_SIZE      ),
    .DTCM_SIZE        ( 0                ),
    .WRITEBUFFER_SIZE ( WRITEBUFFER_SIZE ),

    .MTVEC_DEFAULT    ( 32'h80000004     )
  )
  dut (
    .HRESETn   ( HRESETn ),
    .HCLK      ( HCLK    ),

    .pma_cfg_i ( pma_cfg ),
    .pma_adr_i ( pma_adr ),

    .ext_nmi   ( 1'b0    ),
    .ext_tint  ( 1'b0    ),
    .ext_sint  ( 1'b0    ),
    .ext_int   ( 4'h0    ),

    .*
  ); 

  //Hookup Debug Unit
  riscv_dbg_bfm #(
    .XLEN ( XLEN ),
    .PLEN ( PLEN )
  )
  dbg_ctrl (
    .rstn ( HRESETn ),
    .clk  ( HCLK    ),

    .cpu_bp_i    ( dbg_bp    ),
    .cpu_stall_o ( dbg_stall ),
    .cpu_stb_o   ( dbg_strb  ),
    .cpu_we_o    ( dbg_we    ),
    .cpu_adr_o   ( dbg_addr  ),
    .cpu_dat_o   ( dbg_dati  ),
    .cpu_dat_i   ( dbg_dato  ),
    .cpu_ack_i   ( dbg_ack   )
  );

  //bus <-> memory model connections
  assign mem_htrans[0] = ins_HTRANS;
  assign mem_hburst[0] = ins_HBURST;
  assign mem_haddr[0]  = ins_HADDR;
  assign mem_hwrite[0] = ins_HWRITE;
  assign mem_hsize[0]  = 4'h0;
  assign mem_hwdata[0] = {XLEN{1'b0}};
  assign ins_HRDATA    = mem_hrdata[0];
  assign ins_HREADY    = mem_hready[0];
  assign ins_HRESP     = mem_hresp[0];

  assign mem_htrans[1] = dat_HTRANS;
  assign mem_hburst[1] = dat_HBURST;
  assign mem_haddr[1]  = dat_HADDR;
  assign mem_hwrite[1] = dat_HWRITE;
  assign mem_hsize[1]  = dat_HSIZE;
  assign mem_hwdata[1] = dat_HWDATA;
  assign dat_HRDATA    = mem_hrdata[1];
  assign dat_HREADY    = mem_hready[1];
  assign dat_HRESP     = mem_hresp[1];

  //hookup memory model
  riscv_memory_model #(
    .INIT_FILE ( INIT_FILE )
  )
  memory_model (
    .HRESETn ( HRESETn    ),
    .HCLK    ( HCLK       ),
    .HTRANS  ( mem_htrans ),
    .HREADY  ( mem_hready ),
    .HRESP   ( mem_hresp  ),
    .HADDR   ( mem_haddr  ),
    .HWRITE  ( mem_hwrite ),
    .HSIZE   ( mem_hsize  ),
    .HBURST  ( mem_hburst ),
    .HWDATA  ( mem_hwdata ),
    .HRDATA  ( mem_hrdata )
  );

  //Front-End Server
  generate
    if (HTIF) begin
      //Old HTIF interface
      riscv_htif #(XLEN)
      htif_frontend (
        .rstn              ( HRESETn           ),
        .clk               ( HCLK              ),
        .host_csr_req      ( host_csr_req      ),
        .host_csr_ack      ( host_csr_ack      ),
        .host_csr_we       ( host_csr_we       ),
        .host_csr_tohost   ( host_csr_tohost   ),
        .host_csr_fromhost ( host_csr_fromhost )
      );
    end
    else begin
      //New MMIO interface
      riscv_mmio_if #(XLEN, PLEN, TOHOST, UART_TX)
      mmio_if (
        .HRESETn   ( HRESETn    ),
        .HCLK      ( HCLK       ),
        .HTRANS    ( dat_HTRANS ),
        .HWRITE    ( dat_HWRITE ),
        .HSIZE     ( dat_HSIZE  ),
        .HBURST    ( dat_HBURST ),
        .HADDR     ( dat_HADDR  ),
        .HWDATA    ( dat_HWDATA ),
        .HRDATA    (            ),
        .HREADYOUT (            ),
        .HRESP     (            )
      );
    end
  endgenerate

  //Generate clock
  always #1 HCLK = ~HCLK;

  initial begin
    $display("\n");
    $display ("                                                                                                         ");
    $display ("                                                                                                         ");
    $display ("                                                              ***                     ***          **    ");
    $display ("                                                            ** ***    *                ***          **   ");
    $display ("                                                           **   ***  ***                **          **   ");
    $display ("                                                           **         *                 **          **   ");
    $display ("    ****    **   ****                                      **                           **          **   ");
    $display ("   * ***  *  **    ***  *    ***       ***    ***  ****    ******   ***        ***      **      *** **   ");
    $display ("  *   ****   **     ****    * ***     * ***    **** **** * *****     ***      * ***     **     ********* ");
    $display (" **    **    **      **    *   ***   *   ***    **   ****  **         **     *   ***    **    **   ****  ");
    $display (" **    **    **      **   **    *** **    ***   **    **   **         **    **    ***   **    **    **   ");
    $display (" **    **    **      **   ********  ********    **    **   **         **    ********    **    **    **   ");
    $display (" **    **    **      **   *******   *******     **    **   **         **    *******     **    **    **   ");
    $display (" **    **    **      **   **        **          **    **   **         **    **          **    **    **   ");
    $display ("  *******     ******* **  ****    * ****    *   **    **   **         **    ****    *   **    **    **   ");
    $display ("   ******      *****   **  *******   *******    ***   ***  **         *** *  *******    *** *  *****     ");
    $display ("       **                   *****     *****      ***   ***  **         ***    *****      ***    ***      ");
    $display ("       **                                                                                                ");
    $display ("       **                                                                                                ");
    $display ("        **                                                                                               ");
    $display ("- RISC-V Regression TestBench ---------------------------------------------------------------------------");
    $display ("  XLEN | PRIV | MMU | FPU | RVA | RVM | MULLAT");
    $display ("  %4d | M%C%C%C | %3d | %3d | %3d | %3d | %6d", 
              XLEN, HAS_H > 0 ? "H" : " ", HAS_S > 0 ? "S" : " ", HAS_U > 0 ? "U" : " ",
              HAS_MMU, HAS_FPU, HAS_RVA, HAS_RVM, MULLAT);
    $display ("------------------------------------------------------------------------------");
    $display ("  CORES | NODES | X | Y | Z | CORES_PER_TILE | CORES_PER_MISD | CORES_PER_SIMD");
    $display ("    1   | %5d | %1d | %1d | %1d |       --       |       --       |       --       ", 
              `NODES, `X, `Y, `Z);
    $display ("------------------------------------------------------------------------------");
    $display ("  Test   = %s", INIT_FILE);
    $display ("  ICache = %0dkB", ICACHE_SIZE);
    $display ("  DCache = %0dkB", DCACHE_SIZE);
    $display ("------------------------------------------------------------------------------");
  end

  initial begin

    `ifdef WAVES
    $shm_open("waves");
    $shm_probe("AS",riscv_testbench,"AS");
    $display("INFO: Signal dump enabled ...\n");
    `endif

    //memory_model.read_elf2hex;
    memory_model.read_ihex;
    //memory_model.dump;

    HCLK  = 'b0;

    HRESETn = 'b1;
    repeat (5) @(negedge HCLK);
    HRESETn = 'b0;
    repeat (5) @(negedge HCLK);
    HRESETn = 'b1;

    #112;
    //stall CPU
    dbg_ctrl.stall;

    //Enable BREAKPOINT to call external debugger
    //dbg_ctrl.write('h0004,'h0008);

    //Enable Single Stepping
    dbg_ctrl.write('h0000,'h0001);

    //single step through 10 instructions
    repeat (100) begin
      while (!dbg_ctrl.stall_cpu) @(posedge HCLK);
      repeat(15) @(posedge HCLK);
      dbg_ctrl.write('h0001,'h0000); //clear single-step-hit
      dbg_ctrl.unstall;
    end

    //last time ...
    @(posedge HCLK);
    while (!dbg_ctrl.stall_cpu) @(posedge HCLK);
    //disable Single Stepping
    dbg_ctrl.write('h0000,'h0000);
    dbg_ctrl.write('h0001,'h0000);
    dbg_ctrl.unstall;
  end
endmodule
