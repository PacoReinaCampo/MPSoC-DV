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

import random

from scalar import ntm_scalar_adder as scalar_adder
from scalar import ntm_scalar_subtractor as scalar_subtractor
from scalar import ntm_scalar_multiplier as scalar_multiplier
from scalar import ntm_scalar_divider as scalar_divider

def test_scalar_adder():

  data_a_in = random.random()
  data_b_in = random.random()

  assert scalar_adder.ntm_scalar_adder(data_a_in, data_b_in) == data_a_in + data_b_in

def test_scalar_subtractor():

  data_a_in = random.random()
  data_b_in = random.random()

  assert scalar_subtractor.ntm_scalar_subtractor(data_a_in, data_b_in) == data_a_in - data_b_in

def test_scalar_multiplier():
  
  data_a_in = random.random()
  data_b_in = random.random()

  assert scalar_multiplier.ntm_scalar_multiplier(data_a_in, data_b_in) == data_a_in * data_b_in

def test_scalar_divider():
  
  data_a_in = random.random()
  data_b_in = random.random()

  assert scalar_divider.ntm_scalar_divider(data_a_in, data_b_in) == data_a_in / data_b_in


test_scalar_adder()
test_scalar_subtractor()
test_scalar_multiplier()
test_scalar_divider()
