## INSTRUCTION PSEUDO-CODE (PL)

Pseudo-Code in C-like syntax provides a high-level representation of RISC-V instructions, illustrating their behavior and operational flow without delving into specific machine-level details. This abstraction aids in software development, algorithm design, and understanding of instruction semantics across different implementations and extensions of the RISC-V ISA.

Format of a line in the table:

`<instruction name> "<instruction pseudo-code>"`

| instruction  | instruction pseudo-code                                                                                     |
|--------------|:------------------------------------------------------------------------------------------------------------|
| `flw`        | `u32 t; mmu.load<u32>(rs1 + imm, t); u32(frd) = t` // `f32(frd) = *(f32*)ptr(rs1 + imm)`                    |
| `fsw`        | `mmu.store<f32>(rs1 + imm, f32(frs2))` // `*(f32*)ptr(rs1 + imm) = f32(frs2)`                               |
| `fmadd.s`    | `fenv_setrm(rm); f32(frd) = f32(frs1) * f32(frs2) + f32(frs3)` // `-mfma`                                   |
| `fmsub.s`    | `fenv_setrm(rm); f32(frd) = f32(frs1) * f32(frs2) - f32(frs3)`                                              |
| `fnmadd.s`   | `fenv_setrm(rm); f32(frd) = f32(frs1) * -f32(frs2) - f32(frs3)`                                             |
| `fnmsub.s`   | `fenv_setrm(rm); f32(frd) = f32(frs1) * -f32(frs2) + f32(frs3)`                                             |
| `fadd.s`     | `fenv_setrm(rm); f32(frd) = f32(frs1) + f32(frs2)`                                                          |
| `fsub.s`     | `fenv_setrm(rm); f32(frd) = f32(frs1) - f32(frs2)`                                                          |
| `fmul.s`     | `fenv_setrm(rm); f32(frd) = f32(frs1) * f32(frs2)`                                                          |
| `fdiv.s`     | `fenv_setrm(rm); f32(frd) = f32(frs1) / f32(frs2)`                                                          |
| `fsgnj.s`    | `u32(frd) = (u32(frs1) & u32(~(1U<<31))) \| (u32(frs2) & u32(1U<<31))`                                      |
| `fsgnjn.s`   | `u32(frd) = (u32(frs1) & u32(~(1U<<31))) \| (~u32(frs2) & u32(1U<<31))`                                     |
| `fsgnjx.s`   | `u32(frd) = u32(frs1) ^ (u32(frs2) & u32(1U<<31))`                                                          |
| `fmin.s`     | `f32(frd) = (f32(frs1) < f32(frs2)) \|\| isnan(f32(frs2)) ? f32(frs1) : f32(frs2)`                          |
| `fmax.s`     | `f32(frd) = (f32(frs1) > f32(frs2)) \|\| isnan(f32(frs2)) ? f32(frs1) : f32(frs2)`                          |
| `fsqrt.s`    | `fenv_setrm(rm); f32(frd) = riscv::f32_sqrt(f32(frs1))`                                                     |
| `fle.s`      | `rd = f32(frs1) <= f32(frs2)`                                                                               |
| `flt.s`      | `rd = f32(frs1) < f32(frs2)`                                                                                |
| `feq.s`      | `rd = f32(frs1) == f32(frs2)`                                                                               |
| `fcvt.w.s`   | `fenv_setrm(rm); rd = riscv::fcvt_w(fcsr, f32(frs1))` // `s32(f32(frs1))`                                   |
| `fcvt.wu.s`  | `fenv_setrm(rm); rd = riscv::fcvt_wu(fcsr, f32(frs1))` // `s32(u32(f32(frs1)))`                             |
| `fcvt.s.w`   | `fenv_setrm(rm); f32(frd) = f32(s32(rs1))`                                                                  |
| `fcvt.s.wu`  | `fenv_setrm(rm); f32(frd) = f32(u32(rs1))`                                                                  |
| `fmv.x.s`    | `rd = isnan(f32(frs1)) ? s32(u32(f32(NAN))) : s32(frs1)` // `s32(frs1)`                                     |
| `fclass.s`   | `rd = f32_classify(f32(frs1))`                                                                              |
| `fmv.s.x`    | `u32(frd) = u32(rs1)`                                                                                       |

:RV32F - "RV32F Standard Extension for Single-Precision Floating-Point"

The RV32F table details the single-precision floating-point extension for the 32-bit RISC-V architecture, supporting operations on 32-bit floating-point numbers according to IEEE 754 standards.

| instruction  | instruction pseudo-code                                                                                     |
|--------------|:------------------------------------------------------------------------------------------------------------|
| `fcvt.l.s`   | `fenv_setrm(rm); rd = riscv::fcvt_l(fcsr, f32(frs1))` // `s64(f32(frs1))`                                   |
| `fcvt.lu.s`  | `fenv_setrm(rm); rd = riscv::fcvt_lu(fcsr, f32(frs1))` // `s64(u32(f32(frs1)))`                             |
| `fcvt.s.l`   | `fenv_setrm(rm); f32(frd) = f32(s64(rs1))`                                                                  |
| `fcvt.s.lu`  | `fenv_setrm(rm); f32(frd) = f32(u64(rs1))`                                                                  |

:RV64F - "RV64F Standard Extension for Single-Precision Floating-Point (+ RV32F)"

 Expanding on RV32F, RV64F introduces support for single-precision floating-point operations in the 64-bit RISC-V architecture, maintaining compatibility with RV32F for seamless transition.

| instruction  | instruction pseudo-code                                                                                     |
|--------------|:------------------------------------------------------------------------------------------------------------|
| `fld`        | `u64 t; mmu.load<u64>(rs1 + imm, t); u64(frd) = t` // `f64(frd) = *(f64*)ptr(rs1 + imm)`                    |
| `fsd`        | `mmu.store<f64>(rs1 + imm, f64(frs2))` // `*(f64*)ptr(rs1 + imm) = f64(frs2)`                               |
| `fmadd.d`    | `fenv_setrm(rm); f64(frd) = f64(frs1) * f64(frs2) + f64(frs3)`                                              |
| `fmsub.d`    | `fenv_setrm(rm); f64(frd) = f64(frs1) * f64(frs2) - f64(frs3)`                                              |
| `fnmadd.d`   | `fenv_setrm(rm); f64(frd) = f64(frs1) * -f64(frs2) - f64(frs3)`                                             |
| `fnmsub.d`   | `fenv_setrm(rm); f64(frd) = f64(frs1) * -f64(frs2) + f64(frs3)`                                             |
| `fadd.d`     | `fenv_setrm(rm); f64(frd) = f64(frs1) + f64(frs2)`                                                          |
| `fsub.d`     | `fenv_setrm(rm); f64(frd) = f64(frs1) - f64(frs2)`                                                          |
| `fmul.d`     | `fenv_setrm(rm); f64(frd) = f64(frs1) * f64(frs2)`                                                          |
| `fdiv.d`     | `fenv_setrm(rm); f64(frd) = f64(frs1) / f64(frs2)`                                                          |
| `fsgnj.d`    | `u64(frd) = (u64(frs1) & u64(~(1ULL<<63))) \| (u64(frs2) & u64(1ULL<<63))`                                  |
| `fsgnjn.d`   | `u64(frd) = (u64(frs1) & u64(~(1ULL<<63))) \| (~u64(frs2) & u64(1ULL<<63))`                                 |
| `fsgnjx.d`   | `u64(frd) = u64(frs1) ^ (u64(frs2) & u64(1ULL<<63))`                                                        |
| `fmin.d`     | `f64(frd) = (f64(frs1) < f64(frs2)) \|\| isnan(f64(frs2)) ? f64(frs1) : f64(frs2)`                          |
| `fmax.d`     | `f64(frd) = (f64(frs1) > f64(frs2)) \|\| isnan(f64(frs2)) ? f64(frs1) : f64(frs2)`                          |
| `fcvt.s.d`   | `fenv_setrm(rm); f32(frd) = f32(f64(frs1))`                                                                 |
| `fcvt.d.s`   | `fenv_setrm(rm); f64(frd) = f64(f32(frs1))`                                                                 |
| `fsqrt.d`    | `fenv_setrm(rm); f64(frd) = riscv::f64_sqrt(f64(frs1))`                                                     |
| `fle.d`      | `rd = f64(frs1) <= f64(frs2)`                                                                               |
| `flt.d`      | `rd = f64(frs1) < f64(frs2)`                                                                                |
| `feq.d`      | `rd = f64(frs1) == f64(frs2)`                                                                               |
| `fcvt.w.d`   | `fenv_setrm(rm); rd = riscv::fcvt_w(fcsr, f64(frs1))` // `s32(f64(frs1))`                                   |
| `fcvt.wu.d`  | `fenv_setrm(rm); rd = riscv::fcvt_wu(fcsr, f64(frs1))` // `s32(u32(f64(frs1)))`                             |
| `fcvt.d.w`   | `fenv_setrm(rm); f64(frd) = f64(s32(rs1))`                                                                  |
| `fcvt.d.wu`  | `fenv_setrm(rm); f64(frd) = f64(u32(rs1))`                                                                  |
| `fclass.d`   | `rd = f64_classify(f64(frs1))`                                                                              |

:RV32D - "RV32D Standard Extension for Double-Precision Floating-Point"

 This table describes the double-precision floating-point extension for the 32-bit RISC-V architecture, enabling operations on 64-bit floating-point numbers conforming to IEEE 754 standards.

| instruction  | instruction pseudo-code                                                                                     |
|--------------|:------------------------------------------------------------------------------------------------------------|
| `fcvt.l.d`   | `fenv_setrm(rm); rd = riscv::fcvt_l(fcsr, f64(frs1))` // `s64(f64(frs1))`                                   |
| `fcvt.lu.d`  | `fenv_setrm(rm); rd = riscv::fcvt_lu(fcsr, f64(frs1))` // `s64(u64(f64(frs1)))`                             |
| `fmv.x.d`    | `rd = isnan(f64(frs1)) ? s64(u64(f64(NAN))) : s64(frs1)` // `s64(frs1)`                                     |
| `fcvt.d.l`   | `fenv_setrm(rm); f64(frd) = f64(s64(rs1))`                                                                  |
| `fcvt.d.lu`  | `fenv_setrm(rm); f64(frd) = f64(u64(rs1))`                                                                  |
| `fmv.d.x`    | `u64(frd) = u64(rs1)`                                                                                       |

:RV64D - "RV64D Standard Extension for Double-Precision Floating-Point (+ RV32F)"

| instruction  | instruction pseudo-code                                                                                     |
|--------------|:------------------------------------------------------------------------------------------------------------|
| `frcsr`      |                                                                                                             |
| `frrm`       |                                                                                                             |
| `frflags`    |                                                                                                             |
| `fscsr`      |                                                                                                             |
| `fsrm`       |                                                                                                             |
| `fsflags`    |                                                                                                             |
| `fsrmi`      |                                                                                                             |
| `fsflagsi`   |                                                                                                             |

:RV32FD - "RV32F and RV32D Common Floating-Point Instructions"

 RV32FD documents the common floating-point instructions shared between the RV32F (single-precision) and RV32D (double-precision) floating-point extensions, optimizing instruction set usage.
