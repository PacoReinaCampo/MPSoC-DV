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

function X_OUT = ntm_inputs_vector(W_IN, K_IN, V_IN, D_IN, X_IN, R_IN, XI_IN, RHO_IN)
  % Package
  addpath(genpath('../../../math/algebra/matrix'));
  addpath(genpath('../../../math/algebra/tensor'));

  % Constants
  [SIZE_D_IN, SIZE_X_IN] = size(W_IN);
  [SIZE_L_IN, SIZE_N_IN, SIZE_R_IN, SIZE_W_IN] = size(R_IN);
  [~, ~, SIZE_S_IN] = size(XI_IN);
  [~, ~, ~, SIZE_P_IN] = size(RHO_IN);

  % Internal Signals
  x_int = zeros(SIZE_N_IN, SIZE_X_IN);
  r_int = zeros(SIZE_N_IN, SIZE_R_IN, SIZE_W_IN);
  rho_int = zeros(SIZE_N_IN, SIZE_R_IN, SIZE_P_IN);
  xi_int = zeros(SIZE_N_IN, SIZE_S_IN);

  % Output Signals
  X_OUT = zeros(SIZE_L_IN, SIZE_N_IN, SIZE_D_IN);

  % Body
  % X(l;n;d) = W(d;x)·x(l;n;x) + K(i;d;k)·r(l;n;i;k) + D(i;d;p)·rho(l;n;i;p) + V(d;s)·xi(l;n;s)

  for l = 1:SIZE_L_IN
    for n = 1:SIZE_N_IN
      for x = 1:SIZE_X_IN
        x_int(n, x) = X_IN(l, n, x);
      end

      for i = 1:SIZE_R_IN
        for k = 1:SIZE_W_IN
          r_int(n, i, k) = R_IN(l, n, i, k);
        end

        for p = 1:SIZE_P_IN
          rho_int(n, i, p) = RHO_IN(l, n, i, p);
        end
      end

      for s = 1:SIZE_S_IN
        xi_int(n, s) = XI_IN(l, n, s);
      end

      % W(d;x)·x(l;n;x)
      vector_first_operation_int = ntm_matrix_vector_product(W_IN, x_int);

      % K(i;d;k)·r(l;n;i;k)
      matrix_operation_int = ntm_tensor_matrix_product(K_IN, r_int);

      for d = 1:SIZE_D_IN
        for i = 1:SIZE_R_IN
          vector_first_operation_int(d) = vector_first_operation_int(d) + matrix_operation_int(i, d);
        end
      end

      % D(i;d;p)·rho(l;n;i;p)
      matrix_operation_int = ntm_tensor_matrix_product(D_IN, rho_int);

      for d = 1:SIZE_D_IN
        for i = 1:SIZE_R_IN
          vector_first_operation_int(d) = vector_first_operation_int(d) + matrix_operation_int(i, d);
        end
      end

      % V(d;s)·xi(l;n;s)
      vector_second_operation_int = ntm_matrix_vector_product(V_IN, xi_int);

      X_OUT(l, n, :) = vector_first_operation_int + vector_second_operation_int;
    end
  end
end