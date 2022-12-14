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

class TensorMathAlgebra:
  def __init__(self, tensor_data_a_in, tensor_data_b_in, matrix_data_a_in, matrix_data_b_in, tensor_data_in, array4_data_in):
    self.tensor_data_a_in = tensor_data_a_in
    self.tensor_data_b_in = tensor_data_b_in

    self.matrix_data_a_in = matrix_data_a_in
    self.matrix_data_b_in = matrix_data_b_in

    self.tensor_data_in = tensor_data_in
    self.array4_data_in = array4_data_in

  def ntm_tensor_convolution(self):

    a_in = np.array(self.tensor_data_a_in)
    b_in = np.array(self.tensor_data_b_in)

    data_out = []

    # calculating convolution
    for i in range(len(self.tensor_data_a_in)):
      data_out.append([])
      for j in range(len(self.tensor_data_a_in[i])):
        data_out[i].append([])
        for k in range(len(self.tensor_data_b_in[i])):
          temporal = 0.0

          for m in range(i):
            for n in range(j):
              for p in range(k):
                temporal += a_in[m][n][p] * b_in[i-m][j-n][k-p]

          data_out[i][j].append(temporal)

    return data_out

  def ntm_tensor_inverse(self):

    data_out = []

    # calculating inverse
    for i in range(len(self.tensor_data_in)):
      data_out.append([])
      for j in range(len(self.tensor_data_in[i])):
        data_out[i].append([])
        for k in range(len(self.tensor_data_in[i][j])):
          data_out[i][j].append(self.tensor_data_in[i][k][j])

    return data_out

  def ntm_tensor_matrix_convolution(self):

    a_in = np.array(self.tensor_data_a_in)
    b_in = np.array(self.matrix_data_b_in)

    data_out = []

    # calculating convolution
    for i in range(len(self.tensor_data_a_in)):
      data_out.append([])
      for j in range(len(self.tensor_data_a_in[i])):
        data_out[i].append([])
        for k in range(len(self.matrix_data_b_in[i])):
          temporal = 0.0

          for m in range(i):
            for n in range(j):
              for p in range(k):
                temporal += a_in[m][n][p] * b_in[i-m][j-n]

          data_out[i][j].append(temporal)

    return data_out

  def ntm_tensor_matrix_product(self):

    a_in = np.array(self.tensor_data_a_in)
    b_in = np.array(self.matrix_data_b_in)

    data_out = []

    # calculating product
    for i in range(len(self.tensor_data_a_in)):
      data_out.append([])
      for j in range(len(self.tensor_data_a_in[i])):
        data_out[i].append([])
        for k in range(len(self.matrix_data_b_in[i])):
          temporal = 0.0

          for m in range(len(self.tensor_data_a_in[i][j])):
            temporal += a_in[i][j][m] * b_in[i][m]

          data_out[i][j].append(temporal)

    return data_out

  def ntm_tensor_multiplication(self):

    data_out = []

    # calculating multiplication
    for i in range(len(self.array4_data_in)):
      data_out.append([])

      for j in range(len(self.array4_data_in[i])):
        data_out[i].append([])

        for k in range(len(self.array4_data_in[i][j])):
          temporal = 1.0

          for t in range(len(self.array4_data_in[i][j][k])):
            temporal *= self.array4_data_in[i][j][k][t]

          data_out[i][j].append(temporal)

    return data_out

  def ntm_tensor_product(self):

    a_in = np.array(self.tensor_data_a_in)
    b_in = np.array(self.tensor_data_b_in)

    data_out = []

    # calculating product
    for i in range(len(self.tensor_data_a_in)):
      data_out.append([])
      for j in range(len(self.tensor_data_a_in[i])):
        data_out[i].append([])
        for k in range(len(self.tensor_data_b_in[i])):
          temporal = 0.0

          for m in range(len(self.tensor_data_a_in[i][j])):
            temporal += a_in[i][j][m] * b_in[i][m][k]

          data_out[i][j].append(temporal)

    return data_out

  def ntm_tensor_summation(self):

    data_out = []

    # calculating summation
    for i in range(len(self.array4_data_in)):
      data_out.append([])

      for j in range(len(self.array4_data_in[i])):
        data_out[i].append([])

        for k in range(len(self.array4_data_in[i][j])):
          temporal = 1.0

          for t in range(len(self.array4_data_in[i][j][k])):
            temporal += self.array4_data_in[i][j][k][t]

          data_out[i][j].append(temporal)

    return data_out

  def ntm_tensor_transpose(self):

    data_out = []

    # calculating transpose
    for i in range(len(self.tensor_data_in)):
      data_out.append([])
      for j in range(len(self.tensor_data_in[i])):
        data_out[i].append([])
        for k in range(len(self.tensor_data_in[i][j])):
          data_out[i][j].append(self.tensor_data_in[i][k][j])

    return data_out
