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

with ntm_tensor_algebra;
use ntm_tensor_algebra;

procedure test_tensor_algebra is

  tensor_data_in : tensor := ( ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0)),
                               ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0)),
                               ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0)) );

  tensor_data_a_in : tensor := ( ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0)),
                                 ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0)),
                                 ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0)) );

  tensor_data_b_in : tensor := ( ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0)),
                                 ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0)),
                                 ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0)) );

  matrix_data_b_in : matrix := ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0));

  array4_data_in : array4 := ( ( ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0)),
                                 ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0)),
                                 ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0)) ),
                          
                               ( ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0)),
                                 ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0)),
                                 ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0)) ),
                          
                               ( ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0)),
                                 ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0)),
                                 ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0)) ) );

  tensor_data_out : tensor;
  matrix_data_out : tensor;

begin

  ntm_tensor_algebra.ntm_tensor_convolution (
    data_a_in => tensor_data_a_in,
    data_b_in => tensor_data_b_in,

    data_out => tensor_data_out
  );

  pragma Assert (1 = 0, "Tensor Convolution");

  for i in i_index loop
    for j in j_index loop
      for k in k_index loop
        Put(float'Image(tensor_data_out(i, j, k)));
      end loop;

      New_Line;
    end loop;

    New_Line;
  end loop;

  ntm_tensor_algebra.ntm_tensor_inverse (
    data_in => tensor_data_in,

    data_out => tensor_data_out
  );

  pragma Assert (1 = 0, "Tensor Inverse");

  for i in i_index loop
    for j in j_index loop
      for k in k_index loop
        Put(float'Image(tensor_data_out(i, j, k)));
      end loop;

      New_Line;
    end loop;

    New_Line;
  end loop;

--  ntm_tensor_algebra.ntm_tensor_matrix_convolution (
--    data_a_in => tensor_data_a_in,
--    data_b_in => matrix_data_b_in,

--    data_out => matrix_data_out
--  );

--  pragma Assert (1 = 0, "Tensor Convolution");

--  for i in i_index loop
--    for j in j_index loop
--      Put(float'Image(matrix_data_out(i, j)));
--    end loop;

--    New_Line;
--  end loop;

--  ntm_tensor_algebra.ntm_tensor_matrix_product (
--    data_a_in => tensor_data_a_in,
--    data_b_in => matrix_data_b_in,

--    data_out => matrix_data_out
--  );

--  pragma Assert (1 = 0, "Tensor Product");

--  for i in i_index loop
--    for j in j_index loop
--      Put(float'Image(matrix_data_out(i, j)));
--    end loop;

--    New_Line;
--  end loop;

  ntm_tensor_algebra.ntm_tensor_multiplication (
    data_in => array4_data_in,

    data_out => tensor_data_out
  );

  pragma Assert (1 = 0, "Tensor Multiplication");

  for i in i_index loop
    for j in j_index loop
      for k in k_index loop
        Put(float'Image(tensor_data_out(i, j, k)));
      end loop;

      New_Line;
    end loop;

    New_Line;
  end loop;

  ntm_tensor_algebra.ntm_tensor_summation (
    data_in => array4_data_in,

    data_out => tensor_data_out
  );

  pragma Assert (1 = 0, "Tensor Summation");

  for i in i_index loop
    for j in j_index loop
      for k in k_index loop
        Put(float'Image(tensor_data_out(i, j, k)));
      end loop;

      New_Line;
    end loop;

    New_Line;
  end loop;

  ntm_tensor_algebra.ntm_tensor_product (
    data_a_in => tensor_data_a_in,
    data_b_in => tensor_data_b_in,

    data_out => tensor_data_out
  );

  pragma Assert (1 = 0, "Tensor Product");

  for i in i_index loop
    for j in j_index loop
      for k in k_index loop
        Put(float'Image(tensor_data_out(i, j, k)));
      end loop;

      New_Line;
    end loop;

    New_Line;
  end loop;

  ntm_tensor_algebra.ntm_tensor_transpose (
    data_in => tensor_data_in,

    data_out => tensor_data_out
  );

  pragma Assert (1 = 0, "Tensor Transpose");

  for i in i_index loop
    for j in j_index loop
      for k in k_index loop
        Put(float'Image(tensor_data_out(i, j, k)));
      end loop;

      New_Line;
    end loop;

    New_Line;
  end loop;

end test_tensor_algebra;
