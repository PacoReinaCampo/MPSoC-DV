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

package ntm_matrix_algebra is

  SIZE_I_IN : constant integer := 3;
  SIZE_J_IN : constant integer := 3;
  SIZE_K_IN : constant integer := 3;

  SIZE_I_A_IN : constant integer := 4;

  SIZE_M_IN : constant integer := 3;

  SIZE_J_B_IN : constant integer := 4;

  type i_index is range 1 .. SIZE_I_IN;
  type j_index is range 1 .. SIZE_J_IN;
  type k_index is range 1 .. SIZE_K_IN;

  type i_a_index is range 1 .. SIZE_I_A_IN;

  type m_index is range 1 .. SIZE_M_IN;

  type j_b_index is range 1 .. SIZE_J_B_IN;

  type vector is array (i_index) of float;

  type matrix is array (i_index, j_index) of float;

  type tensor is array (i_index, j_index, k_index) of float;

  type a_vector is array (i_a_index) of float;
  type b_vector is array (j_b_index) of float;
  type m_vector is array (m_index) of float;

  type a_matrix is array (i_a_index, m_index) of float;
  type b_matrix is array (m_index, j_b_index) of float;

  type out_matrix is array (i_a_index, j_b_index) of float;

  procedure ntm_matrix_convolution (
    data_a_in : in a_matrix;
    data_b_in : in b_matrix;

    data_out : out out_matrix
  );

  procedure ntm_matrix_inverse (
    data_in : in matrix;

    data_out : out matrix
  );

  procedure ntm_matrix_multiplication (
    data_in : in tensor;

    data_out : out matrix
  );

  procedure ntm_matrix_product (
    data_a_in : in a_matrix;
    data_b_in : in b_matrix;

    data_out : out out_matrix
  );

  procedure ntm_matrix_summation (
    data_in : in tensor;

    data_out : out matrix
  );

  procedure ntm_matrix_transpose (
    data_in : in matrix;

    data_out : out matrix
  );

  procedure ntm_matrix_vector_convolution (
    data_a_in : in a_matrix;
    data_b_in : in b_vector;

    data_out : out a_vector
  );

  procedure ntm_matrix_vector_product (
    data_a_in : in a_matrix;
    data_b_in : in m_vector;

    data_out : out a_vector
  );

  procedure ntm_transpose_vector_product (
    data_a_in : in a_vector;
    data_b_in : in b_vector;

    data_out : out out_matrix
  );

end ntm_matrix_algebra;
