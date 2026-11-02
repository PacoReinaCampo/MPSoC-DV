## INSTRUCTION CLASSES

| **Instruction** | **Class**       |
|:----------------|:----------------|
| `lui`           | `alu`           |
| `auipc`         | `alu`           |
| `jal`           | `jump`          |
| `jalr`          | `jump,indirect` |
| `beq`           | `branch`        |
| `bne`           | `branch`        |
| `blt`           | `branch`        |
| `bge`           | `branch`        |
| `bltu`          | `branch`        |
| `bgeu`          | `branch`        |
| `lb`            | `load`          |
| `lh`            | `load`          |
| `lw`            | `load`          |
| `lbu`           | `load`          |
| `lhu`           | `load`          |
| `lwu`           | `load`          |
| `sb`            | `store`         |
| `sh`            | `store`         |
| `sw`            | `store`         |
| `addi`          | `alu`           |
| `slti`          | `alu`           |
| `sltiu`         | `alu`           |
| `xori`          | `alu`           |
| `ori`           | `alu`           |
| `andi`          | `alu`           |
| `slli`          | `alu`           |
| `srli`          | `alu`           |
| `srai`          | `alu`           |
| `add`           | `alu`           |
| `sub`           | `alu`           |
| `sll`           | `alu`           |
| `slt`           | `alu`           |
| `sltu`          | `alu`           |
| `xor`           | `alu`           |
| `srl`           | `alu`           |
| `sra`           | `alu`           |
| `or`            | `alu`           |
| `and`           | `alu`           |
| `fence`         | `fence`         |
| `fence.i`       | `fence`         |

:RV32O - "RV32O Base Integer Instruction Set"

| **Instruction** | **Class** |
|:----------------|:----------|
| `ld`            | `load`    |
| `sd`            | `store`   |
| `addiw`         | `alu`     |
| `slliw`         | `alu`     |
| `srliw`         | `alu`     |
| `sraiw`         | `alu`     |
| `addw`          | `alu`     |
| `subw`          | `alu`     |
| `sllw`          | `alu`     |
| `srlw`          | `alu`     |
| `sraw`          | `alu`     |

:RV64O - "RV64O Base Integer Instruction Set (+ RV32O)"