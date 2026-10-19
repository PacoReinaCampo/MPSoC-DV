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
| `lr.w`       | `rd rs1 24..20=0`     | `aq rl 31..29=0 28..27=2 14..12=2 6..2=0x0B 1..0=3`                                | `r·l`        | `rv32a rv64a rv128a` |
| `sc.w`       | `rd rs1 rs2`          | `aq rl 31..29=0 28..27=3 14..12=2 6..2=0x0B 1..0=3`                                | `r·a`        | `rv32a rv64a rv128a` |
| `amoswap.w`  | `rd rs1 rs2`          | `aq rl 31..29=0 28..27=1 14..12=2 6..2=0x0B 1..0=3`                                | `r·a`        | `rv32a rv64a rv128a` |
| `amoadd.w`   | `rd rs1 rs2`          | `aq rl 31..29=0 28..27=0 14..12=2 6..2=0x0B 1..0=3`                                | `r·a`        | `rv32a rv64a rv128a` |
| `amoxor.w`   | `rd rs1 rs2`          | `aq rl 31..29=1 28..27=0 14..12=2 6..2=0x0B 1..0=3`                                | `r·a`        | `rv32a rv64a rv128a` |
| `amoor.w`    | `rd rs1 rs2`          | `aq rl 31..29=2 28..27=0 14..12=2 6..2=0x0B 1..0=3`                                | `r·a`        | `rv32a rv64a rv128a` |
| `amoand.w`   | `rd rs1 rs2`          | `aq rl 31..29=3 28..27=0 14..12=2 6..2=0x0B 1..0=3`                                | `r·a`        | `rv32a rv64a rv128a` |
| `amomin.w`   | `rd rs1 rs2`          | `aq rl 31..29=4 28..27=0 14..12=2 6..2=0x0B 1..0=3`                                | `r·a`        | `rv32a rv64a rv128a` |
| `amomax.w`   | `rd rs1 rs2`          | `aq rl 31..29=5 28..27=0 14..12=2 6..2=0x0B 1..0=3`                                | `r·a`        | `rv32a rv64a rv128a` |
| `amominu.w`  | `rd rs1 rs2`          | `aq rl 31..29=6 28..27=0 14..12=2 6..2=0x0B 1..0=3`                                | `r·a`        | `rv32a rv64a rv128a` |
| `amomaxu.w`  | `rd rs1 rs2`          | `aq rl 31..29=7 28..27=0 14..12=2 6..2=0x0B 1..0=3`                                | `r·a`        | `rv32a rv64a rv128a` |

:RV32A - "RV32A Standard Extension for Atomic Instructions"

Detailed here are the atomic instruction set extensions for the 32-bit RISC-V architecture, providing concurrency control primitives essential for synchronization in multi-threaded environments.

| instruction  | argument              | opcode                                                                             | codec        | extension            |
|--------------|:----------------------|:-----------------------------------------------------------------------------------|:-------------|:---------------------|
| `lr.d`       | `rd rs1 24..20=0`     | `aq rl 31..29=0 28..27=2 14..12=3 6..2=0x0B 1..0=3`                                | `r·l`        |       `rv64a rv128a` |
| `sc.d`       | `rd rs1 rs2`          | `aq rl 31..29=0 28..27=3 14..12=3 6..2=0x0B 1..0=3`                                | `r·a`        |       `rv64a rv128a` |
| `amoswap.d`  | `rd rs1 rs2`          | `aq rl 31..29=0 28..27=1 14..12=3 6..2=0x0B 1..0=3`                                | `r·a`        |       `rv64a rv128a` |
| `amoadd.d`   | `rd rs1 rs2`          | `aq rl 31..29=0 28..27=0 14..12=3 6..2=0x0B 1..0=3`                                | `r·a`        |       `rv64a rv128a` |
| `amoxor.d`   | `rd rs1 rs2`          | `aq rl 31..29=1 28..27=0 14..12=3 6..2=0x0B 1..0=3`                                | `r·a`        |       `rv64a rv128a` |
| `amoor.d`    | `rd rs1 rs2`          | `aq rl 31..29=2 28..27=0 14..12=3 6..2=0x0B 1..0=3`                                | `r·a`        |       `rv64a rv128a` |
| `amoand.d`   | `rd rs1 rs2`          | `aq rl 31..29=3 28..27=0 14..12=3 6..2=0x0B 1..0=3`                                | `r·a`        |       `rv64a rv128a` |
| `amomin.d`   | `rd rs1 rs2`          | `aq rl 31..29=4 28..27=0 14..12=3 6..2=0x0B 1..0=3`                                | `r·a`        |       `rv64a rv128a` |
| `amomax.d`   | `rd rs1 rs2`          | `aq rl 31..29=5 28..27=0 14..12=3 6..2=0x0B 1..0=3`                                | `r·a`        |       `rv64a rv128a` |
| `amominu.d`  | `rd rs1 rs2`          | `aq rl 31..29=6 28..27=0 14..12=3 6..2=0x0B 1..0=3`                                | `r·a`        |       `rv64a rv128a` |
| `amomaxu.d`  | `rd rs1 rs2`          | `aq rl 31..29=7 28..27=0 14..12=3 6..2=0x0B 1..0=3`                                | `r·a`        |       `rv64a rv128a` |

:RV64A - "RV64A Standard Extension for Atomic Instructions (+ RV32A)"

Extending atomic operations to 64-bit, RV64A builds upon RV32A by offering atomic instructions for manipulating memory in a thread-safe manner across larger data sets.

| instruction  | argument              | opcode                                                                             | codec        | extension            |
|--------------|:----------------------|:-----------------------------------------------------------------------------------|:-------------|:---------------------|
| `lr.q`       | `rd rs1 24..20=0`     | `aq rl 31..29=0 28..27=2 14..12=4 6..2=0x0B 1..0=3`                                | `r·l`        |             `rv128a` |
| `sc.q`       | `rd rs1 rs2`          | `aq rl 31..29=0 28..27=3 14..12=4 6..2=0x0B 1..0=3`                                | `r·a`        |             `rv128a` |
| `amoswap.q`  | `rd rs1 rs2`          | `aq rl 31..29=0 28..27=1 14..12=4 6..2=0x0B 1..0=3`                                | `r·a`        |             `rv128a` |
| `amoadd.q`   | `rd rs1 rs2`          | `aq rl 31..29=0 28..27=0 14..12=4 6..2=0x0B 1..0=3`                                | `r·a`        |             `rv128a` |
| `amoxor.q`   | `rd rs1 rs2`          | `aq rl 31..29=1 28..27=0 14..12=4 6..2=0x0B 1..0=3`                                | `r·a`        |             `rv128a` |
| `amoor.q`    | `rd rs1 rs2`          | `aq rl 31..29=2 28..27=0 14..12=4 6..2=0x0B 1..0=3`                                | `r·a`        |             `rv128a` |
| `amoand.q`   | `rd rs1 rs2`          | `aq rl 31..29=3 28..27=0 14..12=4 6..2=0x0B 1..0=3`                                | `r·a`        |             `rv128a` |
| `amomin.q`   | `rd rs1 rs2`          | `aq rl 31..29=4 28..27=0 14..12=4 6..2=0x0B 1..0=3`                                | `r·a`        |             `rv128a` |
| `amomax.q`   | `rd rs1 rs2`          | `aq rl 31..29=5 28..27=0 14..12=4 6..2=0x0B 1..0=3`                                | `r·a`        |             `rv128a` |
| `amominu.q`  | `rd rs1 rs2`          | `aq rl 31..29=6 28..27=0 14..12=4 6..2=0x0B 1..0=3`                                | `r·a`        |             `rv128a` |
| `amomaxu.q`  | `rd rs1 rs2`          | `aq rl 31..29=7 28..27=0 14..12=4 6..2=0x0B 1..0=3`                                | `r·a`        |             `rv128a` |

:RV128A - "RV128A Standard Extension for Atomic Instructions (+ RV64A)"
