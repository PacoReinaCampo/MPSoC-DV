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

package body ntm_state_outputs is

  procedure ntm_state_vector_state (
    data_a_in : in matrix;
    data_b_in : in matrix;
    data_c_in : in matrix;
    data_d_in : in matrix;

    data_k_in : in matrix;
    data_u_in : in matrix;

    initial_x : in vector;

    k : in float;

    data_x_out : out vector
  ) is

    -- Variables
    matrix_operation_int : matrix;

  begin

  -- Body
  -- x(k) = exp(A,k)·x(0) + summation(exp(A,k-j-1)·B·u(j))[j in 0 to k-1]

  ntm_state_feedback.ntm_state_matrix_feedforward (
    data_d_in => data_d_in,
    data_k_in => data_k_in,

    data_d_out => matrix_operation_int
  );

  ntm_state_feedback.ntm_state_matrix_input (
    data_b_in => data_b_in,
    data_d_in => data_d_in,
    data_k_in => data_k_in,

    data_b_out => matrix_operation_int
  );

  ntm_state_feedback.ntm_state_matrix_output (
    data_a_in => data_a_in,
    data_b_in => data_b_in,
    data_c_in => data_c_in,
    data_d_in => data_d_in,
    data_k_in => data_k_in,

    data_c_out  => matrix_operation_int
  );

  ntm_state_feedback.ntm_state_matrix_state (
    data_a_in => data_a_in,
    data_b_in => data_b_in,
    data_c_in => data_c_in,
    data_d_in => data_d_in,
    data_k_in => data_k_in,

    data_a_out => matrix_operation_int
  );

  end ntm_state_vector_state;

  procedure ntm_state_vector_output (
    data_a_in : in matrix;
    data_b_in : in matrix;
    data_c_in : in matrix;
    data_d_in : in matrix;

    data_k_in : in matrix;
    data_u_in : in matrix;

    initial_x : in vector;

    k : in float;

    data_y_out : out vector
  ) is

    -- Variables
    matrix_operation_int : matrix;

  begin

  -- Body
  -- y(k) = C·exp(A,k)·x(0) + summation(C·exp(A,k-j)·B·u(j))[j in 0 to k-1] + D·u(k)

  ntm_state_feedback.ntm_state_matrix_feedforward (
    data_d_in => data_d_in,
    data_k_in => data_k_in,

    data_d_out => matrix_operation_int
  );

  ntm_state_feedback.ntm_state_matrix_input (
    data_b_in => data_b_in,
    data_d_in => data_d_in,
    data_k_in => data_k_in,

    data_b_out => matrix_operation_int
  );

  ntm_state_feedback.ntm_state_matrix_output (
    data_a_in => data_a_in,
    data_b_in => data_b_in,
    data_c_in => data_c_in,
    data_d_in => data_d_in,
    data_k_in => data_k_in,

    data_c_out  => matrix_operation_int
  );

  ntm_state_feedback.ntm_state_matrix_state (
    data_a_in => data_a_in,
    data_b_in => data_b_in,
    data_c_in => data_c_in,
    data_d_in => data_d_in,
    data_k_in => data_k_in,

    data_a_out => matrix_operation_int
  );

  end ntm_state_vector_output;

end ntm_state_outputs;
