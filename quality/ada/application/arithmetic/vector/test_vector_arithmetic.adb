-----------------------------------------------------------------------------------
--                                            __ _      _     _                  --
--                                           / _(_)    | |   | |                 --
--                __ _ _   _  ___  ___ _ __ | |_ _  ___| | __| |                 --
--               / _` | | | |/ _ \/ _ \ '_ \|  _| |/ _ \ |/ _` |                 --
--              | (_| | |_| |  __/  __/ | | | | | |  __/ | (_| |                 --
--               \__, |\__,_|\___|\___|_| |_|_| |_|\___|_|\__,_|                 --
--                  | |                                                          --
--                  |_|                                                          --
--                                                                               --
--                                                                               --
--              Peripheral-NTM for MPSoC                                         --
--              Neural Turing Machine for MPSoC                                  --
--                                                                               --
-----------------------------------------------------------------------------------

-----------------------------------------------------------------------------------
--                                                                               --
-- Copyright (c) 2020-2024 by the author(s)                                      --
--                                                                               --
-- Permission is hereby granted, free of charge, to any person obtaining a copy  --
-- of this software and associated documentation files (the "Software"), to deal --
-- in the Software without restriction, including without limitation the rights  --
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell     --
-- copies of the Software, and to permit persons to whom the Software is         --
-- furnished to do so, subject to the following conditions:                      --
--                                                                               --
-- The above copyright notice and this permission notice shall be included in    --
-- all copies or substantial portions of the Software.                           --
--                                                                               --
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR    --
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,      --
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE   --
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER        --
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, --
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN     --
-- THE SOFTWARE.                                                                 --
--                                                                               --
-- ============================================================================= --
-- Author(s):                                                                    --
--   Paco Reina Campo <pacoreinacampo@queenfield.tech>                           --
--                                                                               --
-----------------------------------------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

with System.Assertions;

with ntm_size;
use ntm_size;

with ntm_vector_arithmetic;
use ntm_vector_arithmetic;

procedure test_vector_arithmetic is

  data_a_in : vector := (2.0, 0.0, 4.0);
  data_b_in : vector := (1.0, 1.0, 2.0);
 
  data_out : vector;

begin

  ntm_vector_arithmetic.ntm_vector_adder(
    data_a_in => data_a_in,
    data_b_in => data_b_in,
    data_out  => data_out
  );

  pragma Assert (1 = 0, "Vector Adder");

  for i in index loop
    Put(float'Image(data_out(i)));
  end loop;

  New_Line;

  ntm_vector_arithmetic.ntm_vector_multiplier(
    data_a_in => data_a_in,
    data_b_in => data_b_in,
    data_out  => data_out
  );

  pragma Assert (1 = 0, "Vector Multiplier");

  for i in index loop
    Put(float'Image(data_out(i)));
  end loop;

  New_Line;

  ntm_vector_arithmetic.ntm_vector_divider(
    data_a_in => data_a_in,
    data_b_in => data_b_in,
    data_out  => data_out
  );

  pragma Assert (1 = 0, "Vector Divider");

  for i in index loop
    Put(float'Image(data_out(i)));
  end loop;

  New_Line;

end test_vector_arithmetic;
