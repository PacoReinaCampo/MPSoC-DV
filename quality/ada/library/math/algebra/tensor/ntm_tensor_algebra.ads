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

package ntm_tensor_algebra is

  SIZE_I_IN : constant integer := 3;
  SIZE_J_IN : constant integer := 3;
  SIZE_K_IN : constant integer := 3;
  SIZE_T_IN : constant integer := 3;

  type i_index is range 1 .. SIZE_I_IN;
  type j_index is range 1 .. SIZE_J_IN;
  type k_index is range 1 .. SIZE_K_IN;
  type t_index is range 1 .. SIZE_T_IN;

  type matrix is array (i_index, j_index) of float;

  type tensor is array (i_index, j_index, k_index) of float;

  type array4 is array (i_index, j_index, k_index, t_index) of float;

  procedure ntm_tensor_convolution (
    data_a_in : in tensor;
    data_b_in : in tensor;
    
    data_out : out tensor
  );

  procedure ntm_tensor_inverse (
    data_in : in tensor;
    
    data_out : out tensor
  );

--  procedure ntm_tensor_matrix_convolution (
--    data_a_in : in tensor;
--    data_b_in : in matrix;
--    
--    data_out : out matrix
--  );

--  procedure ntm_tensor_matrix_product (
--    data_a_in : in tensor;
--    data_b_in : in matrix;
--    
--    data_out : out matrix
--  );

  procedure ntm_tensor_multiplication (
    data_in : in array4;
    
    data_out : out tensor
  );

  procedure ntm_tensor_product (
    data_a_in : in tensor;
    data_b_in : in tensor;
    
    data_out : out tensor
  );

  procedure ntm_tensor_summation (
    data_in : in array4;
    
    data_out : out tensor
  );

  procedure ntm_tensor_transpose (
    data_in : in tensor;
    
    data_out : out tensor
  );

end ntm_tensor_algebra;
