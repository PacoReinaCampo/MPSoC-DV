# LOAD Instructions

| `Name` | `Format`   | `Type` | `Extension` |
|--------|------------|--------|-------------|
| `LB`   | `I_FORMAT` | `LOAD` | `RV32I`     |
| `LH`   | `I_FORMAT` | `LOAD` | `RV32I`     |
| `LW`   | `I_FORMAT` | `LOAD` | `RV32I`     |
| `LBU`  | `I_FORMAT` | `LOAD` | `RV32I`     |
| `LHU`  | `I_FORMAT` | `LOAD` | `RV32I`     |

# STORE Instructions

| `Name` | `Format`   | `Type`  | `Extension` |
|--------|------------|---------|-------------|
| `SB`   | `S_FORMAT` | `STORE` | `RV32I`     |
| `SH`   | `S_FORMAT` | `STORE` | `RV32I`     |
| `SW`   | `S_FORMAT` | `STORE` | `RV32I`     |

# SHIFT Instructions

| `Name` | `Format`   | `Type`  | `Extension` |
|--------|------------|---------|-------------|
| `SLL`  | `R_FORMAT` | `SHIFT` | `RV32I`     |
| `SLLI` | `I_FORMAT` | `SHIFT` | `RV32I`     |
| `SRL`  | `R_FORMAT` | `SHIFT` | `RV32I`     |
| `SRLI` | `I_FORMAT` | `SHIFT` | `RV32I`     |
| `SRA`  | `R_FORMAT` | `SHIFT` | `RV32I`     |
| `SRAI` | `I_FORMAT` | `SHIFT` | `RV32I`     |

# ARITHMETIC Instructions

| `Name`  | `Format`   | `Type`       | `Extension` | `Format-Extension` |
|---------|------------|--------------|-------------|--------------------|
| `ADD`   | `R_FORMAT` | `ARITHMETIC` | `RV32I`     | `-`                |
| `ADDI`  | `I_FORMAT` | `ARITHMETIC` | `RV32I`     | `-`                |
| `NOP`   | `I_FORMAT` | `ARITHMETIC` | `RV32I`     | `-`                |
| `SUB`   | `R_FORMAT` | `ARITHMETIC` | `RV32I`     | `-`                |
| `LUI`   | `U_FORMAT` | `ARITHMETIC` | `RV32I`     | `UIMM`             |
| `AUIPC` | `U_FORMAT` | `ARITHMETIC` | `RV32I`     | `UIMM`             |

# LOGICAL Instructions

| `Name` | `Format`   | `Type`    | `Extension` |
|--------|------------|-----------|-------------|
| `XOR`  | `R_FORMAT` | `LOGICAL` | `RV32I`     |
| `XORI` | `I_FORMAT` | `LOGICAL` | `RV32I`     |
| `OR`   | `R_FORMAT` | `LOGICAL` | `RV32I`     |
| `ORI`  | `I_FORMAT` | `LOGICAL` | `RV32I`     |
| `AND`  | `R_FORMAT` | `LOGICAL` | `RV32I`     |
| `ANDI` | `I_FORMAT` | `LOGICAL` | `RV32I`     |

# COMPARE Instructions

| `Name`  | `Format`   | `Type`    | `Extension` |
|---------|------------|-----------|-------------|
| `SLT`   | `R_FORMAT` | `COMPARE` | `RV32I`     |
| `SLTI`  | `I_FORMAT` | `COMPARE` | `RV32I`     |
| `SLTU`  | `R_FORMAT` | `COMPARE` | `RV32I`     |
| `SLTIU` | `I_FORMAT` | `COMPARE` | `RV32I`     |

# BRANCH Instructions

| `Name` | `Format`   | `Type`   | `Extension` |
|--------|------------|----------|-------------|
| `BEQ`  | `B_FORMAT` | `BRANCH` | `RV32I`     |
| `BNE`  | `B_FORMAT` | `BRANCH` | `RV32I`     |
| `BLT`  | `B_FORMAT` | `BRANCH` | `RV32I`     |
| `BGE`  | `B_FORMAT` | `BRANCH` | `RV32I`     |
| `BLTU` | `B_FORMAT` | `BRANCH` | `RV32I`     |
| `BGEU` | `B_FORMAT` | `BRANCH` | `RV32I`     |

# JUMP Instructions

| `Name` | `Format`   | `Type` | `Extension` |
|--------|------------|--------|-------------|
| `JAL`  | `J_FORMAT` | `JUMP` | `RV32I`     |
| `JALR` | `I_FORMAT` | `JUMP` | `RV32I`     |

# SYNCH Instructions

| `Name`       | `Format`    | `Type`  | `Extension` |
|--------------|-------------|---------|-------------|
| `FENCE`      |`  I_FORMAT` | `SYNCH` | `RV32I`     |
| `FENCE_I`    | `I_FORMAT`  | `SYNCH` | `RV32I`     |
| `SFENCE_VMA` | `R_FORMAT`  | `SYNCH` | `RV32I`     |

# SYSTEM Instructions

| `Name`   | `Format`   | `Type`      | `Extension` |
|----------|------------|-------------|-------------|
| `ECALL`  | `I_FORMAT` | `SYSTEM`    | `RV32I`     |
| `EBREAK` | `I_FORMAT` | `SYSTEM`    | `RV32I`     |
| `URET`   | `I_FORMAT` | `SYSTEM`    | `RV32I`     |
| `SRET`   | `I_FORMAT` | `SYSTEM`    | `RV32I`     |
| `MRET`   | `I_FORMAT` | `SYSTEM`    | `RV32I`     |
| `DRET`   | `I_FORMAT` | `SYSTEM`    | `RV32I`     |
| `WFI`    | `I_FORMAT` | `INTERRUPT` | `RV32I`     |

# CSR Instructions

| `Name`   | `Format`   | `Type` | `Extension` | `Format-Extension` |
|----------|------------|--------|-------------|--------------------|
| `CSRRW`  | `R_FORMAT` | `CSR`  | `RV32I`     | `UIMM`             |
| `CSRRS`  | `R_FORMAT` | `CSR`  | `RV32I`     | `UIMM`             |
| `CSRRC`  | `R_FORMAT` | `CSR`  | `RV32I`     | `UIMM`             |
| `CSRRWI` | `I_FORMAT` | `CSR`  | `RV32I`     | `UIMM`             |
| `CSRRSI` | `I_FORMAT` | `CSR`  | `RV32I`     | `UIMM`             |
| `CSRRCI` | `I_FORMAT` | `CSR`  | `RV32I`     | `UIMM`             |

# LOAD/STORE Instructions

| `Name` | `Format`   | `Type`  | `Extension` |
|--------|------------|---------|-------------|
| `LWU`  | `I_FORMAT` | `LOAD`  | `RV64I`     |
| `LD`   | `I_FORMAT` | `LOAD`  | `RV64I`     |
| `SD`   | `S_FORMAT` | `STORE` | `RV64I`     |

# SHIFT Instructions

| `Name`  | `Format`   | `Type`  | `Extension` |
|---------|------------|---------|-------------|
| `SLLW`  | `R_FORMAT` | `SHIFT` | `RV64I`     |
| `SLLIW` | `I_FORMAT` | `SHIFT` | `RV64I`     |
| `SRLW`  | `R_FORMAT` | `SHIFT` | `RV64I`     |
| `SRLIW` | `I_FORMAT` | `SHIFT` | `RV64I`     |
| `SRAW`  | `R_FORMAT` | `SHIFT` | `RV64I`     |
| `SRAIW` | `I_FORMAT` | `SHIFT` | `RV64I`     |

# ARITHMETIC Instructions

| `Name`  | `Format`   | `Type`       | `Extension` |
|---------|------------|--------------|-------------|
| `ADDW`  | `R_FORMAT` | `ARITHMETIC` | `RV64I`     |
| `ADDIW` | `I_FORMAT` | `ARITHMETIC` | `RV64I`     |
| `SUBW`  | `R_FORMAT` | `ARITHMETIC` | `RV64I`     |
