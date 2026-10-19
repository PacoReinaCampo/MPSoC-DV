## INSTRUCTION CLASSES

RISC-V instructions are classified into distinct classes based on their primary operations and operand types:

- **Arithmetic**: Operations like addition, subtraction, multiplication.
- **Logical**: Bitwise operations such as AND, OR, XOR.
- **Memory**: Load and store operations for data access.
- **Control Transfer**: Branches and jumps for altering program flow.
- **System**: Instructions for privileged operations and interaction with control and status registers (CSRs).

Each class serves a specific role in program execution and is encoded with corresponding opcodes to facilitate efficient instruction decoding and execution.

Format of a line in the table:

`<ins name> <class>`

| instruction  | class           |
|--------------|:----------------|
| `mul`        | `alu,multiply`  |
| `mulh`       | `alu,multiply`  |
| `mulhsu`     | `alu,multiply`  |
| `mulhu`      | `alu,multiply`  |
| `div`        | `alu,divide`    |
| `divu`       | `alu,divide`    |
| `rem`        | `alu,divide`    |
| `remu`       | `alu,divide`    |

:RV32M - "RV32M Standard Extension for Integer Multiply and Divide"

This table outlines the standard extension for integer multiplication and division operations in the 32-bit RISC-V architecture, enhancing computational capabilities with dedicated instructions.

| instruction  | class           |
|--------------|:----------------|
| `mulw`       | `alu,multiply`  |
| `divw`       | `alu,multiply`  |
| `divuw`      | `alu,multiply`  |
| `remw`       | `alu,divide`    |
| `remuw`      | `alu,divide`    |

:RV64M - "RV64M Standard Extension for Integer Multiply and Divide (+ RV32M)"

Extending RV32M to 64-bit, RV64M introduces support for integer multiplication and division operations, catering to applications requiring larger data processing capabilities.
