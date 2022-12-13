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

from vector import ntm_vector_adder as vector_adder
from vector import ntm_vector_multiplier as vector_multiplier
from vector import ntm_vector_divider as vector_divider

from vector import ntm_vector_arithmetic as vector_arithmetic

def test_vector_adder():
  
  data_a_in = np.random.rand(3,1)
  data_b_in = np.random.rand(3,1)

  np.testing.assert_array_equal(vector_adder.ntm_vector_adder(data_a_in, data_b_in), data_a_in + data_b_in)

def test_vector_multiplier():
  
  data_a_in = np.random.rand(3,1)
  data_b_in = np.random.rand(3,1)

  np.testing.assert_array_equal(vector_multiplier.ntm_vector_multiplier(data_a_in, data_b_in), data_a_in * data_b_in)

def test_vector_divider():
  
  data_a_in = np.random.rand(3,1)
  data_b_in = np.random.rand(3,1)

  np.testing.assert_array_equal(vector_divider.ntm_vector_divider(data_a_in, data_b_in), data_a_in / data_b_in)

def test_vector_arithmetic():

  data_a_in = np.random.rand(3,1)
  data_b_in = np.random.rand(3,1)

  arithmetic = vector_arithmetic.VectorArithmetic(data_a_in, data_b_in)

  np.testing.assert_array_equal(arithmetic.ntm_vector_adder(), data_a_in + data_b_in)

  np.testing.assert_array_equal(arithmetic.ntm_vector_multiplier(), data_a_in * data_b_in)

  np.testing.assert_array_equal(arithmetic.ntm_vector_divider(), data_a_in / data_b_in)


test_vector_adder()
test_vector_multiplier()
test_vector_divider()

test_vector_arithmetic()
