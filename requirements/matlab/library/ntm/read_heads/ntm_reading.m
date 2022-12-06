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

function R_OUT = ntm_reading(W_IN, M_IN)
  % Package
  addpath(genpath('../../math/algebra/vector'));
  addpath(genpath('../../math/algebra/matrix'));

  % Constants
  [SIZE_R_IN, SIZE_N_IN] = size(W_IN);
  [~, SIZE_W_IN] = size(M_IN);

  % Internal Signals
  matrix_operation_int = zeros(SIZE_N_IN, SIZE_W_IN);

  vector_summation_int = zeros(1, SIZE_W_IN);

  % Output Signals
  R_OUT = zeros(SIZE_R_IN, SIZE_W_IN);

  % Body
  % r(t;i;k) = summation(w(t;i;j)·M(t;j;k))[j in 1 to N]

  for i = 1:SIZE_R_IN
    for j = 1:SIZE_N_IN
      for k = 1:SIZE_W_IN
        matrix_operation_int(j, k) = W_IN(i, j);
      end
    end

    matrix_operation_int = matrix_operation_int.*M_IN;

    for j = 1:SIZE_N_IN
      vector_summation_int = vector_summation_int + matrix_operation_int(j, :);
    end

    R_OUT(i, :) = vector_summation_int;
  end
end