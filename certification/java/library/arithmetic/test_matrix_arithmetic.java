///////////////////////////////////////////////////////////////////////////////////
//                                            __ _      _     _                  //
//                                           / _(_)    | |   | |                 //
//                __ _ _   _  ___  ___ _ __ | |_ _  ___| | __| |                 //
//               / _` | | | |/ _ \/ _ \ '_ \|  _| |/ _ \ |/ _` |                 //
//              | (_| | |_| |  __/  __/ | | | | | |  __/ | (_| |                 //
//               \__, |\__,_|\___|\___|_| |_|_| |_|\___|_|\__,_|                 //
//                  | |                                                          //
//                  |_|                                                          //
//                                                                               //
//                                                                               //
//              Peripheral-NTM for MPSoC                                         //
//              Neural Turing Machine for MPSoC                                  //
//                                                                               //
///////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////
//                                                                               //
// Copyright (c) 2020-2024 by the author(s)                                      //
//                                                                               //
// Permission is hereby granted, free of charge, to any person obtaining a copy  //
// of this software and associated documentation files (the "Software"), to deal //
// in the Software without restriction, including without limitation the rights  //
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell     //
// copies of the Software, and to permit persons to whom the Software is         //
// furnished to do so, subject to the following conditions:                      //
//                                                                               //
// The above copyright notice and this permission notice shall be included in    //
// all copies or substantial portions of the Software.                           //
//                                                                               //
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR    //
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,      //
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE   //
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER        //
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, //
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN     //
// THE SOFTWARE.                                                                 //
//                                                                               //
// ============================================================================= //
// Author(s):                                                                    //
//   Paco Reina Campo <pacoreinacampo@queenfield.tech>                           //
//                                                                               //
///////////////////////////////////////////////////////////////////////////////////

import java.util.Arrays;
import java.util.Random;

import matrix.ntm_matrix_arithmetic;

class test_matrix_arithmetic {
  public static void main(String[] args) {
    Random random = new Random();

    double[][] data_a_in = new double[3][3];
    for (int i = 0; i < data_a_in.length; i++) {
      final int row = i;
      Arrays.setAll(data_a_in[row], j -> random.nextDouble());
    }

    double[][] data_b_in = new double[3][3];
    for (int i = 0; i < data_b_in.length; i++) {
      final int row = i;
      Arrays.setAll(data_b_in[row], j -> random.nextDouble());
    }

    double[][] addition = new double[data_a_in.length][data_a_in[0].length];
    for (int i = 0; i < data_a_in.length; i++) {
      final int row = i;
      Arrays.setAll(addition[row], j -> data_a_in[row][j] + data_b_in[row][j]);
    }

    assert Arrays.deepEquals(ntm_matrix_arithmetic.ntm_matrix_adder(data_a_in, data_b_in), addition) : "Incorrect Addition";

    double[][] subtraction = new double[data_a_in.length][data_a_in[0].length];
    for (int i = 0; i < data_a_in.length; i++) {
      final int row = i;
      Arrays.setAll(subtraction[row], j -> data_a_in[row][j] - data_b_in[row][j]);
    }

    assert Arrays.deepEquals(ntm_matrix_arithmetic.ntm_matrix_subtractor(data_a_in, data_b_in), subtraction) : "Incorrect Subtraction";

    double[][] multiplication = new double[data_a_in.length][data_a_in[0].length];
    for (int i = 0; i < data_a_in.length; i++) {
      final int row = i;
      Arrays.setAll(multiplication[row], j -> data_a_in[row][j] * data_b_in[row][j]);
    }

    assert Arrays.deepEquals(ntm_matrix_arithmetic.ntm_matrix_multiplier(data_a_in, data_b_in), multiplication) : "Incorrect Multiplication";

    double[][] division = new double[data_a_in.length][data_a_in[0].length];
    for (int i = 0; i < data_a_in.length; i++) {
      final int row = i;
      Arrays.setAll(division[row], j -> data_a_in[row][j] / data_b_in[row][j]);
    }

    assert Arrays.deepEquals(ntm_matrix_arithmetic.ntm_matrix_divider(data_a_in, data_b_in), division) : "Incorrect Division";
  }
}
