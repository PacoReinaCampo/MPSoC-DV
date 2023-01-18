--------------------------------------------------------------------------------
--                                            __ _      _     _               --
--                                           / _(_)    | |   | |              --
--                __ _ _   _  ___  ___ _ __ | |_ _  ___| | __| |              --
--               / _` | | | |/ _ \/ _ \ '_ \|  _| |/ _ \ |/ _` |              --
--              | (_| | |_| |  __/  __/ | | | | | |  __/ | (_| |              --
--               \__, |\__,_|\___|\___|_| |_|_| |_|\___|_|\__,_|              --
--                  | |                                                       --
--                  |_|                                                       --
--                                                                            --
--                                                                            --
--              Peripheral-NTM for MPSoC                                      --
--              Neural Turing Machine for MPSoC                               --
--                                                                            --
--------------------------------------------------------------------------------

-- Copyright (c) 2020-2021 by the author(s)
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
--
--------------------------------------------------------------------------------
-- Author(s):
--   Paco Reina Campo <pacoreinacampo@queenfield.tech>

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.ntm_arithmetic_pkg.all;
use work.ntm_math_pkg.all;

entity ntm_design_adder is
  generic (
    DATA_SIZE : positive := 4
    );
  port (
    CLK : in std_logic;
    RST : in std_logic;

    DATA_A_IN : in  unsigned(DATA_SIZE-1 downto 0);
    DATA_B_IN : in  unsigned(DATA_SIZE-1 downto 0);
    DATA_OUT  : out unsigned(DATA_SIZE downto 0)
    );
end entity ntm_design_adder;

architecture ntm_design_adder_architecture of ntm_design_adder is

begin

  -----------------------------------------------------------------------
  -- Body
  -----------------------------------------------------------------------

  design : process (CLK, RST) is
    variable carry_int : std_logic;
  begin
    if(RST = '0') then
      DATA_OUT <= (others => '0');
    elsif(rising_edge(CLK)) then
      carry_int := '0';

      for index_loop in 0 to DATA_SIZE-1 loop
        if(index_loop = 0) then
          DATA_OUT(index_loop) <= DATA_A_IN(index_loop) xor DATA_B_IN(index_loop);
        else
          DATA_OUT(index_loop) <= DATA_A_IN(index_loop) xor DATA_B_IN(index_loop) xor carry_int;
        end if;

        carry_int := (DATA_A_IN(index_loop) and DATA_B_IN(index_loop)) or
                     (DATA_A_IN(index_loop) and carry_int) or
                     (DATA_B_IN(index_loop) and carry_int);
      end loop;

      DATA_OUT(DATA_SIZE) <= carry_int;
    end if;
  end process design;

end architecture ntm_design_adder_architecture;
