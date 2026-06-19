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

use std.textio.all;
use ieee.std_logic_textio.all;

library osvvm;
use osvvm.RandomBasePkg.all;
use osvvm.RandomPkg.all;

use work.peripheral_types_model_pkg.all;

entity peripheral_types_testbench is
end peripheral_types_testbench;

architecture test of peripheral_types_testbench is
begin
  RandomGenProc : process
    variable RV : RandomPType;

    variable DataInt      : integer;
    variable DataSlv      : std_logic_vector(3 downto 0);
    variable DataUnsigned : unsigned(3 downto 0);
    variable DataSigned   : signed(4 downto 0);

    -- Statistics
    variable TestNum  : integer                     := 0;
    variable Results  : integer_array (-100 to 100) := (others => 0);
    variable writebuf : line;

  begin

    RV.InitSeed(RV'instance_name);  -- Initialize Seed.  Typically done one time

    write(OUTPUT, LF&LF& "Random Range Tests");
    TestInit("RandInt(0, 7)  Range 0-7", Results, TestNum);  -- 1
    for i in 1 to 8000 loop             -- Loop 1000x per value
      DataInt := RV.RandInt(0, 7);
      AccumulateResults(DataInt, i, Results);
    end loop;
    PrintResults (Results);

    TestInit("RandInt(1, 13, (3, 7, 11)  Range 1-13, Exclude 3,7,11", Results, TestNum);  -- 2
    for i in 1 to 10000 loop            -- Loop 1000x per value
      DataInt := RV.RandInt(1, 13, (3, 7, 11));
      AccumulateResults(DataInt, i, Results);
    end loop;
    PrintResults (Results);

    TestInit("RandSlv(0, 4, 4)  Range 0-4", Results, TestNum);  -- 3
    for i in 1 to 5000 loop             -- Loop 1000x per value
      DataSlv := RV.RandSlv(0, 4, 4);
      AccumulateResults(to_integer(unsigned(DataSlv)), i, Results);
    end loop;
    PrintResults (Results);

    TestInit("RandUnsigned(4, 9, (0 => 7), 4)  Range 4-9, Exclude 7", Results, TestNum);  -- 4
    for i in 1 to 5000 loop             -- Loop 1000x per value
      DataUnsigned := RV.RandUnsigned(4, 9, (0 => 7), 4);  -- only 1 exclude element
      AccumulateResults(to_integer(DataUnsigned), i, Results);
    end loop;
    PrintResults (Results);

    TestInit("RandSigned(-4, 3, 5)", Results, TestNum);  -- 5
    for i in 1 to 8000 loop             -- Loop 1000x per value
      DataSigned := RV.RandSigned(-4, 3, 5);
      AccumulateResults(to_integer(DataSigned), i, Results);
    end loop;
    PrintResults (Results);

    write(OUTPUT, LF&LF& "Random Set Tests");
    TestNum := 0;
    TestInit("RandInt( (-50, -22, -14, -7, -2, 0, 3, 7, 9, 27, 49, 89, 99)).  Set: (-50, -22, -14, -7, -2, 0, 3, 7, 9, 27, 49, 89, 99)", Results, TestNum);  -- 1
    for i in 1 to 13000 loop            -- Loop 1000x per value
      DataInt := RV.RandInt((-50, -22, -14, -7, -2, 0, 3, 7, 9, 27, 49, 89, 99));
      AccumulateResults(DataInt, i, Results);
    end loop;
    PrintResults (Results);

    TestInit("RandInt( (-5, -1, 3, 7, 11), (-1, 7) )  Set (-5, -1, 3, 7, 11), Exclude (-1, 7)", Results, TestNum);  -- 2
    for i in 1 to 3000 loop             -- Loop 1000x per value
      DataInt := RV.RandInt((-5, -1, 3, 7, 11), (-1, 7));
      AccumulateResults(DataInt, i, Results);
    end loop;
    PrintResults (Results);

    TestInit("RandSlv( (1, 2, 3, 7, 11), 4)", Results, TestNum);  -- 3
    for i in 1 to 5000 loop             -- Loop 1000x per value
      DataSlv := RV.RandSlv((1, 2, 3, 7, 11), 4);
      AccumulateResults(to_integer(unsigned(DataSlv)), i, Results);
    end loop;
    PrintResults (Results);

    TestInit("RandUnsigned( (1, 2, 3, 11), (1 => 3), 4)", Results, TestNum);  -- 4
    for i in 1 to 3000 loop             -- Loop 1000x per value
      DataUnsigned := RV.RandUnsigned((1, 2, 3, 11), (1 => 3), 4);  -- 1 element middle
      AccumulateResults(to_integer(DataUnsigned), i, Results);
    end loop;
    PrintResults (Results);

    TestInit("RandSigned( (-5, -1, 3, 7, 11), 5)", Results, TestNum);  -- 5
    for i in 1 to 5000 loop             -- Loop 1000x per value
      DataSigned := RV.RandSigned((-5, -1, 3, 7, 11), 5);
      AccumulateResults(to_integer(DataSigned), i, Results);
    end loop;
    PrintResults (Results);

    write(OUTPUT, LF&LF& "Weighted Distribution Tests");
    TestNum := 0;
    -- There is also DistSlv, DistUnsigned, DistSigned
    TestInit("RV.DistInt( (7, 2, 1) ) ", Results, TestNum);
    for i in 1 to 10000 loop            -- Loop 1000x per distribute weight
      DataInt := RV.DistInt((7, 2, 1));
      AccumulateResults(DataInt, i, Results);
    end loop;
    PrintResults (Results);

    TestInit("RV.DistInt( (0, 2, 0, 4, 0, 6, 0, 8, 0, 10), (3,9) );", Results, TestNum);
    for i in 1 to 16000 loop            -- Loop 1000x per distribute weight
      DataInt := RV.DistInt((0, 2, 0, 4, 0, 6, 0, 8, 0, 10), (3, 9));
      AccumulateResults(DataInt, i, Results);
    end loop;
    PrintResults (Results);

    write(OUTPUT, LF&LF& "Weighted Distribution with Value");
    TestNum := 0;
    -- There is also DistValSlv, DistValUnsigned, DistValSigned
    TestInit("RV.DistValInt( ((1, 7), (3, 2), (5, 1)) ) ", Results, TestNum);
    for i in 1 to 10000 loop            -- Loop 1000x per distribute weight
      DataInt := RV.DistValInt(((1, 7), (3, 2), (5, 1)));
      AccumulateResults(DataInt, i, Results);
    end loop;
    PrintResults (Results);

    TestInit("RV.DistValInt( ((1, 7), (3, 2), (5, 1)), (1=>3) ) Exclude 3", Results, TestNum);
    for i in 1 to 8000 loop             -- Loop 1000x per distribute weight
      DataInt := RV.DistValInt(((1, 7), (3, 2), (5, 1)), (1 => 3));
      AccumulateResults(DataInt, i, Results);
    end loop;
    PrintResults (Results);

    write(OUTPUT, LF&LF& "Mode Direct Tests");
    -- There are also real return values
    TestNum := 0;
    TestInit("Integer Uniform:  Integer Range (0 to 9)", Results, TestNum);
    for i in 1 to 10000 loop            -- Loop 1000x per value
      DataInt := RV.uniform(0, 9);
      AccumulateResults(DataInt, i, Results);
    end loop;
    PrintResults (Results);

    TestInit("Integer FavorSmall:  Integer Range (0 to 9)", Results, TestNum);
    for i in 1 to 10000 loop            -- Loop 1000x per value
      DataInt := RV.FavorSmall(0, 9);
      AccumulateResults(DataInt, i, Results);
    end loop;
    PrintResults (Results);

    TestInit("Integer FavorBig:  Integer Range (0 to 9)", Results, TestNum);
    for i in 1 to 10000 loop            -- Loop 1000x per value
      DataInt := RV.FavorBig(0, 9);
      AccumulateResults(DataInt, i, Results);
    end loop;
    PrintResults (Results);

    TestInit("Integer NORMAL, 50.0, 5.0 range -100 to 100", Results, TestNum);
    for i in 1 to 100000 loop           -- Loop 1000x per value
      DataInt := RV.Normal(50.0, 5.0, -100, 100);
      AccumulateResults(DataInt, i, Results);
    end loop;
    PrintResults (Results);

    TestInit("Integer Poisson, 10.0, -100, 100", Results, TestNum);
    for i in 1 to 10000 loop            -- Loop 1000x per value
      DataInt := RV.Poisson(10.0, -100, 100);
      AccumulateResults(DataInt, i, Results);
    end loop;
    PrintResults (Results);

    wait;
  end process RandomGenProc;

end test;
