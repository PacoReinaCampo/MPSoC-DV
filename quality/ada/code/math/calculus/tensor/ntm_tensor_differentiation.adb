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

procedure ntm_tensor_differentiation is

  SIZE_I_IN : constant integer := 3;
  SIZE_J_IN : constant integer := 3;
  SIZE_K_IN : constant integer := 3;

  type i_Index is range 1 .. SIZE_I_IN;
  type j_Index is range 1 .. SIZE_J_IN;
  type k_Index is range 1 .. SIZE_K_IN;

  type tensor is array (i_Index, j_Index, k_Index) of float;

  control : integer := 0;

  length_i_in : float := 1.0;
  length_j_in : float := 1.0;
  length_k_in : float := 1.0;

  data_in : tensor := ( ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0)),
                        ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0)),
                        ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0)) );

  data_out : tensor;

  procedure tensor_differentiation (
    data_in : tensor;

    length_i_in : float;
    length_j_in : float;
    length_k_in : float;

    control : integer
  ) is
  begin
    for i in i_index loop
      for j in j_index loop
        for k in k_index loop
          if control = 0 then
            if i = 1 then
              data_out(i, j, k) := 0.0;
            else
              data_out(i, j, k) := (data_in(i, j, k) - data_in(i-1, j, k))/length_i_in;
            end if;
          elsif control = 1 then
            if i = 1 then
              data_out(i, j, k) := 0.0;
            else
              data_out(i, j, k) := (data_in(i, j, k) - data_in(i, j-1, k))/length_j_in;
            end if;
          else
            if i = 1 then
              data_out(i, j, k) := 0.0;
            else
              data_out(i, j, k) := (data_in(i, j, k) - data_in(i, j, k-1))/length_k_in;
            end if;
          end if;
        end loop;
      end loop;
    end loop;

  end tensor_differentiation;

begin

  tensor_differentiation(data_in, length_i_in, length_j_in, length_k_in, control);

  for i in i_index loop
    for j in j_index loop
      for k in k_index loop
        Put(float'Image(data_out(i, j, k)));
      end loop;

      New_Line;
    end loop;

    New_Line;
  end loop;

end ntm_tensor_differentiation;
