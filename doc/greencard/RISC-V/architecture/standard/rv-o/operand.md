## OPERAND BIT ENCODINGS

| **Argument** | **Bit Encoding**              | **Type** | **Description** | **Note**                                                                      |
|:-------------|:------------------------------|:---------|:----------------|:------------------------------------------------------------------------------|
| `rd`         | `11:7`                        | `ireg`   | `rd`            | `Integer destination register index`                                          |
| `rs1`        | `19:15`                       | `ireg`   | `rs1`           | `First integer source register index`                                         |
| `rs2`        | `24:20`                       | `ireg`   | `rs2`           | `Second integer source register index`                                        |
| `rs3`        | `31:27`                       | `ireg`   | `rs3`           | `Third integer source register field in repository notation`                  |
| `frd`        | `11:7`                        | `freg`   | `frd`           | `Floating-point destination register index`                                   |
| `frs1`       | `19:15`                       | `freg`   | `frs1`          | `First floating-point source register index`                                  |
| `frs2`       | `24:20`                       | `freg`   | `frs2`          | `Second floating-point source register index`                                 |
| `frs3`       | `31:27`                       | `freg`   | `frs3`          | `Third floating-point source register index for fused operations`             |
| `aq`         | `26`                          | `arg`    | `aq`            | `Acquire ordering for subsequent accesses within the accessed address domain` |
| `rl`         | `25`                          | `arg`    | `rl`            | `Release ordering for prior accesses within the accessed address domain`      |
| `pred`       | `27:24`                       | `arg`    | `pred`          | `FENCE predecessor mask selecting input, output, read, and write accesses`    |
| `succ`       | `23:20`                       | `arg`    | `succ`          | `FENCE successor mask selecting input, output, read, and write accesses`      |
| `rm`         | `14:12`                       | `arg`    | `rm`            | `Floating-point rounding selector; 111 uses the dynamic frm setting`          |
| `imm20`      | `31:12[31:12]`                | `simm`   | `simm`          | `Upper immediate; lower twelve bits are zero`                                 |
| `oimm20`     | `31:12[31:12]`                | `offset` | `simm`          | `PC-relative upper immediate; lower twelve bits are zero`                     |
| `jimm20`     | `31:12[20-10:1-11-19:12]`     | `offset` | `simm`          | `Signed PC-relative jump offset with an implicit zero low bit`                |
| `imm12`      | `31:20[11:0]`                 | `simm`   | `simm`          | `Signed twelve-bit immediate, sign-extended to XLEN`                          |
| `oimm12`     | `31:20[11:0]`                 | `offset` | `simm`          | `Signed twelve-bit offset added to the base register`                         |
| `csr12`      | `31:20[11:0]`                 | `uimm`   | `csr`           | `Unsigned twelve-bit control and status register address`                     |
| `simm12`     | `31:25[11:5],11:7[4:0]`       | `offset` | `simm`          | `Signed store offset split across two instruction fields`                     |
| `sbimm12`    | `31:25[12-10:5],11:7[4:1-11]` | `offset` | `simm`          | `Signed PC-relative branch offset with an implicit zero low bit`              |
| `zimm`       | `19:15[4:0]`                  | `uimm`   | `uimm`          | `Unsigned five-bit immediate for CSR operations`                              |
| `shamt5`     | `24:20[4:0]`                  | `uimm`   | `shamt`         | `Unsigned shift count, 0–31, for RV32 or RV64 word operations`                |
| `shamt6`     | `25:20[5:0]`                  | `uimm`   | `shamt`         | `Unsigned shift count, 0–63, for RV64 full-width operations`                  |
| `shamt7`     | `26:20[6:0]`                  | `uimm`   | `shamt`         | `Historical RV128 shift count, 0–127; excluded from the current baseline`     |
| `crd0`       | `12`                          | `creg`   | `rd''`          | `Selects implicit jump destination: zero selects x0, one x1`                  |
| `crdq`       | `4:2`                         | `creg`   | `rd'`           | `Compressed destination register index selecting x8 through x15`              |
| `crs1q`      | `9:7`                         | `creg`   | `rs1'`          | `Compressed first source register index selecting x8 through x15`             |
| `crs1rdq`    | `9:7`                         | `creg`   | `rs1'/rd'`      | `Shared compressed source and destination selecting x8 through x15`           |
| `crs2q`      | `4:2`                         | `creg`   | `rs2'`          | `Compressed second source register index selecting x8 through x15`            |
| `crd`        | `11:7`                        | `ireg`   | `rd`            | `Compressed integer destination using the full register index`                |
| `crs1`       | `11:7`                        | `ireg`   | `rs1`           | `Compressed integer source using the full register index`                     |
| `crs1rd`     | `11:7`                        | `ireg`   | `rs1/rd`        | `Shared compressed integer source and destination register index`             |
| `crs2`       | `6:2`                         | `ireg`   | `rs2`           | `Compressed second integer source using the full register index`              |
| `cfrdq`      | `4:2`                         | `creg`   | `frd'`          | `Compressed floating-point destination selecting f8 through f15`              |
| `cfrs2q`     | `4:2`                         | `creg`   | `frs2'`         | `Compressed floating-point source selecting f8 through f15`                   |
| `cfrs2`      | `6:2`                         | `freg`   | `frs2`          | `Compressed floating-point source using the full register index`              |
| `cfrd`       | `11:7`                        | `freg`   | `frd`           | `Compressed floating-point destination using the full register index`         |
| `cimmsh5`    | `6:2[4:0]`                    | `uimm`   | `nzuimm`        | `Five-bit compressed shift amount; zero denotes a HINT`                       |
| `cimmsh6`    | `12[5],6:2[4:0]`              | `uimm`   | `nzuimm`        | `Six-bit compressed shift amount; legality depends on XLEN`                   |
| `cimmi`      | `12[5],6:2[4:0]`              | `simm`   | `simm`          | `Signed six-bit immediate for compressed arithmetic`                          |
| `cnzimmi`    | `12[5],6:2[4:0]`              | `simm`   | `nzsimm`        | `Nonzero signed six-bit immediate for compressed arithmetic`                  |
| `cimmui`     | `12[17],6:2[16:12]`           | `simm`   | `nzsimm`        | `Signed compressed upper immediate with twelve implicit zero bits`            |
| `cimmlwsp`   | `12[5],6:2[4:2-7:6]`          | `uimm`   | `uimm`          | `Unsigned stack-relative word load offset, multiple of four`                  |
| `cimmldsp`   | `12[5],6:2[4:3-8:6]`          | `uimm`   | `uimm`          | `Unsigned stack-relative doubleword load offset, multiple of eight`           |
| `cimmlqsp`   | `12[5],6:2[4-9:6]`            | `uimm`   | `uimm`          | `Historical quadword stack load offset, multiple of sixteen`                  |
| `cimm16sp`   | `12[9],6:2[4-6-8:7-5]`        | `simm`   | `nzsimm`        | `Nonzero signed stack adjustment, multiple of sixteen`                        |
| `cimmj`      | `12:2[11-4-9:8-10-6-7-3:1-5]` | `simm`   | `simm`          | `Signed compressed jump offset, PC-relative, with implicit low zero bit`      |
| `cimmb`      | `12:10[8-4:3],6:2[7:62:1-5]`  | `simm`   | `simm`          | `Signed compressed branch offset, PC-relative, with implicit low zero bit`    |
| `cimmswsp`   | `12:7[5:2-7:6]`               | `uimm`   | `uimm`          | `Unsigned stack-relative word store offset, multiple of four`                 |
| `cimmsdsp`   | `12:7[5:3-8:6]`               | `uimm`   | `uimm`          | `Unsigned stack-relative doubleword store offset, multiple of eight`          |
| `cimmsqsp`   | `12:7[5:4-9:6]`               | `uimm`   | `uimm`          | `Historical quadword stack store offset, multiple of sixteen`                 |
| `cimm4spn`   | `12:5[5:4-9:6-2-3]`           | `uimm`   | `nzuimm`        | `Nonzero unsigned stack-pointer addition immediate, multiple of four`         |
| `cimmw`      | `12:10[5:3],6:5[2-6]`         | `uimm`   | `uimm`          | `Unsigned compressed word memory offset, multiple of four`                    |
| `cimmd`      | `12:10[5:3],6:5[7:6]`         | `uimm`   | `uimm`          | `Unsigned compressed doubleword memory offset, multiple of eight`             |
| `cimmq`      | `12:10[5:4-8],6:5[7:6]`       | `uimm`   | `uimm`          | `Historical compressed quadword memory offset, multiple of sixteen`           |

:Operand Bit Encodings