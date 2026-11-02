## OPCODE ENCODING INFORMATION

| **Instruction** | **Argument**      | **Opcode**                                                                         | **Codec** | **Extension**        |
|:----------------|:------------------|:-----------------------------------------------------------------------------------|:----------|:---------------------|
| `lui`           | `rd imm20`        | `6..2=0x0D 1..0=3`                                                                 | `u`       | `rv32i rv64i rv128i` |
| `auipc`         | `rd oimm20`       | `6..2=0x05 1..0=3`                                                                 | `u+o`     | `rv32i rv64i rv128i` |
| `jal`           | `rd jimm20`       | `6..2=0x1b 1..0=3`                                                                 | `uj`      | `rv32i rv64i rv128i` |
| `jalr`          | `rd rs1 oimm12`   | `14..12=0 6..2=0x19 1..0=3`                                                        | `i+o`     | `rv32i rv64i rv128i` |
| `beq`           | `rs1 rs2 sbimm12` | `14..12=0 6..2=0x18 1..0=3`                                                        | `sb`      | `rv32i rv64i rv128i` |
| `bne`           | `rs1 rs2 sbimm12` | `14..12=1 6..2=0x18 1..0=3`                                                        | `sb`      | `rv32i rv64i rv128i` |
| `blt`           | `rs1 rs2 sbimm12` | `14..12=4 6..2=0x18 1..0=3`                                                        | `sb`      | `rv32i rv64i rv128i` |
| `bge`           | `rs1 rs2 sbimm12` | `14..12=5 6..2=0x18 1..0=3`                                                        | `sb`      | `rv32i rv64i rv128i` |
| `bltu`          | `rs1 rs2 sbimm12` | `14..12=6 6..2=0x18 1..0=3`                                                        | `sb`      | `rv32i rv64i rv128i` |
| `bgeu`          | `rs1 rs2 sbimm12` | `14..12=7 6..2=0x18 1..0=3`                                                        | `sb`      | `rv32i rv64i rv128i` |
| `lb`            | `rd rs1 oimm12`   | `14..12=0 6..2=0x00 1..0=3`                                                        | `i+l`     | `rv32i rv64i rv128i` |
| `lh`            | `rd rs1 oimm12`   | `14..12=1 6..2=0x00 1..0=3`                                                        | `i+l`     | `rv32i rv64i rv128i` |
| `lw`            | `rd rs1 oimm12`   | `14..12=2 6..2=0x00 1..0=3`                                                        | `i+l`     | `rv32i rv64i rv128i` |
| `lbu`           | `rd rs1 oimm12`   | `14..12=4 6..2=0x00 1..0=3`                                                        | `i+l`     | `rv32i rv64i rv128i` |
| `lhu`           | `rd rs1 oimm12`   | `14..12=5 6..2=0x00 1..0=3`                                                        | `i+l`     | `rv32i rv64i rv128i` |
| `sb`            | `rs1 rs2 simm12`  | `14..12=0 6..2=0x08 1..0=3`                                                        | `s`       | `rv32i rv64i rv128i` |
| `sh`            | `rs1 rs2 simm12`  | `14..12=1 6..2=0x08 1..0=3`                                                        | `s`       | `rv32i rv64i rv128i` |
| `sw`            | `rs1 rs2 simm12`  | `14..12=2 6..2=0x08 1..0=3`                                                        | `s`       | `rv32i rv64i rv128i` |
| `addi`          | `rd rs1 imm12`    | `14..12=0 6..2=0x04 1..0=3`                                                        | `i`       | `rv32i rv64i rv128i` |
| `slti`          | `rd rs1 imm12`    | `14..12=2 6..2=0x04 1..0=3`                                                        | `i`       | `rv32i rv64i rv128i` |
| `sltiu`         | `rd rs1 imm12`    | `14..12=3 6..2=0x04 1..0=3`                                                        | `i`       | `rv32i rv64i rv128i` |
| `xori`          | `rd rs1 imm12`    | `14..12=4 6..2=0x04 1..0=3`                                                        | `i`       | `rv32i rv64i rv128i` |
| `ori`           | `rd rs1 imm12`    | `14..12=6 6..2=0x04 1..0=3`                                                        | `i`       | `rv32i rv64i rv128i` |
| `andi`          | `rd rs1 imm12`    | `14..12=7 6..2=0x04 1..0=3`                                                        | `i`       | `rv32i rv64i rv128i` |
| `slli`          | `rd rs1 shamt5`   | `31..27=0  14..12=1 6..2=0x04 1..0=3`                                              | `i·sh5`   | `rv32i`              |
| `srli`          | `rd rs1 shamt5`   | `31..27=0  14..12=5 6..2=0x04 1..0=3`                                              | `i·sh5`   | `rv32i`              |
| `srai`          | `rd rs1 shamt5`   | `31..27=8  14..12=5 6..2=0x04 1..0=3`                                              | `i·sh5`   | `rv32i`              |
| `add`           | `rd rs1 rs2`      | `31..25=0  14..12=0 6..2=0x0C 1..0=3`                                              | `r`       | `rv32i rv64i rv128i` |
| `sub`           | `rd rs1 rs2`      | `31..25=32 14..12=0 6..2=0x0C 1..0=3`                                              | `r`       | `rv32i rv64i rv128i` |
| `sll`           | `rd rs1 rs2`      | `31..25=0  14..12=1 6..2=0x0C 1..0=3`                                              | `r`       | `rv32i rv64i rv128i` |
| `slt`           | `rd rs1 rs2`      | `31..25=0  14..12=2 6..2=0x0C 1..0=3`                                              | `r`       | `rv32i rv64i rv128i` |
| `sltu`          | `rd rs1 rs2`      | `31..25=0  14..12=3 6..2=0x0C 1..0=3`                                              | `r`       | `rv32i rv64i rv128i` |
| `xor`           | `rd rs1 rs2`      | `31..25=0  14..12=4 6..2=0x0C 1..0=3`                                              | `r`       | `rv32i rv64i rv128i` |
| `srl`           | `rd rs1 rs2`      | `31..25=0  14..12=5 6..2=0x0C 1..0=3`                                              | `r`       | `rv32i rv64i rv128i` |
| `sra`           | `rd rs1 rs2`      | `31..25=32 14..12=5 6..2=0x0C 1..0=3`                                              | `r`       | `rv32i rv64i rv128i` |
| `or`            | `rd rs1 rs2`      | `31..25=0  14..12=6 6..2=0x0C 1..0=3`                                              | `r`       | `rv32i rv64i rv128i` |
| `and`           | `rd rs1 rs2`      | `31..25=0  14..12=7 6..2=0x0C 1..0=3`                                              | `r`       | `rv32i rv64i rv128i` |
| `fence`         | `-`               | `31..28=ignore pred succ     19..15=ignore 14..12=0 11..7=ignore 6..2=0x03 1..0=3` | `r·f`     | `rv32i rv64i rv128i` |
| `fence.i`       | `-`               | `31..28=ignore 27..20=ignore 19..15=ignore 14..12=1 11..7=ignore 6..2=0x03 1..0=3` | `none`    | `rv32i rv64i rv128i` |

:RV32I - "RV32I Base Integer Instruction Set"

| **Instruction** | **Argument**     | **Opcode**                            | **Codec** | **Extension**  |
|:----------------|:-----------------|:--------------------------------------|:----------|:---------------|
| `lwu`           | `rd rs1 oimm12`  | `14..12=6 6..2=0x00 1..0=3`           | `i+l`     | `rv64i rv128i` |
| `ld`            | `rd rs1 oimm12`  | `14..12=3 6..2=0x00 1..0=3`           | `i+l`     | `rv64i rv128i` |
| `sd`            | `rs1 rs2 simm12` | `14..12=3 6..2=0x08 1..0=3`           | `s`       | `rv64i rv128i` |
| `slli`          | `rd rs1 shamt6`  | `31..27=0  14..12=1 6..2=0x04 1..0=3` | `i·sh6`   | `rv64i`        |
| `srli`          | `rd rs1 shamt6`  | `31..27=0  14..12=5 6..2=0x04 1..0=3` | `i·sh6`   | `rv64i`        |
| `srai`          | `rd rs1 shamt6`  | `31..27=8  14..12=5 6..2=0x04 1..0=3` | `i·sh6`   | `rv64i`        |
| `addiw`         | `rd rs1 imm12`   | `14..12=0 6..2=0x06 1..0=3`           | `i`       | `rv64i rv128i` |
| `slliw`         | `rd rs1 shamt5`  | `31..25=0  14..12=1 6..2=0x06 1..0=3` | `i·sh5`   | `rv64i rv128i` |
| `srliw`         | `rd rs1 shamt5`  | `31..25=0  14..12=5 6..2=0x06 1..0=3` | `i·sh5`   | `rv64i rv128i` |
| `sraiw`         | `rd rs1 shamt5`  | `31..25=32 14..12=5 6..2=0x06 1..0=3` | `i·sh5`   | `rv64i rv128i` |
| `addw`          | `rd rs1 rs2`     | `31..25=0  14..12=0 6..2=0x0E 1..0=3` | `r`       | `rv64i rv128i` |
| `subw`          | `rd rs1 rs2`     | `31..25=32 14..12=0 6..2=0x0E 1..0=3` | `r`       | `rv64i rv128i` |
| `sllw`          | `rd rs1 rs2`     | `31..25=0  14..12=1 6..2=0x0E 1..0=3` | `r`       | `rv64i rv128i` |
| `srlw`          | `rd rs1 rs2`     | `31..25=0  14..12=5 6..2=0x0E 1..0=3` | `r`       | `rv64i rv128i` |
| `sraw`          | `rd rs1 rs2`     | `31..25=32 14..12=5 6..2=0x0E 1..0=3` | `r`       | `rv64i rv128i` |

:RV64I - "RV64I Base Integer Instruction Set (+ RV32I)"

| **Instruction** | **Argument**     | **Opcode**                            | **Codec** | **Extension** |
|:----------------|:-----------------|:--------------------------------------|:----------|:--------------|
| `ldu`           | `rd rs1 oimm12`  | `14..12=7 6..2=0x00 1..0=3`           | `i+l`     | `rv128i`      |
| `lq`            | `rd rs1 oimm12`  | `14..12=2 6..2=0x03 1..0=3`           | `i+l`     | `rv128i`      |
| `sq`            | `rs1 rs2 simm12` | `14..12=4 6..2=0x08 1..0=3`           | `s`       | `rv128i`      |
| `slli`          | `rd rs1 shamt7`  | `31..27=0  14..12=1 6..2=0x04 1..0=3` | `i·sh7`   | `rv128i`      |
| `srli`          | `rd rs1 shamt7`  | `31..27=0  14..12=5 6..2=0x04 1..0=3` | `i·sh7`   | `rv128i`      |
| `srai`          | `rd rs1 shamt7`  | `31..27=8  14..12=5 6..2=0x04 1..0=3` | `i·sh7`   | `rv128i`      |
| `addid`         | `rd rs1 imm12`   | `14..12=0 6..2=0x16 1..0=3`           | `i`       | `rv128i`      |
| `sllid`         | `rd rs1 shamt6`  | `31..26=0  14..12=1 6..2=0x16 1..0=3` | `i·sh6`   | `rv128i`      |
| `srlid`         | `rd rs1 shamt6`  | `31..26=0  14..12=5 6..2=0x16 1..0=3` | `i·sh6`   | `rv128i`      |
| `sraid`         | `rd rs1 shamt6`  | `31..26=16 14..12=5 6..2=0x16 1..0=3` | `i·sh6`   | `rv128i`      |
| `addd`          | `rd rs1 rs2`     | `31..25=0  14..12=0 6..2=0x1E 1..0=3` | `r`       | `rv128i`      |
| `subd`          | `rd rs1 rs2`     | `31..25=32 14..12=0 6..2=0x1E 1..0=3` | `r`       | `rv128i`      |
| `slld`          | `rd rs1 rs2`     | `31..25=0  14..12=1 6..2=0x1E 1..0=3` | `r`       | `rv128i`      |
| `srld`          | `rd rs1 rs2`     | `31..25=0  14..12=5 6..2=0x1E 1..0=3` | `r`       | `rv128i`      |
| `srad`          | `rd rs1 rs2`     | `31..25=32 14..12=5 6..2=0x1E 1..0=3` | `r`       | `rv128i`      |

:RV128I - "RV128I Base Integer Instruction Set (+ RV64I)"
