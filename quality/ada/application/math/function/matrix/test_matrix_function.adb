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

with ntm_matrix_function;
use ntm_matrix_function;

procedure test_matrix_function is

  data_in : matrix := (
    ( 6.3226113886226751, 3.1313826152262876, 8.3512687816132226 ),
    ( 4.3132651822261687, 5.3132616875182226, 6.6931471805599454 ),
    ( 9.9982079678583020, 7.9581688450893644, 2.9997639589554603 )
  );

  data_out : matrix;

begin

  ntm_matrix_function.ntm_matrix_logistic_function (
    data_in => data_in,

    data_out  => data_out
  );

  pragma Assert (1 = 0, "Matrix Logistic");

  for i in i_index loop
    for j in j_index loop
      Put(float'Image(data_out(i, j)));
    end loop;

    New_Line;
  end loop;

  ntm_matrix_function.ntm_matrix_oneplus_function (
    data_in => data_in,

    data_out  => data_out
  );

  pragma Assert (1 = 0, "Matrix Oneplus");

  for i in i_index loop
    for j in j_index loop
      Put(float'Image(data_out(i, j)));
    end loop;

    New_Line;
  end loop;

end test_matrix_function;
