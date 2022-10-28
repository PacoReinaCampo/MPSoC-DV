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

function U_OUT = ntm_masked_scaled_dot_product_attention(K_IN, Q_IN, V_IN, M_IN, X_IN)
  % Package
  addpath(genpath('../../../math/algebra/matrix'));
  addpath(genpath('../../../math/calculus/matrix'));

  addpath(genpath('../inputs'));

  % Constants
  [~, SIZE_K_IN] = size(K_IN);

  % Body
  k_int = ntm_keys_vector(K_IN, X_IN);
  q_int = ntm_queries_vector(Q_IN, X_IN);

  matrix_operation_int = ntm_matrix_transpose(k_int);
  matrix_operation_int = ntm_matrix_product(q_int, matrix_operation_int);
  matrix_operation_int = matrix_operation_int + M_IN;
  scalar_operation_int = sqrt(SIZE_K_IN);
  matrix_operation_int = matrix_operation_int/scalar_operation_int;
  matrix_operation_int = ntm_matrix_softmax(matrix_operation_int);

  v_int = ntm_values_vector(V_IN, X_IN);

  U_OUT = ntm_matrix_product(matrix_operation_int, v_int);
end