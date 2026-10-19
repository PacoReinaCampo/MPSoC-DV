* **RV32A - `RV32A Standard Extension for Atomic Instructions`**

  | **Name**    | **Pseudo-Code**                                                                    |
  |:------------|:-----------------------------------------------------------------------------------|
  | `lr.w`      | `lr = rs1; s32 t; mmu.load<s32>(rs1, t); rd = t`                                   |
  | `sc.w`      | `ux res = 0; if (lr != rs1) res = 1; else mmu.store<s32>(rs1, s32(rs2)); rd = res` |
  | `amoswap.w` | `s32 t1, t2 = s32(rs2); mmu.amo<s32>(amoswap, rs1, t1, t2); rd = t1`               |
  | `amoadd.w`  | `s32 t1, t2 = s32(rs2); mmu.amo<s32>(amoadd, rs1, t1, t2); rd = t1`                |
  | `amoxor.w`  | `s32 t1, t2 = s32(rs2); mmu.amo<s32>(amoxor, rs1, t1, t2); rd = t1`                |
  | `amoor.w`   | `s32 t1, t2 = s32(rs2); mmu.amo<s32>(amoor, rs1, t1, t2); rd = t1`                 |
  | `amoand.w`  | `s32 t1, t2 = s32(rs2); mmu.amo<s32>(amoand, rs1, t1, t2); rd = t1`                |
  | `amomin.w`  | `s32 t1, t2 = s32(rs2); mmu.amo<s32>(amomin, rs1, t1, t2); rd = t1`                |
  | `amomax.w`  | `s32 t1, t2 = s32(rs2); mmu.amo<s32>(amomax, rs1, t1, t2); rd = t1`                |
  | `amominu.w` | `s32 t1, t2 = s32(rs2); mmu.amo<s32>(amominu, rs1, t1, t2); rd = t1`               |
  | `amomaxu.w` | `s32 t1, t2 = s32(rs2); mmu.amo<s32>(amomaxu, rs1, t1, t2); rd = t1`               |

* **RV64A - `RV64A Standard Extension for Atomic Instructions (in addition to RV32A)`**

  | **Name**    | **Pseudo-Code**                                                                    |
  |:------------|:-----------------------------------------------------------------------------------|
  | `lr.d`      | `lr = rs1; s64 t; mmu.load<s64>(rs1, t); rd = t`                                   |
  | `sc.d`      | `ux res = 0; if (lr != rs1) res = 1; else mmu.store<s64>(rs1, s64(rs2)); rd = res` |
  | `amoswap.d` | `s64 t1, t2 = s64(rs2); mmu.amo<s64>(amoswap, rs1, t1, t2); rd = t1`               |
  | `amoadd.d`  | `s64 t1, t2 = s64(rs2); mmu.amo<s64>(amoadd, rs1, t1, t2); rd = t1`                |
  | `amoxor.d`  | `s64 t1, t2 = s64(rs2); mmu.amo<s64>(amoxor, rs1, t1, t2); rd = t1`                |
  | `amoor.d`   | `s64 t1, t2 = s64(rs2); mmu.amo<s64>(amoor, rs1, t1, t2); rd = t1`                 |
  | `amoand.d`  | `s64 t1, t2 = s64(rs2); mmu.amo<s64>(amoand, rs1, t1, t2); rd = t1`                |
  | `amomin.d`  | `s64 t1, t2 = s64(rs2); mmu.amo<s64>(amomin, rs1, t1, t2); rd = t1`                |
  | `amomax.d`  | `s64 t1, t2 = s64(rs2); mmu.amo<s64>(amomax, rs1, t1, t2); rd = t1`                |
  | `amominu.d` | `s64 t1, t2 = s64(rs2); mmu.amo<s64>(amominu, rs1, t1, t2); rd = t1`               |
  | `amomaxu.d` | `s64 t1, t2 = s64(rs2); mmu.amo<s64>(amomaxu, rs1, t1, t2); rd = t1`               |
  | `fmv.d.x`   | `u64(frd) = u64(rs1)`                                                              |
