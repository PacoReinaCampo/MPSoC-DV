* **RV32M - `RV32M Standard Extension for Integer Multiply and Divide`**

  | **Name**  | **Pseudo-Code**                                                                                      |
  |:----------|:-----------------------------------------------------------------------------------------------------|
  | `mul`     | `rd = sx(rs1) * sx(rs2)`                                                                             |
  | `mulh`    | `rd = riscv::mulh(sx(rs1), sx(rs2))`                                                                 |
  | `mulhsu`  | `rd = riscv::mulhsu(sx(rs1), ux(rs2))`                                                               |
  | `mulhu`   | `rd = riscv::mulhu(ux(rs1), ux(rs2))`                                                                |
  | `div`     | `rd = sx(rs1) == sx(INT_MIN) && sx(rs2) == -1 ? sx(INT_MIN) : sx(rs2) == 0 ? -1 : sx(rs1) / sx(rs2)` |
  | `divu`    | `rd = sx(rs2) == 0 ? -1 : sx(ux(rs1) / ux(rs2))`                                                     |
  | `rem`     | `rd = sx(rs1) == sx(INT_MIN) && sx(rs2) == -1 ? 0 : sx(rs2) == 0 ? sx(rs1) : sx(rs1) % sx(rs2)`      |
  | `remu`    | `rd = sx(rs2) == 0 ? sx(rs1) : sx(ux(rs1) % ux(rs2))`                                                |

* **RV64M - `RV64M Standard Extension for Integer Multiply and Divide (in addition to RV32M)`**

  | **Name**  | **Pseudo-Code**                                                                                             |
  |:----------|:------------------------------------------------------------------------------------------------------------|
  | `mulw`    | `rd = s32(u32(rs1) * u32(rs2))`                                                                             |
  | `divw`    | `rd = s32(rs1) == s32(INT_MIN) && s32(rs2) == -1 ? s32(INT_MIN) : s32(rs2) == 0 ? -1 : s32(rs1) / s32(rs2)` |
  | `divuw`   | `rd = s32(rs2) == 0 ? -1 : s32(u32(rs1) / u32(rs2))`                                                        |
  | `remw`    | `rd = s32(rs1) == s32(INT_MIN) && s32(rs2) == -1 ? 0 : s32(rs2) == 0 ? s32(rs1) : s32(rs1) % s32(rs2)`      |
  | `remuw`   | `rd = s32(rs2) == 0 ? s32(rs1) : s32(u32(rs1) % u32(rs2))`                                                  |
