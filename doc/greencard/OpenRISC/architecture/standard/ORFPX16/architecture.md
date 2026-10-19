# INSTRUCTION SET ARCHITECTURE

| `Item`           | `Description`                                                                                                                                                                                                    |
|------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `l.mnemonic`     | Identifies an ORBIS32/ORBIS64 instruction.                                                                                                                                                                       |
| `lf.mnemonic`    | Identifies an ORFPX16/ORFPX32/ORFPX64/ORFPX128 instruction                                                                                                                                                       |
| `lv.mnemonic`    | Identifies an ORVDX32/ORVDX64 instruction.                                                                                                                                                                       |
| `lw.mnemonic`    | Identifies an ORWDX32/ORWDX64 instruction.                                                                                                                                                                       |
| `ly.mnemonic`    | Identifies an ORYDX32/ORYDX64 instruction.                                                                                                                                                                       |
| `0x`             | Indicates a hexadecimal number                                                                                                                                                                                   |
| `rA`             | Instruction syntax used to identify a general purpose register                                                                                                                                                   |
| `REG[FIELD]`     | Syntax used to identify specific bit(s) of a general or special purpose register. FIELD can be a name of one bit or a group of bits or a numerical range constructed from two values separated by a colon        |
| `X`              | In certain contexts, this indicates a 'don't care'                                                                                                                                                               |
| `N`              | In certain contexts, this indicates an undefined numerical value                                                                                                                                                 |
| `Implementation` | An actual processor implementing the OpenRISC 1000 architecture                                                                                                                                                  |
| `Unit`           | Sometimes referred to as a coprocessor. An implemented unit usually with some special registers and controlling instructions. It can be defined by the architecture or it may be custom                          |
| `Exception`      | A vectored transfer of control to supervisor software through an exception vector table. A way in which a processor can request operating system assistance (division by zero, TLB miss, external interrupt etc) |
| `Privileged`     | An instruction (or register) that can only be executed (or accessed) when the processor is in supervisor mode (when SR[SM]=1)                                                                                    |

: Conventions
