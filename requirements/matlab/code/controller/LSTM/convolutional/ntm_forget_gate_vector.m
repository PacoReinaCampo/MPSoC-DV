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

function F_OUT = ntm_forget_gate_vector(W_IN, K_IN, V_IN, D_IN, U_IN, B_IN, R_IN, XI_IN, RHO_IN, H_IN, X_IN)
  % Package
  addpath(genpath('../../../math/algebra/matrix'));
  addpath(genpath('../../../math/algebra/tensor'));
  addpath(genpath('../../../math/function/vector'));

  % Constants
  [SIZE_R_IN, SIZE_L_IN, ~] = size(K_IN);

  % Body
  % f(t;l) = sigmoid(W(l;x)*x(t;x) + K(i;l;k)*r(t;i;k) + D(i;l;m)*rho(t;i;m) + V(l;s)*xi(t;s) + U(l;l)*h(t-1;l) + b(l))
  
  % W(l;x)*x(t;x)
  vector_operation_int = ntm_matrix_vector_convolution(W_IN, X_IN);

  % K(i;l;k)*r(t;i;k)
  matrix_operation_int = ntm_tensor_matrix_convolution(K_IN, R_IN);

  for i = 1:SIZE_R_IN
    for l = 1:SIZE_L_IN
      vector_operation_int(l) = vector_operation_int(l) + matrix_operation_int(i, l);
    end
  end

  % D(i;l;m)*rho(t;i;m)
  matrix_operation_int = ntm_tensor_matrix_convolution(D_IN, RHO_IN);

  for i = 1:SIZE_R_IN
    for l = 1:SIZE_L_IN
      vector_operation_int(l) = vector_operation_int(l) + matrix_operation_int(i, l);
    end
  end

  % b(l)
  F_OUT = vector_operation_int + B_IN;

  % V(l;s)*xi(t;s)
  vector_operation_int = ntm_matrix_vector_convolution(V_IN, XI_IN);

  F_OUT = F_OUT + vector_operation_int;

  % U(l;l)*h(t-1;l)
  vector_operation_int = ntm_matrix_vector_convolution(U_IN, H_IN);

  F_OUT = F_OUT + vector_operation_int;

  % sigmoid(.)
  F_OUT = ntm_vector_logistic_function(F_OUT);
end