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

package main

// fmt package provides the function to print anything
import (
  "fmt"
  "math/rand"

  "go/library/bfm/ahb4"
)

func main() {
  // define the float64 variables we want to add
  var data_a_in, data_b_in float64

  var adder_output float64
  var substractor_output float64
  var multiplier_output float64
  var divider_output float64

  // initializing the variables
  data_a_in = rand.Float64()
  data_b_in = rand.Float64()

  // calling the function and storing the result
  adder_output = peripheral_design.ScalarAdder(data_a_in, data_b_in)
  substractor_output = peripheral_design.ScalarSubstractor(data_a_in, data_b_in)
  multiplier_output = peripheral_design.ScalarMultiplier(data_a_in, data_b_in)
  divider_output = peripheral_design.ScalarDivider(data_a_in, data_b_in)

  // printing the results
  fmt.Println("The addition of ", data_a_in, " and ", data_b_in, " is ", adder_output, "(adding two float numbers outside the function)")
  fmt.Println("The substraction of ", data_a_in, " and ", data_b_in, " is ", substractor_output, "(substracting two float numbers outside the function)")
  fmt.Println("The multiplication of ", data_a_in, " and ", data_b_in, " is ", multiplier_output, "(multiplying two float numbers outside the function)")
  fmt.Println("The division of ", data_a_in, " and ", data_b_in, " is ", divider_output, "(dividing two float numbers outside the function)")
}
