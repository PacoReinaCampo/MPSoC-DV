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

function Y_OUT = ntm_masked_multi_head_attention(K_IN, Q_IN, V_IN, M_IN, W_OH_IN, X_IN)
  % Package
  addpath(genpath('../inputs'));

  % Constants
  [SIZE_N_IN, ~] = size(X_IN);

  [~, ~, SIZE_K_IN] = size(K_IN);
  [SIZE_H_IN, SIZE_D_IN, SIZE_V_IN] = size(V_IN);

  % Internal Signals
  k_int = zeros(SIZE_D_IN, SIZE_K_IN);
  q_int = zeros(SIZE_D_IN, SIZE_K_IN);
  v_int = zeros(SIZE_D_IN, SIZE_V_IN);

  multi_head_int = zeros(SIZE_N_IN, SIZE_H_IN*SIZE_V_IN);

  % Body
  for h = 1:SIZE_H_IN
    for d = 1:SIZE_D_IN
      k_int(d, :) = K_IN(h, d, :);
      q_int(d, :) = Q_IN(h, d, :);
      v_int(d, :) = V_IN(h, d, :);
    end

    head_int = ntm_masked_scaled_dot_product_attention(k_int, q_int, v_int, M_IN, X_IN);
    
    multi_head_int(:, 1+SIZE_V_IN*(h-1):SIZE_V_IN*h) = head_int;
  end

  Y_OUT = ntm_matrix_product(multi_head_int, W_OH_IN);
end