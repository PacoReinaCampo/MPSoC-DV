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

function N_OUT = ntm_layer_norm(Z_IN, GAMMA_IN, BETA_IN)
  % Package
  addpath(genpath('../../../math/statitics/vector'));

  % Constants
  [SIZE_N_IN, SIZE_D_IN] = size(Z_IN);

  % Output Signals
  N_OUT = zeros(SIZE_N_IN, SIZE_D_IN);

  % Body
  vector_operation_int = ntm_vector_mean(Z_IN);

  for n = 1:SIZE_N_IN
    for d = 1:SIZE_D_IN
      N_OUT(n, d) = Z_IN(n, d) - vector_operation_int(n);
    end
  end

  vector_operation_int = ntm_vector_deviation(Z_IN, vector_operation_int);

  for n = 1:SIZE_N_IN
    for d = 1:SIZE_D_IN
      N_OUT(n, d) = N_OUT(n, d)/vector_operation_int(n);
    end
  end

  N_OUT = GAMMA_IN.*N_OUT;

  N_OUT = N_OUT + BETA_IN;
end