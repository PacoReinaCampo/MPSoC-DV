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

extern crate library;

use library::module_abc::module_a::*;
use library::module_abc::module_b::*;
use library::module_abc::module_c::*;

use library::module_xyz::module_x::*;
use library::module_xyz::module_y::*;
use library::module_xyz::module_z::*;

fn main() {
    let first_a = A {
        a_1: "first_a one".to_string(),
        a_2: 2,
        a_3: -1,
    };

    let second_b = B {
        b_1: "second_b one".to_string(),
        b_2: 4,
        b_3: -2,
    };

    let third_c = C {
        c_1: "third_c one".to_string(),
        c_2: 8,
        c_3: -4,
    };

    let first_x = X {
        x_1: "first_x one".to_string(),
        x_2: 2,
        x_3: -1,
    };

    let second_y = Y {
        y_1: "second_y one".to_string(),
        y_2: 4,
        y_3: -2,
    };

    let third_z = Z {
        z_1: "third_z one".to_string(),
        z_2: 8,
        z_3: -4,
    };

    println!("{}: {}, {} = {}", first_a.a_1, first_a.a_2, first_a.a_3, first_a.calculate_a());
    println!("{}: {}, {} = {}", second_b.b_1, second_b.b_2, second_b.b_3, second_b.calculate_b());
    println!("{}: {}, {} = {}", third_c.c_1, third_c.c_2, third_c.c_3, third_c.calculate_c());

    println!("{}: {}, {} = {}", first_x.x_1, first_x.x_2, first_x.x_3, first_x.calculate_x());
    println!("{}: {}, {} = {}", second_y.y_1, second_y.y_2, second_y.y_3, second_y.calculate_y());
    println!("{}: {}, {} = {}", third_z.z_1, third_z.z_2, third_z.z_3, third_z.calculate_z());
}
