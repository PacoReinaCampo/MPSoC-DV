## INSTRUCTION DESCRIPTIONS

| **Instruction Name** | **Instruction Description**                                                         |
|:---------------------|:------------------------------------------------------------------------------------|
| `mul`                | `Multiply rs1 by rs2 and place the result in rd`                                    |
| `mulh`               | `Multiply signed rs1 by signed rs2 and place the high bits of the result in rd`     |
| `mulhsu`             | `Multiply signed rs1 by unsigned rs2 and place the high bits of the result in rd`   |
| `mulhu`              | `Multiply unsigned rs1 by unsigned rs2 and place the high bits of the result in rd` |
| `div`                | `Divide rs1 (dividend) by rs2 (divisor) and place the quotient in rd (signed)`      |
| `divu`               | `Divide rs1 (dividend) by rs2 (divisor) and place the quotient in rd (unsigned)`    |
| `rem`                | `Divide rs1 (dividend) by rs2 (divisor) and place the remainder in rd (signed)`     |
| `remu`               | `Divide rs1 (dividend) by rs2 (divisor) and place the remainder in rd (unsigned)`   |

:RV32M - "RV32M Standard Extension for Integer Multiply and Divide"

| **Instruction Name** | **Instruction Description**                                                                                         |
|:---------------------|:--------------------------------------------------------------------------------------------------------------------|
| `mulw`               | `Multiply with lower 32-bits of rs1 by the lower 32-bits of rs2 and place the result in rd`                         |
| `divw`               | `Divide lower 32-bits of rs1 (dividend) by lower 32-bits of rs2 (divisor) and place the quotient in rd (signed)`    |
| `divuw`              | `Divide lower 32-bits of rs1 (dividend) by lower 32-bits of rs2 (divisor) and place the quotient in rd (unsigned)`  |
| `remw`               | `Divide lower 32-bits of rs1 (dividend) by lower 32-bits of rs2 (divisor) and place the remainder in rd (signed)`   |
| `remuw`              | `Divide lower 32-bits of rs1 (dividend) by lower 32-bits of rs2 (divisor) and place the remainder in rd (unsigned)` |

:RV64M - "RV64M Standard Extension for Integer Multiply and Divide (+ RV32M)"