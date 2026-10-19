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

`DEFINE_INSTRUCTION(LWU,     I_FORMAT, LOAD, RV64E)
`DEFINE_INSTRUCTION(LD,      I_FORMAT, LOAD, RV64E)
`DEFINE_INSTRUCTION(SD,      S_FORMAT, STORE, RV64E)
// SHIFT intructions
`DEFINE_INSTRUCTION(SLLW,    R_FORMAT, SHIFT, RV64E)
`DEFINE_INSTRUCTION(SLLIW,   I_FORMAT, SHIFT, RV64E)
`DEFINE_INSTRUCTION(SRLW,    R_FORMAT, SHIFT, RV64E)
`DEFINE_INSTRUCTION(SRLIW,   I_FORMAT, SHIFT, RV64E)
`DEFINE_INSTRUCTION(SRAW,    R_FORMAT, SHIFT, RV64E)
`DEFINE_INSTRUCTION(SRAIW,   I_FORMAT, SHIFT, RV64E)
// ARITHMETIC intructions
`DEFINE_INSTRUCTION(ADDW,    R_FORMAT, ARITHMETIC, RV64E)
`DEFINE_INSTRUCTION(ADDIW,   I_FORMAT, ARITHMETIC, RV64E)
`DEFINE_INSTRUCTION(SUBW,    R_FORMAT, ARITHMETIC, RV64E)
