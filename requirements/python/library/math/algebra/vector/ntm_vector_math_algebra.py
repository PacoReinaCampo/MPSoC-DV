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

import math
import numpy as np 

class VectorMathAlgebra:
  def __init__(self, data_a_in, data_b_in, data_in):
    self.data_a_in = data_a_in
    self.data_b_in = data_b_in

    self.data_in = data_in

  def ntm_dot_product(self):
    data_out = 0.0

    # calculating dot_product
    for i in range(len(self.data_a_in)):
      data_out += self.data_a_in[i] * self.data_b_in[i]

    return data_out

  def ntm_vector_convolution(self):

    a_in = np.array(self.data_a_in)
    b_in = np.array(self.data_b_in)

    data_out = []

    # calculating convolution
    for i in range(len(self.data_a_in)):
      temporal = 0.0

      for m in range(len(self.data_a_in)):
        temporal += a_in[i] * b_in[i-m]

      data_out.append(temporal)

    return data_out

  def ntm_vector_cosine_similarity(self):
    dot_result = 0.0

    input_a_result = 0.0
    input_b_result = 0.0

    # calculating vector_cosine_similarity
    for i in range(len(self.data_a_in)):
      dot_result += self.data_a_in[i] * self.data_b_in[i]

    # calculating vector_cosine_similarity a
    for i in range(len(self.data_a_in)):
      input_a_result += self.data_a_in[i] * self.data_a_in[i]

    # calculating vector_cosine_similarity b
    for i in range(len(self.data_b_in)):
      input_b_result += self.data_b_in[i] * self.data_b_in[i]

    return dot_result/(math.sqrt(input_a_result)*math.sqrt(input_b_result))

  def ntm_vector_module(self):
    data_out = 0.0

    # calculating vector_module
    for i in range(len(self.data_in)):
      data_out += self.data_in[i] * self.data_in[i]

    return math.sqrt(data_out)

  def ntm_vector_multiplication(self):
    data_out = []

    # calculating multiplication
    for i in range(len(self.data_in)):
      temporal = 0.0

      for j in range(len(self.data_in[i])):
        temporal *= self.data_in[i][j]

      data_out.append(temporal)

    return data_out

  def ntm_vector_summation(self):
    data_out = []

    # calculating summation
    for i in range(len(self.data_in)):
      temporal = 0.0

      for j in range(len(self.data_in[i])):
        temporal += self.data_in[i][j]

      data_out.append(temporal)

    return data_out
