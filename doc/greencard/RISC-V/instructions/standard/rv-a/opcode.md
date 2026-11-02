## OPCODE ENCODING INFORMATION

| **Instruction** | **Argument**      | **Opcode**                                          | **Codec** | **Extension**        |
|:----------------|:------------------|:----------------------------------------------------|:----------|:---------------------|
| `lr.w`          | `rd rs1 24..20=0` | `aq rl 31..29=0 28..27=2 14..12=2 6..2=0x0B 1..0=3` | `r·l`     | `rv32a rv64a rv128a` |
| `sc.w`          | `rd rs1 rs2`      | `aq rl 31..29=0 28..27=3 14..12=2 6..2=0x0B 1..0=3` | `r·a`     | `rv32a rv64a rv128a` |
| `amoswap.w`     | `rd rs1 rs2`      | `aq rl 31..29=0 28..27=1 14..12=2 6..2=0x0B 1..0=3` | `r·a`     | `rv32a rv64a rv128a` |
| `amoadd.w`      | `rd rs1 rs2`      | `aq rl 31..29=0 28..27=0 14..12=2 6..2=0x0B 1..0=3` | `r·a`     | `rv32a rv64a rv128a` |
| `amoxor.w`      | `rd rs1 rs2`      | `aq rl 31..29=1 28..27=0 14..12=2 6..2=0x0B 1..0=3` | `r·a`     | `rv32a rv64a rv128a` |
| `amoor.w`       | `rd rs1 rs2`      | `aq rl 31..29=2 28..27=0 14..12=2 6..2=0x0B 1..0=3` | `r·a`     | `rv32a rv64a rv128a` |
| `amoand.w`      | `rd rs1 rs2`      | `aq rl 31..29=3 28..27=0 14..12=2 6..2=0x0B 1..0=3` | `r·a`     | `rv32a rv64a rv128a` |
| `amomin.w`      | `rd rs1 rs2`      | `aq rl 31..29=4 28..27=0 14..12=2 6..2=0x0B 1..0=3` | `r·a`     | `rv32a rv64a rv128a` |
| `amomax.w`      | `rd rs1 rs2`      | `aq rl 31..29=5 28..27=0 14..12=2 6..2=0x0B 1..0=3` | `r·a`     | `rv32a rv64a rv128a` |
| `amominu.w`     | `rd rs1 rs2`      | `aq rl 31..29=6 28..27=0 14..12=2 6..2=0x0B 1..0=3` | `r·a`     | `rv32a rv64a rv128a` |
| `amomaxu.w`     | `rd rs1 rs2`      | `aq rl 31..29=7 28..27=0 14..12=2 6..2=0x0B 1..0=3` | `r·a`     | `rv32a rv64a rv128a` |

:RV32A - "RV32A Standard Extension for Atomic Instructions"

| **Instruction** | **Argument**      | **Opcode**                                          | **Codec** | **Extension**  |
|:----------------|:------------------|:----------------------------------------------------|:----------|:---------------|
| `lr.d`          | `rd rs1 24..20=0` | `aq rl 31..29=0 28..27=2 14..12=3 6..2=0x0B 1..0=3` | `r·l`     | `rv64a rv128a` |
| `sc.d`          | `rd rs1 rs2`      | `aq rl 31..29=0 28..27=3 14..12=3 6..2=0x0B 1..0=3` | `r·a`     | `rv64a rv128a` |
| `amoswap.d`     | `rd rs1 rs2`      | `aq rl 31..29=0 28..27=1 14..12=3 6..2=0x0B 1..0=3` | `r·a`     | `rv64a rv128a` |
| `amoadd.d`      | `rd rs1 rs2`      | `aq rl 31..29=0 28..27=0 14..12=3 6..2=0x0B 1..0=3` | `r·a`     | `rv64a rv128a` |
| `amoxor.d`      | `rd rs1 rs2`      | `aq rl 31..29=1 28..27=0 14..12=3 6..2=0x0B 1..0=3` | `r·a`     | `rv64a rv128a` |
| `amoor.d`       | `rd rs1 rs2`      | `aq rl 31..29=2 28..27=0 14..12=3 6..2=0x0B 1..0=3` | `r·a`     | `rv64a rv128a` |
| `amoand.d`      | `rd rs1 rs2`      | `aq rl 31..29=3 28..27=0 14..12=3 6..2=0x0B 1..0=3` | `r·a`     | `rv64a rv128a` |
| `amomin.d`      | `rd rs1 rs2`      | `aq rl 31..29=4 28..27=0 14..12=3 6..2=0x0B 1..0=3` | `r·a`     | `rv64a rv128a` |
| `amomax.d`      | `rd rs1 rs2`      | `aq rl 31..29=5 28..27=0 14..12=3 6..2=0x0B 1..0=3` | `r·a`     | `rv64a rv128a` |
| `amominu.d`     | `rd rs1 rs2`      | `aq rl 31..29=6 28..27=0 14..12=3 6..2=0x0B 1..0=3` | `r·a`     | `rv64a rv128a` |
| `amomaxu.d`     | `rd rs1 rs2`      | `aq rl 31..29=7 28..27=0 14..12=3 6..2=0x0B 1..0=3` | `r·a`     | `rv64a rv128a` |

:RV64A - "RV64A Standard Extension for Atomic Instructions (+ RV32A)"

| **Instruction** | **Argument**      | **Opcode**                                          | **Codec** | **Extension** |
|:----------------|:------------------|:----------------------------------------------------|:----------|:--------------|
| `lr.q`          | `rd rs1 24..20=0` | `aq rl 31..29=0 28..27=2 14..12=4 6..2=0x0B 1..0=3` | `r·l`     | `rv128a`      |
| `sc.q`          | `rd rs1 rs2`      | `aq rl 31..29=0 28..27=3 14..12=4 6..2=0x0B 1..0=3` | `r·a`     | `rv128a`      |
| `amoswap.q`     | `rd rs1 rs2`      | `aq rl 31..29=0 28..27=1 14..12=4 6..2=0x0B 1..0=3` | `r·a`     | `rv128a`      |
| `amoadd.q`      | `rd rs1 rs2`      | `aq rl 31..29=0 28..27=0 14..12=4 6..2=0x0B 1..0=3` | `r·a`     | `rv128a`      |
| `amoxor.q`      | `rd rs1 rs2`      | `aq rl 31..29=1 28..27=0 14..12=4 6..2=0x0B 1..0=3` | `r·a`     | `rv128a`      |
| `amoor.q`       | `rd rs1 rs2`      | `aq rl 31..29=2 28..27=0 14..12=4 6..2=0x0B 1..0=3` | `r·a`     | `rv128a`      |
| `amoand.q`      | `rd rs1 rs2`      | `aq rl 31..29=3 28..27=0 14..12=4 6..2=0x0B 1..0=3` | `r·a`     | `rv128a`      |
| `amomin.q`      | `rd rs1 rs2`      | `aq rl 31..29=4 28..27=0 14..12=4 6..2=0x0B 1..0=3` | `r·a`     | `rv128a`      |
| `amomax.q`      | `rd rs1 rs2`      | `aq rl 31..29=5 28..27=0 14..12=4 6..2=0x0B 1..0=3` | `r·a`     | `rv128a`      |
| `amominu.q`     | `rd rs1 rs2`      | `aq rl 31..29=6 28..27=0 14..12=4 6..2=0x0B 1..0=3` | `r·a`     | `rv128a`      |
| `amomaxu.q`     | `rd rs1 rs2`      | `aq rl 31..29=7 28..27=0 14..12=4 6..2=0x0B 1..0=3` | `r·a`     | `rv128a`      |

:RV128A - "RV128A Standard Extension for Atomic Instructions (+ RV64A)"