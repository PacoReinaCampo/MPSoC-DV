## INSTRUCTION FULL-NAMES

The RISC-V ISA defines a comprehensive set of instructions, each identified by an opcode that denotes its operation. Full-Names for instructions typically include a mnemonic followed by suffixes indicating specific variants or extensions. For instance, "ADD" denotes addition, while "ADDI" specifies addition with an immediate operand.

Format of a line in the table:

`<instruction name> "<instruction full-name>"`

| instruction  | instruction full-name                                               |
|--------------|:--------------------------------------------------------------------|
| `mul`        | `Multiply`                                                          |
| `mulh`       | `Multiply High Signed Signed`                                       |
| `mulhsu`     | `Multiply High Signed Unsigned`                                     |
| `mulhu`      | `Multiply High Unsigned Unsigned`                                   |
| `div`        | `Divide Signed`                                                     |
| `divu`       | `Divide Unsigned`                                                   |
| `rem`        | `Remainder Signed`                                                  |
| `remu`       | `Remainder Unsigned`                                                |

:RV32M - "RV32M Standard Extension for Integer Multiply and Divide"

This table outlines the standard extension for integer multiplication and division operations in the 32-bit RISC-V architecture, enhancing computational capabilities with dedicated instructions.

| instruction  | instruction full-name                                               |
|--------------|:--------------------------------------------------------------------|
| `mulw`       | `Multiple Word`                                                     |
| `divw`       | `Divide Signed Word`                                                |
| `divuw`      | `Divide Unsigned Word`                                              |
| `remw`       | `Remainder Signed Word`                                             |
| `remuw`      | `Remainder Unsigned Word`                                           |

:RV64M - "RV64M Standard Extension for Integer Multiply and Divide (+ RV32M)"

Extending RV32M to 64-bit, RV64M introduces support for integer multiplication and division operations, catering to applications requiring larger data processing capabilities.
