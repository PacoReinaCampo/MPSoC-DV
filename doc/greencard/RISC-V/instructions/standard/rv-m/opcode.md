## OPCODE ENCODING INFORMATION

Opcodes in RISC-V are structured within instruction encoding formats, defining fields such as opcode itself, function codes (`funct3`, `funct7`), immediate values, and register specifiers (`rd`, `rs1`, `rs2`). Structured information ensures consistent interpretation and execution across different implementations and extensions of the RISC-V ISA, supporting modularity and compatibility.

Format of a line in the table:

`<instruction name> [<arguments> ...] <opcode> <codec> <extension>`

`<arguments> is one of rd, rs1, rs2, frd, frs1, frs2, frs3, imm20, imm12, sbimm12, simm12, shamt5, shamt6, rm, aq, rl, pred, succ`

`<opcode> is given by specifying one or more range/value pairs: hi..lo=value or bit=value or argument=value (e.g. 6..2=0x45 10=1)`

`<codec> is one of r, i, s, sb, u, uj, ...`

`<extension> is one of { rv32, rv64, rv128 } · { i, m, a, f, d, s, c }`

| instruction  | argument              | opcode                                                                             | codec        | extension            |
|--------------|:----------------------|:-----------------------------------------------------------------------------------|:-------------|:---------------------|
| `mul`        | `rd rs1 rs2`          | `31..25=1 14..12=0 6..2=0x0C 1..0=3`                                               | `r`          | `rv32m rv64m rv128m` |
| `mulh`       | `rd rs1 rs2`          | `31..25=1 14..12=1 6..2=0x0C 1..0=3`                                               | `r`          | `rv32m rv64m rv128m` |
| `mulhsu`     | `rd rs1 rs2`          | `31..25=1 14..12=2 6..2=0x0C 1..0=3`                                               | `r`          | `rv32m rv64m rv128m` |
| `mulhu`      | `rd rs1 rs2`          | `31..25=1 14..12=3 6..2=0x0C 1..0=3`                                               | `r`          | `rv32m rv64m rv128m` |
| `div`        | `rd rs1 rs2`          | `31..25=1 14..12=4 6..2=0x0C 1..0=3`                                               | `r`          | `rv32m rv64m rv128m` |
| `divu`       | `rd rs1 rs2`          | `31..25=1 14..12=5 6..2=0x0C 1..0=3`                                               | `r`          | `rv32m rv64m rv128m` |
| `rem`        | `rd rs1 rs2`          | `31..25=1 14..12=6 6..2=0x0C 1..0=3`                                               | `r`          | `rv32m rv64m rv128m` |
| `remu`       | `rd rs1 rs2`          | `31..25=1 14..12=7 6..2=0x0C 1..0=3`                                               | `r`          | `rv32m rv64m rv128m` |

:RV32M - "RV32M Standard Extension for Integer Multiply and Divide"

This table outlines the standard extension for integer multiplication and division operations in the 32-bit RISC-V architecture, enhancing computational capabilities with dedicated instructions.

| instruction  | argument              | opcode                                                                             | codec        | extension            |
|--------------|:----------------------|:-----------------------------------------------------------------------------------|:-------------|:---------------------|
| `mulw`       | `rd rs1 rs2`          | `31..25=1 14..12=0 6..2=0x0E 1..0=3`                                               | `r`          |       `rv64m rv128m` |
| `divw`       | `rd rs1 rs2`          | `31..25=1 14..12=4 6..2=0x0E 1..0=3`                                               | `r`          |       `rv64m rv128m` |
| `divuw`      | `rd rs1 rs2`          | `31..25=1 14..12=5 6..2=0x0E 1..0=3`                                               | `r`          |       `rv64m rv128m` |
| `remw`       | `rd rs1 rs2`          | `31..25=1 14..12=6 6..2=0x0E 1..0=3`                                               | `r`          |       `rv64m rv128m` |
| `remuw`      | `rd rs1 rs2`          | `31..25=1 14..12=7 6..2=0x0E 1..0=3`                                               | `r`          |       `rv64m rv128m` |

:RV64M - "RV64M Standard Extension for Integer Multiply and Divide (+ RV32M)"

Extending RV32M to 64-bit, RV64M introduces support for integer multiplication and division operations, catering to applications requiring larger data processing capabilities.

| instruction  | argument              | opcode                                                                             | codec        | extension            |
|--------------|:----------------------|:-----------------------------------------------------------------------------------|:-------------|:---------------------|
| `muld`       | `rd rs1 rs2`          | `31..25=1 14..12=0 6..2=0x1E 1..0=3`                                               | `r`          |             `rv128m` |
| `divd`       | `rd rs1 rs2`          | `31..25=1 14..12=4 6..2=0x1E 1..0=3`                                               | `r`          |             `rv128m` |
| `divud`      | `rd rs1 rs2`          | `31..25=1 14..12=5 6..2=0x1E 1..0=3`                                               | `r`          |             `rv128m` |
| `remd`       | `rd rs1 rs2`          | `31..25=1 14..12=6 6..2=0x1E 1..0=3`                                               | `r`          |             `rv128m` |
| `remud`      | `rd rs1 rs2`          | `31..25=1 14..12=7 6..2=0x1E 1..0=3`                                               | `r`          |             `rv128m` |

:RV128M - "RV128M Standard Extension for Integer Multiply and Divide (+ RV64M)"
