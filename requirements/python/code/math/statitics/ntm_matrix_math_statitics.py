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

class MatrixMathStatitics:
  def __init__(self, data_in):
    self.data_in = data_in

  def ntm_matrix_mean(self):
    inputs = np.array(self.data_in)

    ones = np.ones(inputs.shape)

    # calculating mean
    return (ones/(ones + ones/np.exp(inputs)))

  def ntm_matrix_deviation(self):
    inputs = np.array(self.data_in)

    ones = np.ones(inputs.shape)

    # calculating deviation
    return (ones + np.log(ones + np.exp(inputs)))


mean_data_in = [[6.3226113886226751, 3.1313826152262876, 8.3512687816132226], [4.3132651822261687, 5.3132616875182226, 6.6931471805599454], [9.9982079678583020, 7.9581688450893644, 2.9997639589554603]]

deviation_data_in = [[6.3226113886226751, 3.1313826152262876, 8.3512687816132226], [6.3226113886226751, 3.1313826152262876, 8.3512687816132226], [6.3226113886226751, 3.1313826152262876, 8.3512687816132226]]


math_mean = MatrixMathStatitics(mean_data_in);

math_deviation = MatrixMathStatitics(deviation_data_in);


mean_data_out = [[0.9982079678583020, 0.9581688450893644, 0.9997639589554603], [0.9867871586112067, 0.9950983109503272, 0.9987621580633643], [0.9999545207076224, 0.9996503292557579, 0.9525634621372647]]

deviation_data_out = [[7.324405028374851, 4.174113884283648, 9.351504850519834], [7.324405028374851, 4.174113884283648, 9.351504850519834], [7.324405028374851, 4.174113884283648, 9.351504850519834]]


np.testing.assert_array_equal(math_mean.ntm_matrix_mean(), mean_data_out)

np.testing.assert_array_equal(math_deviation.ntm_matrix_deviation(), deviation_data_out)
