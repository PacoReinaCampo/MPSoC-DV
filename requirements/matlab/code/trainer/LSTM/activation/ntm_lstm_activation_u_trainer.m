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

function U_OUT = ntm_lstm_activation_u_trainer(A_IN, I_IN, F_IN, O_IN, S_IN, H_IN, LENGTH_IN)
  % Package
  addpath(genpath('../differentiation'));

  % Constants
  [SIZE_T_IN, SIZE_L_IN] = size(A_IN);

  % Output Signals
  U_OUT = zeros(SIZE_L_IN, SIZE_L_IN);

  % Body
  % ds(t;l) = dh(t;l) o o(t;l) o (1 - (tanh(s(t;l)))^2) + ds(t+1;l) + f(t+1;l)
  vector_dh_int = ntm_vector_controller_differentiation(H_IN, LENGTH_IN);
  vector_ds_int = ntm_vector_controller_differentiation(S_IN, LENGTH_IN);

  vector_ds_int = vector_dh_int.*O_IN.*(1-tanh(S_IN).^2) + vector_ds_int + F_IN;

  % da(t;l) = ds(t;l) o i(t;l) o (1 - a(t;l)^2)
  vector_da_int = vector_ds_int.*I_IN.*(1-A_IN).^2;

  % dU(l;m) = summation(da(t+1;l) · h(t;l))[t in 0 to T-1]
  for t = 1:SIZE_T_IN
    for l = 1:SIZE_L_IN
      for m = 1:SIZE_L_IN
        scalar_operation_int = vector_da_int(t, l)*H_IN(t, m);

        U_OUT(l, m) = U_OUT(l, m) + scalar_operation_int;
      end
    end
  end
end