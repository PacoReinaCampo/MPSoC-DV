# LOGICAL Instructions

| `Name`    | `Format`    | `Type`    | `Extension` | `Format-Extension` |
|-----------|-------------|-----------|-------------|--------------------|
| `GORC`    | `R_FORMAT`  | `LOGICAL` | `RV32B`     | `-`                |
| `GORCI`   | `I_FORMAT`  | `LOGICAL` | `RV32B`     | `UIMM`             |
| `CMIX`    | `R4_FORMAT` | `LOGICAL` | `RV32B`     | `-`                |
| `CMOV`    | `R4_FORMAT` | `LOGICAL` | `RV32B`     | `-`                |
| `PACK`    | `R_FORMAT`  | `LOGICAL` | `RV32B`     | `-`                |
| `PACKU`   | `R_FORMAT`  | `LOGICAL` | `RV32B`     | `-`                |
| `PACKH`   | `R_FORMAT`  | `LOGICAL` | `RV32B`     | `-`                |
| `XPERM_N` | `R_FORMAT`  | `LOGICAL` | `RV32B`     | `-`                |
| `XPERM_B` | `R_FORMAT`  | `LOGICAL` | `RV32B`     | `-`                |
| `XPERM_H` | `R_FORMAT`  | `LOGICAL` | `RV32B`     | `-`                |

# SHIFT Instructions

| `Name`  | `Format`    | `Type`  | `Extension` | `Format-Extension` |
|---------|-------------|---------|-------------|--------------------|
| `SLO`   | `R_FORMAT`  | `SHIFT` | `RV32B`     | `-`                |
| `SRO`   | `R_FORMAT`  | `SHIFT` | `RV32B`     | `-`                |
| `SLOI`  | `I_FORMAT`  | `SHIFT` | `RV32B`     | `UIMM`             |
| `SROI`  | `I_FORMAT`  | `SHIFT` | `RV32B`     | `UIMM`             |
| `GREV`  | `R_FORMAT`  | `SHIFT` | `RV32B`     | `-`                |
| `GREVI` | `I_FORMAT`  | `SHIFT` | `RV32B`     | `UIMM`             |
| `FSL`   | `R4_FORMAT` | `SHIFT` | `RV32B`     | `-`                |
| `FSR`   | `R4_FORMAT` | `SHIFT` | `RV32B`     | `-`                |
| `FSRI`  | `I_FORMAT`  | `SHIFT` | `RV32B`     | `UIMM`             |

# ARITHMETIC Instructions

| `Name`        | `Format`   | `Type`       | `Extension` | `Format-Extension` |
|---------------|------------|--------------|-------------|--------------------|
| `CRC32_B`     | `R_FORMAT` | `ARITHMETIC` | `RV32B`     | `-`                |
| `CRC32_H`     | `R_FORMAT` | `ARITHMETIC` | `RV32B`     | `-`                |
| `CRC32_W`     | `R_FORMAT` | `ARITHMETIC` | `RV32B`     | `-`                |
| `CRC32C_B`    | `R_FORMAT` | `ARITHMETIC` | `RV32B`     | `-`                |
| `CRC32C_H`    | `R_FORMAT` | `ARITHMETIC` | `RV32B`     | `-`                |
| `CRC32C_W`    | `R_FORMAT` | `ARITHMETIC` | `RV32B`     | `-`                |
| `SHFL`        | `R_FORMAT` | `ARITHMETIC` | `RV32B`     | `-`                |
| `UNSHFL`      | `R_FORMAT` | `ARITHMETIC` | `RV32B`     | `-`                |
| `SHFLI`       | `I_FORMAT` | `ARITHMETIC` | `RV32B`     | `UIMM`             |
| `UNSHFLI`     | `I_FORMAT` | `ARITHMETIC` | `RV32B`     | `UIMM`             |
| `BCOMPRESS`   | `R_FORMAT` | `ARITHMETIC` | `RV32B`     | `-`                |
| `BDECOMPRESS` | `R_FORMAT` | `ARITHMETIC` | `RV32B`     | `-`                |
| `BFP`         | `R_FORMAT` | `ARITHMETIC` | `RV32B`     | `-`                |

# ARITHMETIC Instructions

| `Name`         | `Format`   | `Type`       | `Extension` |
|----------------|------------|--------------|-------------|
| `BMATOR`       | `R_FORMAT` | `ARITHMETIC` | `RV64B`     |
| `BMATXOR`      | `R_FORMAT` | `ARITHMETIC` | `RV64B`     |
| `BMATFLIP`     | `R_FORMAT` | `ARITHMETIC` | `RV64B`     |
| `CRC32_D`      | `R_FORMAT` | `ARITHMETIC` | `RV64B`     |
| `CRC32C_D`     | `R_FORMAT` | `ARITHMETIC` | `RV64B`     |
| `SHFLW`        | `R_FORMAT` | `ARITHMETIC` | `RV64B`     |
| `UNSHFLW`      | `R_FORMAT` | `ARITHMETIC` | `RV64B`     |
| `BCOMPRESSW`   | `R_FORMAT` | `ARITHMETIC` | `RV64B`     |
| `BDECOMPRESSW` | `R_FORMAT` | `ARITHMETIC` | `RV64B`     |
| `BFPW`         | `R_FORMAT` | `ARITHMETIC` | `RV64B`     |

# SHIFT Instructions

| `Name`   | `Format`    | `Type`  | `Extension` | `Format-Extension` |
|----------|-------------|---------|-------------|--------------------|
| `SLOW`   | `R_FORMAT`  | `SHIFT` | `RV64B`     | `-`                |
| `SROW`   | `R_FORMAT`  | `SHIFT` | `RV64B`     | `-`                |
| `SLOIW`  | `I_FORMAT`  | `SHIFT` | `RV64B`     | `UIMM`             |
| `SROIW`  | `I_FORMAT`  | `SHIFT` | `RV64B`     | `UIMM`             |
| `GREVW`  | `R_FORMAT`  | `SHIFT` | `RV64B`     | `-`                |
| `GREVIW` | `I_FORMAT`  | `SHIFT` | `RV64B`     | `UIMM`             |
| `FSLW`   | `R4_FORMAT` | `SHIFT` | `RV64B`     | `-`                |
| `FSRW`   | `R4_FORMAT` | `SHIFT` | `RV64B`     | `-`                |
| `FSRIW`  | `I_FORMAT`  | `SHIFT` | `RV64B`     | `UIMM`             |

# LOGICAL Instructions

| `Name`    | `Format`   | `Type`    | `Extension` | `Format-Extension` |
|-----------|------------|-----------|-------------|--------------------|
| `GORCW`   | `R_FORMAT` | `LOGICAL` | `RV64B`     | `-`                |
| `GORCIW`  | `I_FORMAT` | `LOGICAL` | `RV64B`     | `UIMM`             |
| `PACKW`   | `R_FORMAT` | `LOGICAL` | `RV64B`     | `-`                |
| `PACKUW`  | `R_FORMAT` | `LOGICAL` | `RV64B`     | `-`                |
| `XPERM_W` | `R_FORMAT` | `LOGICAL` | `RV64B`     | `-`                |
