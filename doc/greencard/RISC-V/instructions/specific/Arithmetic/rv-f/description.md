## INSTRUCTION DESCRIPTIONS

Instructions in RISC-V are designed to perform specific operations ranging from basic arithmetic and logical computations to memory access and control flow. Each instruction description outlines its functionality, including operands (registers or immediates), effects on status flags, memory access patterns, and control flow implications. Descriptions provide a clear understanding of how instructions interact with processor state and contribute to program execution.

Format of a line in the table:

`<instruction name> "<instruction description>"`

| instruction name | instruction description                                                                                                          |
|------------------|:---------------------------------------------------------------------------------------------------------------------------------|
| `flw`            | `Loads a single-precision foating-point value from memory into foating-point register frd`                                       |
| `fsw`            | `Stores a single-precision foating-point value from foating-point register frs2 to memory`                                       |
| `fmadd.s`        | `Multiply the single-precision values in frs1 and frs2, then add rs3 and write the result to frd`                                |
| `fmsub.s`        | `Multiply the single-precision values in frs1 and frs2, then subtract rs3 and write the result to frd`                           |
| `fnmsub.s`       | `Multiply the single-precision value in frs1 with the negated value in frs2, then add rs3 and write the result to frd`           |
| `fnmadd.s`       | `Multiply the single-precision value in frs1 with the negated value in frs2, then subtract rs3 and write the result to frd`      |
| `fadd.s`         | `Add the single-precision values in frs1 and frs2, then write the result to frd`                                                 |
| `fsub.s`         | `Subtract the single-precision values in frs1 from frs2, then write the result to frd`                                           |
| `fmul.s`         | `Multiply the single-precision values in frs1 and frs2, then write the result to frd`                                            |
| `fdiv.s`         | `Divide the single-precision value in frs1 into frs2, then write the result to frd`                                              |
| `fsgnj.s`        | `Take the single-precision value from frs1 and inject the sign bit from frs2, then write the result to frd`                      |
| `fsgnjn.s`       | `Take the single-precision value from frs1 and inject the negated sign bit from frs2, then write the result to frd`              |
| `fsgnjx.s`       | `Take the single-precision value from frs1 and inject the xor of the sign bits frs1 and frs2, then write the result to frd`      |
| `fmin.s`         | `Take the smaller single-precision value from frs1 and frs2, then write the result to frd`                                       |
| `fmax.s`         | `Take the larger single-precision value from frs1 and frs2, then write the result to frd`                                        |
| `fsqrt.s`        | `Calculate the square root of the single-precision value in frs1, then write the result to frd`                                  |
| `fle.s`          | `Set rd to 1 if the single-precision value in frs1 is less than or equal to frs2, otherwise set rd to 0`                         |
| `flt.s`          | `Set rd to 1 if the single-precision value in frs1 is less than frs2, otherwise set rd to 0`                                     |
| `feq.s`          | `Set rd to 1 if the single-precision value in frs1 is equal to frs2, otherwise set rd to 0`                                      |
| `fcvt.w.s`       | `Convert the single-precision value in frs1 to a 32-bit signed integer, then write the result to rd`                             |
| `fcvt.wu.s`      | `Convert the single-precision value in frs1 to a 32-bit unsigned integer, then write the result to rd`                           |
| `fcvt.s.w`       | `Convert the 32-bit signed integer in rs1 to a single-precision value, then write the result to frd`                             |
| `fcvt.s.wu`      | `Convert the 32-bit unsigned integer in rs1 to a single-precision value, then write the result to frd`                           |
| `fclass.s`       | `Set rd to a 10-bit mask indicating the class of the single-precision value in frs1`                                             |

:RV32F - "RV32F Standard Extension for Single-Precision Floating-Point"

The RV32F table details the single-precision floating-point extension for the 32-bit RISC-V architecture, supporting operations on 32-bit floating-point numbers according to IEEE 754 standards.

| instruction name | instruction description                                                                                                          |
|------------------|:---------------------------------------------------------------------------------------------------------------------------------|
| `fcvt.l.s`       | `Convert the single-precision value in frs1 to a 64-bit signed integer, then write the result to rd`                             |
| `fcvt.lu.s`      | `Convert the single-precision value in frs1 to a 64-bit unsigned integer, then write the result to rd`                           |
| `fmv.x.s`        | `Write the sign extended single-precision value in frs1 into the integer register rd`                                            |
| `fcvt.s.l`       | `Convert the 64-bit signed integer in rs1 to a single-precision value, then write the result to frd`                             |
| `fcvt.s.lu`      | `Convert the 64-bit unsigned integer in rs1 to a single-precision value, then write the result to frd`                           |
| `fmv.s.x`        | `Write the lower 32-bits of the integer register rs1 into the single-precision register frd`                                     |

:RV64F - "RV64F Standard Extension for Single-Precision Floating-Point (+ RV32F)"

 Expanding on RV32F, RV64F introduces support for single-precision floating-point operations in the 64-bit RISC-V architecture, maintaining compatibility with RV32F for seamless transition.
