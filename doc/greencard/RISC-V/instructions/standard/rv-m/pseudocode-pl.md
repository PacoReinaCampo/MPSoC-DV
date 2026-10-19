## INSTRUCTION PSEUDO-CODE (PL)

Pseudo-Code in C-like syntax provides a high-level representation of RISC-V instructions, illustrating their behavior and operational flow without delving into specific machine-level details. This abstraction aids in software development, algorithm design, and understanding of instruction semantics across different implementations and extensions of the RISC-V ISA.

Format of a line in the table:

`<instruction name> "<instruction pseudo-code>"`

| instruction  | instruction pseudo-code                                                                                     |
|--------------|:------------------------------------------------------------------------------------------------------------|
| `mul`        | `rd = sx(rs1) * sx(rs2)`                                                                                    |
| `mulh`       | `rd = riscv::mulh(sx(rs1), sx(rs2))`                                                                        |
| `mulhsu`     | `rd = riscv::mulhsu(sx(rs1), ux(rs2))`                                                                      |
| `mulhu`      | `rd = riscv::mulhu(ux(rs1), ux(rs2))`                                                                       |
| `div`        | `rd = sx(rs1) == sx(INT_MIN) && sx(rs2) == -1 ? sx(INT_MIN) : sx(rs2) == 0 ? -1 : sx(rs1) / sx(rs2)`        |
| `divu`       | `rd = sx(rs2) == 0 ? -1 : sx(ux(rs1) / ux(rs2))`                                                            |
| `rem`        | `rd = sx(rs1) == sx(INT_MIN) && sx(rs2) == -1 ? 0 : sx(rs2) == 0 ? sx(rs1) : sx(rs1) % sx(rs2)`             |
| `remu`       | `rd = sx(rs2) == 0 ? sx(rs1) : sx(ux(rs1) % ux(rs2))`                                                       |

:RV32M - "RV32M Standard Extension for Integer Multiply and Divide"

This table outlines the standard extension for integer multiplication and division operations in the 32-bit RISC-V architecture, enhancing computational capabilities with dedicated instructions.

| instruction  | instruction pseudo-code                                                                                     |
|--------------|:------------------------------------------------------------------------------------------------------------|
| `mulw`       | `rd = s32(u32(rs1) * u32(rs2))`                                                                             |
| `divw`       | `rd = s32(rs1) == s32(INT_MIN) && s32(rs2) == -1 ? s32(INT_MIN) : s32(rs2) == 0 ? -1 : s32(rs1) / s32(rs2)` |
| `divuw`      | `rd = s32(rs2) == 0 ? -1 : s32(u32(rs1) / u32(rs2))`                                                        |
| `remw`       | `rd = s32(rs1) == s32(INT_MIN) && s32(rs2) == -1 ? 0 : s32(rs2) == 0 ? s32(rs1) : s32(rs1) % s32(rs2)`      |
| `remuw`      | `rd = s32(rs2) == 0 ? s32(rs1) : s32(u32(rs1) % u32(rs2))`                                                  |

:RV64M - "RV64M Standard Extension for Integer Multiply and Divide (+ RV32M)"

Extending RV32M to 64-bit, RV64M introduces support for integer multiplication and division operations, catering to applications requiring larger data processing capabilities.
