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

with ntm_vector_algebra;
use ntm_vector_algebra;

procedure test_vector_algebra is

  vector_data_in : vector := (0.0, 0.0, 0.0);

  vector_data_a_in : vector := (0.0, 0.0, 0.0);
  vector_data_b_in : vector := (0.0, 0.0, 0.0);

  matrix_data_in : matrix := ((0.0, 0.0, 0.0), (0.0, 0.0, 0.0), (0.0, 0.0, 0.0));
 
  scalar_data_out : float := 0.0;

  vector_data_out : vector := (0.0, 0.0, 0.0);

begin

  vector_data_a_in := (1.0, 2.0, 3.0);
  vector_data_b_in := (1.0, 3.0, 3.0);

  ntm_vector_algebra.ntm_dot_product (
    data_a_in => vector_data_a_in,
    data_b_in => vector_data_b_in,

    data_out  => scalar_data_out
  );

  pragma Assert (1 = 0, "Vector Dot Product");

  Put(float'Image(scalar_data_out));

  New_Line;

  vector_data_a_in := (1.0, 2.0, 3.0);
  vector_data_b_in := (1.0, 3.0, 3.0);

  ntm_vector_algebra.ntm_vector_convolution (
    data_a_in => vector_data_a_in,
    data_b_in => vector_data_b_in,

    data_out  => vector_data_out
  );

  pragma Assert (1 = 0, "Vector Convolution");

  for i in vector_data_out'Range loop
    Put(float'Image(vector_data_out(i)));
  end loop;

  New_Line;

  vector_data_a_in := (4.0, 0.0, 3.0);
  vector_data_b_in := (4.0, 0.0, 3.0);

  ntm_vector_algebra.ntm_vector_cosine_similarity (
    data_a_in => vector_data_a_in,
    data_b_in => vector_data_b_in,

    data_out  => scalar_data_out
  );

  pragma Assert (1 = 0, "Cosine Similarity");

  Put(float'Image(scalar_data_out));

  New_Line;

  vector_data_in := (4.0, 0.0, 3.0);

  ntm_vector_algebra.ntm_vector_module (
    data_in => vector_data_in,

    data_out  => scalar_data_out
  );

  pragma Assert (1 = 0, "Vector Module");

  Put(float'Image(scalar_data_out));

  New_Line;

  matrix_data_in := ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0));

  ntm_vector_algebra.ntm_vector_multiplication (
    data_in => matrix_data_in,

    data_out  => vector_data_out
  );

  pragma Assert (1 = 0, "Vector Multiplication");

  for i in vector_data_out'Range loop
    Put(float'Image(vector_data_out(i)));
  end loop;

  matrix_data_in := ((2.0, 0.0, 4.0), (2.0, 0.0, 4.0), (2.0, 0.0, 4.0));

  ntm_vector_algebra.ntm_vector_summation (
    data_in => matrix_data_in,

    data_out  => vector_data_out
  );

  pragma Assert (1 = 0, "Vector Summation");

  for i in vector_data_out'Range loop
    Put(float'Image(vector_data_out(i)));
  end loop;

end test_vector_algebra;
