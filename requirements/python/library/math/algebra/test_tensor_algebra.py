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

from tensor import ntm_tensor_convolution as tensor_convolution
from tensor import ntm_tensor_inverse as tensor_inverse
from tensor import ntm_tensor_matrix_convolution as tensor_matrix_convolution
from tensor import ntm_tensor_matrix_product as tensor_matrix_product
from tensor import ntm_tensor_multiplication as tensor_multiplication
from tensor import ntm_tensor_product as tensor_product
from tensor import ntm_tensor_summation as tensor_summation
from tensor import ntm_tensor_transpose as tensor_transpose

from tensor import ntm_tensor_math_algebra as tensor_math_algebra

def test_tensor_convolution():

  data_a_in = np.random.rand(3,3,3)
  data_b_in = np.random.rand(3,3,3)

  np.testing.assert_array_equal(tensor_convolution.ntm_tensor_convolution(data_a_in, data_b_in), tensor_convolution.ntm_tensor_convolution(data_a_in, data_b_in))

def test_tensor_inverse():

  data_in = np.random.rand(3,3,3)

  np.testing.assert_array_equal(tensor_inverse.ntm_tensor_inverse(data_in), tensor_inverse.ntm_tensor_inverse(data_in))

def test_tensor_matrix_convolution():

  data_a_in = np.random.rand(3,3,3)
  data_b_in = np.random.rand(3,3)

  np.testing.assert_array_equal(tensor_matrix_convolution.ntm_tensor_matrix_convolution(data_a_in, data_b_in), tensor_matrix_convolution.ntm_tensor_matrix_convolution(data_a_in, data_b_in))

def test_tensor_matrix_product():

  data_a_in = np.random.rand(3,3,3)
  data_b_in = np.random.rand(3,3)

  np.testing.assert_array_equal(tensor_matrix_product.ntm_tensor_matrix_product(data_a_in, data_b_in), tensor_matrix_product.ntm_tensor_matrix_product(data_a_in, data_b_in))

def test_tensor_multiplication():

  data_in = np.random.rand(3,3,3,3)

  np.testing.assert_array_equal(tensor_multiplication.ntm_tensor_multiplication(data_in), tensor_multiplication.ntm_tensor_multiplication(data_in))

def test_tensor_product():

  data_a_in = np.random.rand(3,3,3)
  data_b_in = np.random.rand(3,3,3)

  np.testing.assert_array_equal(tensor_product.ntm_tensor_product(data_a_in, data_b_in), tensor_product.ntm_tensor_product(data_a_in, data_b_in))

def test_tensor_summation():

  data_in = np.random.rand(3,3,3,3)

  np.testing.assert_array_equal(tensor_summation.ntm_tensor_summation(data_in), tensor_summation.ntm_tensor_summation(data_in))

def test_tensor_transpose():

  data_in = np.random.rand(3,3,3)

  np.testing.assert_array_equal(tensor_transpose.ntm_tensor_transpose(data_in), tensor_transpose.ntm_tensor_transpose(data_in))

def test_tensor_math_algebra():

  tensor_data_a_in = np.random.rand(3,3,3)
  tensor_data_b_in = np.random.rand(3,3,3)

  matrix_data_a_in = np.random.rand(3,3)
  matrix_data_b_in = np.random.rand(3,3)

  tensor_data_in = np.random.rand(3,3,3)
  array4_data_in = np.random.rand(3,3,3,3)

  math_algebra = tensor_math_algebra.TensorMathAlgebra(tensor_data_a_in, tensor_data_b_in, matrix_data_a_in, matrix_data_b_in, tensor_data_in, array4_data_in)
  test_algebra = tensor_math_algebra.TensorMathAlgebra(tensor_data_a_in, tensor_data_b_in, matrix_data_a_in, matrix_data_b_in, tensor_data_in, array4_data_in)

  np.testing.assert_array_equal(math_algebra.ntm_tensor_convolution(), test_algebra.ntm_tensor_convolution())

  np.testing.assert_array_equal(math_algebra.ntm_tensor_inverse(), test_algebra.ntm_tensor_inverse())

  np.testing.assert_array_equal(math_algebra.ntm_tensor_matrix_convolution(), test_algebra.ntm_tensor_matrix_convolution())

  np.testing.assert_array_equal(math_algebra.ntm_tensor_matrix_product(), test_algebra.ntm_tensor_matrix_product())

  np.testing.assert_array_equal(math_algebra.ntm_tensor_multiplication(), test_algebra.ntm_tensor_multiplication())

  np.testing.assert_array_equal(math_algebra.ntm_tensor_product(), test_algebra.ntm_tensor_product())

  np.testing.assert_array_equal(math_algebra.ntm_tensor_summation(), test_algebra.ntm_tensor_summation())

  np.testing.assert_array_equal(math_algebra.ntm_tensor_transpose(), test_algebra.ntm_tensor_transpose())


test_tensor_convolution()
test_tensor_inverse()
test_tensor_matrix_convolution()
test_tensor_matrix_product()
test_tensor_multiplication()
test_tensor_product()
test_tensor_summation()
test_tensor_transpose()

test_tensor_math_algebra()
