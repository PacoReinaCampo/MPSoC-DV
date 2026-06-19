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

library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.std_logic_textio.all;

package peripheral_types_model_pkg is
  type integer_array is array (integer range <>) of integer;

  procedure TestInit (TestName        : string; variable Results : inout integer_array);
  procedure TestInit (TestName        : string; variable Results : inout integer_array; variable Count : inout natural);
  procedure AccumulateResults (IntVal : integer; Num : integer; variable Results : inout integer_array);
  procedure PrintResults (Results     : integer_array);

end peripheral_types_model_pkg;

package body peripheral_types_model_pkg is
  procedure TestInit (TestName : string; variable Results : inout integer_array) is
  begin
    write(OUTPUT, LF&LF & TestName & LF);
    Results := (Results'range => 0);
    write(OUTPUT, "1st 20 values = ");
  end;

  procedure TestInit (TestName : string; variable Results : inout integer_array; variable Count : inout natural) is
  begin
    Count   := Count + 1;
    write(OUTPUT, LF&LF & "Test " & integer'image(Count) & ": " & TestName & LF);
    Results := (Results'range => 0);
    write(OUTPUT, "1st 20 values = ");
  end;

  procedure AccumulateResults (IntVal : integer; Num : integer; variable Results : inout integer_array) is
  begin
    Results(IntVal) := Results(IntVal) + 1;
    if Num < 20 then
      write(OUTPUT, integer'image(IntVal) & " ");
    end if;
  end;

  procedure PrintResults (Results : integer_array) is
  begin
    write(OUTPUT, LF & "Accumulated Results.  Expecting approximately 1000 of each per weight." & LF);
    for i in Results'range loop
      if Results(i) > 0 then
        write(OUTPUT, "**  ");
        write(OUTPUT, integer'image(i) & " : " & integer'image(Results(i)) & LF);
      end if;
    end loop;
  end;
end peripheral_types_model_pkg;
