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

procedure ntm_matrix_vector_convolution is

  SIZE_I_A_IN : constant integer := 4;
  SIZE_J_A_IN : constant integer := 3;

  type i_a_index is range 1 .. SIZE_I_A_IN;
  type j_a_index is range 1 .. SIZE_J_A_IN;


  type a_matrix is array (i_a_index, j_a_index) of float;
  type b_matrix is array (j_a_index) of float;

  type out_matrix is array (i_a_index) of float;

  data_a_in : a_matrix := ((1.0, 2.0, 3.0), (4.0, 2.0, 6.0), (3.0, 4.0, 1.0), (2.0, 4.0, 8.0));
  data_b_in : b_matrix := (1.0, 3.0, 3.0);

  data_out : out_matrix;

  procedure matrix_vector_convolution (
    data_a_in : a_matrix;
    data_b_in : b_matrix
  ) is
    temporal : float;
  begin
    for i in i_a_index loop
      for j in j_a_index loop
        temporal := 0.0;

        for m in 1 .. i loop
          for n in 1 .. j loop
            --temporal := temporal + data_a_in(m, n) * data_b_in(i-m);
            temporal := temporal + data_a_in(m, 1) * data_b_in(1);

            data_out(i) := temporal;
          end loop;
        end loop;
      end loop;
    end loop;

  end matrix_vector_convolution;

begin

  matrix_vector_convolution(data_a_in, data_b_in);

  for i in i_a_index loop
    Put(float'Image(data_out(i)));
  end loop;

end ntm_matrix_vector_convolution;
