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
## Copyright (c) 2022-2023 by the author(s)                                      ##
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

import numpy as np

from matrix import ntm_matrix_mean as matrix_mean
from matrix import ntm_matrix_deviation as matrix_deviation

from matrix import ntm_matrix_math_statitics as matrix_math_statitics

def test_matrix_mean():

  data_in = np.random.rand(3,3,3)

  np.testing.assert_array_equal(matrix_mean.ntm_matrix_mean(data_in), matrix_mean.ntm_matrix_mean(data_in))

def test_matrix_deviation():

  data_in = np.random.rand(3,3,3)
  mean_in = np.zeros((3,3))

  np.testing.assert_array_equal(matrix_deviation.ntm_matrix_deviation(data_in, mean_in), matrix_deviation.ntm_matrix_deviation(data_in, mean_in))

def test_matrix_math_statitics():

  data_in = np.random.rand(3,3,3)
  mean_in = np.zeros((3,3))

  math_statitics = matrix_math_statitics.MatrixMathStatitics(data_in, mean_in)
  test_statitics = matrix_math_statitics.MatrixMathStatitics(data_in, mean_in)

  np.testing.assert_array_equal(math_statitics.ntm_matrix_mean(), test_statitics.ntm_matrix_mean())

  np.testing.assert_array_equal(math_statitics.ntm_matrix_deviation(), test_statitics.ntm_matrix_deviation())


test_matrix_mean()
test_matrix_deviation()

test_matrix_math_statitics()
