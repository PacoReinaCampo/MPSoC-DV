%{
###################################################################################
##                                            __ _      _     _                  ##
##                                           / _(_)    | |   | |                 ##
##                __ _ _   _  ___  ___ _ __ | |_ _  ___| | __| |                 ##
##               / _` | | | |/ _ \/ _ \ '_ \|  _| |/ _ \ |/ _` |                 ##
##              | (_| | |_| |  __/  __/ | | | | | |  __/ | (_| |                 ##
##               \__, |\__,_|\___|\___|_| |_|_| |_|\___|_|\__,_|                 ##
##                  | |                                                          ##
##                  |_|                                                          ##
##                                                                               ##
##                                                                               ##
##              Peripheral-NTM for MPSoC                                         ##
##              Neural Turing Machine for MPSoC                                  ##
##                                                                               ##
###################################################################################

###################################################################################
##                                                                               ##
## Copyright (c) 2020-2024 by the author(s)                                      ##
##                                                                               ##
## Permission is hereby granted, free of charge, to any person obtaining a copy  ##
## of this software and associated documentation files (the "Software"), to deal ##
## in the Software without restriction, including without limitation the rights  ##
## to use, copy, modify, merge, publish, distribute, sublicense, and/or sell     ##
## copies of the Software, and to permit persons to whom the Software is         ##
## furnished to do so, subject to the following conditions:                      ##
##                                                                               ##
## The above copyright notice and this permission notice shall be included in    ##
## all copies or substantial portions of the Software.                           ##
##                                                                               ##
## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR    ##
## IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,      ##
## FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE   ##
## AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER        ##
## LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, ##
## OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN     ##
## THE SOFTWARE.                                                                 ##
##                                                                               ##
## ============================================================================= ##
## Author(s):                                                                    ##
##   Paco Reina Campo <pacoreinacampo@queenfield.tech>                           ##
##                                                                               ##
###################################################################################
%}

function W_OUT = dnc_read_weighting(PI_IN, B_IN, C_IN, F_IN)
  % Package
  addpath(genpath('../../math/algebra/matrix'));

  % Constants
  [SIZE_R_IN, SIZE_N_IN] = size(B_IN);

  % Internal Signals
  matrix_operation_int = zeros(SIZE_R_IN, SIZE_N_IN);

  % Body
  % w(t;i,j) = pi(t;i)[1]·b(t;i;j) + pi(t;i)[2]·c(t;i,j) + pi(t;i)[3]·f(t;i;j)

  for i = 1:SIZE_R_IN
    for j = 1:SIZE_N_IN
      matrix_operation_int(i, j) = PI_IN(j, 1);
    end
  end

  matrix_first_multiplier_int = matrix_operation_int.*B_IN;

  for i = 1:SIZE_R_IN
    for j = 1:SIZE_N_IN
      matrix_operation_int(i, j) = PI_IN(j, 2);
    end
  end

  matrix_second_multiplier_int = matrix_operation_int.*C_IN;

  matrix_adder_int = matrix_first_multiplier_int + matrix_second_multiplier_int;

  for i = 1:SIZE_R_IN
    for j = 1:SIZE_N_IN
      matrix_operation_int(i, j) = PI_IN(j, 3);
    end
  end

  matrix_first_multiplier_int = matrix_operation_int.*F_IN;

  W_OUT = matrix_first_multiplier_int + matrix_adder_int;
end