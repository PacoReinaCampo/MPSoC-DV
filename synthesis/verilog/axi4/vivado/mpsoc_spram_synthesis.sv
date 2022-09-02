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
//              Master Slave Interface Tesbench                               //
//              AMBA3 AHB-Lite Bus Interface                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

/* Copyright (c) 2018-2019 by the author(s)
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

module mpsoc_spram_testbench;

  //////////////////////////////////////////////////////////////////
  //
  // Constants
  //

  localparam XLEN = 64;
  localparam PLEN = 64;

  localparam SYNC_DEPTH = 3;
  localparam TECHNOLOGY = "GENERIC";

  //Memory parameters
  parameter DEPTH   = 256;
  parameter MEMFILE = "";

  //////////////////////////////////////////////////////////////////
  //
  // Variables
  //

  //Common signals
  wire                                     HRESETn;
  wire                                     HCLK;

  //AHB3 signals
  wire                                     mst_spram_HSEL;
  wire               [PLEN           -1:0] mst_spram_HADDR;
  wire               [XLEN           -1:0] mst_spram_HWDATA;
  wire               [XLEN           -1:0] mst_spram_HRDATA;
  wire                                     mst_spram_HWRITE;
  wire               [                2:0] mst_spram_HSIZE;
  wire               [                2:0] mst_spram_HBURST;
  wire               [                3:0] mst_spram_HPROT;
  wire               [                1:0] mst_spram_HTRANS;
  wire                                     mst_spram_HMASTLOCK;
  wire                                     mst_spram_HREADY;
  wire                                     mst_spram_HREADYOUT;
  wire                                     mst_spram_HRESP;

  //////////////////////////////////////////////////////////////////
  //
  // Module Body
  //

  //DUT AHB3
  mpsoc_ahb3_spram #(
    .MEM_SIZE          ( 256 ),
    .MEM_DEPTH         ( 256 ),
    .PLEN              ( PLEN ),
    .XLEN              ( XLEN ),
    .TECHNOLOGY        ( TECHNOLOGY ),
    .REGISTERED_OUTPUT ( "NO" )
  )
  ahb3_spram (
    .HRESETn   ( HRESETn ),
    .HCLK      ( HCLK    ),

    .HSEL      ( mst_spram_HSEL      ),
    .HADDR     ( mst_spram_HADDR     ),
    .HWDATA    ( mst_spram_HWDATA    ),
    .HRDATA    ( mst_spram_HRDATA    ),
    .HWRITE    ( mst_spram_HWRITE    ),
    .HSIZE     ( mst_spram_HSIZE     ),
    .HBURST    ( mst_spram_HBURST    ),
    .HPROT     ( mst_spram_HPROT     ),
    .HTRANS    ( mst_spram_HTRANS    ),
    .HMASTLOCK ( mst_spram_HMASTLOCK ),
    .HREADYOUT ( mst_spram_HREADYOUT ),
    .HREADY    ( mst_spram_HREADY    ),
    .HRESP     ( mst_spram_HRESP     )
  );
endmodule
