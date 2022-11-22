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
SIZE_N_IN = 3;
SIZE_P_IN = 3;
SIZE_Q_IN = 3;

k = 4;

% Signals
DATA_K_IN = [0.8334, 0.8499, 0.4069; 0.3961, 0.6429, 0.1376; 0.5145, 0.1792, 0.5457];
DATA_A_IN = [0.8883, 0.7614, 0.9901; 0.1910, 0.5176, 0.5156; 0.1396, 0.7185, 0.2810];
DATA_B_IN = [0.1786, 0.1327, 0.2872; 0.6814, 0.1739, 0.4270; 0.8388, 0.4361, 0.1429];
DATA_C_IN = [0.8640, 0.9439, 0.4257; 0.9781, 0.1217, 0.5513; 0.3687, 0.3826, 0.1675];
DATA_D_IN = [0.4134, 0.9401, 0.3017; 0.0990, 0.0800, 0.1841; 0.9090, 0.0997, 0.1913];

DATA_U_IN = [0.9753, 0.5761, 0.6899, 0.7820; 0.7502, 0.6274, 0.7890, 0.8169; 0.6252, 0.4263, 0.4472, 0.9737];

INITIAL_X = [0.5532; 0.8813; 0.9741];

DATA_X_OUT = [ 5.748798576201760e+01;
               4.844263317870473e+01;
               4.779442403878640e+01];

% DUT
assert(ntm_state_vector_state(DATA_K_IN, DATA_A_IN, DATA_B_IN, DATA_C_IN, DATA_D_IN, DATA_U_IN, INITIAL_X, k), DATA_X_OUT, 1e-6);
