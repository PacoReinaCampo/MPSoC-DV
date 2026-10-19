## INSTRUCTION DESCRIPTIONS

Instructions in RISC-V are designed to perform specific operations ranging from basic arithmetic and logical computations to memory access and control flow. Each instruction description outlines its functionality, including operands (registers or immediates), effects on status flags, memory access patterns, and control flow implications. Descriptions provide a clear understanding of how instructions interact with processor state and contribute to program execution.

Format of a line in the table:

`<instruction name> "<instruction description>"`

| **instruction name** | **instruction description**                                                                                              |
|:---------------------|:-------------------------------------------------------------------------------------------------------------------------|
| `lui`                | `Set and sign extend the 20-bit immediate (shited 12 bits left) and zero the bottom 12 bits into rd`                     |
| `auipc`              | `Place the PC plus the 20-bit signed immediate (shited 12 bits left) into rd (used before JALR)`                         |
| `jal`                | `Jump to the PC plus 20-bit signed immediate while saving PC+4 into rd`                                                  |
| `jalr`               | `Jump to rs1 plus the 12-bit signed immediate while saving PC+4 into rd`                                                 |
| `beq`                | `Branch to PC relative 12-bit signed immediate (shifted 1 bit left) if rs1 == rs2`                                       |
| `bne`                | `Branch to PC relative 12-bit signed immediate (shifted 1 bit left) if rs1 != rs2`                                       |
| `blt`                | `Branch to PC relative 12-bit signed immediate (shifted 1 bit left) if rs1 < rs2 (signed)`                               |
| `bge`                | `Branch to PC relative 12-bit signed immediate (shifted 1 bit left) if rs1 >= rs2 (signed)`                              |
| `bltu`               | `Branch to PC relative 12-bit signed immediate (shifted 1 bit left) if rs1 < rs2 (unsigned)`                             |
| `bgeu`               | `Branch to PC relative 12-bit signed immediate (shifted 1 bit left) if rs1 >= rs2 (unsigned)`                            |
| `lb`                 | `Load 8-bit value from addr in rs1 plus the 12-bit signed immediate and place sign-extended result into rd`              |
| `lh`                 | `Load 16-bit value from addr in rs1 plus the 12-bit signed immediate and place sign-extended result into rd`             |
| `lw`                 | `Load 32-bit value from addr in rs1 plus the 12-bit signed immediate and place sign-extended result into rd`             |
| `lbu`                | `Load 8-bit value from addr in rs1 plus the 12-bit signed immediate and place zero-extended result into rd`              |
| `lhu`                | `Load 32-bit value from addr in rs1 plus the 12-bit signed immediate and place zero-extended result into rd`             |
| `lwu`                | `Load 32-bit value from addr in rs1 plus the 12-bit signed immediate and place zero-extended result into rd`             |
| `sb`                 | `Store 8-bit value from the low bits of rs2 to addr in rs1 plus the 12-bit signed immediate`                             |
| `sh`                 | `Store 16-bit value from the low bits of rs2 to addr in rs1 plus the 12-bit signed immediate`                            |
| `sw`                 | `Store 32-bit value from the low bits of rs2 to addr in rs1 plus the 12-bit signed immediate`                            |
| `addi`               | `Add sign-extended 12-bit immediate to register rs1 and place the result in rd`                                          |
| `slti`               | `Set rd to 1 if rs1 is less than the sign-extended 12-bit immediate, otherwise set rd to 0 (signed)`                     |
| `sltiu`              | `Set rd to 1 if rs1 is less than the sign-extended 12-bit immediate, otherwise set rd to 0 (unsigned)`                   |
| `xori`               | `Set rd to the bitwise xor of rs1 with the sign-extended 12-bit immediate`                                               |
| `ori`                | `Set rd to the bitwise or of rs1 with the sign-extended 12-bit immediate`                                                |
| `andi`               | `Set rd to the bitwise and of rs1 with the sign-extended 12-bit immediate`                                               |
| `slli`               | `Shift rs1 left by the 5 or 6 (RV32/64) bit (RV64) immediate and place the result into rd`                               |
| `srli`               | `Shift rs1 right by the 5 or 6 (RV32/64) bit immediate and place the result into rd`                                     |
| `srai`               | `Shift rs1 right by the 5 or 6 (RV32/64) bit immediate and place the result into rd while retaining the sign`            |
| `add`                | `Add rs2 to rs1 and place the result into rd`                                                                            |
| `sub`                | `Subtract rs2 from rs1 and place the result into rd`                                                                     |
| `sll`                | `Shift rs1 left by the by the lower 5 or 6 (RV32/64) bits in rs2 and place the result into rd`                           |
| `slt`                | `Set rd to 1 if rs1 is less than rs2, otherwise set rd to 0 (signed)`                                                    |
| `sltu`               | `Set rd to 1 if rs1 is less than rs2, otherwise set rd to 0 (unsigned)`                                                  |
| `xor`                | `Set rd to the bitwise xor of rs1 and rs2`                                                                               |
| `srl`                | `Shift rs1 right by the by the lower 5 or 6 (RV32/64) bits in rs2 and place the result into rd`                          |
| `sra`                | `Shift rs1 right by the by the lower 5 or 6 (RV32/64) bits in rs2 and place the result into rd while retaining the sign` |
| `or`                 | `Set rd to the bitwise or of rs1 and rs2`                                                                                |
| `and`                | `Set rd to the bitwise and of rs1 and rs2`                                                                               |
| `fence`              | `Order device I/O and memory accesses viewed by other threads and devices`                                               |
| `fence.i`            | `Synchronize the instruction and data streams`                                                                           |

:RV32E - "RV32E Base Integer Instruction Set"

The RV32E table details the base integer instruction set for the 32-bit RISC-V architecture, encompassing essential operations and functionalities supported at the machine level.

| **instruction name** | **instruction description**                                                                                                      |
|:---------------------|:---------------------------------------------------------------------------------------------------------------------------------|
| `ld`                 | `Load 64-bit value from addr in rs1 plus 12-bit signed immediate and place sign-extended result into rd`                         |
| `sd`                 | `Store 64-bit value from the low bits of rs2 to addr in rs1 plus the 12-bit signed immediate`                                    |
| `addiw`              | `Add sign-extended 12-bit immediate to register rs1 and place 32-bit sign extended result in rs2 zeroing upper bits`             |
| `slliw`              | `Shift 32-bit value in rs1 left by the 5 bit immediate and place the result into rd while zeroing upper bits`                    |
| `srliw`              | `Shift 32-bit value in rs1 right by the 5 bit immediate and place the result into rd while zeroing upper bits`                   |
| `sraiw`              | `Shift 32-bit value in rs1 right by the 5 bit immediate and place the result into rd and retaining the sign`                     |
| `addw`               | `Add 32-bit value in rs2 to rs1 and place the 32-bit result into rd`                                                             |
| `subw`               | `Subtract 32-bit value in rs2 from rs1 and place the 32-bit result into rd`                                                      |
| `sllw`               | `Shift 32-bit value in rs1 left by the by the lower 5 bits in rs2 and place the 32-bit result into rd`                           |
| `srlw`               | `Shift 32-bit value in rs1 right by the by the lower 5 bits in rs2 and place the 32-bit result into rd`                          |
| `sraw`               | `Shift 32-bit value in rs1 right by the by the lower 5 bits in rs2 and place the 32-bit result into rd while retaining the sign` |

:RV64E - "RV64E Base Integer Instruction Set (+ RV32E)"

Building upon RV32E, RV64E extends the base integer instruction set to 64-bit, maintaining compatibility with RV32E while adding support for larger data and addressing spaces.
