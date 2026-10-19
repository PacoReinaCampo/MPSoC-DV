* **RV32F - "RV32F Standard Extension for Single-Precision Floating-Point"**

  | **Name**    | **Pseudo-Code**                                                                       |
  |:------------|:--------------------------------------------------------------------------------------|
  | `flw`       | "u32 t; mmu.load<u32>(rs1 + imm, t); u32(frd) = t" # f32(frd) = *(f32*)ptr(rs1 + imm) |
  | `fsw`       | "mmu.store<f32>(rs1 + imm, f32(frs2))" # *(f32*)ptr(rs1 + imm) = f32(frs2)            |
  | `fmadd.s`   | "fenv_setrm(rm); f32(frd) = f32(frs1) * f32(frs2) + f32(frs3)" # -mfma                |
  | `fmsub.s`   | "fenv_setrm(rm); f32(frd) = f32(frs1) * f32(frs2) - f32(frs3)"                        |
  | `fnmadd.s`  | "fenv_setrm(rm); f32(frd) = f32(frs1) * -f32(frs2) - f32(frs3)"                       |
  | `fnmsub.s`  | "fenv_setrm(rm); f32(frd) = f32(frs1) * -f32(frs2) + f32(frs3)"                       |
  | `fadd.s`    | "fenv_setrm(rm); f32(frd) = f32(frs1) + f32(frs2)"                                    |
  | `fsub.s`    | "fenv_setrm(rm); f32(frd) = f32(frs1) - f32(frs2)"                                    |
  | `fmul.s`    | "fenv_setrm(rm); f32(frd) = f32(frs1) * f32(frs2)"                                    |
  | `fdiv.s`    | "fenv_setrm(rm); f32(frd) = f32(frs1) / f32(frs2)"                                    |
  | `fsgnj.s`   | "u32(frd) = (u32(frs1) & u32(~(1U<<31))) \| (u32(frs2) & u32(1U<<31))"                |
  | `fsgnjn.s`  | "u32(frd) = (u32(frs1) & u32(~(1U<<31))) \| (~u32(frs2) & u32(1U<<31))"               |
  | `fsgnjx.s`  | "u32(frd) = u32(frs1) ^ (u32(frs2) & u32(1U<<31))"                                    |
  | `fmin.s`    | "f32(frd) = (f32(frs1) < f32(frs2)) \|\| isnan(f32(frs2)) ? f32(frs1) : f32(frs2)"    |
  | `fmax.s`    | "f32(frd) = (f32(frs1) > f32(frs2)) \|\| isnan(f32(frs2)) ? f32(frs1) : f32(frs2)"    |
  | `fsqrt.s`   | "fenv_setrm(rm); f32(frd) = riscv::f32_sqrt(f32(frs1))"                               |
  | `fle.s`     | "rd = f32(frs1) <= f32(frs2)"                                                         |
  | `flt.s`     | "rd = f32(frs1) < f32(frs2)"                                                          |
  | `feq.s`     | "rd = f32(frs1) == f32(frs2)"                                                         |
  | `fcvt.w.s`  | "fenv_setrm(rm); rd = riscv::fcvt_w(fcsr, f32(frs1))" # s32(f32(frs1))                |
  | `fcvt.wu.s` | "fenv_setrm(rm); rd = riscv::fcvt_wu(fcsr, f32(frs1))" # s32(u32(f32(frs1)))          |
  | `fcvt.s.w`  | "fenv_setrm(rm); f32(frd) = f32(s32(rs1))"                                            |
  | `fcvt.s.wu` | "fenv_setrm(rm); f32(frd) = f32(u32(rs1))"                                            |
  | `fmv.x.s`   | "rd = isnan(f32(frs1)) ? s32(u32(f32(NAN))) : s32(frs1)" # s32(frs1)                  |
  | `fclass.s`  | "rd = f32_classify(f32(frs1))"                                                        |
  | `fmv.s.x`   | "u32(frd) = u32(rs1)"                                                                 |

* **RV64F - "RV64F Standard Extension for Single-Precision Floating-Point (in addition to RV32F)"**

  | **Name**    | **Pseudo-Code**                                                              |
  |:------------|:-----------------------------------------------------------------------------|
  | `fcvt.l.s`  | "fenv_setrm(rm); rd = riscv::fcvt_l(fcsr, f32(frs1))" # s64(f32(frs1))       |
  | `fcvt.lu.s` | "fenv_setrm(rm); rd = riscv::fcvt_lu(fcsr, f32(frs1))" # s64(u32(f32(frs1))) |
  | `fcvt.s.l`  | "fenv_setrm(rm); f32(frd) = f32(s64(rs1))"                                   |
  | `fcvt.s.lu` | "fenv_setrm(rm); f32(frd) = f32(u64(rs1))"                                   |
