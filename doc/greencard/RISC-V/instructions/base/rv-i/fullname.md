## INSTRUCTION FULL-NAMES

The RISC-V ISA defines a comprehensive set of instructions, each identified by an opcode that denotes its operation. Full-Names for instructions typically include a mnemonic followed by suffixes indicating specific variants or extensions. For instance, "ADD" denotes addition, while "ADDI" specifies addition with an immediate operand.

Format of a line in the table:

`<instruction name> "<instruction full-name>"`

| **instruction** | **instruction full-name**            |
|:----------------|:-------------------------------------|
| `lui`           | `Load Upper Immediate`               |
| `auipc`         | `Add Upper Immediate to PC`          |
| `jal`           | `Jump and Link`                      |
| `jalr`          | `Jump and Link Register`             |
| `beq`           | `Branch Equal`                       |
| `bne`           | `Branch Not Equal`                   |
| `blt`           | `Branch Less Than`                   |
| `bge`           | `Branch Greater than Equal`          |
| `bltu`          | `Branch Less Than Unsigned`          |
| `bgeu`          | `Branch Greater than Equal Unsigned` |
| `lb`            | `Load Byte`                          |
| `lh`            | `Load Half`                          |
| `lw`            | `Load Word`                          |
| `lbu`           | `Load Byte Unsigned`                 |
| `lhu`           | `Load Half Unsigned`                 |
| `lwu`           | `Load Word Unsigned`                 |
| `sb`            | `Store Byte`                         |
| `sh`            | `Store Half`                         |
| `sw`            | `Store Word`                         |
| `addi`          | `Add Immediate`                      |
| `slti`          | `Set Less Than Immediate`            |
| `sltiu`         | `Set Less Than Immediate Unsigned`   |
| `xori`          | `Xor Immediate`                      |
| `ori`           | `Or Immediate`                       |
| `andi`          | `And Immediate`                      |
| `slli`          | `Shift Left Logical Immediate`       |
| `srli`          | `Shift Right Logical Immediate`      |
| `srai`          | `Shift Right Arithmetic Immediate`   |
| `add`           | `Add`                                |
| `sub`           | `Subtract`                           |
| `sll`           | `Shift Left Logical`                 |
| `slt`           | `Set Less Than`                      |
| `sltu`          | `Set Less Than Unsigned`             |
| `xor`           | `Xor`                                |
| `srl`           | `Shift Right Logical`                |
| `sra`           | `Shift Right Arithmetic`             |
| `or`            | `Or`                                 |
| `and`           | `And`                                |
| `fence`         | `Fence`                              |
| `fence.i`       | `Fence Instruction`                  |

:RV32I - "RV32I Base Integer Instruction Set"

The RV32I table details the base integer instruction set for the 32-bit RISC-V architecture, encompassing essential operations and functionalities supported at the machine level.

| **instruction** | **instruction full-name**               |
|:----------------|:----------------------------------------|
| `ld`            | `Load Double`                           |
| `sd`            | `Store Double`                          |
| `addiw`         | `Add Immediate Word`                    |
| `slliw`         | `Shift Left Logical Immediate Word`     |
| `srliw`         | `Shift Right Logical Immediate Word`    |
| `sraiw`         | `Shift Right Arithmetic Immediate Word` |
| `addw`          | `Add Word`                              |
| `subw`          | `Subtract Word`                         |
| `sllw`          | `Shift Left Logical Word`               |
| `srlw`          | `Shift Right Logical Word`              |
| `sraw`          | `Shift Right Arithmetic Word`           |

:RV64I - "RV64I Base Integer Instruction Set (+ RV32I)"

Building upon RV32I, RV64I extends the base integer instruction set to 64-bit, maintaining compatibility with RV32I while adding support for larger data and addressing spaces.
