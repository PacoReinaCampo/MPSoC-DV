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
| `lui`        | `alu`           |
| `auipc`      | `alu`           |
| `jal`        | `jump`          |
| `jalr`       | `jump,indirect` |
| `beq`        | `branch`        |
| `bne`        | `branch`        |
| `blt`        | `branch`        |
| `bge`        | `branch`        |
| `bltu`       | `branch`        |
| `bgeu`       | `branch`        |
| `lb`         | `load`          |
| `lh`         | `load`          |
| `lw`         | `load`          |
| `lbu`        | `load`          |
| `lhu`        | `load`          |
| `lwu`        | `load`          |
| `sb`         | `store`         |
| `sh`         | `store`         |
| `sw`         | `store`         |
| `addi`       | `alu`           |
| `slti`       | `alu`           |
| `sltiu`      | `alu`           |
| `xori`       | `alu`           |
| `ori`        | `alu`           |
| `andi`       | `alu`           |
| `slli`       | `alu`           |
| `srli`       | `alu`           |
| `srai`       | `alu`           |
| `add`        | `alu`           |
| `sub`        | `alu`           |
| `sll`        | `alu`           |
| `slt`        | `alu`           |
| `sltu`       | `alu`           |
| `xor`        | `alu`           |
| `srl`        | `alu`           |
| `sra`        | `alu`           |
| `or`         | `alu`           |
| `and`        | `alu`           |
| `fence`      | `fence`         |
| `fence.i`    | `fence`         |

:RV32O - "RV32O Base Integer Instruction Set"

The RV32O table details the base integer instruction set for the 32-bit RISC-V architecture, encompassing essential operations and functionalities supported at the machine level.

| instruction  | class           |
|--------------|:----------------|
| `ld`         | `load`          |
| `sd`         | `store`         |
| `addiw`      | `alu`           |
| `slliw`      | `alu`           |
| `srliw`      | `alu`           |
| `sraiw`      | `alu`           |
| `addw`       | `alu`           |
| `subw`       | `alu`           |
| `sllw`       | `alu`           |
| `srlw`       | `alu`           |
| `sraw`       | `alu`           |

:RV64O - "RV64O Base Integer Instruction Set (+ RV32O)"

Building upon RV32O, RV64O extends the base integer instruction set to 64-bit, maintaining compatibility with RV32O while adding support for larger data and addressing spaces.
