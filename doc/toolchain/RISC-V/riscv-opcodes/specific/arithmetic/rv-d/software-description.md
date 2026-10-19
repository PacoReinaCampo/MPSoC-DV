* **RV32D - "RV32D Standard Extension for Double-Precision Floating-Point"**

  | **Name**    | **Pseudo-Code**                                                                       |
  |:------------|:--------------------------------------------------------------------------------------|
  | `fld`       | "u64 t; mmu.load<u64>(rs1 + imm, t); u64(frd) = t" # f64(frd) = *(f64*)ptr(rs1 + imm) |
  | `fsd`       | "mmu.store<f64>(rs1 + imm, f64(frs2))" # *(f64*)ptr(rs1 + imm) = f64(frs2)            |
  | `fmadd.d`   | "fenv_setrm(rm); f64(frd) = f64(frs1) * f64(frs2) + f64(frs3)"                        |
  | `fmsub.d`   | "fenv_setrm(rm); f64(frd) = f64(frs1) * f64(frs2) - f64(frs3)"                        |
  | `fnmadd.d`  | "fenv_setrm(rm); f64(frd) = f64(frs1) * -f64(frs2) - f64(frs3)"                       |
  | `fnmsub.d`  | "fenv_setrm(rm); f64(frd) = f64(frs1) * -f64(frs2) + f64(frs3)"                       |
  | `fadd.d`    | "fenv_setrm(rm); f64(frd) = f64(frs1) + f64(frs2)"                                    |
  | `fsub.d`    | "fenv_setrm(rm); f64(frd) = f64(frs1) - f64(frs2)"                                    |
  | `fmul.d`    | "fenv_setrm(rm); f64(frd) = f64(frs1) * f64(frs2)"                                    |
  | `fdiv.d`    | "fenv_setrm(rm); f64(frd) = f64(frs1) / f64(frs2)"                                    |
  | `fsgnj.d`   | "u64(frd) = (u64(frs1) & u64(~(1ULL<<63))) \| (u64(frs2) & u64(1ULL<<63))"            |
  | `fsgnjn.d`  | "u64(frd) = (u64(frs1) & u64(~(1ULL<<63))) \| (~u64(frs2) & u64(1ULL<<63))"           |
  | `fsgnjx.d`  | "u64(frd) = u64(frs1) ^ (u64(frs2) & u64(1ULL<<63))"                                  |
  | `fmin.d`    | "f64(frd) = (f64(frs1) < f64(frs2)) \|\| isnan(f64(frs2)) ? f64(frs1) : f64(frs2)"    |
  | `fmax.d`    | "f64(frd) = (f64(frs1) > f64(frs2)) \|\| isnan(f64(frs2)) ? f64(frs1) : f64(frs2)"    |
  | `fcvt.s.d`  | "fenv_setrm(rm); f32(frd) = f32(f64(frs1))"                                           |
  | `fcvt.d.s`  | "fenv_setrm(rm); f64(frd) = f64(f32(frs1))"                                           |
  | `fsqrt.d`   | "fenv_setrm(rm); f64(frd) = riscv::f64_sqrt(f64(frs1))"                               |
  | `fle.d`     | "rd = f64(frs1) <= f64(frs2)"                                                         |
  | `flt.d`     | "rd = f64(frs1) < f64(frs2)"                                                          |
  | `feq.d`     | "rd = f64(frs1) == f64(frs2)"                                                         |
  | `fcvt.w.d`  | "fenv_setrm(rm); rd = riscv::fcvt_w(fcsr, f64(frs1))" # s32(f64(frs1))                |
  | `fcvt.wu.d` | "fenv_setrm(rm); rd = riscv::fcvt_wu(fcsr, f64(frs1))" # s32(u32(f64(frs1)))          |
  | `fcvt.d.w`  | "fenv_setrm(rm); f64(frd) = f64(s32(rs1))"                                            |
  | `fcvt.d.wu` | "fenv_setrm(rm); f64(frd) = f64(u32(rs1))"                                            |
  | `fclass.d`  | "rd = f64_classify(f64(frs1))"                                                        |

* **RV64D - "RV64D Standard Extension for Double-Precision Floating-Point (in addition to RV32D)"**

  | **Name**    | **Pseudo-Code**                                                              |
  |:------------|:-----------------------------------------------------------------------------|
  | `fcvt.l.d`  | "fenv_setrm(rm); rd = riscv::fcvt_l(fcsr, f64(frs1))" # s64(f64(frs1))       |
  | `fcvt.lu.d` | "fenv_setrm(rm); rd = riscv::fcvt_lu(fcsr, f64(frs1))" # s64(u64(f64(frs1))) |
  | `fmv.x.d`   | "rd = isnan(f64(frs1)) ? s64(u64(f64(NAN))) : s64(frs1)" # s64(frs1)         |
  | `fcvt.d.l`  | "fenv_setrm(rm); f64(frd) = f64(s64(rs1))"                                   |
  | `fcvt.d.lu` | "fenv_setrm(rm); f64(frd) = f64(u64(rs1))"                                   |
  | `fmv.d.x`   | "u64(frd) = u64(rs1)"                                                        |
