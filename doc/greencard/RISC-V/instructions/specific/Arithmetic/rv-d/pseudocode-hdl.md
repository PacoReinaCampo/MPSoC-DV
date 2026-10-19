## INSTRUCTION PSEUDO-CODE (HDL)

Alternative Pseudo-Code representations may also be used to describe RISC-V instructions, catering to different programming paradigms or abstraction levels. These representations vary in style and detail but aim to convey the fundamental operations and control flow logic inherent in each instruction type.

Format of a line in the table:

`<instruction name> "<instruction pseudo-code>"`

| instruction  | instruction pseudo-code                                             |
|--------------|:--------------------------------------------------------------------|
| `flw`        | `frd = f32[rs1 + imm]`                                              |
| `fsw`        | `f32[rs1 + imm] = f32(frs2)`                                        |
| `fmadd.s`    | `frm = rm ; frd = f32(frs1) * f32(frs2) + f32(frs3)`                |
| `fmsub.s`    | `frm = rm ; frd = f32(frs1) * f32(frs2) - f32(frs3)`                |
| `fnmadd.s`   | `frm = rm ; frd = f32(frs1) * -f32(frs2) - f32(frs3)`               |
| `fnmsub.s`   | `frm = rm ; frd = f32(frs1) * -f32(frs2) + f32(frs3)`               |
| `fadd.s`     | `frm = rm ; frd = f32(frs1) + f32(frs2)`                            |
| `fsub.s`     | `frm = rm ; frd = f32(frs1) - f32(frs2)`                            |
| `fmul.s`     | `frm = rm ; frd = f32(frs1) * f32(frs2)`                            |
| `fdiv.s`     | `frm = rm ; frd = f32(frs1) / f32(frs2)`                            |
| `fsgnj.s`    | `frd = f32_copysign(f32(frs1), f32(frs2))`                          |
| `fsgnjn.s`   | `frd = f32_copysign(f32(frs1), -f32(frs2))`                         |
| `fsgnjx.s`   | `frd = f32_xorsign(f32(frs1), f32(frs2))`                           |
| `fmin.s`     | `frd = f32_min(f32(frs1), f32(frs2))`                               |
| `fmax.s`     | `frd = f32_max(f32(frs1), f32(frs2))`                               |
| `fsqrt.s`    | `frm = rm ; frd = f32_sqrt(f32(frs1))`                              |
| `fle.s`      | `if f32(frs1) <= f32(frs2) then rd = 1 else rd = 0`                 |
| `flt.s`      | `if f32(frs1) < f32(frs2) then rd = 1 else rd = 0`                  |
| `feq.s`      | `if f32(frs1) = f32(frs2) then rd = 1 else rd = 0`                  |
| `fcvt.w.s`   | `frm = rm ; rd = s32(f32(frs1))`                                    |
| `fcvt.wu.s`  | `frm = rm ; if f32(frs1) > 0 then rd = u32(f32(frs1) else rd = 0`   |
| `fcvt.s.w`   | `frm = rm ; frd = f32(s32(rs1))`                                    |
| `fcvt.s.wu`  | `frm = rm ; frd = f32(u32(rs1))`                                    |
| `fmv.x.s`    | `rd = s32(frs1)`                                                    |
| `fclass.s`   | `rd = f32_classify(f32(frs1))`                                      |
| `fmv.s.x`    | `frd = s32(rs1)`                                                    |

:RV32F - "RV32F Standard Extension for Single-Precision Floating-Point"

The RV32F table details the single-precision floating-point extension for the 32-bit RISC-V architecture, supporting operations on 32-bit floating-point numbers according to IEEE 754 standards.

| instruction  | instruction pseudo-code                                             |
|--------------|:--------------------------------------------------------------------|
| `fcvt.l.s`   | `frm = rm ; rd = s64(f32(frs1))`                                    |
| `fcvt.lu.s`  | `frm = rm ; rd = u64(f32(frs1))`                                    |
| `fcvt.s.l`   | `frm = rm ; frd = f32(s64(rs1))`                                    |
| `fcvt.s.lu`  | `frm = rm ; frd = f32(u64(rs1))`                                    |

:RV64F - "RV64F Standard Extension for Single-Precision Floating-Point (+ RV32F)"

 Expanding on RV32F, RV64F introduces support for single-precision floating-point operations in the 64-bit RISC-V architecture, maintaining compatibility with RV32F for seamless transition.

| instruction  | instruction pseudo-code                                             |
|--------------|:--------------------------------------------------------------------|
| `fld`        | `frd = f64[rs1 + imm]`                                              |
| `fsd`        | `f64[rs1 + imm] = f64(frs2)`                                        |
| `fmadd.d`    | `frm = rm ; frd = f64(frs1) * f64(frs2) + f64(frs3)`                |
| `fmsub.d`    | `frm = rm ; frd = f64(frs1) * f64(frs2) - f64(frs3)`                |
| `fnmadd.d`   | `frm = rm ; frd = f64(frs1) * -f64(frs2) - f64(frs3)`               |
| `fnmsub.d`   | `frm = rm ; frd = f64(frs1) * -f64(frs2) + f64(frs3)`               |
| `fadd.d`     | `frm = rm ; frd = f64(frs1) + f64(frs2)`                            |
| `fsub.d`     | `frm = rm ; frd = f64(frs1) - f64(frs2)`                            |
| `fmul.d`     | `frm = rm ; frd = f64(frs1) * f64(frs2)`                            |
| `fdiv.d`     | `frm = rm ; frd = f64(frs1) / f64(frs2)`                            |
| `fsgnj.d`    | `frd = f64_copysign(f64(frs1), f64(frs2))`                          |
| `fsgnjn.d`   | `frd = f64_copysign(f64(frs1), -f64(frs2))`                         |
| `fsgnjx.d`   | `frd = f64_xorsign(f64(frs1), f64(frs2))`                           |
| `fmin.d`     | `frd = f64_min(f64(frs1), f64(frs2))`                               |
| `fmax.d`     | `frd = f64_max(f64(frs1), f64(frs2))`                               |
| `fcvt.s.d`   | `frm = rm ; frd = f32(f64(frs1))`                                   |
| `fcvt.d.s`   | `frm = rm ; frd = f64(f32(frs1))`                                   |
| `fsqrt.d`    | `frm = rm ; frd = f64_sqrt(f64(frs1))`                              |
| `fle.d`      | `if f64(frs1) <= f64(frs2) then rd = 1 else rd = 0`                 |
| `flt.d`      | `if f64(frs1) < f64(frs2) then rd = 1 else rd = 0`                  |
| `feq.d`      | `if f64(frs1) = f64(frs2) then rd = 1 else rd = 0`                  |
| `fcvt.w.d`   | `frm = rm ; rd = s32(f64(frs1))`                                    |
| `fcvt.wu.d`  | `frm = rm ; if f64(frs1) > 0 then rd = u32(f64(frs1) else rd = 0`   |
| `fcvt.d.w`   | `frm = rm ; frd = f64(s32(rs1))`                                    |
| `fcvt.d.wu`  | `frm = rm ; frd = f64(u32(rs1))`                                    |
| `fclass.d`   | `rd = rd = f64_classify(f64(frs1))`                                 |

:RV32D - "RV32D Standard Extension for Double-Precision Floating-Point"

 This table describes the double-precision floating-point extension for the 32-bit RISC-V architecture, enabling operations on 64-bit floating-point numbers conforming to IEEE 754 standards.

| instruction  | instruction pseudo-code                                             |
|--------------|:--------------------------------------------------------------------|
| `fcvt.l.d`   | `frm = rm ; rd = s64(f64(frs1))`                                    |
| `fcvt.lu.d`  | `frm = rm ; if f64(frs1) > 0 then rd = u64(f64(frs1) else rd = 0`   |
| `fmv.x.d`    | `rd = s64(frs1)`                                                    |
| `fcvt.d.l`   | `frm = rm ; frd = f64(u64(rs1))`                                    |
| `fcvt.d.lu`  | `frm = rm ; frd = f64(s64(rs1))`                                    |
| `fmv.d.x`    | `frd = u64(rs1)`                                                    |

:RV64D - "RV64D Standard Extension for Double-Precision Floating-Point (+ RV32D)"

 Building upon RV32D, RV64D extends support for double-precision floating-point operations to the 64-bit RISC-V architecture, facilitating higher precision computations.

| instruction  | instruction pseudo-code                                             |
|--------------|:--------------------------------------------------------------------|
| `frcsr`      |                                                                     |
| `frrm`       |                                                                     |
| `frflags`    |                                                                     |
| `fscsr`      |                                                                     |
| `fsrm`       |                                                                     |
| `fsflags`    |                                                                     |
| `fsrmi`      |                                                                     |
| `fsflagsi`   |                                                                     |

:RV32FD - "RV32F and RV32D Common Floating-Point Instructions"

 RV32FD documents the common floating-point instructions shared between the RV32F (single-precision) and RV32D (double-precision) floating-point extensions, optimizing instruction set usage.
