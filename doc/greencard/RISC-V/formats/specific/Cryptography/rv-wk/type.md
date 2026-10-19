## INSTRUCTION TYPES

Instructions in RISC-V are categorized into several types based on their functionality:

- **R-Type**: Arithmetic/Logical instructions with register operands.
- **I-Type**: Immediate instructions with an immediate value and one register operand.
- **S-Type**: Store instructions that store a register value into memory.
- **B-Type**: Branch instructions for conditional jumps.
- **U-Type**: Upper immediate instructions for setting upper bits of a register.
- **J-Type**: Jump instructions for unconditional jumps.

Each type is designed with specific operand formats and encodings to efficiently perform common computational tasks and control flow operations.

Format of a line in the table:

`<type> <type name> <bit encoding>[=<name>] ...`

| **type** | **type name** | **bit encoding**                                                                            |
|:---------|:--------------|:--------------------------------------------------------------------------------------------|
| `32`     | `Base`        | `31:25                       24:20     19:15     14:12        11:7              6:0`        |
| `r`      | `Register`    | `31:25=funct7                24:20=rs2 19:15=rs1 14:12=funct3 11:7=rd           6:0=opcode` |
| `i`      | `Immediate`   | `31:20[11:0]=imm                       19:15=rs1 14:12=funct3 11:7=rd           6:0=opcode` |
| `s`      | `Store`       | `31:25[11:5]=imm             24:20=rs2 19:15=rs1 14:12=funct3 11:7[4:0]=imm     6:0=opcode` |
| `b`      | `Branch`      | `31:25[12-10:5]=imm          24:20=rs2 19:15=rs1 14:12=funct3 11:7[4:1-11]=imm  6:0=opcode` |
| `u`      | `Upper`       | `31:12[31:12]=imm                                             11:7=rd           6:0=opcode` |
| `j`      | `Jump`        | `31:12[20-10:1-11-19:12]=imm                                  11:7=rd           6:0=opcode` |

:RISC-V Base 32-Bit Instruction Type

| **type** | **type name** | **bit encoding**                                                                |
|:---------|:--------------|:--------------------------------------------------------------------------------|
| `32`     | `Base`        | `31:25                     24:20     19:15     14:12        11:7    6:0`        |
| `r4`     | `Register`    | `31:27=rs3    26:25=funct2 24:20=rs2 19:15=rs1 14:12=funct3 11:7=rd 6:0=opcode` |

:RISC-V Float-Point 32-Bit Instruction Type

The base instruction type table categorizes and describes the fundamental instructions that constitute the core of the RISC-V ISA, covering essential operations such as arithmetic, logical, control flow, and memory access.

| **type** | **type name**          | **bit encoding**                                                      |
|:---------|:-----------------------|:----------------------------------------------------------------------|
| `16`     | `Compressed`           | `15:13        12:10             9:7      6:5     4:2      1:0`        |
| `cr`     | `Register`             | `15:12=funct4           11:7=rd/rs1      6:2=rs2          1:0=opcode` |
| `ci`     | `Immediate`            | `15:13=funct3 12=imm    11:7=rd/rs1      6:2=imm          1:0=opcode` |
| `css`    | `Stack-relative Store` | `15:13=funct3 12:7=imm                   6:2=rs2          1:0=opcode` |
| `ciw`    | `Wide Immediate`       | `15:13=funct3 12:5=imm                           4:2=rd'  1:0=opcode` |
| `cl`     | `Load`                 | `15:13=funct3 12:10=imm         9:7=rs1' 6:5=imm 4:2=rd'  1:0=opcode` |
| `cs`     | `Store`                | `15:13=funct3 12:10=imm         9:7=rs1' 6:5=imm 4:2=rs2' 1:0=opcode` |
| `cb`     | `Branch`               | `15:13=funct3 12:10=imm         9:7=rs1' 6:2=imm          1:0=opcode` |
| `cj`     | `Jump`                 | `15:13=funct3 12:2=imm                                    1:0=opcode` |

:RISC-V Compressed 16-Bit Instruction Type

The compressed instruction type table details the subset of instructions available in compressed format within the RISC-V ISA, offering reduced code size benefits while maintaining compatibility with the base instruction set.

| **type** | **type name** | **bit encoding**                                                                             |
|:---------|:--------------|:---------------------------------------------------------------------------------------------|
| `64`     | `Extended`    | `63:48                       47:38     37:28     27:22        21:12             11:0`        |
| `or`     | `Register`    | `63:54=funct16                                   27:22=funct6 21:12=rd          11:0=opcode` |
| `oi`     | `Immediate`   | `63:38[21:0]=imm                       37:28=rs1 27:22=funct6 21:12=rd          11:0=opcode` |
| `os`     | `Store`       | `63:48[21:10]=imm            47:38=rs2 37:28=rs1 27:22=funct6 21:12[9:0]=imm    11:0=opcode` |
| `ob`     | `Branch`      | `63:48[22-20:10]=imm         47:38=rs2 37:28=rs1 27:22=funct6 21:12[9:1-21]=imm 11:0=opcode` |
| `ou`     | `Upper`       | `63:22[63:22]=imm                                             21:12=rd          11:0=opcode` |
| `oj`     | `Jump`        | `63:22[38-20:1-21-37:22]=imm                                  21:12=rd          11:0=opcode` |

:RISC-V Extended 64-Bit Instruction Type

| **type** | **type name** | **bit encoding**                                                                   |
|:---------|:--------------|:-----------------------------------------------------------------------------------|
| `64`     | `Extended`    | `63:48                      47:38     37:28     27:22        21:12    11:0`        |
| `or4`    | `Register`    | `63:54=rs3     53:48=funct6 47:38=rs2 37:28=rs1 27:22=funct6 21:12=rd 11:0=opcode` |

:RISC-V Float-Point 64-Bit Instruction Type

The extended instruction type table details the subset of instructions available in extended format within the RISC-V ISA, offering amplified code size benefits while maintaining compatibility with the base instruction set.
