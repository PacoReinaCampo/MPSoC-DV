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

from vector import ntm_vector_mean as vector_mean
from vector import ntm_vector_deviation as vector_deviation

from vector import ntm_vector_math_statitics as vector_math_statitics

def test_vector_mean():

  data_in = np.random.rand(3,3)

  np.testing.assert_array_equal(vector_mean.ntm_vector_mean(data_in), vector_mean.ntm_vector_mean(data_in))

def test_vector_deviation():

  data_in = np.random.rand(3,3)
  mean_in = np.zeros(3)

  np.testing.assert_array_equal(vector_deviation.ntm_vector_deviation(data_in, mean_in), vector_deviation.ntm_vector_deviation(data_in, mean_in))

def test_vector_math_statitics():

  data_in = np.random.rand(3,3)
  mean_in = np.zeros(3)

  math_statitics = vector_math_statitics.VectorMathStatitics(data_in, mean_in)
  test_statitics = vector_math_statitics.VectorMathStatitics(data_in, mean_in)

  np.testing.assert_array_equal(math_statitics.ntm_vector_mean(), test_statitics.ntm_vector_mean())

  np.testing.assert_array_equal(math_statitics.ntm_vector_deviation(), test_statitics.ntm_vector_deviation())


test_vector_mean()
test_vector_deviation()

test_vector_math_statitics()
