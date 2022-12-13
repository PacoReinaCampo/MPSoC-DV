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

from tensor import ntm_tensor_differentiation as tensor_differentiation
from tensor import ntm_tensor_integration as tensor_integration
from tensor import ntm_tensor_softmax as tensor_softmax

from tensor import ntm_tensor_math_calculus as tensor_math_calculus

def test_tensor_differentiation():

  control = 0

  length_i_in = 1.0
  length_j_in = 1.0
  length_k_in = 1.0

  data_in = np.random.rand(3,3,3)

  np.testing.assert_array_equal(tensor_differentiation.ntm_tensor_differentiation(data_in, length_i_in, length_j_in, length_k_in, control), tensor_differentiation.ntm_tensor_differentiation(data_in, length_i_in, length_j_in, length_k_in, control))

def test_tensor_integration():

  length_in = 1.0

  data_in = np.random.rand(3,3,3)

  np.testing.assert_array_equal(tensor_integration.ntm_tensor_integration(data_in, length_in), tensor_integration.ntm_tensor_integration(data_in, length_in))

def test_tensor_softmax():

  data_in = np.random.rand(3,3,3)

  np.testing.assert_array_equal(tensor_softmax.ntm_tensor_softmax(data_in), tensor_softmax.ntm_tensor_softmax(data_in))

def test_tensor_math_calculus():

  control = 0

  length_in = 1.0

  length_i_in = 1.0
  length_j_in = 1.0
  length_k_in = 1.0

  data_in = np.random.rand(3,3,3)

  math_calculus = tensor_math_calculus.TensorMathCalculus(data_in, length_in, length_i_in, length_j_in, length_k_in, control)
  test_calculus = tensor_math_calculus.TensorMathCalculus(data_in, length_in, length_i_in, length_j_in, length_k_in, control)

  np.testing.assert_array_equal(math_calculus.ntm_tensor_differentiation(), test_calculus.ntm_tensor_differentiation())

  np.testing.assert_array_equal(math_calculus.ntm_tensor_integration(), test_calculus.ntm_tensor_integration())

  np.testing.assert_array_equal(math_calculus.ntm_tensor_softmax(), test_calculus.ntm_tensor_softmax())


test_tensor_differentiation()
test_tensor_integration()
test_tensor_softmax()

test_tensor_math_calculus()
