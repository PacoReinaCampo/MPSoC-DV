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

import vector.ntm_vector_math;

class test_vector_math {
  public static void main(String[] args) {
    Random random = new Random();

    double[] data_a_in = new double[3];
    Arrays.setAll(data_a_in, i -> random.nextDouble());

    double[] data_b_in = new double[3];
    Arrays.setAll(data_b_in, i -> random.nextDouble());

    double[] logistic_function = new double[data_a_in.length];
    Arrays.setAll(logistic_function, i -> data_a_in[i] + data_b_in[i]);

    assert Arrays.equals(ntm_vector_math.ntm_vector_logistic_function(data_a_in, data_b_in), logistic_function) : "Incorrect Logistic Function";

    double[] oneplus_function = new double[data_a_in.length];
    Arrays.setAll(oneplus_function, i -> data_a_in[i] - data_b_in[i]);

    assert Arrays.equals(ntm_vector_math.ntm_vector_oneplus_function(data_a_in, data_b_in), oneplus_function) : "Incorrect Oneplus Function";

    double[] mean_function = new double[data_a_in.length];
    Arrays.setAll(mean_function, i -> data_a_in[i] * data_b_in[i]);

    assert Arrays.equals(ntm_vector_math.ntm_vector_mean_function(data_a_in, data_b_in), mean_function) : "Incorrect Mean Function";

    double[] deviation_function = new double[data_a_in.length];
    Arrays.setAll(deviation_function, i -> data_a_in[i] / data_b_in[i]);

    assert Arrays.equals(ntm_vector_math.ntm_vector_deviation_function(data_a_in, data_b_in), deviation_function) : "Incorrect Deviation Function";
  }
}
