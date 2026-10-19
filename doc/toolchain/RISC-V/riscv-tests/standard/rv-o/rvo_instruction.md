# LOAD Instructions

| `Name` | `Format`   | `Type` | `Extension` |
|--------|------------|--------|-------------|
| `LB`   | `I_FORMAT` | `LOAD` | `RV32O`     |
| `LH`   | `I_FORMAT` | `LOAD` | `RV32O`     |
| `LW`   | `I_FORMAT` | `LOAD` | `RV32O`     |
| `LBU`  | `I_FORMAT` | `LOAD` | `RV32O`     |
| `LHU`  | `I_FORMAT` | `LOAD` | `RV32O`     |

# STORE Instructions

| `Name` | `Format`   | `Type`  | `Extension` |
|--------|------------|---------|-------------|
| `SB`   | `S_FORMAT` | `STORE` | `RV32O`     |
| `SH`   | `S_FORMAT` | `STORE` | `RV32O`     |
| `SW`   | `S_FORMAT` | `STORE` | `RV32O`     |

# SHIFT Instructions

| `Name` | `Format`   | `Type`  | `Extension` |
|--------|------------|---------|-------------|
| `SLL`  | `R_FORMAT` | `SHIFT` | `RV32O`     |
| `SLLI` | `I_FORMAT` | `SHIFT` | `RV32O`     |
| `SRL`  | `R_FORMAT` | `SHIFT` | `RV32O`     |
| `SRLI` | `I_FORMAT` | `SHIFT` | `RV32O`     |
| `SRA`  | `R_FORMAT` | `SHIFT` | `RV32O`     |
| `SRAI` | `I_FORMAT` | `SHIFT` | `RV32O`     |

# ARITHMETIC Instructions

| `Name`  | `Format`   | `Type`       | `Extension` | `Format-Extension` |
|---------|------------|--------------|-------------|--------------------|
| `ADD`   | `R_FORMAT` | `ARITHMETIC` | `RV32O`     | `-`                |
| `ADDI`  | `I_FORMAT` | `ARITHMETIC` | `RV32O`     | `-`                |
| `NOP`   | `I_FORMAT` | `ARITHMETIC` | `RV32O`     | `-`                |
| `SUB`   | `R_FORMAT` | `ARITHMETIC` | `RV32O`     | `-`                |
| `LUI`   | `U_FORMAT` | `ARITHMETIC` | `RV32O`     | `UIMM`             |
| `AUIPC` | `U_FORMAT` | `ARITHMETIC` | `RV32O`     | `UIMM`             |

# LOGICAL Instructions

| `Name` | `Format`   | `Type`    | `Extension` |
|--------|------------|-----------|-------------|
| `XOR`  | `R_FORMAT` | `LOGICAL` | `RV32O`     |
| `XORI` | `I_FORMAT` | `LOGICAL` | `RV32O`     |
| `OR`   | `R_FORMAT` | `LOGICAL` | `RV32O`     |
| `ORI`  | `I_FORMAT` | `LOGICAL` | `RV32O`     |
| `AND`  | `R_FORMAT` | `LOGICAL` | `RV32O`     |
| `ANDI` | `I_FORMAT` | `LOGICAL` | `RV32O`     |

# COMPARE Instructions

| `Name`  | `Format`   | `Type`    | `Extension` |
|---------|------------|-----------|-------------|
| `SLT`   | `R_FORMAT` | `COMPARE` | `RV32O`     |
| `SLTI`  | `I_FORMAT` | `COMPARE` | `RV32O`     |
| `SLTU`  | `R_FORMAT` | `COMPARE` | `RV32O`     |
| `SLTIU` | `I_FORMAT` | `COMPARE` | `RV32O`     |

# BRANCH Instructions

| `Name` | `Format`   | `Type`   | `Extension` |
|--------|------------|----------|-------------|
| `BEQ`  | `B_FORMAT` | `BRANCH` | `RV32O`     |
| `BNE`  | `B_FORMAT` | `BRANCH` | `RV32O`     |
| `BLT`  | `B_FORMAT` | `BRANCH` | `RV32O`     |
| `BGE`  | `B_FORMAT` | `BRANCH` | `RV32O`     |
| `BLTU` | `B_FORMAT` | `BRANCH` | `RV32O`     |
| `BGEU` | `B_FORMAT` | `BRANCH` | `RV32O`     |

# JUMP Instructions

| `Name` | `Format`   | `Type` | `Extension` |
|--------|------------|--------|-------------|
| `JAL`  | `J_FORMAT` | `JUMP` | `RV32O`     |
| `JALR` | `I_FORMAT` | `JUMP` | `RV32O`     |

# SYNCH Instructions

| `Name`       | `Format`    | `Type`  | `Extension` |
|--------------|-------------|---------|-------------|
| `FENCE`      |`  I_FORMAT` | `SYNCH` | `RV32O`     |
| `FENCE_I`    | `I_FORMAT`  | `SYNCH` | `RV32O`     |
| `SFENCE_VMA` | `R_FORMAT`  | `SYNCH` | `RV32O`     |

# SYSTEM Instructions

| `Name`   | `Format`   | `Type`      | `Extension` |
|----------|------------|-------------|-------------|
| `ECALL`  | `I_FORMAT` | `SYSTEM`    | `RV32O`     |
| `EBREAK` | `I_FORMAT` | `SYSTEM`    | `RV32O`     |
| `URET`   | `I_FORMAT` | `SYSTEM`    | `RV32O`     |
| `SRET`   | `I_FORMAT` | `SYSTEM`    | `RV32O`     |
| `MRET`   | `I_FORMAT` | `SYSTEM`    | `RV32O`     |
| `DRET`   | `I_FORMAT` | `SYSTEM`    | `RV32O`     |
| `WFI`    | `I_FORMAT` | `INTERRUPT` | `RV32O`     |

# CSR Instructions

| `Name`   | `Format`   | `Type` | `Extension` | `Format-Extension` |
|----------|------------|--------|-------------|--------------------|
| `CSRRW`  | `R_FORMAT` | `CSR`  | `RV32O`     | `UIMM`             |
| `CSRRS`  | `R_FORMAT` | `CSR`  | `RV32O`     | `UIMM`             |
| `CSRRC`  | `R_FORMAT` | `CSR`  | `RV32O`     | `UIMM`             |
| `CSRRWI` | `I_FORMAT` | `CSR`  | `RV32O`     | `UIMM`             |
| `CSRRSI` | `I_FORMAT` | `CSR`  | `RV32O`     | `UIMM`             |
| `CSRRCI` | `I_FORMAT` | `CSR`  | `RV32O`     | `UIMM`             |

# LOAD/STORE Instructions

| `Name` | `Format`   | `Type`  | `Extension` |
|--------|------------|---------|-------------|
| `LWU`  | `I_FORMAT` | `LOAD`  | `RV64O`     |
| `LD`   | `I_FORMAT` | `LOAD`  | `RV64O`     |
| `SD`   | `S_FORMAT` | `STORE` | `RV64O`     |

# SHIFT Instructions

| `Name`  | `Format`   | `Type`  | `Extension` |
|---------|------------|---------|-------------|
| `SLLW`  | `R_FORMAT` | `SHIFT` | `RV64O`     |
| `SLLIW` | `I_FORMAT` | `SHIFT` | `RV64O`     |
| `SRLW`  | `R_FORMAT` | `SHIFT` | `RV64O`     |
| `SRLIW` | `I_FORMAT` | `SHIFT` | `RV64O`     |
| `SRAW`  | `R_FORMAT` | `SHIFT` | `RV64O`     |
| `SRAIW` | `I_FORMAT` | `SHIFT` | `RV64O`     |

# ARITHMETIC Instructions

| `Name`  | `Format`   | `Type`       | `Extension` |
|---------|------------|--------------|-------------|
| `ADDW`  | `R_FORMAT` | `ARITHMETIC` | `RV64O`     |
| `ADDIW` | `I_FORMAT` | `ARITHMETIC` | `RV64O`     |
| `SUBW`  | `R_FORMAT` | `ARITHMETIC` | `RV64O`     |
