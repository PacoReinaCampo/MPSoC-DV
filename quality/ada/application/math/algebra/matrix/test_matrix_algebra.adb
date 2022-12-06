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

with ntm_matrix_algebra;
use ntm_matrix_algebra;

procedure test_matrix_algebra is

  tensor_data_in : tensor := ( ((0.0, 0.0, 0.0), (0.0, 0.0, 0.0), (0.0, 0.0, 0.0)),
                               ((0.0, 0.0, 0.0), (0.0, 0.0, 0.0), (0.0, 0.0, 0.0)),
                               ((0.0, 0.0, 0.0), (0.0, 0.0, 0.0), (0.0, 0.0, 0.0)) );

  matrix_data_in : matrix := ((0.0, 0.0, 0.0), (0.0, 0.0, -0.0), (-0.0, -0.0, -0.0));

  matrix_data_a_in : matrix := ((0.0, 0.0, 0.0), (0.0, 0.0, 0.0), (0.0, 0.0, 0.0), (0.0, 0.0, 0.0));
  matrix_data_b_in : matrix := ((0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0));

  vector_data_a_in : vector := (0.0, 0.0, 0.0, 0.0);
  vector_data_b_in : vector := (0.0, 0.0, 0.0, 0.0);

  vector_data_bm_in : vector := (0.0, 0.0, 0.0);

  matrix_data_out : matrix := ((0.0, 0.0, 0.0), (0.0, 0.0, -0.0), (-0.0, -0.0, -0.0));

  matrix_data_ab_out : matrix := ((0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0));

  vector_data_a_out : vector := (0.0, 0.0, 0.0, 0.0);
  vector_data_b_out : vector := (0.0, 0.0, 0.0);

begin

  matrix_data_a_in := ((1.0, 2.0, 3.0), (4.0, 2.0, 6.0), (3.0, 4.0, 1.0), (2.0, 4.0, 8.0));
  matrix_data_b_in := ((1.0, 3.0, 3.0, 2.0), (7.0, 6.0, 2.0, 1.0), (3.0, 4.0, 2.0, 1.0));

  ntm_matrix_algebra.ntm_matrix_convolution (
    data_a_in => matrix_data_a_in,
    data_b_in => matrix_data_b_in,

    data_out  => matrix_data_ab_out
  );

  pragma Assert (1 = 0, "Matrix Convolution");

  for i in matrix_data_ab_out'Range(1) loop
    for j in matrix_data_ab_out'Range(2) loop
      Put(float'Image(matrix_data_ab_out(i, j)));
    end loop;

    New_Line;
  end loop;

  matrix_data_in := ((1.0, 1.0, 2.0), (1.0, 3.0, -4.0), (-2.0, -4.0, -4.0));

  ntm_matrix_algebra.ntm_matrix_inverse (
    data_in => matrix_data_in,

    data_out  => matrix_data_out
  );

  pragma Assert (1 = 0, "Matrix Inverse");

  for i in matrix_data_out'Range(1) loop
    for j in matrix_data_out'Range(2) loop
      Put(float'Image(matrix_data_out(i, j)));
    end loop;

    New_Line;
  end loop;

  tensor_data_in := ( ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0)),
                      ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0)),
                      ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0)) );

  ntm_matrix_algebra.ntm_matrix_multiplication (
    data_in => tensor_data_in,

    data_out  => matrix_data_out
  );

  pragma Assert (1 = 0, "Matrix Multiplication");

  for i in matrix_data_out'Range(1) loop
    for j in matrix_data_out'Range(2) loop
      Put(float'Image(matrix_data_out(i, j)));
    end loop;

    New_Line;
  end loop;

  matrix_data_a_in := ((1.0, 2.0, 3.0), (4.0, 2.0, 6.0), (3.0, 4.0, 1.0), (2.0, 4.0, 8.0));
  matrix_data_b_in := ((1.0, 3.0, 3.0, 2.0), (7.0, 6.0, 2.0, 1.0), (3.0, 4.0, 2.0, 1.0));

  ntm_matrix_algebra.ntm_matrix_product (
    data_a_in => matrix_data_a_in,
    data_b_in => matrix_data_b_in,

    data_out  => matrix_data_ab_out
  );

  pragma Assert (1 = 0, "Matrix Product");

  for i in matrix_data_ab_out'Range(1) loop
    for j in matrix_data_ab_out'Range(2) loop
      Put(float'Image(matrix_data_ab_out(i, j)));
    end loop;

    New_Line;
  end loop;

  tensor_data_in := ( ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0)),
                      ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0)),
                      ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0)) );

  ntm_matrix_algebra.ntm_matrix_summation (
    data_in => tensor_data_in,

    data_out  => matrix_data_out
  );

  pragma Assert (1 = 0, "Matrix Summation");

  for i in matrix_data_out'Range(1) loop
    for j in matrix_data_out'Range(2) loop
      Put(float'Image(matrix_data_out(i, j)));
    end loop;

    New_Line;
  end loop;

  matrix_data_in := ((1.0, 1.0, 2.0), (1.0, 3.0, -4.0), (-2.0, -4.0, -4.0));

  ntm_matrix_algebra.ntm_matrix_transpose (
    data_in => matrix_data_in,

    data_out  => matrix_data_out
  );

  pragma Assert (1 = 0, "Matrix Transpose");

  for i in matrix_data_out'Range(1) loop
    for j in matrix_data_out'Range(2) loop
      Put(float'Image(matrix_data_out(i, j)));
    end loop;

    New_Line;
  end loop;

  matrix_data_a_in := ((1.0, 2.0, 3.0), (4.0, 2.0, 6.0), (3.0, 4.0, 1.0), (2.0, 4.0, 8.0));
  vector_data_b_in := (1.0, 3.0, 3.0, 4.0);

  ntm_matrix_algebra.ntm_matrix_vector_convolution (
    data_a_in => matrix_data_a_in,
    data_b_in => vector_data_b_in,

    data_out  => vector_data_a_out
  );

  pragma Assert (1 = 0, "Matrix Vector Convolution");

  for i in vector_data_a_out'Range(1) loop
    Put(float'Image(vector_data_a_out(i)));
  end loop;

  matrix_data_a_in := ((1.0, 2.0, 3.0), (4.0, 2.0, 6.0), (3.0, 4.0, 1.0), (2.0, 4.0, 8.0));

  vector_data_bm_in := (1.0, 3.0, 3.0);

  ntm_matrix_algebra.ntm_matrix_vector_product (
    data_a_in => matrix_data_a_in,
    data_b_in => vector_data_bm_in,

    data_out  => vector_data_a_out
  );

  pragma Assert (1 = 0, "Matrix Vector Product");

  for i in vector_data_a_out'Range(1) loop
    Put(float'Image(vector_data_a_out(i)));
  end loop;

  New_Line;

  vector_data_a_in := (1.0, 2.0, 3.0, 4.0);
  vector_data_b_in := (1.0, 3.0, 3.0, 4.0);

  ntm_matrix_algebra.ntm_transpose_vector_product (
    data_a_in => vector_data_a_in,
    data_b_in => vector_data_b_in,

    data_out  => matrix_data_ab_out
  );

  pragma Assert (1 = 0, "Matrix Transpose Vector Product");

  for i in matrix_data_ab_out'Range(1) loop
    for j in matrix_data_ab_out'Range(2) loop
      Put(float'Image(matrix_data_ab_out(i, j)));
    end loop;

    New_Line;
  end loop;

end test_matrix_algebra;
