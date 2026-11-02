## INSTRUCTION PSEUDO-CODE (HDL)

| **Instruction** | **Instruction Pseudo-Code**        |
|:----------------|:-----------------------------------|
| `mul`           | `rd = ux(rs1) * ux(rs2)`           |
| `mulh`          | `rd = (sx(rs1) * sx(rs2)) >> xlen` |
| `mulhsu`        | `rd = (sx(rs1) * ux(rs2)) >> xlen` |
| `mulhu`         | `rd = (ux(rs1) * ux(rs2)) >> xlen` |
| `div`           | `rd = sx(rs1) / sx(rs2)`           |
| `divu`          | `rd = ux(rs1) / ux(rs2)`           |
| `rem`           | `rd = sx(rs1) mod sx(rs2)`         |
| `remu`          | `rd = ux(rs1) mod ux(rs2)`         |

:RV32M - "RV32M Standard Extension for Integer Multiply and Divide"

| **Instruction** | **Instruction Pseudo-Code**  |
|:----------------|:-----------------------------|
| `mulw`          | `rd = u32(rs1) * u32(rs2)`   |
| `divw`          | `rd = s32(rs1) / s32(rs2)`   |
| `divuw`         | `rd = u32(rs1) / u32(rs2)`   |
| `remw`          | `rd = s32(rs1) mod s32(rs2)` |
| `remuw`         | `rd = u32(rs1) mod u32(rs2)` |

:RV64M - "RV64M Standard Extension for Integer Multiply and Divide (+ RV32M)"