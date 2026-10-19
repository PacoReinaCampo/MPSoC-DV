## INSTRUCTION DESCRIPTIONS

Instructions in RISC-V are designed to perform specific operations ranging from basic arithmetic and logical computations to memory access and control flow. Each instruction description outlines its functionality, including operands (registers or immediates), effects on status flags, memory access patterns, and control flow implications. Descriptions provide a clear understanding of how instructions interact with processor state and contribute to program execution.

Format of a line in the table:

`<instruction name> "<instruction description>"`

| instruction name | instruction description                                                                                                          |
|------------------|:---------------------------------------------------------------------------------------------------------------------------------|
| `mul`            | `Multiply rs1 by rs2 and place the result in rd`                                                                                 |
| `mulh`           | `Multiply signed rs1 by signed rs2 and place the high bits of the result in rd`                                                  |
| `mulhsu`         | `Multiply signed rs1 by unsigned rs2 and place the high bits of the result in rd`                                                |
| `mulhu`          | `Multiply unsigned rs1 by unsigned rs2 and place the high bits of the result in rd`                                              |
| `div`            | `Divide rs1 (dividend) by rs2 (divisor) and place the quotient in rd (signed)`                                                   |
| `divu`           | `Divide rs1 (dividend) by rs2 (divisor) and place the quotient in rd (unsigned)`                                                 |
| `rem`            | `Divide rs1 (dividend) by rs2 (divisor) and place the remainder in rd (signed)`                                                  |
| `remu`           | `Divide rs1 (dividend) by rs2 (divisor) and place the remainder in rd (unsigned)`                                                |

:RV32M - "RV32M Standard Extension for Integer Multiply and Divide"

This table outlines the standard extension for integer multiplication and division operations in the 32-bit RISC-V architecture, enhancing computational capabilities with dedicated instructions.

| instruction name | instruction description                                                                                                          |
|------------------|:---------------------------------------------------------------------------------------------------------------------------------|
| `mulw`           | `Multiply with lower 32-bits of rs1 by the lower 32-bits of rs2 and place the result in rd`                                      |
| `divw`           | `Divide lower 32-bits of rs1 (dividend) by lower 32-bits of rs2 (divisor) and place the quotient in rd (signed)`                 |
| `divuw`          | `Divide lower 32-bits of rs1 (dividend) by lower 32-bits of rs2 (divisor) and place the quotient in rd (unsigned)`               |
| `remw`           | `Divide lower 32-bits of rs1 (dividend) by lower 32-bits of rs2 (divisor) and place the remainder in rd (signed)`                |
| `remuw`          | `Divide lower 32-bits of rs1 (dividend) by lower 32-bits of rs2 (divisor) and place the remainder in rd (unsigned)`              |

:RV64M - "RV64M Standard Extension for Integer Multiply and Divide (+ RV32M)"

Extending RV32M to 64-bit, RV64M introduces support for integer multiplication and division operations, catering to applications requiring larger data processing capabilities.
