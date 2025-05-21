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

use std.env.all;

library osvvm;
use osvvm.RandomPkg.all;
use osvvm.CoveragePkg.all;

entity peripheral_types_testbench is
end entity peripheral_types_testbench;

use work.peripheral_types_model_pkg.all;
use work.peripheral_types_design_pkg.all;

architecture peripheral_types_testbench_architecture of peripheral_types_testbench is

  ------------------------------------------------------------------------------
  -- Constants
  ------------------------------------------------------------------------------

  -- width of adder inputs
  constant DATA_SIZE : positive := 8;

  -- clock period
  constant PERIOD : time := 20 ns;

  -- how many bins should be generated
  constant C_MAX_BINS : natural := 16;

  ------------------------------------------------------------------------------
  -- Signals
  ------------------------------------------------------------------------------

  -- GLOBAL
  signal clk_int : std_logic := '0';
  signal rst_int : std_logic := '0';

  -- CONTROL
  -- coverage object of (protected) type CovPType
  shared variable sv_coverage : CovPType;

  -- SCALAR ADDER
  signal data_a_in_int : unsigned(DATA_SIZE-1 downto 0);
  signal data_b_in_int : unsigned(DATA_SIZE-1 downto 0);

  signal data_out_model_int  : unsigned(DATA_SIZE downto 0) := (others => '0');
  signal data_out_design_int : unsigned(DATA_SIZE downto 0) := (others => '0');

begin

  ------------------------------------------------------------------------------
  -- Body
  ------------------------------------------------------------------------------

  -- clk generation
  clk_int <= not clk_int after PERIOD/2;

  -- rst generation
  rst_int <= '1' after 100 ns;

  -- MODEL
  model_adder : peripheral_types_model
    generic map (
      DATA_SIZE => DATA_SIZE
      )
    port map (
      CLK => clk_int,
      RST => rst_int,

      DATA_A_IN => data_a_in_int,
      DATA_B_IN => data_b_in_int,
      DATA_OUT  => data_out_model_int
      );

  -- DUT
  design_adder : peripheral_types_design
    generic map (
      DATA_SIZE => DATA_SIZE
      )
    port map (
      CLK => clk_int,
      RST => rst_int,

      DATA_A_IN => data_a_in_int,
      DATA_B_IN => data_b_in_int,
      DATA_OUT  => data_out_design_int
      );

  -- stimulus & coverage of adder inputs
  StimCoverageProcess : process is
    -- holds the two random values from sv_coverage object
    variable v_adder_in : integer_vector(0 to 1);
  begin
    data_a_in_int <= (others => '0');
    data_b_in_int <= (others => '0');

    -- cross bins for all possible combinations (very slow on large vector widths):
    -- sv_coverage.AddCross(GenBin(0, 2**DATA_SIZE-1), GenBin(0, 2**DATA_SIZE-1));

    -- cross bins for maximum of C_MAX_BINS slices with same width:
    sv_coverage.AddCross(GenBin(0, 2**DATA_SIZE-1, C_MAX_BINS), GenBin(0, 2**DATA_SIZE-1, C_MAX_BINS));

    -- cross bins for corner cases (min against max):
    sv_coverage.AddCross(GenBin(0), GenBin(2**DATA_SIZE-1));
    sv_coverage.AddCross(GenBin(2**DATA_SIZE-1), GenBin(0));

    -- loop until reaching coverage goal
    while not sv_coverage.IsCovered loop
      wait until rising_edge(clk_int);
      -- generate random values depending on coverage hole
      v_adder_in := sv_coverage.RandCovPoint;

      data_a_in_int <= to_unsigned(v_adder_in(0), DATA_SIZE);
      data_b_in_int <= to_unsigned(v_adder_in(1), DATA_SIZE);

      -- save generated random values in coverage object
      sv_coverage.ICover(v_adder_in);
    end loop;

    wait for 2*PERIOD;
    -- print coverage report
    report("CovBin Coverage details");
    sv_coverage.WriteBin;
    stop;
  end process StimCoverageProcess;

  -- check if outputs of both adders are equal
  CheckerProcess : process is
  begin
    wait until rising_edge(clk_int);
    assert data_out_model_int = data_out_design_int
      report "FAILURE: data_out_model_int (0x" & to_hstring(data_out_model_int) & ") & data_out_design_int (0x" & to_hstring(data_out_design_int) & ") are not equal!"
      severity failure;
  end process CheckerProcess;

end architecture peripheral_types_testbench_architecture;
