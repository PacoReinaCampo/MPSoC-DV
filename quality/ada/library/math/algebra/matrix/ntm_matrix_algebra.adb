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

package body ntm_matrix_algebra is

  procedure ntm_matrix_convolution (
    data_a_in : in matrix;
    data_b_in : in matrix;

    data_out : out matrix
  ) is
    temporal : float;
  begin
    for i in data_out'Range(1) loop
      for j in data_out'Range(2) loop
        temporal := 0.0;

        for m in 1 .. i loop
          for n in 1 .. j loop
            temporal := temporal + data_a_in(m, n) * data_b_in(i-m, j-n);

            data_out(i, j) := temporal;
          end loop;
        end loop;
      end loop;
    end loop;

  end ntm_matrix_convolution;

  procedure ntm_matrix_inverse (
    data_in : in matrix;

    data_out : out matrix
  ) is
  begin
    for i in data_out'Range(1) loop
      for j in data_out'Range(2) loop
        data_out(i, j) := data_in(i, j);
      end loop;
    end loop;

  end ntm_matrix_inverse;

  procedure ntm_matrix_multiplication (
    data_in : in tensor;

    data_out : out matrix
  ) is
  begin
    for i in data_out'Range(1) loop
      for j in data_out'Range(2) loop
        data_out(i, j) := 1.0;

        for k in data_in'Range(3) loop
          data_out(i, j) := data_out(i, j) * data_in(i, j, k);
        end loop;
      end loop;
    end loop;

  end ntm_matrix_multiplication;

  procedure ntm_matrix_product (
    data_a_in : in matrix;
    data_b_in : in matrix;

    data_out : out matrix
  ) is
    temporal : float;
  begin
    for i in data_out'Range(1) loop
      for j in data_out'Range(2) loop
        temporal := 0.0;

        for m in data_a_in'Range(2) loop
          temporal := temporal + data_a_in(i, m) * data_b_in(m, j);

          data_out(i, j) := temporal;
        end loop;
      end loop;
    end loop;

  end ntm_matrix_product;

  procedure ntm_matrix_summation (
    data_in : in tensor;

    data_out : out matrix
  ) is
  begin
    for i in data_out'Range(1) loop
      for j in data_out'Range(2) loop
        data_out(i, j) := 0.0;

        for k in data_in'Range(3) loop
          data_out(i, j) := data_out(i, j) + data_in(i, j, k);
        end loop;
      end loop;
    end loop;

  end ntm_matrix_summation;

  procedure ntm_matrix_transpose (
    data_in : in matrix;

    data_out : out matrix
  ) is
  begin
    for i in data_out'Range(1) loop
      for j in data_out'Range(2) loop
        data_out(i, j) := data_in(j, i);
      end loop;
    end loop;

  end ntm_matrix_transpose;

  procedure ntm_matrix_vector_convolution (
    data_a_in : in matrix;
    data_b_in : in vector;

    data_out : out vector
  ) is
    temporal : float;
  begin
    for i in data_a_in'Range(1) loop
      for j in data_a_in'Range(2) loop
        temporal := 0.0;

        for m in 1 .. i loop
          for n in 1 .. j loop
            temporal := temporal + data_a_in(m, n) * data_b_in(i-m);

            data_out(i) := temporal;
          end loop;
        end loop;
      end loop;
    end loop;

  end ntm_matrix_vector_convolution;

  procedure ntm_matrix_vector_product (
    data_a_in : in matrix;
    data_b_in : in vector;

    data_out : out vector
  ) is
    temporal : float;
  begin
    for i in data_a_in'Range(1) loop
      for j in data_a_in'Range(2) loop
        temporal := 0.0;

        for m in data_b_in'Range loop
          temporal := temporal + data_a_in(i, m) * data_b_in(m);

          data_out(i) := temporal;
        end loop;
      end loop;
    end loop;

  end ntm_matrix_vector_product;

  procedure ntm_transpose_vector_product (
    data_a_in : vector;
    data_b_in : vector;

    data_out : out matrix
  ) is
  begin
    for i in data_a_in'Range loop
      for j in data_b_in'Range loop
        data_out(i, j) := data_a_in(i) * data_b_in(j);
      end loop;
    end loop;

  end ntm_transpose_vector_product;

end ntm_matrix_algebra;
