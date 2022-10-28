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

function DATA_OUT = ntm_matrix_differentiation(DATA_IN, LENGTH_I_IN, LENGTH_J_IN, LENGTH_K_IN, CONTROL)
  % Constants
  [SIZE_I_IN, SIZE_J_IN, SIZE_K_IN] = size(DATA_IN);

  % Signals
  scalar_operation_int = 0;

  DATA_OUT = zeros(SIZE_I_IN, SIZE_J_IN, SIZE_K_IN);

  % Body
  for i = 1:SIZE_I_IN
    for j = 1:SIZE_J_IN
      for k = 1:SIZE_K_IN
        if (CONTROL == 0)
          if (i == 1)
            DATA_OUT(i, j, k) = 0;
          else
            scalar_operation_int = DATA_IN(i, j, k) - DATA_IN(i-1, j, k);

            DATA_OUT(i, j, k) = scalar_operation_int/LENGTH_I_IN;
          end
        elseif (CONTROL == 1)
          if (j == 1)
            DATA_OUT(i, j, k) = 0;
          else
            scalar_operation_int = DATA_IN(i, j, k) - DATA_IN(i, j-1, k);

            DATA_OUT(i, j, k) = scalar_operation_int/LENGTH_J_IN;
          end
        elseif (CONTROL == 2)
          if (k == 1)
            DATA_OUT(i, j, k) = 0;
          else
            scalar_operation_int = DATA_IN(i, j, k) - DATA_IN(i, j, k-1);

            DATA_OUT(i, j, k) = scalar_operation_int/LENGTH_K_IN;
          end
        end
      end
    end
  end
end