## INSTRUCTION PSEUDO-CODE (HDL)

Alternative Pseudo-Code representations may also be used to describe RISC-V instructions, catering to different programming paradigms or abstraction levels. These representations vary in style and detail but aim to convey the fundamental operations and control flow logic inherent in each instruction type.

Format of a line in the table:

`<instruction name> "<instruction pseudo-code>"`

| instruction  | instruction pseudo-code                                             |
|--------------|:--------------------------------------------------------------------|
| `mul`        | `rd = ux(rs1) * ux(rs2)`                                            |
| `mulh`       | `rd = (sx(rs1) * sx(rs2)) >> xlen`                                  |
| `mulhsu`     | `rd = (sx(rs1) * ux(rs2)) >> xlen`                                  |
| `mulhu`      | `rd = (ux(rs1) * ux(rs2)) >> xlen`                                  |
| `div`        | `rd = sx(rs1) / sx(rs2)`                                            |
| `divu`       | `rd = ux(rs1) / ux(rs2)`                                            |
| `rem`        | `rd = sx(rs1) mod sx(rs2)`                                          |
| `remu`       | `rd = ux(rs1) mod ux(rs2)`                                          |

:RV32M - "RV32M Standard Extension for Integer Multiply and Divide"

This table outlines the standard extension for integer multiplication and division operations in the 32-bit RISC-V architecture, enhancing computational capabilities with dedicated instructions.

| instruction  | instruction pseudo-code                                             |
|--------------|:--------------------------------------------------------------------|
| `mulw`       | `rd = u32(rs1) * u32(rs2)`                                          |
| `divw`       | `rd = s32(rs1) / s32(rs2)`                                          |
| `divuw`      | `rd = u32(rs1) / u32(rs2)`                                          |
| `remw`       | `rd = s32(rs1) mod s32(rs2)`                                        |
| `remuw`      | `rd = u32(rs1) mod u32(rs2)`                                        |

:RV64M - "RV64M Standard Extension for Integer Multiply and Divide (+ RV32M)"

Extending RV32M to 64-bit, RV64M introduces support for integer multiplication and division operations, catering to applications requiring larger data processing capabilities.
