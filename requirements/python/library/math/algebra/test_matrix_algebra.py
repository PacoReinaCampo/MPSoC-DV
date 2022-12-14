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

from matrix import ntm_matrix_convolution as matrix_convolution
from matrix import ntm_matrix_inverse as matrix_inverse
from matrix import ntm_matrix_multiplication as matrix_multiplication
from matrix import ntm_matrix_product as matrix_product
from matrix import ntm_matrix_summation as matrix_summation
from matrix import ntm_matrix_transpose as matrix_transpose
from matrix import ntm_matrix_vector_convolution as matrix_vector_convolution
from matrix import ntm_matrix_vector_product as matrix_vector_product
from matrix import ntm_transpose_vector_product as transpose_vector_product

from matrix import ntm_matrix_math_algebra as matrix_math_algebra

def test_matrix_convolution():

  data_a_in = np.random.rand(3,3)
  data_b_in = np.random.rand(3,3)

  np.testing.assert_array_equal(matrix_convolution.ntm_matrix_convolution(data_a_in, data_b_in), matrix_convolution.ntm_matrix_convolution(data_a_in, data_b_in))

def test_matrix_inverse():

  data_in = np.random.rand(3,3)

  np.testing.assert_array_equal(matrix_inverse.ntm_matrix_inverse(data_in), matrix_inverse.ntm_matrix_inverse(data_in))

def test_matrix_multiplication():

  data_in = np.random.rand(3,3,3)

  np.testing.assert_array_equal(matrix_multiplication.ntm_matrix_multiplication(data_in), matrix_multiplication.ntm_matrix_multiplication(data_in))

def test_matrix_product():

  data_a_in = np.random.rand(3,3)
  data_b_in = np.random.rand(3,3)

  np.testing.assert_array_equal(matrix_product.ntm_matrix_product(data_a_in, data_b_in), matrix_product.ntm_matrix_product(data_a_in, data_b_in))

def test_matrix_summation():

  data_in = np.random.rand(3,3,3)

  np.testing.assert_array_equal(matrix_summation.ntm_matrix_summation(data_in), matrix_summation.ntm_matrix_summation(data_in))

def test_matrix_transpose():

  data_in = np.random.rand(3,3)

  np.testing.assert_array_equal(matrix_transpose.ntm_matrix_transpose(data_in), matrix_transpose.ntm_matrix_transpose(data_in))

def test_matrix_vector_convolution():

  data_a_in = np.random.rand(3,3)
  data_b_in = np.random.rand(3)

  np.testing.assert_array_equal(matrix_vector_convolution.ntm_matrix_vector_convolution(data_a_in, data_b_in), matrix_vector_convolution.ntm_matrix_vector_convolution(data_a_in, data_b_in))

def test_matrix_vector_product():

  data_a_in = np.random.rand(3,3)
  data_b_in = np.random.rand(3)

  np.testing.assert_array_equal(matrix_vector_product.ntm_matrix_vector_product(data_a_in, data_b_in), matrix_vector_product.ntm_matrix_vector_product(data_a_in, data_b_in))

def test_transpose_vector_product():

  data_a_in = np.random.rand(3)
  data_b_in = np.random.rand(3)

  np.testing.assert_array_equal(transpose_vector_product.ntm_transpose_vector_product(data_a_in, data_b_in), transpose_vector_product.ntm_transpose_vector_product(data_a_in, data_b_in))

def test_matrix_math_algebra():

  matrix_data_a_in = np.random.rand(3,3)
  matrix_data_b_in = np.random.rand(3,3)

  vector_data_a_in = np.random.rand(3)
  vector_data_b_in = np.random.rand(3)

  matrix_data_in = np.random.rand(3,3)
  tensor_data_in = np.random.rand(3,3,3)

  math_algebra = matrix_math_algebra.MatrixMathAlgebra(matrix_data_a_in, matrix_data_b_in, vector_data_a_in, vector_data_b_in, matrix_data_in, tensor_data_in)
  test_algebra = matrix_math_algebra.MatrixMathAlgebra(matrix_data_a_in, matrix_data_b_in, vector_data_a_in, vector_data_b_in, matrix_data_in, tensor_data_in)

  np.testing.assert_array_equal(math_algebra.ntm_matrix_convolution(), test_algebra.ntm_matrix_convolution())

  np.testing.assert_array_equal(math_algebra.ntm_matrix_inverse(), test_algebra.ntm_matrix_inverse())

  np.testing.assert_array_equal(math_algebra.ntm_matrix_multiplication(), test_algebra.ntm_matrix_multiplication())

  np.testing.assert_array_equal(math_algebra.ntm_matrix_product(), test_algebra.ntm_matrix_product())

  np.testing.assert_array_equal(math_algebra.ntm_matrix_summation(), test_algebra.ntm_matrix_summation())

  np.testing.assert_array_equal(math_algebra.ntm_matrix_transpose(), test_algebra.ntm_matrix_transpose())

  np.testing.assert_array_equal(math_algebra.ntm_matrix_vector_convolution(), test_algebra.ntm_matrix_vector_convolution())

  np.testing.assert_array_equal(math_algebra.ntm_matrix_vector_product(), test_algebra.ntm_matrix_vector_product())

  np.testing.assert_array_equal(math_algebra.ntm_transpose_vector_product(), test_algebra.ntm_transpose_vector_product())


test_matrix_convolution()
test_matrix_inverse()
test_matrix_multiplication()
test_matrix_product()
test_matrix_summation()
test_matrix_transpose()
test_matrix_vector_convolution()
test_matrix_vector_product()
test_transpose_vector_product()

test_matrix_math_algebra()
