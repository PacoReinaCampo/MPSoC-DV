-- Converted from mpsoc_spram_synthesis.sv
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
--              MSP430 CPU                                                    //
--              Processing Unit                                               //
--                                                                            //
--//////////////////////////////////////////////////////////////////////////////

-- Copyright (c) 2015-2016 by the author(s)
-- *
-- * Redistribution and use in source and binary forms, with or without
-- * modification, are permitted provided that the following conditions
-- * are met:
-- *     * Redistributions of source code must retain the above copyright
-- *       notice, this list of conditions and the following disclaimer.
-- *     * Redistributions in binary form must reproduce the above copyright
-- *       notice, this list of conditions and the following disclaimer in the
-- *       documentation and/or other materials provided with the distribution.
-- *     * Neither the name of the authors nor the names of its contributors
-- *       may be used to endorse or promote products derived from this software
-- *       without specific prior written permission.
-- *
-- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
-- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
-- * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
-- * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
-- * OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
-- * THE POSSIBILITY OF SUCH DAMAGE
-- *
-- * =============================================================================
-- * Author(s):
-- *   Olivier Girard <olgirard@gmail.com>
-- *   Paco Reina Campo <pacoreinacampo@queenfield.tech>
-- */

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mpsoc_spram_synthesis is
  generic (
    AW       : integer := 6;   -- Address bus
    DW       : integer := 16;  -- Data bus
    MEM_SIZE : integer := 256  -- Memory size in bytes
  );
  port (
    -- Address bus
    -- Data bus
    -- Memory size in bytes
    ram_clk : in std_logic;             -- RAM clock

    ram_addr : in  std_logic_vector(AW-1 downto 0);  -- RAM address
    ram_dout : out std_logic_vector(DW-1 downto 0);  -- RAM data output
    ram_din  : in  std_logic_vector(DW-1 downto 0);  -- RAM data input
    ram_cen  : in  std_logic;                        -- RAM chip enable (low active)
    ram_wen  : in  std_logic_vector(1 downto 0)      -- RAM write enable (low active)
  );
end mpsoc_spram_synthesis;

architecture RTL of mpsoc_spram_synthesis is
  component msp430_ram
    generic (
      AW       : integer := 6;   -- Address bus
      DW       : integer := 16;  -- Data bus
      MEM_SIZE : integer := 256  -- Memory size in bytes
    );
    port (
      ram_clk : in std_logic;           -- RAM clock

      ram_addr : in  std_logic_vector(AW-1 downto 0);  -- RAM address
      ram_dout : out std_logic_vector(DW-1 downto 0);  -- RAM data output
      ram_din  : in  std_logic_vector(DW-1 downto 0);  -- RAM data input
      ram_cen  : in  std_logic;                        -- RAM chip enable (low active)
      ram_wen  : in  std_logic_vector(1 downto 0)      -- RAM write enable (low active)    
    );
  end component;

begin

  --////////////////////////////////////////////////////////////////
  --
  -- Module Body
  --

  --DUT AHB3
  ram : msp430_ram
    generic map (
      AW       => AW,
      DW       => DW,
      MEM_SIZE => MEM_SIZE
    )
    port map (
      ram_clk => ram_clk,

      ram_addr => ram_addr,
      ram_dout => ram_dout,
      ram_din  => ram_din,
      ram_cen  => ram_cen,
      ram_wen  => ram_wen
    );
end RTL;
