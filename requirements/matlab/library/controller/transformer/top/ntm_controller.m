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

function Z_OUT = ntm_controller(K_IN, Q_IN, V_IN, W_OH_IN, W1_IN, B1_IN, W2_IN, B2_IN, W_I_IN, K_I_IN, V_I_IN, D_I_IN, X_I_IN, R_I_IN, XI_I_IN, RHO_I_IN, W_O_IN, K_O_IN, V_O_IN, D_O_IN, X_O_IN, R_O_IN, XI_O_IN, RHO_O_IN, PE_IN)
  % Package
  addpath(genpath('../inputs'));
  addpath(genpath('../components'));
  addpath(genpath('../functions'));

  % Body
  % Input Embedding
  x_in_int = ntm_inputs_vector(W_I_IN, K_I_IN, V_I_IN, D_I_IN, X_I_IN, R_I_IN, XI_I_IN, RHO_I_IN);

  y_int = ntm_positional_encoding(x_in_int, PE_IN);

  x_in_int = x_in_int + y_int;

  % Output Embedding
  x_out_int = ntm_inputs_vector(W_O_IN, K_O_IN, V_O_IN, D_O_IN, X_O_IN, R_O_IN, XI_O_IN, RHO_O_IN);

  y_int = ntm_positional_encoding(x_out_int, PE_IN);

  x_out_int = x_out_int + y_int;

  % Encoder
  z_int = ntm_encoder(K_IN, Q_IN, V_IN, W_OH_IN, W1_IN, B1_IN, W2_IN, B2_IN, x_in_int);

  % Decoder
  Z_OUT = ntm_decoder(K_IN, Q_IN, V_IN, W_OH_IN, W1_IN, B1_IN, W2_IN, B2_IN, x_out_int, z_int);
end
