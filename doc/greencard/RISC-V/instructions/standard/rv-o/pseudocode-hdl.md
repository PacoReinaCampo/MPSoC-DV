## INSTRUCTION PSEUDO-CODE (HDL)

| **Instruction** | **Instruction Pseudo-Code**                      |
|:----------------|:-------------------------------------------------|
| `lui`           | `rd = imm`                                       |
| `auipc`         | `rd = pc + imm`                                  |
| `jal`           | `rd = pc + length(inst) ; pc = pc + imm`         |
| `jalr`          | `rd = pc + length(inst) ; pc = (rs1 + imm) & -2` |
| `beq`           | `if rs1 = rs2 then pc = pc + imm`                |
| `bne`           | `if rs1 != rs2 then pc = pc + imm`               |
| `blt`           | `if rs1 < rs2 then pc = pc + imm`                |
| `bge`           | `if rs1 >= rs2 then pc = pc + imm`               |
| `bltu`          | `if rs1 < rs2 then pc = pc + imm`                |
| `bgeu`          | `if rs1 >= rs2 then pc = pc + imm`               |
| `lb`            | `rd = s8[rs1 + imm]`                             |
| `lh`            | `rd = s16[rs1 + imm]`                            |
| `lw`            | `rd = s32[rs1 + imm]`                            |
| `lbu`           | `rd = u8[rs1 + imm]`                             |
| `lhu`           | `rd = u16[rs1 + imm]`                            |
| `lwu`           | `rd = u32[rs1 + imm]`                            |
| `sb`            | `u8[rs1 + imm] = rs2`                            |
| `sh`            | `u16[rs1 + imm] = rs2`                           |
| `sw`            | `u32[rs1 + imm] = rs2`                           |
| `addi`          | `rd = rs1 + sx(imm)`                             |
| `slti`          | `rd = sx(rs1) < sx(imm)`                         |
| `sltiu`         | `rd = ux(rs1) < ux(imm)`                         |
| `xori`          | `rd = ux(rs1) ^ ux(imm)`                         |
| `ori`           | `rd = ux(rs1) \| ux(imm)`                        |
| `andi`          | `rd = ux(rs1) & ux(imm)`                         |
| `slli`          | `rd = ux(rs1) << ux(imm)`                        |
| `srli`          | `rd = ux(rs1) >> ux(imm)`                        |
| `srai`          | `rd = sx(rs1) >> ux(imm)`                        |
| `add`           | `rd = sx(rs1) + sx(rs2)`                         |
| `sub`           | ``rd = sx(rs1) - sx(rs2)` `rs1 + ~rs2 + 1``      |
| `sll`           | `rd = ux(rs1) << rs2`                            |
| `slt`           | `rd = sx(rs1) < sx(rs2)`                         |
| `sltu`          | `rd = ux(rs1) < ux(rs2)`                         |
| `xor`           | `rd = ux(rs1) ^ ux(rs2)`                         |
| `srl`           | `rd = ux(rs1) >> rs2`                            |
| `sra`           | `rd = sx(rs1) >> rs2`                            |
| `or`            | `rd = ux(rs1) \| ux(rs2)`                        |
| `and`           | `rd = ux(rs1) & ux(rs2)`                         |
| `fence`         |                                                  |
| `fence.i`       |                                                  |

:RV32O - "RV32O Base Integer Instruction Set"

| **Instruction** | **Instruction Pseudo-Code** |
|:----------------|:----------------------------|
| `ld`            | `rd = u64[rs1 + imm]`       |
| `sd`            | `u64[rs1 + imm] = rs2`      |
| `addiw`         | `rd = s32(rs1) + imm`       |
| `slliw`         | `rd = s32(u32(rs1) << imm)` |
| `srliw`         | `rd = s32(u32(rs1) >> imm)` |
| `sraiw`         | `rd = s32(rs1) >> imm`      |
| `addw`          | `rd = s32(rs1) + s32(rs2)`  |
| `subw`          | `rd = s32(rs1) - s32(rs2)`  |
| `sllw`          | `rd = s32(u32(rs1) << rs2)` |
| `srlw`          | `rd = s32(u32(rs1) >> rs2)` |
| `sraw`          | `rd = s32(rs1) >> rs2`      |

:RV64O - "RV64O Base Integer Instruction Set (+ RV32O)"