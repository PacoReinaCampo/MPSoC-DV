## MAJOR OPCODES

Major opcodes in RISC-V encompass essential instruction categories such as arithmetic, logical operations, memory access, and control flow. Each major opcode represents a group of related instructions that share common functionalities and operand types, contributing to the versatility and efficiency of the RISC-V ISA across diverse computing applications.

| **`[6:5] \ [4:2]`** | **`000 (0)`** | **`001 (1)`** | **`010 (2)`** | **`011 (3)`** | **`100 (4)`** | **`101 (5)`** | **`110 (6)`** | **`111 (7)`** |
|:--------------------|:--------------|:--------------|:--------------|:--------------|:--------------|:--------------|:--------------|:--------------|
| `00 (0)`            | `load`        | `load-fp`     | `custom-0`    | `misc-mem`    | `op-imm`      | `auipc`       | `op-imm-32`   | `reserved`    |
| `01 (1)`            | `store`       | `store-fp`    | `custom-1`    | `amo`         | `op`          | `lui`         | `op-32`       | `reserved`    |
| `10 (2)`            | `madd`        | `msub`        | `nmsub`       | `nmadd`       | `op-fp`       | `op-v`        | `custom-2`    | `reserved`    |
| `11 (3)`            | `branch`      | `jalr`        | `reserved`    | `jal`         | `system`      | `op-ve`       | `custom-3`    | `reserved`    |

:Major Opcodes RV32G / RV64G

| **`6..5`** | **`4..2`** | **name**         |
|:-----------|:-----------|:-----------------|
| `6..5=0`   | `4..2=0`   | `load`           |
| `6..5=0`   | `4..2=1`   | `load-fp`        |
| `6..5=0`   | `4..2=2`   | `custom-0`       |
| `6..5=0`   | `4..2=3`   | `misc-mem`       |
| `6..5=0`   | `4..2=4`   | `op-imm`         |
| `6..5=0`   | `4..2=5`   | `auipc`          |
| `6..5=0`   | `4..2=6`   | `op-imm-32`      |
| `6..5=0`   | `4..2=7`   | `48-bit`         |
| `6..5=1`   | `4..2=0`   | `store`          |
| `6..5=1`   | `4..2=1`   | `store-fp`       |
| `6..5=1`   | `4..2=2`   | `custom-1`       |
| `6..5=1`   | `4..2=3`   | `amo`            |
| `6..5=1`   | `4..2=4`   | `op`             |
| `6..5=1`   | `4..2=5`   | `lui`            |
| `6..5=1`   | `4..2=6`   | `op-32`          |
| `6..5=1`   | `4..2=7`   | `64-bit`         |
| `6..5=2`   | `4..2=0`   | `madd`           |
| `6..5=2`   | `4..2=1`   | `msub`           |
| `6..5=2`   | `4..2=2`   | `nmsub`          |
| `6..5=2`   | `4..2=3`   | `nmadd`          |
| `6..5=2`   | `4..2=4`   | `op-fp`          |
| `6..5=2`   | `4..2=5`   | `reserved`       |
| `6..5=2`   | `4..2=6`   | `custom-2,rv128` |
| `6..5=2`   | `4..2=7`   | `48-bit`         |
| `6..5=3`   | `4..2=0`   | `branch`         |
| `6..5=3`   | `4..2=1`   | `jalr`           |
| `6..5=3`   | `4..2=2`   | `reserved`       |
| `6..5=3`   | `4..2=3`   | `jal`            |
| `6..5=3`   | `4..2=4`   | `system`         |
| `6..5=3`   | `4..2=5`   | `reserved`       |
| `6..5=3`   | `4..2=6`   | `custom-3,rv128` |
| `6..5=3`   | `4..2=7`   | `>80-bit`        |

:Major Opcodes RV32 / RV64

The major opcodes table categorizes and lists the primary opcodes utilized in the RISC-V instruction set architecture, essential for navigating and comprehending the instruction set's core functionalities.
