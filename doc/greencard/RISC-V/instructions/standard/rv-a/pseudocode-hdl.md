## INSTRUCTION PSEUDO-CODE (HDL)

| **Instruction** | **Instruction Pseudo-Code**                                |
|:----------------|:-----------------------------------------------------------|
| `lr.w`          | `lr = rs1 , rd = sx(s32[rs1])`                             |
| `sc.w`          | `if lr = rs1 then u32[rs1] = u32(rs2); rd = 0 else rd = 1` |
| `amoswap.w`     | `rd = s32[rs1] , u32[rs1] = s32(rs2)`                      |
| `amoadd.w`      | `rd = s32[rs1] , u32[rs1] = s32(rs2) + s32[rs1]`           |
| `amoxor.w`      | `rd = s32[rs1] , u32[rs1] = s32(rs2) ^ s32[rs1]`           |
| `amoor.w`       | `rd = s32[rs1] , u32[rs1] = s32(rs2) \| s32[rs1]`          |
| `amoand.w`      | `rd = s32[rs1] , u32[rs1] = s32(rs2) & s32[rs1]`           |
| `amomin.w`      | `rd = s32[rs1] , u32[rs1] = s32_min(s32(rs2), s32[rs1])`   |
| `amomax.w`      | `rd = s32[rs1] , u32[rs1] = s32_max(s32(rs2), s32[rs1])`   |
| `amominu.w`     | `rd = s32[rs1] , u32[rs1] = u32_min(u32(rs2), u32[rs1])`   |
| `amomaxu.w`     | `rd = s32[rs1] , u32[rs1] = u32_max(u32(rs2), u32[rs1])`   |

:RV32A - "RV32A Standard Extension for Atomic Instructions"

| **Instruction** | **Instruction Pseudo-Code**                                |
|:----------------|:-----------------------------------------------------------|
| `lr.d`          | `lr = rs1 , rd = sx(s64[rs1])`                             |
| `sc.d`          | `if lr = rs1 then u64[rs1] = u64(rs2); rd = 0 else rd = 1` |
| `amoswap.d`     | `rd = s64[rs1] , u64[rs1] = s64(rs2)`                      |
| `amoadd.d`      | `rd = s64[rs1] , u64[rs1] = s64(rs2) + s64[rs1]`           |
| `amoxor.d`      | `rd = s64[rs1] , u64[rs1] = s64(rs2) ^ s64[rs1]`           |
| `amoor.d`       | `rd = s64[rs1] , u64[rs1] = s64(rs2) \| s64[rs1]`          |
| `amoand.d`      | `rd = s64[rs1] , u64[rs1] = s64(rs2) & s64[rs1]`           |
| `amomin.d`      | `rd = s64[rs1] , u64[rs1] = s64_min(s64(rs2), s64[rs1])`   |
| `amomax.d`      | `rd = s64[rs1] , u64[rs1] = s64_max(s64(rs2), s64[rs1])`   |
| `amominu.d`     | `rd = s64[rs1] , u64[rs1] = u64_min(u64(rs2), u64[rs1])`   |
| `amomaxu.d`     | `rd = s64[rs1] , u64[rs1] = u64_max(u64(rs2), u64[rs1])`   |

:RV64A - "RV64A Standard Extension for Atomic Instructions (+ RV32A)"