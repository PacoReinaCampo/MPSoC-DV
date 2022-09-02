-- Converted from bench/verilog/regression/mpsoc_spram_testbench.sv
-- by verilog2vhdl - QueenField

--//////////////////////////////////////////////////////////////////////////////
--                                            __ _      _     _               //
--                                           / _(_)    | |   | |              //
--                __ _ _   _  ___  ___ _ __ | |_ _  ___| | __| |              //
--               / _` | | | |/ _ \/ _ \ '_ \|  _| |/ _ \ |/ _` |              //
--              | (_| | |_| |  __/  __/ | | | | | |  __/ | (_| |              //
--               \__, |\__,_|\___|\___|_| |_|_| |_|\___|_|\__,_|              //
--                  | |                                                       //
--                  |_|                                                       //
--                                                                            //
--                                                                            //
--              MPSoC-RISCV CPU                                               //
--              Master Slave Interface Tesbench                               //
--              AMBA3 AHB-Lite Bus Interface                                  //
--                                                                            //
--//////////////////////////////////////////////////////////////////////////////

-- Copyright (c) 2018-2019 by the author(s)
-- *
-- * Permission is hereby granted, free of charge, to any person obtaining a copy
-- * of this software and associated documentation files (the "Software"), to deal
-- * in the Software without restriction, including without limitation the rights
-- * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- * copies of the Software, and to permit persons to whom the Software is
-- * furnished to do so, subject to the following conditions:
-- *
-- * The above copyright notice and this permission notice shall be included in
-- * all copies or substantial portions of the Software.
-- *
-- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- * THE SOFTWARE.
-- *
-- * =============================================================================
-- * Author(s):
-- *   Paco Reina Campo <pacoreinacampo@queenfield.tech>
-- */

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.mpsoc_spram_ahb3_pkg.all;

entity mpsoc_spram_synthesis is
  generic (
    MEM_SIZE          : integer := 256;  --Memory in Bytes
    MEM_DEPTH         : integer := 256;  --Memory depth
    PLEN              : integer := 8;
    XLEN              : integer := 32;
    TECHNOLOGY        : string  := "GENERIC";
    REGISTERED_OUTPUT : string  := "NO"
  );
  port (
    HRESETn : in std_logic;
    HCLK    : in std_logic;

    --AHB3 Slave Interfaces (receive data from AHB Masters)
    --AHB3 Masters connect to these ports
    HSEL      : in  std_logic;
    HADDR     : in  std_logic_vector(PLEN-1 downto 0);
    HWDATA    : in  std_logic_vector(XLEN-1 downto 0);
    HRDATA    : out std_logic_vector(XLEN-1 downto 0);
    HWRITE    : in  std_logic;
    HSIZE     : in  std_logic_vector(2 downto 0);
    HBURST    : in  std_logic_vector(2 downto 0);
    HPROT     : in  std_logic_vector(3 downto 0);
    HTRANS    : in  std_logic_vector(1 downto 0);
    HMASTLOCK : in  std_logic;
    HREADYOUT : out std_logic;
    HREADY    : in  std_logic;
    HRESP     : out std_logic
  );
end mpsoc_spram_synthesis;

architecture RTL of mpsoc_spram_synthesis is

  --////////////////////////////////////////////////////////////////
  --
  -- Components
  --
  component mpsoc_ahb3_spram
    generic (
      MEM_SIZE          : integer := 256;  --Memory in Bytes
      MEM_DEPTH         : integer := 256;  --Memory depth
      PLEN              : integer := 8;
      XLEN              : integer := 32;
      TECHNOLOGY        : string  := "GENERIC";
      REGISTERED_OUTPUT : string  := "NO"
    );
    port (
      HRESETn : in std_logic;
      HCLK    : in std_logic;

      --AHB3 Slave Interfaces (receive data from AHB Masters)
      --AHB3 Masters connect to these ports
      HSEL      : in  std_logic;
      HADDR     : in  std_logic_vector(PLEN-1 downto 0);
      HWDATA    : in  std_logic_vector(XLEN-1 downto 0);
      HRDATA    : out std_logic_vector(XLEN-1 downto 0);
      HWRITE    : in  std_logic;
      HSIZE     : in  std_logic_vector(2 downto 0);
      HBURST    : in  std_logic_vector(2 downto 0);
      HPROT     : in  std_logic_vector(3 downto 0);
      HTRANS    : in  std_logic_vector(1 downto 0);
      HMASTLOCK : in  std_logic;
      HREADYOUT : out std_logic;
      HREADY    : in  std_logic;
      HRESP     : out std_logic
    );
  end component;

begin
  --////////////////////////////////////////////////////////////////
  --
  -- Module Body
  --

  --DUT AHB3
  ahb3_spram : mpsoc_ahb3_spram
    generic map (
      MEM_SIZE          => MEM_SIZE,
      MEM_DEPTH         => MEM_DEPTH,
      PLEN              => PLEN,
      XLEN              => XLEN,
      TECHNOLOGY        => TECHNOLOGY,
      REGISTERED_OUTPUT => REGISTERED_OUTPUT
    )
    port map (
      HRESETn => HRESETn,
      HCLK    => HCLK,

      HSEL      => HSEL,
      HADDR     => HADDR,
      HWDATA    => HWDATA,
      HRDATA    => HRDATA,
      HWRITE    => HWRITE,
      HSIZE     => HSIZE,
      HBURST    => HBURST,
      HPROT     => HPROT,
      HTRANS    => HTRANS,
      HMASTLOCK => HMASTLOCK,
      HREADYOUT => HREADYOUT,
      HREADY    => HREADY,
      HRESP     => HRESP
    );
end RTL;
