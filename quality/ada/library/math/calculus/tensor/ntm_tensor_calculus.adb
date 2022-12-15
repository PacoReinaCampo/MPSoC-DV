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

package body ntm_tensor_calculus is

  procedure ntm_tensor_differentiation (
    data_in : tensor;

    length_i_in : in float;
    length_j_in : in float;
    length_k_in : in float;

    control : in integer;

    data_out : out tensor
  ) is
  begin
    for i in data_out'Range(1) loop
      for j in data_out'Range(2) loop
        for k in data_out'Range(3) loop
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

  end ntm_tensor_differentiation;

  procedure ntm_tensor_integration (
    data_in : in tensor;

    length_in : in float;

    data_out : out tensor
  ) is
    temporal : float := 0.0;
  begin
    for i in data_out'Range(1) loop
      for j in data_out'Range(2) loop
        for k in data_out'Range(3) loop
          temporal := temporal + data_in(i, j, k)*length_in;

          data_out(i, j, k) := temporal;
        end loop;
      end loop;
    end loop;

  end ntm_tensor_integration;

  procedure ntm_tensor_softmax (
    data_in : in tensor;
    
    data_out : out tensor
  ) is
    temporal : float := 0.0;
  begin
    for i in data_out'Range(1) loop
      for j in data_out'Range(2) loop
        for k in data_out'Range(3) loop
          temporal := temporal + exp(data_in(i, j, k));

          data_out(i, j, k) := exp(data_in(i, j, k));
        end loop;

        for k in data_out'Range(3) loop
          data_out(i, j, k) := data_out(i, j, k)/temporal;
        end loop;
      end loop;
    end loop;

  end ntm_tensor_softmax;

end ntm_tensor_calculus;
