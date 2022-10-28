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

function H_OUT = ntm_controller(W_IN, K_IN, V_IN, D_IN, U_IN, B_IN, R_IN, XI_IN, RHO_IN, S_IN, H_IN, X_IN)
  % Package
  addpath(genpath('../../../math/algebra/matrix'));
  addpath(genpath('../../../math/algebra/tensor'));

  % Body
  % a(t;l) = sigmoid(W(l;x)*x(t;x) + K(i;l;k)*r(t;i;k) + D(i;l;m)*rho(t;i;m) + V(l;s)*xi(t;s) + U(l;l)*h(t-1,l) + b(l))
  vector_a_int = ntm_activation_gate_vector(W_IN, K_IN, V_IN, D_IN, U_IN, B_IN, R_IN, XI_IN, RHO_IN, H_IN, X_IN);

  % f(t;l) = sigmoid(W(l;x)*x(t;x) + K(i;l;k)*r(t;i;k) + D(i;l;m)*rho(t;i;m) + V(l;s)*xi(t;s) + U(l;l)*h(t-1,l) + b(l))
  vector_f_int = ntm_forget_gate_vector(W_IN, K_IN, V_IN, D_IN, U_IN, B_IN, R_IN, XI_IN, RHO_IN, H_IN, X_IN);

  % i(t;l) = sigmoid(W(l;x)*x(t;x) + K(i;l;k)*r(t;i;k) + D(i;l;m)*rho(t;i;m) + V(l;s)*xi(t;s) + U(l;l)*h(t-1,l) + b(l))
  vector_i_int = ntm_input_gate_vector(W_IN, K_IN, V_IN, D_IN, U_IN, B_IN, R_IN, XI_IN, RHO_IN, H_IN, X_IN);

  % s(t;l) = f(t;l) o s(t-1,l) + i(t;l) o a(t;l)
  vector_s_int = ntm_state_gate_vector(S_IN, vector_i_int, vector_f_int, vector_a_int);

  % o(t;l) = sigmoid(W(l;x)*x(t;x) + K(i;l;k)*r(t;i;k) + D(i;l;m)*rho(t;i;m) + V(l;s)*xi(t;s) + U(l;l)*h(t-1,l) + b(l))
  vector_o_int = ntm_output_gate_vector(W_IN, K_IN, V_IN, D_IN, U_IN, B_IN, R_IN, XI_IN, RHO_IN, H_IN, X_IN);

  % h(t;l) = o(t;l) o tanh(s(t;l))
  H_OUT = ntm_hidden_gate_vector(vector_s_int, vector_o_int);
end