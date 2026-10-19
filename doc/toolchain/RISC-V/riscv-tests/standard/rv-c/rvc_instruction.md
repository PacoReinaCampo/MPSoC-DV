| `Name`       | `Format`     | `Type`       | `Extension` |
|--------------|--------------|--------------|-------------|
| `C_LW`       | `CL_FORMAT`  | `LOAD`       | `RV32C`     |
| `C_SW`       | `CS_FORMAT`  | `STORE`      | `RV32C`     |
| `C_LWSP`     | `CI_FORMAT`  | `LOAD`       | `RV32C`     |
| `C_SWSP`     | `CSS_FORMAT` | `STORE`      | `RV32C`     |
| `C_ADDI4SPN` | `CIW_FORMAT` | `ARITHMETIC` | `RV32C`     |
| `C_ADDI`     | `CI_FORMAT`  | `ARITHMETIC` | `RV32C`     |
| `C_ADDI16SP` | `CI_FORMAT`  | `ARITHMETIC` | `RV32C`     |
| `C_LI`       | `CI_FORMAT`  | `ARITHMETIC` | `RV32C`     |
| `C_LUI`      | `CI_FORMAT`  | `ARITHMETIC` | `RV32C`     |
| `C_SUB`      | `CA_FORMAT`  | `ARITHMETIC` | `RV32C`     |
| `C_ADD`      | `CR_FORMAT`  | `ARITHMETIC` | `RV32C`     |
| `C_NOP`      | `CI_FORMAT`  | `ARITHMETIC` | `RV32C`     |
| `C_MV`       | `CR_FORMAT`  | `ARITHMETIC` | `RV32C`     |
| `C_ANDI`     | `CB_FORMAT`  | `LOGICAL`    | `RV32C`     |
| `C_XOR`      | `CA_FORMAT`  | `LOGICAL`    | `RV32C`     |
| `C_OR`       | `CA_FORMAT`  | `LOGICAL`    | `RV32C`     |
| `C_AND`      | `CA_FORMAT`  | `LOGICAL`    | `RV32C`     |
| `C_BEQZ`     | `CB_FORMAT`  | `BRANCH`     | `RV32C`     |
| `C_BNEZ`     | `CB_FORMAT`  | `BRANCH`     | `RV32C`     |
| `C_SRLI`     | `CB_FORMAT`  | `SHIFT`      | `RV32C`     |
| `C_SRAI`     | `CB_FORMAT`  | `SHIFT`      | `RV32C`     |
| `C_SLLI`     | `CI_FORMAT`  | `SHIFT`      | `RV32C`     |
| `C_J`        | `CJ_FORMAT`  | `JUMP`       | `RV32C`     |
| `C_JAL`      | `CJ_FORMAT`  | `JUMP`       | `RV32C`     |
| `C_JR`       | `CR_FORMAT`  | `JUMP`       | `RV32C`     |
| `C_JALR`     | `CR_FORMAT`  | `JUMP`       | `RV32C`     |
| `C_EBREAK`   | `CI_FORMAT`  | `SYSTEM`     | `RV32C`     |

| `Name`    | `Format`     | `Type`       | `Extension` |
|-----------|--------------|--------------|-------------|
| `C_ADDIW` | `CI_FORMAT`  | `ARITHMETIC` | `RV64C`     |
| `C_SUBW`  | `CA_FORMAT`  | `ARITHMETIC` | `RV64C`     |
| `C_ADDW`  | `CA_FORMAT`  | `ARITHMETIC` | `RV64C`     |
| `C_LD`    | `CL_FORMAT`  | `LOAD`       | `RV64C`     |
| `C_SD`    | `CS_FORMAT`  | `STORE`      | `RV64C`     |
| `C_LDSP`  | `CI_FORMAT`  | `LOAD`       | `RV64C`     |
| `C_SDSP`  | `CSS_FORMAT` | `STORE`      | `RV64C`     |

| `Name`     | `Format`     | `Type`  | `Extension` |
|------------|--------------|---------|-------------|
| `C_SRLI64` | `CB_FORMAT`  | `SHIFT` | `RV128C`    |
| `C_SRAI64` | `CB_FORMAT`  | `SHIFT` | `RV128C`    |
| `C_SLLI64` | `CI_FORMAT`  | `SHIFT` | `RV128C`    |
| `C_LQ`     | `CL_FORMAT`  | `LOAD`  | `RV32DC`    |
| `C_SQ`     | `CS_FORMAT`  | `STORE` | `RV32DC`    |
| `C_LQSP`   | `CI_FORMAT`  | `LOAD`  | `RV32DC`    |
| `C_SQSP`   | `CSS_FORMAT` | `STORE` | `RV32DC`    |
