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

function C_OUT = dnc_matrix_content_based_addressing(K_IN, BETA_IN, M_IN)
  % Package
  addpath(genpath('../../math/algebra/vector'));
  addpath(genpath('../../math/algebra/matrix'));
  addpath(genpath('../../math/calculus/matrix'));

  % Constants
  SIZE_R_IN = length(BETA_IN);

  [SIZE_N_IN, SIZE_W_IN] = size(M_IN);

  % Internal Signals
  matrix_beta_int = zeros(SIZE_R_IN, SIZE_N_IN);

  matrix_j_operation_int = zeros(SIZE_R_IN, SIZE_N_IN);
  vector_j_operation_int = zeros(SIZE_N_IN, 1);
  vector_k_operation_int = zeros(SIZE_W_IN, 1);

  % Body
  % C(M[j,�],k,beta)[i;j] = softmax(cosine_similarity(k,M[j,�])�beta)[i;j]

  for i = 1:SIZE_R_IN
    for j = 1:SIZE_N_IN
      matrix_beta_int(i, j) = BETA_IN(i);

      for k = 1:SIZE_W_IN
        vector_k_operation_int(k) = M_IN(j, k);

        vector_j_operation_int(j) = K_IN(i, k);
      end

      scalar_operation_int = ntm_vector_cosine_similarity(vector_j_operation_int, vector_k_operation_int);

      matrix_j_operation_int(i, j) = scalar_operation_int;
    end
  end

  matrix_j_operation_int = matrix_j_operation_int.*matrix_beta_int;

  C_OUT = ntm_matrix_softmax(matrix_j_operation_int);
end