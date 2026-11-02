## OPCODE ENCODING INFORMATION

| **Instruction** | **Argument** | **Opcode**                           | **Codec** | **Extension**        |
|:----------------|:-------------|:-------------------------------------|:----------|:---------------------|
| `mul`           | `rd rs1 rs2` | `31..25=1 14..12=0 6..2=0x0C 1..0=3` | `r`       | `rv32m rv64m rv128m` |
| `mulh`          | `rd rs1 rs2` | `31..25=1 14..12=1 6..2=0x0C 1..0=3` | `r`       | `rv32m rv64m rv128m` |
| `mulhsu`        | `rd rs1 rs2` | `31..25=1 14..12=2 6..2=0x0C 1..0=3` | `r`       | `rv32m rv64m rv128m` |
| `mulhu`         | `rd rs1 rs2` | `31..25=1 14..12=3 6..2=0x0C 1..0=3` | `r`       | `rv32m rv64m rv128m` |
| `div`           | `rd rs1 rs2` | `31..25=1 14..12=4 6..2=0x0C 1..0=3` | `r`       | `rv32m rv64m rv128m` |
| `divu`          | `rd rs1 rs2` | `31..25=1 14..12=5 6..2=0x0C 1..0=3` | `r`       | `rv32m rv64m rv128m` |
| `rem`           | `rd rs1 rs2` | `31..25=1 14..12=6 6..2=0x0C 1..0=3` | `r`       | `rv32m rv64m rv128m` |
| `remu`          | `rd rs1 rs2` | `31..25=1 14..12=7 6..2=0x0C 1..0=3` | `r`       | `rv32m rv64m rv128m` |

:RV32M - "RV32M Standard Extension for Integer Multiply and Divide"

| **Instruction** | **Argument** | **Opcode**                           | **Codec** | **Extension**  |
|:----------------|:-------------|:-------------------------------------|:----------|:---------------|
| `mulw`          | `rd rs1 rs2` | `31..25=1 14..12=0 6..2=0x0E 1..0=3` | `r`       | `rv64m rv128m` |
| `divw`          | `rd rs1 rs2` | `31..25=1 14..12=4 6..2=0x0E 1..0=3` | `r`       | `rv64m rv128m` |
| `divuw`         | `rd rs1 rs2` | `31..25=1 14..12=5 6..2=0x0E 1..0=3` | `r`       | `rv64m rv128m` |
| `remw`          | `rd rs1 rs2` | `31..25=1 14..12=6 6..2=0x0E 1..0=3` | `r`       | `rv64m rv128m` |
| `remuw`         | `rd rs1 rs2` | `31..25=1 14..12=7 6..2=0x0E 1..0=3` | `r`       | `rv64m rv128m` |

:RV64M - "RV64M Standard Extension for Integer Multiply and Divide (+ RV32M)"

| **Instruction** | **Argument** | **Opcode**                           | **Codec** | **Extension** |
|:----------------|:-------------|:-------------------------------------|:----------|:--------------|
| `muld`          | `rd rs1 rs2` | `31..25=1 14..12=0 6..2=0x1E 1..0=3` | `r`       | `rv128m`      |
| `divd`          | `rd rs1 rs2` | `31..25=1 14..12=4 6..2=0x1E 1..0=3` | `r`       | `rv128m`      |
| `divud`         | `rd rs1 rs2` | `31..25=1 14..12=5 6..2=0x1E 1..0=3` | `r`       | `rv128m`      |
| `remd`          | `rd rs1 rs2` | `31..25=1 14..12=6 6..2=0x1E 1..0=3` | `r`       | `rv128m`      |
| `remud`         | `rd rs1 rs2` | `31..25=1 14..12=7 6..2=0x1E 1..0=3` | `r`       | `rv128m`      |

:RV128M - "RV128M Standard Extension for Integer Multiply and Divide (+ RV64M)"