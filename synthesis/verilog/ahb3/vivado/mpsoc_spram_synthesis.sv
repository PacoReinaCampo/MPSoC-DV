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

module mpsoc_spram_synthesis #(
  parameter MEM_SIZE          = 256,  //Memory in Bytes
  parameter MEM_DEPTH         = 256,  //Memory depth
  parameter PLEN              = 8,
  parameter XLEN              = 32,
  parameter TECHNOLOGY        = "GENERIC",
  parameter REGISTERED_OUTPUT = "NO"
)
  (
    input                 HRESETn,
    input                 HCLK,

    input                 HSEL,
    input      [PLEN-1:0] HADDR,
    input      [XLEN-1:0] HWDATA,
    output reg [XLEN-1:0] HRDATA,
    input                 HWRITE,
    input      [     2:0] HSIZE,
    input      [     2:0] HBURST,
    input      [     3:0] HPROT,
    input      [     1:0] HTRANS,
    input                 HMASTLOCK,
    output reg            HREADYOUT,
    input                 HREADY,
    output                HRESP
  );

  //////////////////////////////////////////////////////////////////
  //
  // Module Body
  //

  //DUT AHB3
  mpsoc_ahb3_spram #(
    .MEM_SIZE          ( MEM_SIZE ),
    .MEM_DEPTH         ( MEM_DEPTH ),
    .PLEN              ( PLEN ),
    .XLEN              ( XLEN ),
    .TECHNOLOGY        ( TECHNOLOGY ),
    .REGISTERED_OUTPUT ( REGISTERED_OUTPUT )
  )
  ahb3_spram (
    .HRESETn   ( HRESETn ),
    .HCLK      ( HCLK    ),

    .HSEL      ( HSEL      ),
    .HADDR     ( HADDR     ),
    .HWDATA    ( HWDATA    ),
    .HRDATA    ( HRDATA    ),
    .HWRITE    ( HWRITE    ),
    .HSIZE     ( HSIZE     ),
    .HBURST    ( HBURST    ),
    .HPROT     ( HPROT     ),
    .HTRANS    ( HTRANS    ),
    .HMASTLOCK ( HMASTLOCK ),
    .HREADYOUT ( HREADYOUT ),
    .HREADY    ( HREADY    ),
    .HRESP     ( HRESP     )
  );
endmodule
