| Compressed Opcode | Decompressed Opcode | Constraint Name                                        | Pseudo-Code                                                                             |
|-------------------|---------------------|--------------------------------------------------------|-----------------------------------------------------------------------------------------|
| `c.addi4spn`      | `addi`              | `imm_10 imm_x4 imm_nz  rd_b3 rs1_eq_sp`                | `rd = sx(rs1) + sx(imm)`                                                                |
| `c.fld`           | `fld`               | `imm_8  imm_x8         rd_b3 rs1_b3`                   | `u64 t; mmu.load<u64>(rs1 + imm, t); u64(frd) = t`                                      |
| `c.lw`            | `lw`                | `imm_7  imm_x4         rd_b3 rs1_b3`                   | `s32 t; mmu.load<s32>(rs1 + imm, t); rd = t`                                            |
| `c.flw`           | `flw`               | `imm_7  imm_x4         rd_b3 rs1_b3`                   | `u32 t; mmu.load<u32>(rs1 + imm, t); u32(frd) = t`                                      |
| `c.fsd`           | `fsd`               | `imm_8  imm_x8         rs1_b3 rs2_b3`                  | `mmu.store<f64>(rs1 + imm, f64(frs2))`                                                  |
| `c.sw`            | `sw`                | `imm_7  imm_x4         rs1_b3 rs2_b3`                  | `mmu.store<s32>(rs1 + imm, s32(rs2))`                                                   |
| `c.fsw`           | `fsw`               | `imm_7  imm_x4         rs1_b3 rs2_b3`                  | `mmu.store<f32>(rs1 + imm, f32(frs2))`                                                  |
| `c.nop`           | `addi`              |                       `rd_eq_x0 rs1_eq_x0 rs2_eq_x0`   | `rd = sx(rs1) + sx(imm)`                                                                |
| `c.addi`          | `addi`              | `simm_6 imm_nz         rd_ne_x0 rd_eq_rs1`             | `rd = sx(rs1) + sx(imm)`                                                                |
| `c.jal`           | `jal`               | `imm_12 imm_x2         rd_eq_ra`                       | `rd = pc + length(inst); pc_offset = imm`                                               |
| `c.li`            | `addi`              | `simm_6                rd_ne_x0 rs1_eq_x0`             | `rd = sx(rs1) + sx(imm)`                                                                |
| `c.lui`           | `lui`               | `imm_18 imm_nz         rd_ne_x0_x2`                    | `rd = imm`                                                                              |
| `c.addi16sp`      | `addi`              | `simm_10 imm_x4 imm_nz rd_eq_sp rs1_eq_sp`             | `rd = sx(rs1) + sx(imm)`                                                                |
| `c.srli`          | `srli`              | `imm_5 imm_nz          rd_eq_rs1 rd_b3 rs1_b3`         | `rd = ux(rs1) >> imm`                                                                   |
| `c.srai`          | `srai`              | `imm_5 imm_nz          rd_eq_rs1 rd_b3 rs1_b3`         | `rd = sx(rs1) >> imm`                                                                   |
| `c.andi`          | `andi`              | `imm_5 imm_nz          rd_eq_rs1 rd_b3 rs1_b3`         | `rd = ux(rs1) & ux(imm)`                                                                |
| `c.sub`           | `sub`               |                       `rd_eq_rs1 rd_b3 rs1_b3 rs2_b3`  | `rd = sx(rs1) - sx(rs2)`                                                                |
| `c.xor`           | `xor`               |                       `rd_eq_rs1 rd_b3 rs1_b3 rs2_b3`  | `rd = ux(rs1) ^ ux(rs2)`                                                                |
| `c.or`            | `or`                |                       `rd_eq_rs1 rd_b3 rs1_b3 rs2_b3`  | `rd = ux(rs1) | ux(rs2)`                                                                |
| `c.and`           | `and`               |                       `rd_eq_rs1 rd_b3 rs1_b3 rs2_b3`  | `rd = ux(rs1) & ux(rs2)`                                                                |
| `c.subw`          | `subw`              |                       `rd_eq_rs1 rd_b3 rs1_b3 rs2_b3`  | `rd = s32(s32(rs1) - s32(rs2))`                                                         |
| `c.addw`          | `addw`              |                       `rd_eq_rs1 rd_b3 rs1_b3 rs2_b3`  | `rd = s32(s32(rs1) + s32(rs2))`                                                         |
| `c.j`             | `jal`               | `simm_12 imm_x2        rd_eq_x0`                       | `rd = pc + length(inst); pc_offset = imm`                                               |
| `c.beqz`          | `beq`               | `simm_9 imm_x2         rs1_b3 rs2_eq_x0`               | `if (sx(rs1) == sx(rs2)) pc_offset = imm`                                               |
| `c.bnez`          | `bne`               | `simm_9 imm_x2         rs1_b3 rs2_eq_x0`               | `if (sx(rs1) != sx(rs2)) pc_offset = imm`                                               |
| `c.slli`          | `slli`              | `imm_5 imm_nz          rd_ne_x0 rd_eq_rs1`             | `rd = ux(rs1) << imm`                                                                   |
| `c.fldsp`         | `fld`               | `imm_9  imm_x8         rs1_eq_sp`                      | `u64 t; mmu.load<u64>(rs1 + imm, t); u64(frd) = t`                                      |
| `c.lwsp`          | `lw`                | `imm_8  imm_x4         rd_ne_x0 rs1_eq_sp`             | `s32 t; mmu.load<s32>(rs1 + imm, t); rd = t`                                            |
| `c.flwsp`         | `flw`               | `imm_8  imm_x4         rs1_eq_sp`                      | `u32 t; mmu.load<u32>(rs1 + imm, t); u32(frd) = t`                                      |
| `c.jr`            | `jalr`              | `imm_eq_zero           rd_eq_x0 rs1_ne_x0`             | `ux new_offset = (rs1 + imm - pc) & ~1; rd = pc + length(inst); pc_offset = new_offset` |
| `c.mv`            | `addi`              | `imm_eq_zero           rd_ne_x0`                       | `rd = sx(rs1) + sx(imm)`                                                                |
| `c.ebreak`        | `ebreak`            | `-`                                                    | `-`                                                                                     |
| `c.jalr`          | `jalr`              | `imm_eq_zero           rd_eq_ra rs1_ne_x0`             | `ux new_offset = (rs1 + imm - pc) & ~1; rd = pc + length(inst); pc_offset = new_offset` |
| `c.add`           | `add`               |                       `rd_eq_rs1 rd_ne_x0 rs2_ne_x0`   | `rd = sx(rs1) + sx(rs2)`                                                                |
| `c.fsdsp`         | `fsd`               | `imm_9  imm_x8         rs1_eq_sp`                      | `mmu.store<f64>(rs1 + imm, f64(frs2))`                                                  |
| `c.swsp`          | `sw`                | `imm_8  imm_x4         rs1_eq_sp`                      | `mmu.store<s32>(rs1 + imm, s32(rs2))`                                                   |
| `c.fswsp`         | `fsw`               | `imm_8  imm_x4         rs1_eq_sp`                      | `mmu.store<f32>(rs1 + imm, f32(frs2))`                                                  |
| `c.ld`            | `ld`                | `imm_8  imm_x8         rd_b3 rs1_b3`                   | `s64 t; mmu.load<s64>(rs1 + imm, t); rd = t`                                            |
| `c.sd`            | `sd`                | `imm_8  imm_x8         rs1_b3 rs2_b3`                  | `mmu.store<s64>(rs1 + imm, s64(rs2))`                                                   |
| `c.lq`            | `lq`                | `imm_9  imm_x16`                                       | `-`                                                                                     |
| `c.sq`            | `sq`                | `imm_9  imm_x16`                                       | `-`                                                                                     |
| `c.addiw`         | `addiw`             | `simm_6                rd_ne_x0 rd_eq_rs1`             | `rd = s32(s32(rs1) + imm)`                                                              |
| `c.ldsp`          | `ld`                | `imm_9  imm_x8         rd_ne_x0 rs1_eq_sp`             | `s64 t; mmu.load<s64>(rs1 + imm, t); rd = t`                                            |
| `c.sdsp`          | `sd`                | `imm_9  imm_x8         rs1_eq_sp`                      | `mmu.store<s64>(rs1 + imm, s64(rs2))`                                                   |
| `c.lqsp`          | `lq`                | `imm_10 imm_x16        rs1_eq_sp`                      | `-`                                                                                     |
| `c.sqsp`          | `sq`                | `imm_10 imm_x16        rs1_eq_sp`                      | `-`                                                                                     |
