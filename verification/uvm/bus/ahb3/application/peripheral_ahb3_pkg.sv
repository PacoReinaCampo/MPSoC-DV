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
//              Package                                                       //
//              Bus Functional Model                                          //
//              AMBA3 AHB-Lite Bus Interface                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2018-2019 by the author(s)
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

package peripheral_ahb3_pkg;

  localparam HADDR_SIZE = 32;
  localparam HDATA_SIZE = 32;

  // HTRANS
  localparam HTRANS_IDLE = 2'b00;
  localparam HTRANS_BUSY = 2'b01;
  localparam HTRANS_NONSEQ = 2'b10;
  localparam HTRANS_SEQ = 2'b11;

  // HSIZE
  localparam HSIZE_B8 = 3'b000;
  localparam HSIZE_B16 = 3'b001;
  localparam HSIZE_B32 = 3'b010;
  localparam HSIZE_B64 = 3'b011;
  localparam HSIZE_B128 = 3'b100;  // 4-word line
  localparam HSIZE_B256 = 3'b101;  // 8-word line
  localparam HSIZE_B512 = 3'b110;
  localparam HSIZE_B1024 = 3'b111;
  localparam HSIZE_BYTE = HSIZE_B8;
  localparam HSIZE_HWORD = HSIZE_B16;
  localparam HSIZE_WORD = HSIZE_B32;
  localparam HSIZE_DWORD = HSIZE_B64;

  // HBURST
  localparam HBURST_SINGLE = 3'b000;
  localparam HBURST_INCR = 3'b001;
  localparam HBURST_WRAP4 = 3'b010;
  localparam HBURST_INCR4 = 3'b011;
  localparam HBURST_WRAP8 = 3'b100;
  localparam HBURST_INCR8 = 3'b101;
  localparam HBURST_WRAP16 = 3'b110;
  localparam HBURST_INCR16 = 3'b111;

  // HPROT
  localparam HPROT_OPCODE = 4'b0000;
  localparam HPROT_DATA = 4'b0001;
  localparam HPROT_USER = 4'b0000;
  localparam HPROT_PRIVILEGED = 4'b0010;
  localparam HPROT_NON_BUFFERABLE = 4'b0000;
  localparam HPROT_BUFFERABLE = 4'b0100;
  localparam HPROT_NON_CACHEABLE = 4'b0000;
  localparam HPROT_CACHEABLE = 4'b1000;

  // HRESP
  localparam HRESP_OKAY = 1'b0;
  localparam HRESP_ERROR = 1'b1;

endpackage
