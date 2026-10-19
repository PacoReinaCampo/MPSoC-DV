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

| instruction name | instruction description                                                                                                          |
|------------------|:---------------------------------------------------------------------------------------------------------------------------------|
| `fld`            | `Loads a double-precision foating-point value from memory into foating-point register frd`                                       |
| `fsd`            | `Stores a double-precision foating-point value from foating-point register frs2 to memory`                                       |
| `fmadd.d`        | `Multiply the double-precision values in frs1 and frs2, then add rs3 and write the result to frd`                                |
| `fmsub.d`        | `Multiply the double-precision values in frs1 and frs2, then subtract rs3 and write the result to frd`                           |
| `fnmsub.d`       | `Multiply the double-precision value in frs1 with the negated value in frs2, then add rs3 and write the result to frd`           |
| `fnmadd.d`       | `Multiply the double-precision value in frs1 with the negated value in frs2, then subtract rs3 and write the result to frd`      |
| `fadd.d`         | `Add the double-precision values in frs1 and frs2, then write the result to frd`                                                 |
| `fsub.d`         | `Subtract the double-precision values in frs1 from frs2, then write the result to frd`                                           |
| `fmul.d`         | `Multiply the double-precision values in frs1 and frs2, then write the result to frd`                                            |
| `fdiv.d`         | `Divide the double-precision value in frs1 into frs2, then write the result to frd`                                              |
| `fsgnj.d`        | `Take the double-precision value from frs1 and inject the sign bit from frs2, then write the result to frd`                      |
| `fsgnjn.d`       | `Take the double-precision value from frs1 and inject the negated sign bit from frs2, then write the result to frd`              |
| `fsgnjx.d`       | `Take the double-precision value from frs1 and inject the xor of the sign bits frs1 and frs2, then write the result to frd`      |
| `fmin.s`         | `Take the smaller double-precision value from frs1 and frs2, then write the result to frd`                                       |
| `fmax.s`         | `Take the larger double-precision value from frs1 and frs2, then write the result to frd`                                        |
| `fcvt.s.d`       | `Convert the double-precision value in frs1 to single-precision, then write the result to frd`                                   |
| `fcvt.d.s`       | `Convert the single-precision value in frs1 to double-precision, then write the result to frd`                                   |
| `fsqrt.d`        | `Calculate the square root of the double-precision value in frs1, then write the result to frd`                                  |
| `fle.d`          | `Set rd to 1 if frs1 is less than or equal to frs2, otherwise set rd to 0`                                                       |
| `flt.d`          | `Set rd to 1 if frs1 is less than frs2, otherwise set rd to 0`                                                                   |
| `feq.d`          | `Set rd to 1 if frs1 is equal to frs2, otherwise set rd to 0`                                                                    |
| `fcvt.w.d`       | `Convert the double-precision value in frs1 to a 32-bit signed integer, then write the result to rd`                             |
| `fcvt.wu.d`      | `Convert the double-precision value in frs1 to a 32-bit unsigned integer, then write the result to rd`                           |
| `fcvt.d.w`       | `Convert the 64-bit signed integer in rs1 to a double-precision value, then write the result to frd`                             |
| `fcvt.d.wu`      | `Convert the 64-bit unsigned integer in rs1 to a double-precision value, then write the result to frd`                           |
| `fmv.x.d`        | `Write the sign extended double-precision value in frs1 into integer register rd`                                                |
| `fclass.d`       | `Set rd to a 10-bit mask indicating the class of the double-precision value in frs1`                                             |
| `fmv.d.x`        | `Write the 64-bit integer register rs1 into the double-precision register frd`                                                   |

:RV32D - "RV32D Standard Extension for Double-Precision Floating-Point"

 This table describes the double-precision floating-point extension for the 32-bit RISC-V architecture, enabling operations on 64-bit floating-point numbers conforming to IEEE 754 standards.

| instruction name | instruction description                                                                                                          |
|------------------|:---------------------------------------------------------------------------------------------------------------------------------|
| `fcvt.l.d`       | `Convert the double-precision value in frs1 to a 64-bit signed integer, then write the result to rd`                             |
| `fcvt.lu.d`      | `Convert the double-precision value in frs1 to a 64-bit unsigned integer, then write the result to rd`                           |
| `fcvt.d.l`       | `Convert the 64-bit signed integer in rs1 to a double-precision value, then write the result to frd`                             |
| `fcvt.d.lu`      | `Convert the 64-bit unsigned integer in rs1 to a double-precision value, then write the result to frd`                           |

:RV64D - "RV64D Standard Extension for Double-Precision Floating-Point (+ RV32D)"

 Building upon RV32D, RV64D extends support for double-precision floating-point operations to the 64-bit RISC-V architecture, facilitating higher precision computations.

| instruction name | instruction description                                                                                                          |
|------------------|:---------------------------------------------------------------------------------------------------------------------------------|
| `frcsr`          | `Read FP Control and Status Register`                                                                                            |
| `frrm`           | `Read FP Rounding Mode (Bits 7:5 of fcsr Control and Status Register)`                                                           |
| `frflags`        | `Read FP Accrued Exception Flags (Bits 4:0 of fcsr Control and Status Register)`                                                 |
| `fscsr`          | `Read FP Control and Status Register`                                                                                            |
| `fsrm`           | `Set FP Rounding Mode (Bits 7:5 of fcsr Control and Status Register)`                                                            |
| `fsflags`        | `Set FP Accrued Exception Flags (Bits 4:0 of fcsr Control and Status Register)`                                                  |
| `fsrmi`          | `Set FP Rounding Mode Immediate (Bits 7:5 of fcsr Control and Status Register)`                                                  |
| `fsflagsi`       | `Set FP Accrued Exception Flags Immediate (Bits 4:0 of fcsr Control and Status Register)`                                        |

:RV32FD - "RV32F and RV32D Common Floating-Point Instructions"

 RV32FD documents the common floating-point instructions shared between the RV32F (single-precision) and RV32D (double-precision) floating-point extensions, optimizing instruction set usage.
