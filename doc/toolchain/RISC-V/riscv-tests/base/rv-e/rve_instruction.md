# LOAD Instructions

| `Name` | `Format`   | `Type` | `Extension` |
|--------|------------|--------|-------------|
| `LB`   | `I_FORMAT` | `LOAD` | `RV32E`     |
| `LH`   | `I_FORMAT` | `LOAD` | `RV32E`     |
| `LW`   | `I_FORMAT` | `LOAD` | `RV32E`     |
| `LBU`  | `I_FORMAT` | `LOAD` | `RV32E`     |
| `LHU`  | `I_FORMAT` | `LOAD` | `RV32E`     |

# STORE Instructions

| `Name` | `Format`   | `Type`  | `Extension` |
|--------|------------|---------|-------------|
| `SB`   | `S_FORMAT` | `STORE` | `RV32E`     |
| `SH`   | `S_FORMAT` | `STORE` | `RV32E`     |
| `SW`   | `S_FORMAT` | `STORE` | `RV32E`     |

# SHIFT Instructions

| `Name` | `Format`   | `Type`  | `Extension` |
|--------|------------|---------|-------------|
| `SLL`  | `R_FORMAT` | `SHIFT` | `RV32E`     |
| `SLLI` | `I_FORMAT` | `SHIFT` | `RV32E`     |
| `SRL`  | `R_FORMAT` | `SHIFT` | `RV32E`     |
| `SRLI` | `I_FORMAT` | `SHIFT` | `RV32E`     |
| `SRA`  | `R_FORMAT` | `SHIFT` | `RV32E`     |
| `SRAI` | `I_FORMAT` | `SHIFT` | `RV32E`     |

# ARITHMETIC Instructions

| `Name`  | `Format`   | `Type`       | `Extension` | `Format-Extension` |
|---------|------------|--------------|-------------|--------------------|
| `ADD`   | `R_FORMAT` | `ARITHMETIC` | `RV32E`     | `-`                |
| `ADDI`  | `I_FORMAT` | `ARITHMETIC` | `RV32E`     | `-`                |
| `NOP`   | `I_FORMAT` | `ARITHMETIC` | `RV32E`     | `-`                |
| `SUB`   | `R_FORMAT` | `ARITHMETIC` | `RV32E`     | `-`                |
| `LUI`   | `U_FORMAT` | `ARITHMETIC` | `RV32E`     | `UIMM`             |
| `AUIPC` | `U_FORMAT` | `ARITHMETIC` | `RV32E`     | `UIMM`             |

# LOGICAL Instructions

| `Name` | `Format`   | `Type`    | `Extension` |
|--------|------------|-----------|-------------|
| `XOR`  | `R_FORMAT` | `LOGICAL` | `RV32E`     |
| `XORI` | `I_FORMAT` | `LOGICAL` | `RV32E`     |
| `OR`   | `R_FORMAT` | `LOGICAL` | `RV32E`     |
| `ORI`  | `I_FORMAT` | `LOGICAL` | `RV32E`     |
| `AND`  | `R_FORMAT` | `LOGICAL` | `RV32E`     |
| `ANDI` | `I_FORMAT` | `LOGICAL` | `RV32E`     |

# COMPARE Instructions

| `Name`  | `Format`   | `Type`    | `Extension` |
|---------|------------|-----------|-------------|
| `SLT`   | `R_FORMAT` | `COMPARE` | `RV32E`     |
| `SLTI`  | `I_FORMAT` | `COMPARE` | `RV32E`     |
| `SLTU`  | `R_FORMAT` | `COMPARE` | `RV32E`     |
| `SLTIU` | `I_FORMAT` | `COMPARE` | `RV32E`     |

# BRANCH Instructions

| `Name` | `Format`   | `Type`   | `Extension` |
|--------|------------|----------|-------------|
| `BEQ`  | `B_FORMAT` | `BRANCH` | `RV32E`     |
| `BNE`  | `B_FORMAT` | `BRANCH` | `RV32E`     |
| `BLT`  | `B_FORMAT` | `BRANCH` | `RV32E`     |
| `BGE`  | `B_FORMAT` | `BRANCH` | `RV32E`     |
| `BLTU` | `B_FORMAT` | `BRANCH` | `RV32E`     |
| `BGEU` | `B_FORMAT` | `BRANCH` | `RV32E`     |

# JUMP Instructions

| `Name` | `Format`   | `Type` | `Extension` |
|--------|------------|--------|-------------|
| `JAL`  | `J_FORMAT` | `JUMP` | `RV32E`     |
| `JALR` | `I_FORMAT` | `JUMP` | `RV32E`     |

# SYNCH Instructions

| `Name`       | `Format`    | `Type`  | `Extension` |
|--------------|-------------|---------|-------------|
| `FENCE`      |`  I_FORMAT` | `SYNCH` | `RV32E`     |
| `FENCE_I`    | `I_FORMAT`  | `SYNCH` | `RV32E`     |
| `SFENCE_VMA` | `R_FORMAT`  | `SYNCH` | `RV32E`     |

# SYSTEM Instructions

| `Name`   | `Format`   | `Type`      | `Extension` |
|----------|------------|-------------|-------------|
| `ECALL`  | `I_FORMAT` | `SYSTEM`    | `RV32E`     |
| `EBREAK` | `I_FORMAT` | `SYSTEM`    | `RV32E`     |
| `URET`   | `I_FORMAT` | `SYSTEM`    | `RV32E`     |
| `SRET`   | `I_FORMAT` | `SYSTEM`    | `RV32E`     |
| `MRET`   | `I_FORMAT` | `SYSTEM`    | `RV32E`     |
| `DRET`   | `I_FORMAT` | `SYSTEM`    | `RV32E`     |
| `WFI`    | `I_FORMAT` | `INTERRUPT` | `RV32E`     |

# CSR Instructions

| `Name`   | `Format`   | `Type` | `Extension` | `Format-Extension` |
|----------|------------|--------|-------------|--------------------|
| `CSRRW`  | `R_FORMAT` | `CSR`  | `RV32E`     | `UIMM`             |
| `CSRRS`  | `R_FORMAT` | `CSR`  | `RV32E`     | `UIMM`             |
| `CSRRC`  | `R_FORMAT` | `CSR`  | `RV32E`     | `UIMM`             |
| `CSRRWI` | `I_FORMAT` | `CSR`  | `RV32E`     | `UIMM`             |
| `CSRRSI` | `I_FORMAT` | `CSR`  | `RV32E`     | `UIMM`             |
| `CSRRCI` | `I_FORMAT` | `CSR`  | `RV32E`     | `UIMM`             |

# LOAD/STORE Instructions

| `Name` | `Format`   | `Type`  | `Extension` |
|--------|------------|---------|-------------|
| `LWU`  | `I_FORMAT` | `LOAD`  | `RV64E`     |
| `LD`   | `I_FORMAT` | `LOAD`  | `RV64E`     |
| `SD`   | `S_FORMAT` | `STORE` | `RV64E`     |

# SHIFT Instructions

| `Name`  | `Format`   | `Type`  | `Extension` |
|---------|------------|---------|-------------|
| `SLLW`  | `R_FORMAT` | `SHIFT` | `RV64E`     |
| `SLLIW` | `I_FORMAT` | `SHIFT` | `RV64E`     |
| `SRLW`  | `R_FORMAT` | `SHIFT` | `RV64E`     |
| `SRLIW` | `I_FORMAT` | `SHIFT` | `RV64E`     |
| `SRAW`  | `R_FORMAT` | `SHIFT` | `RV64E`     |
| `SRAIW` | `I_FORMAT` | `SHIFT` | `RV64E`     |

# ARITHMETIC Instructions

| `Name`  | `Format`   | `Type`       | `Extension` |
|---------|------------|--------------|-------------|
| `ADDW`  | `R_FORMAT` | `ARITHMETIC` | `RV64E`     |
| `ADDIW` | `I_FORMAT` | `ARITHMETIC` | `RV64E`     |
| `SUBW`  | `R_FORMAT` | `ARITHMETIC` | `RV64E`     |
