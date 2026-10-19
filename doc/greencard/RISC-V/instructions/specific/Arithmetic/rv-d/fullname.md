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

| instruction  | instruction full-name                                               |
|--------------|:--------------------------------------------------------------------|
| `fld`        | `FP Load (DP)`                                                      |
| `fsd`        | `FP Store (DP)`                                                     |
| `fmadd.d`    | `FP Fused Multiply Add (DP)`                                        |
| `fmsub.d`    | `FP Fused Multiply Subtract (DP)`                                   |
| `fnmadd.d`   | `FP Negate fused Multiply Add (DP)`                                 |
| `fnmsub.d`   | `FP Negate fused Multiply Subtract (DP)`                            |
| `fadd.d`     | `FP Add (DP)`                                                       |
| `fsub.d`     | `FP Subtract (DP)`                                                  |
| `fmul.d`     | `FP Multiply (DP)`                                                  |
| `fdiv.d`     | `FP Divide (DP)`                                                    |
| `fsgnj.d`    | `FP to Sign-injection (DP)`                                         |
| `fsgnjn.d`   | `FP to Sign-injection Negate (DP)`                                  |
| `fsgnjx.d`   | `FP to Sign-injection Xor (DP)`                                     |
| `fmin.d`     | `FP Minimum (DP)`                                                   |
| `fmax.d`     | `FP Maximum (DP)`                                                   |
| `fcvt.s.d`   | `FP Convert DP to SP`                                               |
| `fcvt.d.s`   | `FP Convert SP to DP`                                               |
| `fsqrt.d`    | `Floating Square Root (DP)`                                         |
| `fle.d`      | `FP Less Than Equal (DP)`                                           |
| `flt.d`      | `FP Less Than (DP)`                                                 |
| `feq.d`      | `FP Equal (DP)`                                                     |
| `fcvt.w.d`   | `FP Convert Float to Word (DP)`                                     |
| `fcvt.wu.d`  | `FP Convert Float to Word Unsigned (DP)`                            |
| `fcvt.d.w`   | `FP Convert Word to Float (DP)`                                     |
| `fcvt.d.wu`  | `FP Convert Word Unsigned to Float (DP)`                            |
| `fclass.d`   | `FP Classify (DP)`                                                  |

:RV32D - "RV32D Standard Extension for Double-Precision Floating-Point"

 This table describes the double-precision floating-point extension for the 32-bit RISC-V architecture, enabling operations on 64-bit floating-point numbers conforming to IEEE 754 standards.

| instruction  | instruction full-name                                               |
|--------------|:--------------------------------------------------------------------|
| `fcvt.l.d`   | `FP Convert Float to Double Word (DP)`                              |
| `fcvt.lu.d`  | `FP Convert Float to Double Word Unsigned (DP)`                     |
| `fmv.x.d`    | `FP Move to Integer Register (DP)`                                  |
| `fcvt.d.l`   | `FP Convert Double Word to Float (DP)`                              |
| `fcvt.d.lu`  | `FP Convert Double Word Unsigned Float (DP)`                        |
| `fmv.d.x`    | `FP Move from Integer Register (DP)`                                |

:RV64D - "RV64D Standard Extension for Double-Precision Floating-Point (+ RV32D)"

 Building upon RV32D, RV64D extends support for double-precision floating-point operations to the 64-bit RISC-V architecture, facilitating higher precision computations.

| instruction  | instruction full-name                                               |
|--------------|:--------------------------------------------------------------------|
| `frcsr`      | `Read FP Control and Status Register`                               |
| `frrm`       | `Read FP Rounding Mode`                                             |
| `frflags`    | `Read FP Accrued Exception Flags`                                   |
| `fscsr`      | `Set FP Control and Status Register`                                |
| `fsrm`       | `Set FP Rounding Mode`                                              |
| `fsflags`    | `Set FP Accrued Exception Flags`                                    |
| `fsrmi`      | `Set FP Rounding Mode Immediate`                                    |
| `fsflagsi`   | `Set FP Accrued Exception Flags Immediate`                          |

:RV32FD - "RV32F and RV32D Common Floating-Point Instructions"

 RV32FD documents the common floating-point instructions shared between the RV32F (single-precision) and RV32D (double-precision) floating-point extensions, optimizing instruction set usage.
