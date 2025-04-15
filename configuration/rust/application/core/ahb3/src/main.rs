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

extern crate core_library_ahb3;
extern crate rand;

use core_library_ahb3::code::peripheral_design::*;
use rand::random;

fn main() {
    let data_a_input: f64 = random();
    let data_b_input: f64 = random();

    let data_addition_output: f64 = data_a_input + data_b_input;
    let data_subtraction_output: f64 = data_a_input - data_b_input;
    let data_multiplication_output: f64 = data_a_input * data_b_input;
    let data_division_output: f64 = data_a_input / data_b_input;

    let addition = ScalarArithmetic {
        data_a_in: data_a_input,
        data_b_in: data_b_input,

        data_out: data_addition_output
    };

    assert_eq!(addition.ntm_scalar_adder(), addition.data_out);

    let subtraction = ScalarArithmetic {
        data_a_in: data_a_input,
        data_b_in: data_b_input,

        data_out: data_subtraction_output
    };

    assert_eq!(subtraction.ntm_scalar_subtractor(), subtraction.data_out);

    let multiplication = ScalarArithmetic {
        data_a_in: data_a_input,
        data_b_in: data_b_input,

        data_out: data_multiplication_output
    };

    assert_eq!(multiplication.ntm_scalar_multiplier(), multiplication.data_out);

    let division = ScalarArithmetic {
        data_a_in: data_a_input,
        data_b_in: data_b_input,

        data_out: data_division_output
    };

    assert_eq!(division.ntm_scalar_divider(), division.data_out);
}