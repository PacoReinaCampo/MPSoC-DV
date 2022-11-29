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

procedure ntm_tensor_divider is

  SIZE_I_IN : constant integer := 3;
  SIZE_J_IN : constant integer := 3;
  SIZE_K_IN : constant integer := 3;

  type i_index is range 1 .. SIZE_I_IN;
  type j_index is range 1 .. SIZE_J_IN;
  type k_index is range 1 .. SIZE_K_IN;

  type tensor is array (i_index, j_index, k_index) of float;

  data_a_in : tensor := ( ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0)),
                          ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0)),
                          ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0)) );
  data_b_in : tensor := ( ((1.0, 1.0, 2.0), (1.0, 1.0, 2.0), (1.0, 1.0, 2.0)),
                          ((1.0, 1.0, 2.0), (1.0, 1.0, 2.0), (1.0, 1.0, 2.0)),
                          ((1.0, 1.0, 2.0), (1.0, 1.0, 2.0), (1.0, 1.0, 2.0)) );

  data_out : tensor;

  procedure tensor_divider (
    data_a_in : tensor;
    data_b_in : tensor
  ) is
  begin
    for i in i_index loop
      for j in j_index loop
        for k in k_index loop
          data_out(i, j, k) := data_a_in(i, j, k) / data_b_in(i, j, k);
        end loop;
      end loop;
    end loop;

  end tensor_divider;

begin

  tensor_divider(data_a_in, data_b_in);

  for i in i_index loop
    for j in j_index loop
      for k in k_index loop
        Put(float'Image(data_out(i, j, k)));
      end loop;

      New_Line;
    end loop;

    New_Line;
  end loop;

end ntm_tensor_divider;
