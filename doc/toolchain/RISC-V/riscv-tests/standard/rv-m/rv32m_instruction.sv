/*
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

////////////  RV32M instructions  //////////////
`DEFINE_INSTRUCTION(MUL,    R_FORMAT, ARITHMETIC, RV32M)
`DEFINE_INSTRUCTION(MULH,   R_FORMAT, ARITHMETIC, RV32M)
`DEFINE_INSTRUCTION(MULHSU, R_FORMAT, ARITHMETIC, RV32M)
`DEFINE_INSTRUCTION(MULHU,  R_FORMAT, ARITHMETIC, RV32M)
`DEFINE_INSTRUCTION(DIV,    R_FORMAT, ARITHMETIC, RV32M)
`DEFINE_INSTRUCTION(DIVU,   R_FORMAT, ARITHMETIC, RV32M)
`DEFINE_INSTRUCTION(REM,    R_FORMAT, ARITHMETIC, RV32M)
`DEFINE_INSTRUCTION(REMU,   R_FORMAT, ARITHMETIC, RV32M)
