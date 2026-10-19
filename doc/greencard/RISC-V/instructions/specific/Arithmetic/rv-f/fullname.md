## INSTRUCTION FULL-NAMES

The RISC-V ISA defines a comprehensive set of instructions, each identified by an opcode that denotes its operation. Full-Names for instructions typically include a mnemonic followed by suffixes indicating specific variants or extensions. For instance, "ADD" denotes addition, while "ADDI" specifies addition with an immediate operand.

Format of a line in the table:

`<instruction name> "<instruction full-name>"`

| instruction  | instruction full-name                                               |
|--------------|:--------------------------------------------------------------------|
| `flw`        | `FP Load (SP)`                                                      |
| `fsw`        | `FP Store (SP)`                                                     |
| `fmadd.s`    | `FP Fused Multiply Add (SP)`                                        |
| `fmsub.s`    | `FP Fused Multiply Subtract (SP)`                                   |
| `fnmadd.s`   | `FP Negate fused Multiply Add (SP)`                                 |
| `fnmsub.s`   | `FP Negate fused Multiply Subtract (SP)`                            |
| `fadd.s`     | `FP Add (SP)`                                                       |
| `fsub.s`     | `FP Subtract (SP)`                                                  |
| `fmul.s`     | `FP Multiply (SP)`                                                  |
| `fdiv.s`     | `FP Divide (SP)`                                                    |
| `fsgnj.s`    | `FP Sign-injection (SP)`                                            |
| `fsgnjn.s`   | `FP Sign-injection Negate (SP)`                                     |
| `fsgnjx.s`   | `FP Sign-injection Xor (SP)`                                        |
| `fmin.s`     | `FP Minimum (SP)`                                                   |
| `fmax.s`     | `FP Maximum (SP)`                                                   |
| `fsqrt.s`    | `FP Square Root (SP)`                                               |
| `fle.s`      | `FP Less Than Equal (SP)`                                           |
| `flt.s`      | `FP Less Than (SP)`                                                 |
| `feq.s`      | `FP Equal (SP)`                                                     |
| `fcvt.w.s`   | `FP Convert Float to Word (SP)`                                     |
| `fcvt.wu.s`  | `FP Convert Float to Word Unsigned (SP)`                            |
| `fcvt.s.w`   | `FP Convert Word to Float (SP)`                                     |
| `fcvt.s.wu`  | `FP Convert Word Unsigned to Float (SP)`                            |
| `fmv.x.s`    | `FP Move to Integer Register (SP)`                                  |
| `fclass.s`   | `FP Classify (SP)`                                                  |
| `fmv.s.x`    | `FP Move from Integer Register (SP)`                                |

:RV32F - "RV32F Standard Extension for Single-Precision Floating-Point"

The RV32F table details the single-precision floating-point extension for the 32-bit RISC-V architecture, supporting operations on 32-bit floating-point numbers according to IEEE 754 standards.

| instruction  | instruction full-name                                               |
|--------------|:--------------------------------------------------------------------|
| `fcvt.l.s`   | `FP Convert Float to Double Word (SP)`                              |
| `fcvt.lu.s`  | `FP Convert Float to Double Word Unsigned (SP)`                     |
| `fcvt.s.l`   | `FP Convert Double Word to Float (SP)`                              |
| `fcvt.s.lu`  | `FP Convert Double Word Unsigned to Float (SP)`                     |

:RV64F - "RV64F Standard Extension for Single-Precision Floating-Point (+ RV32F)"

 Expanding on RV32F, RV64F introduces support for single-precision floating-point operations in the 64-bit RISC-V architecture, maintaining compatibility with RV32F for seamless transition.
