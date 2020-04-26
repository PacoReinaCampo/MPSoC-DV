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

import dii_package::dii_flit;
import opensocdebug::mmsp430_trace_exec;
import optimsoc_config::*;
import optimsoc_functions::*;

module msp430_tile #(
  parameter AW = 32,
  parameter DW = 32,

  parameter config_t CONFIG = 'x,

  parameter ID       = 'x,
  parameter COREBASE = 'x,

  parameter DEBUG_BASEID = 'x,

  parameter MEM_FILE = 'x,

  localparam CHANNELS   = CONFIG.NOC_CHANNELS,
  localparam FLIT_WIDTH = CONFIG.NOC_FLIT_WIDTH
)
  (
    input                                 dii_flit [1:0] debug_ring_in,
    output                                dii_flit [1:0] debug_ring_out,

    output [   1:0]                       debug_ring_in_ready,
    input  [   1:0]                       debug_ring_out_ready,

    output [AW-1:0]                       bb_ext_addr_i,
    output [DW-1:0]                       bb_ext_din_i,
    output                                bb_ext_en_i,
    output                                bb_ext_we_i,

    input  [DW-1:0]                       bb_ext_dout_o,

    input                                 clk,
    input                                 rst_dbg,
    input                                 rst_cpu,
    input                                 rst_sys,

    input  [CHANNELS-1:0][FLIT_WIDTH-1:0] noc_in_flit,
    input  [CHANNELS-1:0]                 noc_in_last,
    input  [CHANNELS-1:0]                 noc_in_valid,
    output [CHANNELS-1:0]                 noc_in_ready,
    output [CHANNELS-1:0][FLIT_WIDTH-1:0] noc_out_flit,
    output [CHANNELS-1:0]                 noc_out_last,
    output [CHANNELS-1:0]                 noc_out_valid,
    input  [CHANNELS-1:0]                 noc_out_ready
  );

  ////////////////////////////////////////////////////////////////
  //
  // Constans
  //

  localparam NR_MASTERS = CONFIG.CORES_PER_TILE * 2 + 1;
  localparam NR_SLAVES  = 5;
  localparam SLAVE_DM   = 0;
  localparam SLAVE_PGAS = 1;
  localparam SLAVE_NA   = 2;
  localparam SLAVE_BOOT = 3;
  localparam SLAVE_UART = 4;

  localparam MOR1KX_FEATURE_FPU          = (CONFIG.CORE_ENABLE_FPU ? "ENABLED" : "NONE");
  localparam MOR1KX_FEATURE_PERFCOUNTERS = (CONFIG.CORE_ENABLE_PERFCOUNTERS ? "ENABLED" : "NONE");
  localparam MOR1KX_FEATURE_DEBUGUNIT    = "NONE"; // XXX: Enable debug unit with OSD CDM module (once it's ready)

  // create DI ring segment with routers
  localparam DEBUG_MODS_PER_TILE_NONZERO = (CONFIG.DEBUG_MODS_PER_TILE == 0) ? 1 : CONFIG.DEBUG_MODS_PER_TILE;

  ////////////////////////////////////////////////////////////////
  //
  // Variables
  //

  mmsp430_trace_exec [CONFIG.CORES_PER_TILE-1:0] trace;

  logic          bb_mem_clk_i;
  logic          bb_mem_rst_i;

  logic [AW-1:0] bb_mem_addr_i;
  logic [DW-1:0] bb_mem_din_i;
  logic          bb_mem_en_i;
  logic          bb_mem_we_i;

  logic [DW-1:0] bb_mem_dout_o;

  dii_flit [DEBUG_MODS_PER_TILE_NONZERO-1:0] dii_in;
  dii_flit [DEBUG_MODS_PER_TILE_NONZERO-1:0] dii_out;

  logic [DEBUG_MODS_PER_TILE_NONZERO-1:0] dii_in_ready;
  logic [DEBUG_MODS_PER_TILE_NONZERO-1:0] dii_out_ready;

  wire [AW-1:0] busms_addr_o [0:NR_MASTERS-1];
  wire [DW-1:0] busms_din_o  [0:NR_MASTERS-1];
  wire          busms_en_o   [0:NR_MASTERS-1];
  wire          busms_we_o   [0:NR_MASTERS-1];
  wire [   1:0] busms_wen_o  [0:NR_MASTERS-1];

  wire [DW-1:0] busms_dout_i [0:NR_MASTERS-1];


  wire [AW-1:0] bussl_addr_i [0:NR_SLAVES-1];
  wire [DW-1:0] bussl_din_i  [0:NR_SLAVES-1];
  wire          bussl_en_i   [0:NR_SLAVES-1];
  wire          bussl_we_i   [0:NR_SLAVES-1];

  wire [DW-1:0] bussl_dout_o [0:NR_SLAVES-1];

  wire          snoop_enable;
  wire [31:0]   snoop_adr;

  wire [31:0]   pic_ints_i [0:CONFIG.CORES_PER_TILE-1];

  genvar c,m,s;

  wire [NR_MASTERS-1:0][AW-1:0] busms_addr_o_flat;
  wire [NR_MASTERS-1:0][DW-1:0] busms_din_o_flat;
  wire [NR_MASTERS-1:0]         busms_en_o_flat;
  wire [NR_MASTERS-1:0]         busms_we_o_flat;

  wire [NR_MASTERS-1:0][DW-1:0] busms_dout_i_flat;

  wire [NR_SLAVES-1:0][AW-1:0] bussl_addr_i_flat;
  wire [NR_SLAVES-1:0][DW-1:0] bussl_din_i_flat;
  wire [NR_SLAVES-1:0]         bussl_en_i_flat;
  wire [NR_SLAVES-1:0]         bussl_we_i_flat;

  wire [NR_SLAVES-1:0][DW-1:0] bussl_dout_o_flat;

  //MAM - BB adapter signals

  logic [AW-1:0] mam_dm_addr_o;
  logic [DW-1:0] mam_dm_din_o;
  logic          mam_dm_en_o;
  logic          mam_dm_we_o;

  logic [DW-1:0] mam_dm_dout_i;

  ////////////////////////////////////////////////////////////////
  //
  // Module Body
  //

  assign pic_ints_i [0][31:5] = 27'h0;
  assign pic_ints_i [0][ 1:0] = 2'b00;

  generate
    if (CONFIG.USE_DEBUG == 1) begin : gen_debug_ring
      genvar i;
      logic [CONFIG.DEBUG_MODS_PER_TILE-1:0][15:0] id_map;
      for (i = 0; i < CONFIG.DEBUG_MODS_PER_TILE; i = i+1) begin
        assign id_map[i][15:0] = 16'(DEBUG_BASEID+i);
      end

      debug_ring_expand #(
        .BUFFER_SIZE (CONFIG.DEBUG_ROUTER_BUFFER_SIZE),
        .PORTS       (CONFIG.DEBUG_MODS_PER_TILE)
      )
      u_debug_ring_segment (
        .clk           (clk),
        .rst           (rst_dbg),
        .id_map        (id_map),
        .dii_in        (dii_in),
        .dii_in_ready  (dii_in_ready),
        .dii_out       (dii_out),
        .dii_out_ready (dii_out_ready),
        .ext_in        (debug_ring_in),
        .ext_in_ready  (debug_ring_in_ready),
        .ext_out       (debug_ring_out),
        .ext_out_ready (debug_ring_out_ready)
      );
    end
  endgenerate

  generate
    for (m = 0; m < NR_MASTERS; m = m + 1) begin : gen_busms_flat
      assign busms_addr_o_flat [m] = busms_addr_o [m];
      assign busms_din_o_flat  [m] = busms_din_o  [m];
      assign busms_en_o_flat   [m] = busms_en_o   [m];
      assign busms_we_o_flat   [m] = busms_we_o   [m];

      assign busms_dout_i [m] = busms_dout_i_flat [m];
    end

    for (s = 0; s < NR_SLAVES; s = s + 1) begin : gen_bussl_flat
      assign bussl_addr_i [s] = bussl_addr_i_flat [s];
      assign bussl_din_i  [s] = bussl_din_i_flat  [s];
      assign bussl_en_i   [s] = bussl_en_i_flat   [s];
      assign bussl_we_i   [s] = bussl_we_i_flat   [s];

      assign bussl_dout_o_flat [s] = bussl_dout_o [s];
    end
  endgenerate

  generate
    for (c = 1; c < CONFIG.CORES_PER_TILE; c = c + 1) begin
      assign pic_ints_i[c] = 32'h0;
    end
  endgenerate

  generate
    for (c = 0; c < CONFIG.CORES_PER_TILE; c = c + 1) begin : gen_cores
      MSP430_CORE #(
        .DW ( 16 ),
        .AW ( 16 )
      )
      u_core (
        .dbg_clk    (),
        .dbg_rst    (),
        .irq_detect (),
        .nmi_detect (),

        .i_state (),
        .e_state (),
        .decode  (),
        .ir      (),
        .irq_num (),
        .pc      (),

        .nodiv_smclk (),

        .aclk (),              // ASIC ONLY: ACLK
        .aclk_en (),           // FPGA ONLY: ACLK enable
        .dbg_freeze (),        // Freeze peripherals
        .dbg_i2c_sda_out (),   // Debug interface: I2C SDA OUT
        .dbg_uart_txd (),      // Debug interface: UART TXD
        .dco_enable (),        // ASIC ONLY: Fast oscillator enable
        .dco_wkup (),          // ASIC ONLY: Fast oscillator wake-up (asynchronous)
        .irq_acc (),           // Interrupt request accepted (one-hot signal)
        .lfxt_enable (),       // ASIC ONLY: Low frequency oscillator enable
        .lfxt_wkup (),         // ASIC ONLY: Low frequency oscillator wake-up (asynchronous)
        .mclk (),              // Main system clock
        .puc_rst (),           // Main system reset
        .smclk (),             // ASIC ONLY: SMCLK
        .smclk_en (),          // FPGA ONLY: SMCLK enable

        .cpu_en (),            // Enable CPU code execution (asynchronous and non-glitchy)
        .dbg_en (),            // Debug interface enable (asynchronous and non-glitchy)
        .dbg_i2c_addr (),      // Debug interface: I2C Address
        .dbg_i2c_broadcast (), // Debug interface: I2C Broadcast Address (for multicore systems)
        .dbg_i2c_scl (),       // Debug interface: I2C SCL
        .dbg_i2c_sda_in (),    // Debug interface: I2C SDA IN
        .dbg_uart_rxd (),      // Debug interface: UART RXD (asynchronous)
        .dco_clk (),           // Fast oscillator (fast clock)
        .irq (),               // Maskable interrupts (14, 30 or 62)
        .lfxt_clk (),          // Low frequency oscillator (typ 32kHz)
        .nmi (),               // Non-maskable interrupt (asynchronous and non-glitchy)
        .reset_n (),           // Reset Pin (active low, asynchronous and non-glitchy)
        .scan_enable (),       // ASIC ONLY: Scan enable (active during scan shifting)
        .scan_mode (),         // ASIC ONLY: Scan mode
        .wkup (),              // ASIC ONLY: System Wake-up (asynchronous and non-glitchy)

        .pmem_addr         ( busms_addr_o [2*c  ][12:0] ), // Program Memory address
        .pmem_din          ( busms_din_o  [2*c  ][15:0] ), // Program Memory data input (optional)
        .pmem_cen          ( busms_en_o   [2*c  ]       ), // Program Memory chip enable (low active)
        .pmem_wen          ( busms_wen_o  [2*c  ]       ), // Program Memory write enable (low active) (optional)
        .pmem_dout         ( busms_dout_i [2*c  ][15:0] ), // Program Memory data output

        .dmem_addr         ( busms_addr_o [2*c+1][10:0] ), // Data Memory address
        .dmem_din          ( busms_din_o  [2*c+1][15:0] ), // Data Memory data input
        .dmem_cen          ( busms_en_o   [2*c+1]       ), // Data Memory chip enable (low active)
        .dmem_wen          ( busms_wen_o  [2*c+1]       ), // Data Memory write enable (low active)
        .dmem_dout         ( busms_dout_i [2*c+1][15:0] ), // Data Memory data output

        .per_addr          (),  // Peripheral address
        .per_din           (),  // Peripheral data input
        .per_en            (),  // Peripheral enable (high active)
        .per_we            (),  // Peripheral write enable (high active)
        .per_dout          (),  // Peripheral data output

        .r0                (),
        .r1                (),
        .r2                (),
        .r3                (),
        .r4                (),
        .r5                (),
        .r6                (),
        .r7                (),
        .r8                (),
        .r9                (),
        .r10               (),
        .r11               (),
        .r12               (),
        .r13               (),
        .r14               (),
        .r15               ()
      );

      if (CONFIG.USE_DEBUG == 1) begin : gen_ctm_stm
        osd_stm_mmsp430 #(
          .MAX_PKT_LEN (CONFIG.DEBUG_MAX_PKT_LEN)
        )
        u_stm (
          .clk             (clk),
          .rst             (rst_dbg),
          .id              (16'(DEBUG_BASEID + 1 + c*CONFIG.DEBUG_MODS_PER_CORE)),
          .debug_in        (dii_out[1+c*CONFIG.DEBUG_MODS_PER_CORE]),
          .debug_out       (dii_in [1+c*CONFIG.DEBUG_MODS_PER_CORE]),
          .debug_in_ready  (dii_out_ready[1 + c*CONFIG.DEBUG_MODS_PER_CORE]),
          .debug_out_ready (dii_in_ready [1 + c*CONFIG.DEBUG_MODS_PER_CORE]),
          .trace_port      (trace[c])
        );

        osd_ctm_mmsp430 #(
          .MAX_PKT_LEN (CONFIG.DEBUG_MAX_PKT_LEN)
        )
        u_ctm (
          .clk             (clk),
          .rst             (rst_dbg),
          .id              (16'(DEBUG_BASEID + 1 + c*CONFIG.DEBUG_MODS_PER_CORE + 1)),
          .debug_in        (dii_out[1 + c*CONFIG.DEBUG_MODS_PER_CORE + 1]),
          .debug_out       (dii_in [1 + c*CONFIG.DEBUG_MODS_PER_CORE + 1]),
          .debug_in_ready  (dii_out_ready[1 + c*CONFIG.DEBUG_MODS_PER_CORE + 1]),
          .debug_out_ready (dii_in_ready [1 + c*CONFIG.DEBUG_MODS_PER_CORE + 1]),
          .trace_port      (trace[c])
        );
      end
    end
  endgenerate

  generate
    if (CONFIG.USE_DEBUG != 0 && CONFIG.DEBUG_DEM_UART != 0) begin : gen_dem_uart
      osd_dem_uart_bb u_dem_uart (
        .clk              (clk),
        .rst              (rst_sys),
        .id               (16'(DEBUG_BASEID + CONFIG.DEBUG_MODS_PER_TILE - 1)),
        .irq              (pic_ints_i[0][2]),
        .debug_in         (dii_out[CONFIG.DEBUG_MODS_PER_TILE - 1]),
        .debug_out        (dii_in [CONFIG.DEBUG_MODS_PER_TILE - 1]),
        .debug_in_ready   (dii_out_ready[CONFIG.DEBUG_MODS_PER_TILE - 1]),
        .debug_out_ready  (dii_in_ready [CONFIG.DEBUG_MODS_PER_TILE - 1]),

        .bb_addr_i (bussl_addr_i [SLAVE_UART][3:0]),
        .bb_din_i  (bussl_din_i  [SLAVE_UART]),
        .bb_en_i   (bussl_en_i   [SLAVE_UART]),
        .bb_we_i   (bussl_we_i   [SLAVE_UART]),

        .bb_dout_o (bussl_dout_o [SLAVE_UART])
      );
    end
  endgenerate

  bb_bus_b3 #(
    .MASTERS        (NR_MASTERS),
    .SLAVES         (NR_SLAVES),
    .S0_ENABLE      (CONFIG.ENABLE_DM),
    .S0_RANGE_WIDTH (CONFIG.DM_RANGE_WIDTH),
    .S0_RANGE_MATCH (CONFIG.DM_RANGE_MATCH),
    .S1_ENABLE      (CONFIG.ENABLE_PGAS),
    .S1_RANGE_WIDTH (CONFIG.PGAS_RANGE_WIDTH),
    .S1_RANGE_MATCH (CONFIG.PGAS_RANGE_MATCH),
    .S2_RANGE_WIDTH (4),
    .S2_RANGE_MATCH (4'he),
    .S3_ENABLE      (CONFIG.ENABLE_BOOTROM),
    .S3_RANGE_WIDTH (4),
    .S3_RANGE_MATCH (4'hf),
    .S4_ENABLE      (CONFIG.DEBUG_DEM_UART),
    .S4_RANGE_WIDTH (28),
    .S4_RANGE_MATCH (28'h9000000)
  )
  u_bus (
    .clk_i                         (clk),
    .rst_i                         (rst_sys),

    // Masters
    .m_addr_i (busms_addr_o_flat),
    .m_din_i  (busms_din_o_flat),
    .m_en_i   (busms_en_o_flat),
    .m_we_i   (busms_we_o_flat),

    .m_dout_o (busms_dout_i_flat),

    // Slaves
    .s_addr_o (bussl_addr_i_flat),
    .s_din_o  (bussl_din_i_flat),
    .s_en_o   (bussl_en_i_flat),
    .s_we_o   (bussl_we_i_flat),

    .s_dout_i (bussl_dout_o_flat),

    .snoop_adr_o                   (snoop_adr),
    .snoop_en_o                    (snoop_enable),

    .bus_hold                      (1'b0),
    .bus_hold_ack                  ()
  );

  if (CONFIG.USE_DEBUG == 1) begin : gen_mam_dm_bb
    //MAM
    osd_mam_bb #(
      .ADDR_WIDTH  (16),
      .DATA_WIDTH  (DW),

      .MAX_PKT_LEN (CONFIG.DEBUG_MAX_PKT_LEN),
      .MEM_SIZE0   (CONFIG.LMEM_SIZE),
      .BASE_ADDR0  (0)
    )
    u_mam_dm_bb (
      .clk_i           (clk),
      .rst_i           (rst_dbg),

      .debug_in        (dii_out[0]),
      .debug_out       (dii_in [0]),
      .debug_in_ready  (dii_out_ready[0]),
      .debug_out_ready (dii_in_ready [0]),

      .id              (16'(DEBUG_BASEID)),

      .addr_o (mam_dm_addr_o),
      .din_o  (mam_dm_din_o),
      .en_o   (mam_dm_en_o),
      .we_o   (mam_dm_we_o),

      .dout_i (mam_dm_dout_i)
    );
  end

  if (CONFIG.ENABLE_DM) begin : gen_mam_bb_adapter
    mam_bb_adapter #(
      .AW (AW),
      .DW (DW)
    )
    u_mam_bb_adapter_dm (
      .bb_mam_addr_o (mam_dm_addr_o),
      .bb_mam_din_o  (mam_dm_din_o),
      .bb_mam_en_o   (mam_dm_en_o),
      .bb_mam_we_o   (mam_dm_we_o),

      .bb_mam_dout_i (mam_dm_dout_i),

      // Out
      .bb_out_addr_i (bb_mem_addr_i),
      .bb_out_din_i  (bb_mem_din_i),
      .bb_out_en_i   (bb_mem_en_i),
      .bb_out_we_i   (bb_mem_we_i),

      .bb_out_dout_o (bb_mem_dout_o),

      .bb_out_clk_i (bb_mem_clk_i),
      .bb_out_rst_i (bb_mem_rst_i),

      // In
      .bb_in_addr_i (bussl_addr_i [SLAVE_DM]),
      .bb_in_din_i  (bussl_din_i  [SLAVE_DM]),
      .bb_in_en_i   (bussl_en_i   [SLAVE_DM]),
      .bb_in_we_i   (bussl_we_i   [SLAVE_DM]),

      .bb_in_dout_o (bussl_dout_o [SLAVE_DM]),

      .bb_in_clk_i (clk),
      .bb_in_rst_i (rst_sys)
    );
  end
  else begin
    assign mam_dm_dout_i = '0;

    assign bussl_dout_o [SLAVE_DM] = '0;
  end

  if (!CONFIG.ENABLE_PGAS) begin : gen_tieoff_pgas
    assign bussl_dout_o [SLAVE_PGAS] = '0;
  end

  generate
    if ((CONFIG.ENABLE_DM) && (CONFIG.LMEM_STYLE == PLAIN)) begin : gen_sram
      bb_sram_sp #(
        .DW           (DW),
        .AW           (clog2_width(CONFIG.LMEM_SIZE)),
        .MEM_SIZE_BYTE  (CONFIG.LMEM_SIZE),
        .MEM_FILE       (MEM_FILE),
        .MEM_IMPL_TYPE  ("PLAIN")
      )
      u_ram (

        .bb_clk_i (bb_mem_clk_i),
        .bb_rst_i (bb_mem_rst_i),

        .bb_addr_i (bb_mem_addr_i[clog2_width(CONFIG.LMEM_SIZE)-1:0]),
        .bb_din_i  (bb_mem_din_i),
        .bb_en_i   (bb_mem_en_i),
        .bb_we_i   (bb_mem_we_i),

        .bb_dout_o (bb_mem_dout_o)
      );
    end
    else begin
      assign bb_ext_addr_i = bb_mem_addr_i;
      assign bb_ext_din_i  = bb_mem_din_i;
      assign bb_ext_en_i   = bb_mem_en_i;
      assign bb_ext_we_i   = bb_mem_we_i;

      assign bb_mem_dout_o = bb_ext_dout_o;
    end
  endgenerate

  networkadapter_ct #(
    .CONFIG   (CONFIG),
    .TILEID   (ID),
    .COREBASE (COREBASE)
  )
  u_na (
    `ifdef OPTIMSOC_CLOCKDOMAINS
    `ifdef OPTIMSOC_CDC_DYNAMIC
    .cdc_conf                     (cdc_conf[2:0]),
    .cdc_enable                   (cdc_enable),
    `endif
    `endif
    .clk                         (clk),
    .rst                         (rst_sys),

    .noc_in_ready                (noc_in_ready),
    .noc_out_flit                (noc_out_flit),
    .noc_out_last                (noc_out_last),
    .noc_out_valid               (noc_out_valid),

    .noc_in_flit                 (noc_in_flit),
    .noc_in_last                 (noc_in_last),
    .noc_in_valid                (noc_in_valid),
    .noc_out_ready               (noc_out_ready),

    .irq                         (pic_ints_i[0][4:3]),

    // Masters
    .bbm_addr_o (busms_addr_o [NR_MASTERS-1]),
    .bbm_din_o  (busms_din_o  [NR_MASTERS-1]),
    .bbm_en_o   (busms_en_o   [NR_MASTERS-1]),
    .bbm_we_o   (busms_we_o   [NR_MASTERS-1]),

    .bbm_dout_i (busms_dout_i [NR_MASTERS-1]),

    // Slaves
    .bbs_addr_i (bussl_addr_i [SLAVE_NA]),
    .bbs_din_i  (bussl_din_i  [SLAVE_NA]),
    .bbs_en_i   (bussl_en_i   [SLAVE_NA]),
    .bbs_we_i   (bussl_we_i   [SLAVE_NA]),

    .bbs_dout_o (bussl_dout_o [SLAVE_NA])
  );

  generate
    if (CONFIG.ENABLE_BOOTROM) begin : gen_bootrom
      bootrom u_bootrom (
        .clk                      (clk),
        .rst                      (rst_sys),

        // Outputs
        .bb_dout_o (bussl_dout_o [SLAVE_BOOT]),

        // Inputs
        .bb_addr_i (bussl_addr_i [SLAVE_BOOT]),
        .bb_din_i  (bussl_din_i  [SLAVE_BOOT]),
        .bb_en_i   (bussl_en_i   [SLAVE_BOOT]),
        .bb_we_i   (bussl_we_i   [SLAVE_BOOT])
      );
    end
    else begin
      assign bussl_dout_o [SLAVE_BOOT] = 'x;
    end
  endgenerate
endmodule
