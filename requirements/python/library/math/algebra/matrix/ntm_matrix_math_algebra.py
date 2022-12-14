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

class MatrixMathAlgebra:
  def __init__(self, matrix_data_a_in, matrix_data_b_in, vector_data_a_in, vector_data_b_in, matrix_data_in, tensor_data_in):
    self.matrix_data_a_in = matrix_data_a_in
    self.matrix_data_b_in = matrix_data_b_in

    self.vector_data_a_in = vector_data_a_in
    self.vector_data_b_in = vector_data_b_in

    self.matrix_data_in = matrix_data_in
    self.tensor_data_in = tensor_data_in

  def ntm_matrix_convolution(self):

    a_in = np.array(self.matrix_data_a_in)
    b_in = np.array(self.matrix_data_b_in)

    data_out = []

    # calculating convolution
    for i in range(len(self.matrix_data_a_in)):
      data_out.append([])
      for j in range(len(self.matrix_data_b_in[i])):
        temporal = 0.0

        for m in range(i):
          for n in range(j):
            temporal += a_in[m][n] * b_in[i-m][j-n]

        data_out[i].append(temporal)

    return data_out

  def ntm_matrix_inverse(self):

    data_out = []

    # calculating inverse
    for i in range(len(self.matrix_data_in)):
      data_out.append([])
      for j in range(len(self.matrix_data_in[i])):
        data_out[i].append(self.matrix_data_in[j][i])

    return data_out

  def ntm_matrix_multiplication(self):

    data_out = []

    # calculating summation
    for i in range(len(self.tensor_data_in)):
      data_out.append([])

      for j in range(len(self.tensor_data_in[i])):
        temporal = 1.0

        for k in range(len(self.tensor_data_in[i][j])):
          temporal *= self.tensor_data_in[i][j][k]

        data_out[i].append(temporal)

    return data_out

  def ntm_matrix_product(self):

    a_in = np.array(self.matrix_data_a_in)
    b_in = np.array(self.matrix_data_b_in)

    data_out = []

    # calculating product
    for i in range(len(self.matrix_data_a_in)):
      data_out.append([])
      for j in range(len(self.matrix_data_b_in[i])):
        temporal = 0.0

        for m in range(len(self.matrix_data_a_in[i])):
          temporal += a_in[i][m] * b_in[m][j]

        data_out[i].append(temporal)

    return data_out

  def ntm_matrix_summation(self):

    data_out = []

    # calculating summation
    for i in range(len(self.tensor_data_in)):
      data_out.append([])

      for j in range(len(self.tensor_data_in[i])):
        temporal = 0.0

        for k in range(len(self.tensor_data_in[i][j])):
          temporal += self.tensor_data_in[i][j][k]

        data_out[i].append(temporal)

    return data_out

  def ntm_matrix_transpose(self):

    data_out = []

    # calculating transpose
    for i in range(len(self.matrix_data_in)):
      data_out.append([])
      for j in range(len(self.matrix_data_in[i])):
        data_out[i].append(self.matrix_data_in[j][i])

    return data_out

  def ntm_matrix_vector_convolution(self):

    a_in = np.array(self.matrix_data_a_in)
    b_in = np.array(self.vector_data_b_in)

    data_out = []

    # calculating convolution
    for i in range(len(self.matrix_data_a_in)):
      data_out.append([])
      for j in range(len(self.matrix_data_a_in[i])):
        temporal = 0.0

        for m in range(i):
          for n in range(j):
            temporal += a_in[m][n] * b_in[i-m]

        data_out[i].append(temporal)

    return data_out

  def ntm_matrix_vector_product(self):

    a_in = np.array(self.matrix_data_a_in)
    b_in = np.array(self.vector_data_b_in)

    data_out = []

    # calculating product
    for i in range(len(self.matrix_data_a_in)):
      data_out.append([])
      for j in range(len(self.matrix_data_a_in[i])):
        temporal = 0.0

        for m in range(len(self.vector_data_b_in)):
          temporal += a_in[i][m] * b_in[m]

        data_out[i].append(temporal)

    return data_out
  
  def ntm_transpose_vector_product(self):

    a_in = np.array(self.vector_data_a_in)
    b_in = np.array(self.vector_data_b_in)

    data_out = []

    # calculating product
    for i in range(len(self.vector_data_a_in)):
      data_out.append([])
      for j in range(len(self.vector_data_b_in)):
        temporal = a_in[i] * b_in[j]

        data_out[i].append(temporal)

    return data_out
