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

% Constants
SIZE_R_IN = 3;
SIZE_N_IN = 3;
SIZE_W_IN = 3;

% Signals
K_READ_IN = rand(SIZE_R_IN, SIZE_W_IN);
BETA_READ_IN = rand(SIZE_R_IN, 1);
F_READ_IN = rand(SIZE_R_IN, 1);
PI_READ_IN = rand(SIZE_R_IN, 3);

K_WRITE_IN = rand(SIZE_W_IN, 1);
BETA_WRITE_IN = rand(1);
E_WRITE_IN = rand(SIZE_W_IN, 1);
V_WRITE_IN = rand(SIZE_W_IN, 1);
GA_WRITE_IN = rand(1);
GW_WRITE_IN = rand(1);

M_IN = rand(SIZE_N_IN, SIZE_W_IN);
L_IN = rand(SIZE_N_IN, SIZE_N_IN);
P_IN = rand(SIZE_N_IN, 1);
U_IN = rand(SIZE_N_IN, 1);
WR_IN = rand(SIZE_R_IN, SIZE_N_IN);
WW_IN = rand(SIZE_N_IN, 1);

% DUT
R_OUT = dnc_addressing(K_READ_IN, BETA_READ_IN, F_READ_IN, PI_READ_IN, K_WRITE_IN, BETA_WRITE_IN, E_WRITE_IN, V_WRITE_IN, GA_WRITE_IN, GW_WRITE_IN, M_IN, L_IN, P_IN, U_IN, WR_IN, WW_IN);