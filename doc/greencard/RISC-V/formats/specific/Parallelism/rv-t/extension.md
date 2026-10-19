## EXTENDED INSTRUCTION

RISC-V also includes a extended instruction set (RVO) to further enhance code density without sacrificing performance. Extended instructions are 64 bits long and provide a subset of frequently used operations from the base ISA. They are seamlessly integrated with the standard instruction set, allowing compilers and assemblers to automatically select between extended and unextended instructions based on optimization goals and target architecture support.

Format of a line in the table:

`<extended opcode> <unextended opcode> [<constraint name> ...]`

`<constraint> is one of imm_6, imm_7, imm_8, imm_9, imm_10, imm_12, imm_18, imm_nz, imm_x2, imm_x4, imm_x8, rd_b3, rs1_b3, rs2_b3, rs1_eq_sp, rd_eq_x0, rs1_eq_x0, rs2_eq_x0, rd_ne_x0, rs1_ne_x0, rs2_ne_x0, rd_eq_rs1, rd_eq_ra, rd_ne_x0_x2, rd_eq_sp`

| **u-opcode** | **unextended-opcode**          | **constraint name**             |
|:-------------|:-------------------------------|:--------------------------------|
| `o.addi4spn` | `addi   imm_10 imm_x4 imm_nz`  | `rd_b3 rs1_eq_sp`               |
| `o.fld`      | `fld    imm_8  imm_x8`         | `rd_b3 rs1_b3`                  |
| `o.lw`       | `lw     imm_7  imm_x4`         | `rd_b3 rs1_b3`                  |
| `o.flw`      | `flw    imm_7  imm_x4`         | `rd_b3 rs1_b3`                  |
| `o.fsd`      | `fsd    imm_8  imm_x8`         | `rs1_b3 rs2_b3`                 |
| `o.sw`       | `sw     imm_7  imm_x4`         | `rs1_b3 rs2_b3`                 |
| `o.fsw`      | `fsw    imm_7  imm_x4`         | `rs1_b3 rs2_b3`                 |
| `o.nop`      | `addi`                         | `rd_eq_x0 rs1_eq_x0 rs2_eq_x0`  |
| `o.addi`     | `addi   simm_6 imm_nz`         | `rd_ne_x0 rd_eq_rs1`            |
| `o.jal`      | `jal    imm_12 imm_x2`         | `rd_eq_ra`                      |
| `o.li`       | `addi   simm_6`                | `rd_ne_x0 rs1_eq_x0`            |
| `o.lui`      | `lui    imm_18 imm_nz`         | `rd_ne_x0_x2`                   |
| `o.addi16sp` | `addi   simm_10 imm_x4 imm_nz` | `rd_eq_sp rs1_eq_sp`            |
| `o.srli`     | `srli   imm_5 imm_nz`          | `rd_eq_rs1 rd_b3 rs1_b3`        |
| `o.srai`     | `srai   imm_5 imm_nz`          | `rd_eq_rs1 rd_b3 rs1_b3`        |
| `o.andi`     | `andi   imm_5 imm_nz`          | `rd_eq_rs1 rd_b3 rs1_b3`        |
| `o.sub`      | `sub`                          | `rd_eq_rs1 rd_b3 rs1_b3 rs2_b3` |
| `o.xor`      | `xor`                          | `rd_eq_rs1 rd_b3 rs1_b3 rs2_b3` |
| `o.or`       | `or`                           | `rd_eq_rs1 rd_b3 rs1_b3 rs2_b3` |
| `o.and`      | `and`                          | `rd_eq_rs1 rd_b3 rs1_b3 rs2_b3` |
| `o.subw`     | `subw`                         | `rd_eq_rs1 rd_b3 rs1_b3 rs2_b3` |
| `o.addw`     | `addw`                         | `rd_eq_rs1 rd_b3 rs1_b3 rs2_b3` |
| `o.j`        | `jal    simm_12 imm_x2`        | `rd_eq_x0`                      |
| `o.beqz`     | `beq    simm_9 imm_x2`         | `rs1_b3 rs2_eq_x0`              |
| `o.bnez`     | `bne    simm_9 imm_x2`         | `rs1_b3 rs2_eq_x0`              |
| `o.slli`     | `slli   imm_5 imm_nz`          | `rd_ne_x0 rd_eq_rs1`            |
| `o.fldsp`    | `fld    imm_9  imm_x8`         | `rs1_eq_sp`                     |
| `o.lwsp`     | `lw     imm_8  imm_x4`         | `rd_ne_x0 rs1_eq_sp`            |
| `o.flwsp`    | `flw    imm_8  imm_x4`         | `rs1_eq_sp`                     |
| `o.jr`       | `jalr   imm_eq_zero`           | `rd_eq_x0 rs1_ne_x0`            |
| `o.mv`       | `addi   imm_eq_zero`           | `rd_ne_x0`                      |
| `o.ebreak`   | `ebreak`                       |                                 |
| `o.jalr`     | `jalr   imm_eq_zero`           | `rd_eq_ra rs1_ne_x0`            |
| `o.add`      | `add`                          | `rd_eq_rs1 rd_ne_x0 rs2_ne_x0`  |
| `o.fsdsp`    | `fsd    imm_9  imm_x8`         | `rs1_eq_sp`                     |
| `o.swsp`     | `sw     imm_8  imm_x4`         | `rs1_eq_sp`                     |
| `o.fswsp`    | `fsw    imm_8  imm_x4`         | `rs1_eq_sp`                     |
| `o.ld`       | `ld     imm_8  imm_x8`         | `rd_b3 rs1_b3`                  |
| `o.sd`       | `sd     imm_8  imm_x8`         | `rs1_b3 rs2_b3`                 |

:RV32O - "Extended Instruction"

| **o-opcode** | **unextended-opcode**   | **constraint name**  |
|:-------------|:------------------------|:---------------------|
| `o.lq`       | `lq     imm_9  imm_x16` | `-`                  |
| `o.sq`       | `sq     imm_9  imm_x16` | `-`                  |
| `o.addiw`    | `addiw  simm_6`         | `rd_ne_x0 rd_eq_rs1` |
| `o.ldsp`     | `ld     imm_9  imm_x8`  | `rd_ne_x0 rs1_eq_sp` |
| `o.sdsp`     | `sd     imm_9  imm_x8`  | `rs1_eq_sp`          |
| `o.lqsp`     | `lq     imm_10 imm_x16` | `rs1_eq_sp`          |
| `o.sqsp`     | `sq     imm_10 imm_x16` | `rs1_eq_sp`          |

:RV64O - "Extended Instruction"

The extended instruction table lists specific examples and encodings of instructions that are available in extended form, demonstrating how these instructions are encoded and decoded within the RISC-V architecture.
