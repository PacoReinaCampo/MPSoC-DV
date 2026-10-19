## OPERAND BIT ENCODINGS

RISC-V instructions use specific encodings for operands and fields within instructions:

- **Register Encoding**: Registers are typically encoded by their numerical index within the register file.
- **Immediate Encoding**: Immediate values are encoded directly within instruction fields, often sign-extended or zero-extended to fit the required bit length.
- **Opcode Encoding**: The opcode field determines the general operation or category of an instruction, facilitating instruction decoding.

Format of a line in the table:

`<argument> <bit encoding> <type> <description> <note>`

`<bit encoding> contains a comma list of gather[scatter] bits`

`<type> is one of arg, creg, ireg, freg, offset, simm, uimm`

| **argument** | **bit encoding**              | **type** | **description** | **note**               |
|:-------------|:------------------------------|:---------|:----------------|:-----------------------|
| `rd`         | `11:7`                        | `ireg`   | `rd`            | `-`                    |
| `rs1`        | `19:15`                       | `ireg`   | `rs1`           | `-`                    |
| `rs2`        | `24:20`                       | `ireg`   | `rs2`           | `-`                    |
| `rs3`        | `31:27`                       | `ireg`   | `rs3`           | `-`                    |
| `frd`        | `11:7`                        | `freg`   | `frd`           | `-`                    |
| `frs1`       | `19:15`                       | `freg`   | `frs1`          | `-`                    |
| `frs2`       | `24:20`                       | `freg`   | `frs2`          | `-`                    |
| `frs3`       | `31:27`                       | `freg`   | `frs3`          | `-`                    |
| `aq`         | `26`                          | `arg`    | `aq`            | `Acquire`              |
| `rl`         | `25`                          | `arg`    | `rl`            | `Release`              |
| `pred`       | `27:24`                       | `arg`    | `pred`          | `Predecessor`          |
| `succ`       | `23:20`                       | `arg`    | `succ`          | `Successor`            |
| `rm`         | `14:12`                       | `arg`    | `rm`            | `Rounding Mode`        |
| `imm20`      | `31:12[31:12]`                | `simm`   | `simm`          | `-`                    |
| `oimm20`     | `31:12[31:12]`                | `offset` | `simm`          | `-`                    |
| `jimm20`     | `31:12[20-10:1-11-19:12]`     | `offset` | `simm`          | `PC relative jump`     |
| `imm12`      | `31:20[11:0]`                 | `simm`   | `simm`          | `-`                    |
| `oimm12`     | `31:20[11:0]`                 | `offset` | `simm`          | `-`                    |
| `csr12`      | `31:20[11:0]`                 | `uimm`   | `csr`           | `-`                    |
| `simm12`     | `31:25[11:5],11:7[4:0]`       | `offset` | `simm`          | `-`                    |
| `sbimm12`    | `31:25[12-10:5],11:7[4:1-11]` | `offset` | `simm`          | `PC relative branch`   |
| `zimm`       | `19:15[4:0]`                  | `uimm`   | `uimm`          | `-`                    |
| `shamt5`     | `24:20[4:0]`                  | `uimm`   | `shamt`         | `32-bit shift amount`  |
| `shamt6`     | `25:20[5:0]`                  | `uimm`   | `shamt`         | `64-bit shift amount`  |
| `shamt7`     | `26:20[6:0]`                  | `uimm`   | `shamt`         | `128-bit shift amount` |
| `crd0`       | `12`                          | `creg`   | `rd''`          | `-`                    |
| `crdq`       | `4:2`                         | `creg`   | `rd'`           | `-`                    |
| `crs1q`      | `9:7`                         | `creg`   | `rs1'`          | `-`                    |
| `crs1rdq`    | `9:7`                         | `creg`   | `rs1'/rd'`      | `-`                    |
| `crs2q`      | `4:2`                         | `creg`   | `rs2'`          | `-`                    |
| `crd`        | `11:7`                        | `ireg`   | `rd`            | `-`                    |
| `crs1`       | `11:7`                        | `ireg`   | `rs1`           | `-`                    |
| `crs1rd`     | `11:7`                        | `ireg`   | `rs1/rd`        | `-`                    |
| `crs2`       | `6:2`                         | `ireg`   | `rs2`           | `-`                    |
| `cfrdq`      | `4:2`                         | `creg`   | `frd'`          | `-`                    |
| `cfrs2q`     | `4:2`                         | `creg`   | `frs2'`         | `-`                    |
| `cfrs2`      | `6:2`                         | `freg`   | `frs2`          | `-`                    |
| `cfrd`       | `11:7`                        | `freg`   | `frd`           | `-`                    |
| `cimmsh5`    | `6:2[4:0]`                    | `uimm`   | `nzuimm`        | `-`                    |
| `cimmsh6`    | `12[5],6:2[4:0]`              | `uimm`   | `nzuimm`        | `-`                    |
| `cimmi`      | `12[5],6:2[4:0]`              | `simm`   | `simm`          | `-`                    |
| `cnzimmi`    | `12[5],6:2[4:0]`              | `simm`   | `nzsimm`        | `-`                    |
| `cimmui`     | `12[17],6:2[16:12]`           | `simm`   | `nzsimm`        | `-`                    |
| `cimmlwsp`   | `12[5],6:2[4:2-7:6]`          | `uimm`   | `uimm`          | `-`                    |
| `cimmldsp`   | `12[5],6:2[4:3-8:6]`          | `uimm`   | `uimm`          | `-`                    |
| `cimmlqsp`   | `12[5],6:2[4-9:6]`            | `uimm`   | `uimm`          | `-`                    |
| `cimm16sp`   | `12[9],6:2[4-6-8:7-5]`        | `simm`   | `nzsimm`        | `-`                    |
| `cimmj`      | `12:2[11-4-9:8-10-6-7-3:1-5]` | `simm`   | `simm`          | `PC relative jump`     |
| `cimmb`      | `12:10[8-4:3],6:2[7:62:1-5]`  | `simm`   | `simm`          | `PC relative branch`   |
| `cimmswsp`   | `12:7[5:2-7:6]`               | `uimm`   | `uimm`          | `-`                    |
| `cimmsdsp`   | `12:7[5:3-8:6]`               | `uimm`   | `uimm`          | `-`                    |
| `cimmsqsp`   | `12:7[5:4-9:6]`               | `uimm`   | `uimm`          | `-`                    |
| `cimm4spn`   | `12:5[5:4-9:6-2-3]`           | `uimm`   | `nzuimm`        | `-`                    |
| `cimmw`      | `12:10[5:3],6:5[2-6]`         | `uimm`   | `uimm`          | `-`                    |
| `cimmd`      | `12:10[5:3],6:5[7:6]`         | `uimm`   | `uimm`          | `-`                    |
| `cimmq`      | `12:10[5:4-8],6:5[7:6]`       | `uimm`   | `uimm`          | `-`                    |

:Operand Bit Encodings

The operand bit encodings table provides detailed information on the bit-level representations and formats of operands used in RISC-V instructions.

These encodings are designed to be efficient in terms of both instruction size and decoding complexity, aligning with RISC-V's goal of simplicity and versatility in various computing environments.
