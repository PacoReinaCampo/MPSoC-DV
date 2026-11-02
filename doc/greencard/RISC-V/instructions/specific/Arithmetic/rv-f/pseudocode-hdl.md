## INSTRUCTION PSEUDO-CODE (HDL)

| **Instruction** | **Instruction Pseudo-Code**                                       |
|:----------------|:------------------------------------------------------------------|
| `flw`           | `frd = f32[rs1 + imm]`                                            |
| `fsw`           | `f32[rs1 + imm] = f32(frs2)`                                      |
| `fmadd.s`       | `frm = rm ; frd = f32(frs1) * f32(frs2) + f32(frs3)`              |
| `fmsub.s`       | `frm = rm ; frd = f32(frs1) * f32(frs2) - f32(frs3)`              |
| `fnmadd.s`      | `frm = rm ; frd = f32(frs1) * -f32(frs2) - f32(frs3)`             |
| `fnmsub.s`      | `frm = rm ; frd = f32(frs1) * -f32(frs2) + f32(frs3)`             |
| `fadd.s`        | `frm = rm ; frd = f32(frs1) + f32(frs2)`                          |
| `fsub.s`        | `frm = rm ; frd = f32(frs1) - f32(frs2)`                          |
| `fmul.s`        | `frm = rm ; frd = f32(frs1) * f32(frs2)`                          |
| `fdiv.s`        | `frm = rm ; frd = f32(frs1) / f32(frs2)`                          |
| `fsgnj.s`       | `frd = f32_copysign(f32(frs1), f32(frs2))`                        |
| `fsgnjn.s`      | `frd = f32_copysign(f32(frs1), -f32(frs2))`                       |
| `fsgnjx.s`      | `frd = f32_xorsign(f32(frs1), f32(frs2))`                         |
| `fmin.s`        | `frd = f32_min(f32(frs1), f32(frs2))`                             |
| `fmax.s`        | `frd = f32_max(f32(frs1), f32(frs2))`                             |
| `fsqrt.s`       | `frm = rm ; frd = f32_sqrt(f32(frs1))`                            |
| `fle.s`         | `if f32(frs1) <= f32(frs2) then rd = 1 else rd = 0`               |
| `flt.s`         | `if f32(frs1) < f32(frs2) then rd = 1 else rd = 0`                |
| `feq.s`         | `if f32(frs1) = f32(frs2) then rd = 1 else rd = 0`                |
| `fcvt.w.s`      | `frm = rm ; rd = s32(f32(frs1))`                                  |
| `fcvt.wu.s`     | `frm = rm ; if f32(frs1) > 0 then rd = u32(f32(frs1) else rd = 0` |
| `fcvt.s.w`      | `frm = rm ; frd = f32(s32(rs1))`                                  |
| `fcvt.s.wu`     | `frm = rm ; frd = f32(u32(rs1))`                                  |
| `fmv.x.s`       | `rd = s32(frs1)`                                                  |
| `fclass.s`      | `rd = f32_classify(f32(frs1))`                                    |
| `fmv.s.x`       | `frd = s32(rs1)`                                                  |

:RV32F - "RV32F Standard Extension for Single-Precision Floating-Point"

| **Instruction** | **Instruction Pseudo-Code**      |
|:----------------|:---------------------------------|
| `fcvt.l.s`      | `frm = rm ; rd = s64(f32(frs1))` |
| `fcvt.lu.s`     | `frm = rm ; rd = u64(f32(frs1))` |
| `fcvt.s.l`      | `frm = rm ; frd = f32(s64(rs1))` |
| `fcvt.s.lu`     | `frm = rm ; frd = f32(u64(rs1))` |

:RV64F - "RV64F Standard Extension for Single-Precision Floating-Point (+ RV32F)"

 Expanding on RV32F, RV64F introduces support for single-precision floating-point operations in the 64-bit RISC-V architecture, maintaining compatibility with RV32F for seamless transition.