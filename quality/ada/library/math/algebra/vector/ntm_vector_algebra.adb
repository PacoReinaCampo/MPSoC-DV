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

with Ada.Numerics;
use Ada.Numerics;

with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;

package body ntm_vector_algebra is

  procedure ntm_dot_product (
    data_a_in : in vector;
    data_b_in : in vector;

    data_out : out float
  ) is
  begin

    data_out := 0.0;

    for i in i_index loop
      data_out := data_out + data_a_in(i) * data_b_in(i);
    end loop;

  end ntm_dot_product;

  procedure ntm_vector_convolution (
    data_a_in : in vector;
    data_b_in : in vector;

    data_out : out vector
  ) is
    temporal : float;
  begin
    for i in i_index loop
      temporal := 0.0;

      for m in 1 .. i loop
        temporal := temporal + data_a_in(m) * data_b_in(i-m);
        
        data_out(i) := temporal;
      end loop;
    end loop;

  end ntm_vector_convolution;

  procedure ntm_vector_cosine_similarity (
    data_a_in : in vector;
    data_b_in : in vector;

    data_out : out float
  ) is
    dot_result : float := 0.0;

    input_a_result : float := 0.0;
    input_b_result : float := 0.0;
  begin

    for i in i_index loop
      dot_result := dot_result + data_a_in(i) * data_b_in(i);
    end loop;

    for i in i_index loop
      input_a_result := input_a_result + data_a_in(i) * data_a_in(i);
    end loop;

    for i in i_index loop
      input_b_result := input_b_result + data_b_in(i) * data_b_in(i);
    end loop;

    data_out := dot_result/(sqrt(input_a_result)*sqrt(input_b_result));

  end ntm_vector_cosine_similarity;

  procedure ntm_vector_module (
    data_in : in vector;

    data_out : out float
  ) is
  begin

    data_out := 0.0;

    for i in i_index loop
      data_out := data_out + data_in(i) * data_in(i);
    end loop;

    data_out := sqrt(data_out);

  end ntm_vector_module;

  procedure ntm_vector_multiplication (
    data_in : matrix;

    data_out : out vector
  ) is
  begin
    for i in i_index loop
      data_out(i) := 1.0;

      for j in j_index loop
        data_out(i) := data_out(i) * data_in(i, j);
      end loop;
    end loop;

  end ntm_vector_multiplication;

  procedure ntm_vector_summation (
    data_in : matrix;

    data_out : out vector
  ) is
  begin
    for i in i_index loop
      data_out(i) := 0.0;

      for j in j_index loop
        data_out(i) := data_out(i) + data_in(i, j);
      end loop;
    end loop;

  end ntm_vector_summation;

end ntm_vector_algebra;
