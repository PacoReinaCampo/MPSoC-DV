# INSTRUCTION SET ARCHITECTURE

## ARCHITECTURE

| `Item`           | `Description`                                                                                                                                                                                                    |
|------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `l.mnemonic`     | Identifies an ORBIS32/ORBIS64 instruction.                                                                                                                                                                       |
| `lv.mnemonic`    | Identifies an ORVDX32/ORVDX64 instruction.                                                                                                                                                                       |
| `lf.mnemonic`    | Identifies an ORFPX16/ORFPX32/ORFPX64/ORFPX128 instruction                                                                                                                                                       |
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

## FORMATS

| `Type of Data`                      | `Length in Bytes` | `Length in Bits` | `addr[3:0] if aligned` |
|-------------------------------------|-------------------|------------------|------------------------|
| `Byte`                              | `1`               | `8`              | `Xxxx`                 |
| `Halfword (or half)`                | `2`               | `16`             | `Xxx0`                 |
| `Singleword (or word)`              | `4`               | `32`             | `Xx00`                 |
| `Doubleword (or double)`            | `8`               | `64`             | `X000`                 |
| `Single precision float`            | `4`               | `32`             | `Xx00`                 |
| `Double precision float`            | `8`               | `64`             | `X000`                 |
| `Vector of bytes`                   | `8`               | `64`             | `X000`                 |
| `Vector of halfwords`               | `8`               | `64`             | `X000`                 |
| `Vector of singlewords`             | `8`               | `64`             | `X000`                 |
| `Vector of single precision floats` | `8`               | `64`             | `X000`                 |

: Memory Operands and their Sizes

| `Type`           | `C Type`                               | `Sizeof` | `Alignment (Bytes)` | `OpenRISC Equivalent`    |
|------------------|----------------------------------------|----------|---------------------|--------------------------|
| `Integral`       | `char signed char`                     | `1`      | `1`                 | `Signed byte`            |
|                  | `unsigned char`                        | `1`      | `1`                 | `Unsigned byte`          |
|                  | `short signed short`                   | `2`      | `2`                 | `Signed halfword`        |
|                  | `unsigned short`                       | `2`      | `2`                 | `Unsigned halfword`      |
|                  | `int signed int long signed long enum` | `4`      | `4`                 | `Signed singleword`      |
|                  | `unsigned int`                         | `4`      | `4`                 | `Unsigned singleword`    |
|                  | `long long signed long long`           | `8`      | `4`                 | `Signed doubleword`      |
|                  | `unsigned long long`                   | `8`      | `4`                 | `Unsigned doubleword`    |
| `Pointer`        | `Any-type * Any-type (*) ()`           | `4`      | `4`                 | `Unsigned singleword`    |
| `Floating-Point` | `float`                                | `4`      | `4`                 | `Single precision float` |
|                  | `double`                               | `8`      | `4`                 | `Double precision float` |

: Scalar Types

| `Vector Type`                                                 | `Sizeof` | `Alignment (Bytes)` | `OpenRISC Equivalent`            |
|---------------------------------------------------------------|----------|---------------------|----------------------------------|
| `Vector char Vector signed char`                              | `8`      | `8`                 | `Vector of signed bytes`         |
| `Vector unsigned char`                                        | `8`      | `8`                 | `Vector of unsigned bytes`       |
| `Vector short Vector signed short`                            | `8`      | `8`                 | `Vector of signed halfwords`     |
| `Vector unsigned short`                                       | `8`      | `8`                 | `Vector of unsigned halfwords`   |
| `Vector int Vector signed int Vector long Vector signed long` | `8`      | `8`                 | `Vector of signed singlewords`   |
| `Vector unsigned int`                                         | `8`      | `8`                 | `Vector of unsigned singlewords` |
| `Vector float`                                                | `8`      | `8`                 | `Vector of single-precisions`    |

: Vector Types

## REGISTERS

| `Group`   | `Unit Description`                                                                                                |
|-----------|-------------------------------------------------------------------------------------------------------------------|
| `0`       | `System Control and Status registers`                                                                             |
| `1`       | `Data MMU (in the case of a single unified MMU, groups 1 and 2 decode into a single set of registers)`            |
| `2`       | `Instruction MMU (in the case of a single unified MMU, groups 1 and 2 decode into a single set of registers)`     |
| `3`       | `Data Cache (in the case of a single unified cache, groups 3 and 4 decode into a single set of registers)`        |
| `4`       | `Instruction Cache (in the case of a single unified cache, groups 3 and 4 decode into a single set of registers)` |
| `5`       | `MAC unit`                                                                                                        |
| `6`       | `Debug unit`                                                                                                      |
| `7`       | `Performance counters unit`                                                                                       |
| `8`       | `Power Management`                                                                                                |
| `9`       | `Programmable Interrupt Controller`                                                                               |
| `10`      | `Tick Timer`                                                                                                      |
| `11`      | `Floating Point unit`                                                                                             |
| `12-23`   | `Reserved for future use`                                                                                         |
| `24-31`   | `Custom units`                                                                                                    |

: Groups of SPRs

| `Group` | `Register`  | `Register Name`          | `User Mode` | `Supervisor Mode` | `Description`                                 |
|---------|-------------|--------------------------|-------------|-------------------|-----------------------------------------------|
| `0`     | `0`         | `VR`                     | `-`         | `R`               | `Version register`                            |
| `0`     | `1`         | `UPR`                    | `-`         | `R`               | `Unit Present register`                       |
| `0`     | `2`         | `CPUCFGR`                | `-`         | `R`               | `CPU Configuration register`                  |
| `0`     | `3`         | `DMMUCFGR`               | `-`         | `R`               | `Data MMU Configuration register`             |
| `0`     | `4`         | `IMMUCFGR`               | `-`         | `R`               | `Instruction MMU Configuration register`      |
| `0`     | `5`         | `DCCFGR`                 | `-`         | `R`               | `Data Cache Configuration register`           |
| `0`     | `6`         | `ICCFGR`                 | `-`         | `R`               | `Instruction Cache Configuration register`    |
| `0`     | `7`         | `DCFGR`                  | `-`         | `R`               | `Debug Configuration register`                |
| `0`     | `8`         | `PCCFGR`                 | `--`        | `R`               | `Performance Counters Configuration register` |
| `0`     | `9`         | `VR2`                    | `-`         | `R`               | `Version register 2`                          |
| `0`     | `10`        | `AVR`                    | `-`         | `R`               | `Architecture version register`               |
| `0`     | `11`        | `EVBAR`                  | `-`         | `R/W`             | `Exception vector base address register`      |
| `0`     | `12`        | `AECR`                   | `-`         | `R/W`             | `Arithmetic Exception Control Register`       |
| `0`     | `13`        | `AESR`                   | `-`         | `R/W`             | `Arithmetic Exception Status Register`        |
| `0`     | `16`        | `NPC`                    | `-`         | `R/W`             | `PC mapped to SPR space (next PC)`            |
| `0`     | `17`        | `SR`                     | `-`         | `R/W`             | `Supervision register`                        |
| `0`     | `18`        | `PPC`                    | `-`         | `R`               | `PC mapped to SPR space (previous PC)`        |
| `0`     | `20`        | `FPCSR`                  | `R/W`       | `R/W`             | `FP Control Status register`                  |
| `0`     | `21-28`     | `ISR0-ISR7`              |             | `R`               | `Implementation-specific registers`           |
| `0`     | `32-47`     | `EPCR0-EPCR15`           | `-`         | `R/W`             | `Exception PC registers`                      |
| `0`     | `48-63`     | `EEAR0-EEAR15`           | `-`         | `R/W`             | `Exception EA registers`                      |
| `0`     | `64-79`     | `ESR0-ESR15`             | `-`         | `R/W`             | `Exception SR registers`                      |
| `0`     | `128`       | `COREID`                 | `-`         | `R`               | `Core Identifier Register`                    |
| `0`     | `129`       | `NUMCORES`               | `-`         | `R`               | `Number of Cores Register`                    |
| `0`     | `1024-1535` | `GPR0-GPR511`            | `-`         | `R/W`             | `GPRs mapped to SPR space`                    |
| `1`     | `0`         | `DMMUCR`                 | `-`         | `R/W`             | `Data MMU Control register`                   |
| `1`     | `1`         | `DMMUPR`                 | `-`         | `R/W`             | `Data MMU Protection Register`                |
| `1`     | `2`         | `DTLBEIR`                | `-`         | `W`               | `Data TLB Entry Invalidate register`          |
| `1`     | `4-7`       | `DATBMR0-DATBMR3`        | `-`         | `R/W`             | `Data ATB Match registers`                    |
| `1`     | `8-11`      | `DATBTR0-DATBTR3`        | `-`         | `R/W`             | `Data ATB Translate registers`                |
| `1`     | `512-639`   | `DTLBW0MR0-DTLBW0MR127`  | `-`         | `R/W`             | `Data TLB Match registers Way 0`              |
| `1`     | `640-767`   | `DTLBW0TR0-DTLBW0TR127`  | `-`         | `R/W`             | `Data TLB Translate registers Way 0`          |
| `1`     | `768-895`   | `DTLBW1MR0-DTLBW1MR127`  | `-`         | `R/W`             | `Data TLB Match registers Way 1`              |
| `1`     | `896-1023`  | `DTLBW1TR0-DTLBW1TR127`  | `-`         | `R/W`             | `Data TLB Translate registers Way 1`          |
| `1`     | `1024-1151` | `DTLBW2MR0-DTLBW2MR127`  | `-`         | `R/W`             | `Data TLB Match registers Way 2`              |
| `1`     | `1152-1279` | `DTLBW2TR0-DTLBW2TR127`  | `-`         | `R/W`             | `Data TLB Translate registers Way 2`          |
| `1`     | `1280-1407` | `DTLBW3MR0-DTLBW3MR127`  | `-`         | `R/W`             | `Data TLB Match registers Way 3`              |
| `1`     | `1408-1535` | `DTLBW3TR0-DTLBW3TR127`  | `-`         | `R/W`             | `Data TLB Translate registers Way 3`          |
| `2`     | `0`         | `IMMUCR`                 | `-`         | `R/W`             | `Instruction MMU Control register`            |
| `2`     | `1`         | `IMMUPR`                 | `-`         | `R/W`             | `Instruction MMU Protection Register`         |
| `2`     | `2`         | `ITLBEIR`                | `-`         | `W`               | `Instruction TLB Entry Invalidate register`   |
| `2`     | `4-7`       | `IATBMR0-IATBMR3`        | `-`         | `R/W`             | `Instruction ATB Match registers`             |
| `2`     | `8-11`      | `IATBTR0-IATBTR3`        | `-`         | `R/W`             | `Instruction ATB Translate registers`         |
| `2`     | `512-639`   | `ITLBW0MR0-ITLBW0MR127`  | `-`         | `R/W`             | `Instruction TLB Match registers Way 0`       |
| `2`     | `640-767`   | `ITLBW0TR0-ITLBW0TR127`  | `-`         | `R/W`             | `Instruction TLB Translate registers Way 0`   |
| `2`     | `768-895`   | `ITLBW1MR0-ITLBW1MR127`  | `-`         | `R/W`             | `Instruction TLB Match registers Way 1`       |
| `2`     | `896-1023`  | `ITLBW1TR0-ITLBW1TR127`  | `-`         | `R/W`             | `Instruction TLB Translate registers Way 1`   |
| `2`     | `1024-1151` | `ITLBW2MR0-ITLBW2MR127`  | `-`         | `R/W`             | `Instruction TLB Match registers Way 2`       |
| `2`     | `1152-1279` | `ITLBW2TR0-ITLBW2TR127`  | `-`         | `R/W`             | `Instruction TLB Translate registers Way 2`   |
| `2`     | `1280-1407` | `ITLBW3MR0-ITLBW3MR127`  | `-`         | `R/W`             | `Instruction TLB Match registers Way 3`       |
| `2`     | `1408-1535` | `ITLBW3TR0-ITLBW3TR127`  | `-`         | `R/W`             | `Instruction TLB Translate registers Way 3`   |
| `3`     | `0`         | `DCCR`                   | `-`         | `R/W`             | `DC Control register`                         |
| `3`     | `1`         | `DCBPR`                  | `W`         | `W`               | `DC Block Prefetch register`                  |
| `3`     | `2`         | `DCBFR`                  | `W`         | `W`               | `DC Block Flush register`                     |
| `3`     | `3`         | `DCBIR`                  | `-`         | `W`               | `DC Block Invalidate register`                |
| `3`     | `4`         | `DCBWR`                  | `W`         | `W`               | `DC Block Write-back register`                |
| `3`     | `5`         | `DCBLR`                  | `W`         | `W`               | `DC Block Lock register`                      |
| `4`     | `0`         | `ICCR`                   | `-`         | `R/W`             | `IC Control register`                         |
| `4`     | `1`         | `ICBPR`                  | `W`         | `W`               | `IC Block Prefetch register`                  |
| `4`     | `2`         | `ICBIR`                  | `-`         | `W`               | `IC Block Invalidate register`                |
| `4`     | `3`         | `ICBLR`                  | `W`         | `W`               | `IC Block Lock register`                      |
| `5`     | `1`         | `MACLO`                  | `R/W*`      | `R/W*`            | `MAC Low`                                     |
| `5`     | `2`         | `MACHI`                  | `R/W*`      | `R/W*`            | `MAC High`                                    |
| `5`     | `3`         | `FPMADDLO`               | `R/W*`      | `R/W*`            | `Floating Point MAC Low`                      |
| `5`     | `4`         | `FPMADDHI`               | `R/W*`      | `R/W*`            | `Floating Point MAC High`                     |
| `5`     | `5`         | `VMACLO`                 | `R/W*`      | `R/W*`            | `Vector MAC Low`                              |
| `5`     | `6`         | `VMACHI`                 | `R/W*`      | `R/W*`            | `Vector MAC High`                             |
| `6`     | `0-7`       | `DVR0-DVR7`              | `-`         | `R/W`             | `Debug Value registers`                       |
| `6`     | `8-15`      | `DCR0-DCR7`              | `-`         | `R/W`             | `Debug Control registers`                     |
| `6`     | `16`        | `DMR1`                   | `-`         | `R/W`             | `Debug Mode register 1`                       |
| `6`     | `17`        | `DMR2`                   | `-`         | `R/W`             | `Debug Mode register 2`                       |
| `6`     | `18-19`     | `DCWR0-DCWR1`            | `-`         | `R/W`             | `Debug Watchpoint Counter registers`          |
| `6`     | `20`        | `DSR`                    | `-`         | `R/W`             | `Debug Stop register`                         |
| `6`     | `21`        | `DRR`                    | `-`         | `R/W`             | `Debug Reason register`                       |
| `7`     | `0-7`       | `PCCR0-PCCR7`            | `R*`        | `R/W`             | `Performance Counters Count registers`        |
| `7`     | `8-15`      | `PCMR0-PCMR7`            | `-`         | `R/W`             | `Performance Counters Mode registers`         |
| `8`     | `0`         | `PMR`                    | `-`         | `R/W`             | `Power Management register`                   |
| `9`     | `0`         | `PICMR`                  | `-`         | `R/W`             | `PIC Mask register`                           |
| `9`     | `2`         | `PICSR`                  | `-`         | `R/W`             | `PIC Status register`                         |
| `10`    | `0`         | `TTMR`                   | `-`         | `R/W`             | `Tick Timer Mode register`                    |
| `10`    | `1`         | `TTCR`                   | `R*`        | `R/W`             | `Tick Timer Count register`                   |

: Special-Purpose Registers

| `Register` | `Preserved across function calls` | `Usage`                                                                                           |
|------------|-----------------------------------|---------------------------------------------------------------------------------------------------|
| `R31`      | `No`                              | `Temporary register`                                                                              |
| `R30`      | `Yes`                             | `Callee-saved register`                                                                           |
| `R29`      | `No`                              | `Temporary register`                                                                              |
| `R28`      | `Yes`                             | `Callee-saved register`                                                                           |
| `R27`      | `No`                              | `Temporary register`                                                                              |
| `R26`      | `Yes`                             | `Callee-saved register`                                                                           |
| `R25`      | `No`                              | `Temporary register`                                                                              |
| `R24`      | `Yes`                             | `Callee-saved register`                                                                           |
| `R23`      | `No`                              | `Temporary register`                                                                              |
| `R22`      | `Yes`                             | `Callee-saved register`                                                                           |
| `R21`      | `No`                              | `Temporary register`                                                                              |
| `R20`      | `Yes`                             | `Callee-saved register`                                                                           |
| `R19`      | `No`                              | `Temporary register`                                                                              |
| `R18`      | `Yes`                             | `Callee-saved register`                                                                           |
| `R17`      | `No`                              | `Temporary register`                                                                              |
| `R16`      | `Yes`                             | `Callee-saved register`                                                                           |
| `R15`      | `No`                              | `Temporary register`                                                                              |
| `R14`      | `Yes`                             | `Callee-saved register`                                                                           |
| `R13`      | `No`                              | `Temporary register`                                                                              |
| `R12`      | `No`                              | `Temporary register for 64-bit RVH - Return value upper 32-bit of 64-bit value on 32-bit system`  |
| `R11`      | `No`                              | `RV - Return value`                                                                               |
| `R10`      | `Yes`                             | `Thread Local Storage`                                                                            |
| `R9`       | `Yes`                             | `LR - Link address register`                                                                      |
| `R8`       | `No`                              | `Function parameter word 5`                                                                       |
| `R7`       | `No`                              | `Function parameter word 4`                                                                       |
| `R6`       | `No`                              | `Function parameter word 3`                                                                       |
| `R5`       | `No`                              | `Function parameter word 2`                                                                       |
| `R4`       | `No`                              | `Function parameter word 1`                                                                       |
| `R3`       | `No`                              | `Function parameter word 0`                                                                       |
| `R2`       | `Yes`                             | `FP - Frame pointer (optional)`                                                                   |
| `R1`       | `Yes`                             | `SP - Stack pointer`                                                                              |
| `R0`       | `-`                               | `Fixed to zero`                                                                                   |

: General-Purpose Registers

## INSTRUCTIONS

| `Class` | `Description`                                                                                                                                                              |
|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `I`     | `Instructions in class I must always be implemented`                                                                                                                       |
| `II`    | `Instructions from class II are optional and an implementation may choose to use some or all instructions from this class based on requirements of the target application` |

: OpenRISC 1000 Instruction Classes

| `OPC`  | `Instruction`                      | `Mnemonic`    | `Function`                                                                       | `Class` |
|--------|------------------------------------|---------------|----------------------------------------------------------------------------------|---------|
| `0x00` | `000000NNNNNNNNNNNNNNNNNNNNNNNNNN` | `l.j`         | `Jump`                                                                           | `I`     |
| `0x01` | `000001NNNNNNNNNNNNNNNNNNNNNNNNNN` | `l.jal`       | `Jump and Link`                                                                  | `I`     |
| `0x02` | `000010DDDDDNNNNNNNNNNNNNNNNNNNNN` | `l.adrp`      | `Compute Instruction Relative Address`                                           | `II`    |
| `0x03` | `000011NNNNNNNNNNNNNNNNNNNNNNNNNN` | `l.bnf`       | `Branch if No Flag`                                                              | `I`     |
| `0x04` | `000100NNNNNNNNNNNNNNNNNNNNNNNNNN` | `l.bf`        | `Branch if Flag`                                                                 | `I`     |
| `0x05` | `00010101--------KKKKKKKKKKKKKKKK` | `l.nop`       | `No Operation`                                                                   | `I`     |
| `0x06` | `000110DDDDD----0KKKKKKKKKKKKKKKK` | `l.movhi`     | `Move Immediate High`                                                            | `I`     |
| `0x06` | `000110DDDDD----10000000000000000` | `l.macrc`     | `MAC Read and Clear`                                                             | `II`    |
| `0x08` | `0010000000000000KKKKKKKKKKKKKKKK` | `l.sys`       | `System Call`                                                                    | `I`     |
| `0x08` | `0010000100000000KKKKKKKKKKKKKKKK` | `l.trap`      | `Trap`                                                                           | `II`    |
| `0x08` | `00100010000000000000000000000000` | `l.msync`     | `Memory Synchronization`                                                         | `II`    |
| `0x08` | `00100010100000000000000000000000` | `l.psync`     | `Pipeline Synchronization`                                                       | `II`    |
| `0x08` | `00100011000000000000000000000000` | `l.csync`     | `Context Synchronization`                                                        | `II`    |
| `0x09` | `001001--------------------------` | `l.rfe`       | `Return From Exception`                                                          | `I`     |
| `0x11` | `010001----------BBBBB-----------` | `l.jr`        | `Jump Register`                                                                  | `I`     |
| `0x12` | `010010----------BBBBB-----------` | `l.jalr`      | `Jump and Link Register`                                                         | `I`     |
| `0x13` | `010011-----AAAAAIIIIIIIIIIIIIIII` | `l.maci`      | `Multiply Immediate Signed and Accumulate`                                       | `I`     |
| `0x1A` | `011010DDDDDAAAAAIIIIIIIIIIIIIIII` | `l.lf`        | `Load Single Float Word with NaN Boxing`                                         | `I`     |
| `0x1B` | `011011DDDDDAAAAAIIIIIIIIIIIIIIII` | `l.lwa`       | `Load Single Word Atomic`                                                        | `I`     |
| `0x1C` | `011100--------------------------` | `l.cust1`     | `Reserved for ORBIS32/64 Custom Instructions`                                    | `I`     |
| `0x1D` | `011101--------------------------` | `l.cust2`     | `Reserved for ORBIS32/64 Custom Instructions`                                    | `I`     |
| `0x1E` | `011110--------------------------` | `l.cust3`     | `Reserved for ORBIS32/64 Custom Instructions`                                    | `I`     |
| `0x1F` | `011111--------------------------` | `l.cust4`     | `Reserved for ORBIS32/64 Custom Instructions`                                    | `I`     |
| `0x20` | `100000DDDDDAAAAAIIIIIIIIIIIIIIII` | `l.ld`        | `Load Double Word`                                                               | `I`     |
| `0x21` | `100001DDDDDAAAAAIIIIIIIIIIIIIIII` | `l.lwz`       | `Load Single Word and Extend with Zero`                                          | `I`     |
| `0x22` | `100010DDDDDAAAAAIIIIIIIIIIIIIIII` | `l.lws`       | `Load Single Word and Extend with Sign`                                          | `I`     |
| `0x23` | `100011DDDDDAAAAAIIIIIIIIIIIIIIII` | `l.lbz`       | `Load Byte and Extend with Zero`                                                 | `I`     |
| `0x24` | `100100DDDDDAAAAAIIIIIIIIIIIIIIII` | `l.lbs`       | `Load Byte and Extend with Sign`                                                 | `I`     |
| `0x25` | `100101DDDDDAAAAAIIIIIIIIIIIIIIII` | `l.lhz`       | `Load Half Word and Extend with Zero`                                            | `I`     |
| `0x26` | `100110DDDDDAAAAAIIIIIIIIIIIIIIII` | `l.lhs`       | `Load Half Word and Extend with Sign`                                            | `I`     |
| `0x27` | `100111DDDDDAAAAAIIIIIIIIIIIIIIII` | `l.addi`      | `Add Immediate Signed`                                                           | `I`     |
| `0x28` | `101000DDDDDAAAAAIIIIIIIIIIIIIIII` | `l.addic`     | `Add Immediate Signed and Carry`                                                 | `I`     |
| `0x29` | `101001DDDDDAAAAAKKKKKKKKKKKKKKKK` | `l.andi`      | `And with Immediate Half Word`                                                   | `I`     |
| `0x2A` | `101010DDDDDAAAAAKKKKKKKKKKKKKKKK` | `l.ori`       | `Or with Immediate Half Word`                                                    | `I`     |
| `0x2B` | `101011DDDDDAAAAAIIIIIIIIIIIIIIII` | `l.xori`      | `Exclusive Or with Immediate Half Word`                                          | `I`     |
| `0x2C` | `101100DDDDDAAAAAIIIIIIIIIIIIIIII` | `l.muli`      | `Multiply Immediate Signed`                                                      | `II`    |
| `0x2D` | `101101DDDDDAAAAAKKKKKKKKKKKKKKKK` | `l.mfspr`     | `Move From Special-Purpose Register`                                             | `I`     |
| `0x2E` | `101110DDDDDAAAAA--------00LLLLLL` | `l.slli`      | `Shift Left Logical with Immediate`                                              | `I`     |
| `0x2E` | `101110DDDDDAAAAA--------01LLLLLL` | `l.srli`      | `Shift Right Logical with Immediate`                                             | `I`     |
| `0x2E` | `101110DDDDDAAAAA--------10LLLLLL` | `l.srai`      | `Shift Right Arithmetic with Immediate`                                          | `I`     |
| `0x2E` | `101110DDDDDAAAAA--------11LLLLLL` | `l.rori`      | `Rotate Right with Immediate`                                                    | `II`    |
| `0x2F` | `10111100000AAAAAIIIIIIIIIIIIIIII` | `l.sfeqi`     | `Set Flag if Equal Immediate`                                                    | `I`     |
| `0x2F` | `10111100001AAAAAIIIIIIIIIIIIIIII` | `l.sfnei`     | `Set Flag if Not Equal Immediate`                                                | `I`     |
| `0x2F` | `10111100010AAAAAIIIIIIIIIIIIIIII` | `l.sfgtui`    | `Set Flag if Greater Than Immediate Unsigned`                                    | `I`     |
| `0x2F` | `10111100011AAAAAIIIIIIIIIIIIIIII` | `l.sfgeui`    | `Set Flag if Greater or Equal Than Immediate Unsigned`                           | `I`     |
| `0x2F` | `10111100100AAAAAIIIIIIIIIIIIIIII` | `l.sfltui`    | `Set Flag if Less Than Immediate Unsigned`                                       | `I`     |
| `0x2F` | `10111100101AAAAAIIIIIIIIIIIIIIII` | `l.sfleui`    | `Set Flag if Less or Equal Than Immediate Unsigned`                              | `I`     |
| `0x2F` | `10111101010AAAAAIIIIIIIIIIIIIIII` | `l.sfgtsi`    | `Set Flag if Greater Than Immediate Signed`                                      | `I`     |
| `0x2F` | `10111101011AAAAAIIIIIIIIIIIIIIII` | `l.sfgesi`    | `Set Flag if Greater or Equal Than Immediate Signed`                             | `I`     |
| `0x2F` | `10111101100AAAAAIIIIIIIIIIIIIIII` | `l.sfltsi`    | `Set Flag if Less Than Immediate Signed`                                         | `I`     |
| `0x2F` | `10111101101AAAAAIIIIIIIIIIIIIIII` | `l.sflesi`    | `Set Flag if Less or Equal Than Immediate Signed`                                | `I`     |
| `0x30` | `110000KKKKKAAAAABBBBBKKKKKKKKKKK` | `l.mtspr`     | `Move To Special-Purpose Register`                                               | `I`     |
| `0x31` | `110001-----AAAAABBBBB-------0001` | `l.mac`       | `Multiply Signed and Accumulate`                                                 | `II`    |
| `0x31` | `110001-----AAAAABBBBB-------0011` | `l.macu`      | `Multiply Unsigned and Accumulate`                                               | `II`    |
| `0x31` | `110001-----AAAAABBBBB-------0010` | `l.msb`       | `Multiply Signed and Subtract`                                                   | `II`    |
| `0x31` | `110001-----AAAAABBBBB-------0100` | `l.msbu`      | `Multiply Unsigned and Subtract`                                                 | `II`    |
| `0x33` | `110011IIIIIAAAAABBBBBIIIIIIIIIII` | `l.swa`       | `Store Single Word Atomic`                                                       | `II`    |
| `0x35` | `110101IIIIIAAAAABBBBBIIIIIIIIIII` | `l.sw`        | `Store Single Word`                                                              | `I`     |
| `0x36` | `110110IIIIIAAAAABBBBBIIIIIIIIIII` | `l.sb`        | `Store Byte`                                                                     | `I`     |
| `0x37` | `110111IIIIIAAAAABBBBBIIIIIIIIIII` | `l.sh`        | `Store Half Word`                                                                | `I`     |
| `0x38` | `111000DDDDDAAAAA------0000--1100` | `l.exths`     | `Extend Half Word with Sign`                                                     | `II`    |
| `0x38` | `111000DDDDDAAAAA------0000--1101` | `l.extws`     | `Extend Word with Sign`                                                          | `II`    |
| `0x38` | `111000DDDDDAAAAA------0001--1100` | `l.extbs`     | `Extend Byte with Sign`                                                          | `II`    |
| `0x38` | `111000DDDDDAAAAA------0001--1101` | `l.extwz`     | `Extend Word with Zero`                                                          | `II`    |
| `0x38` | `111000DDDDDAAAAA------0010--1100` | `l.exthz`     | `Extend Half Word with Zero`                                                     | `II`    |
| `0x38` | `111000DDDDDAAAAA------0011--1100` | `l.extbz`     | `Extend Byte with Zero`                                                          | `II`    |
| `0x38` | `111000DDDDDAAAAABBBBB-00----0000` | `l.add`       | `Add Signed`                                                                     | `I`     |
| `0x38` | `111000DDDDDAAAAABBBBB-00----0001` | `l.addc`      | `Add Signed and Carry`                                                           | `I`     |
| `0x38` | `111000DDDDDAAAAABBBBB-00----0010` | `l.sub`       | `Subtract Signed`                                                                | `I`     |
| `0x38` | `111000DDDDDAAAAABBBBB-00----0011` | `l.and`       | `And`                                                                            | `I`     |
| `0x38` | `111000DDDDDAAAAABBBBB-00----0100` | `l.or`        | `Or`                                                                             | `I`     |
| `0x38` | `111000DDDDDAAAAABBBBB-00----0101` | `l.xor`       | `Exclusive Or`                                                                   | `I`     |
| `0x38` | `111000DDDDDAAAAABBBBB-00----1110` | `l.cmov`      | `Conditional Move`                                                               | `II`    |
| `0x38` | `111000DDDDDAAAAA------00----1111` | `l.ff1`       | `Find First 1`                                                                   | `II`    |
| `0x38` | `111000DDDDDAAAAABBBBB-0000--1000` | `l.sll`       | `Shift Left Logical`                                                             | `I`     |
| `0x38` | `111000DDDDDAAAAABBBBB-0001--1000` | `l.srl`       | `Shift Right Logical`                                                            | `I`     |
| `0x38` | `111000DDDDDAAAAABBBBB-0010--1000` | `l.sra`       | `Shift Right Arithmetic`                                                         | `I`     |
| `0x38` | `111000DDDDDAAAAABBBBB-0011--1000` | `l.ror`       | `Rotate Right`                                                                   | `II`    |
| `0x38` | `111000DDDDDAAAAA------01----1111` | `l.fl1`       | `Find Last 1`                                                                    | `II`    |
| `0x38` | `111000DDDDDAAAAABBBBB-11----0110` | `l.mul`       | `Multiply Signed`                                                                | `II`    |
| `0x38` | `111000-----AAAAABBBBB-11----0111` | `l.muld`      | `Multiply Signed to Double`                                                      | `II`    |
| `0x38` | `111000DDDDDAAAAABBBBB-11----1001` | `l.div`       | `Divide Signed`                                                                  | `II`    |
| `0x38` | `111000DDDDDAAAAABBBBB-11----1010` | `l.divu`      | `Divide Unsigned`                                                                | `II`    |
| `0x38` | `111000DDDDDAAAAABBBBB-11----1011` | `l.mulu`      | `Multiply Unsigned`                                                              | `II`    |
| `0x38` | `111000-----AAAAABBBBB-11----1100` | `l.muldu`     | `Multiply Unsigned to Double`                                                    | `II`    |
| `0x39` | `11100100000AAAAABBBBB-----------` | `l.sfeq`      | `Set Flag if Equal`                                                              | `I`     |
| `0x39` | `11100100001AAAAABBBBB-----------` | `l.sfne`      | `Set Flag if Not Equal`                                                          | `I`     |
| `0x39` | `11100100010AAAAABBBBB-----------` | `l.sfgtu`     | `Set Flag if Greater Than Unsigned`                                              | `I`     |
| `0x39` | `11100100011AAAAABBBBB-----------` | `l.sfgeu`     | `Set Flag if Greater or Equal Than Unsigned`                                     | `I`     |
| `0x39` | `11100100100AAAAABBBBB-----------` | `l.sfltu`     | `Set Flag if Less Than Unsigned`                                                 | `I`     |
| `0x39` | `11100100101AAAAABBBBB-----------` | `l.sfleu`     | `Set Flag if Less or Equal Than Unsigned`                                        | `I`     |
| `0x39` | `11100101010AAAAABBBBB-----------` | `l.sfgts`     | `Set Flag if Greater Than Signed`                                                | `I`     |
| `0x39` | `11100101011AAAAABBBBB-----------` | `l.sfges`     | `Set Flag if Greater or Equal Than Signed`                                       | `I`     |
| `0x39` | `11100101100AAAAABBBBB-----------` | `l.sflts`     | `Set Flag if Less Than Signed`                                                   | `I`     |
| `0x39` | `11100101101AAAAABBBBB-----------` | `l.sfles`     | `Set Flag if Less or Equal Than Signed`                                          | `I`     |
| `0x3C` | `111100DDDDDAAAAABBBBBLLLLLLKKKKK` | `l.cust5`     | `Reserved for ORBIS32/64 Custom Instructions`                                    | `II`    |
| `0x3D` | `111101--------------------------` | `l.cust6`     | `Reserved for ORBIS32/64 Custom Instructions`                                    | `II`    |
| `0x3E` | `111110--------------------------` | `l.cust7`     | `Reserved for ORBIS32/64 Custom Instructions`                                    | `II`    |
| `0x3F` | `111111--------------------------` | `l.cust8`     | `Reserved for ORBIS32/64 Custom Instructions`                                    | `II`    |

: ORBIS32, ORBIS64 Instructions

## EXCEPTIONS

| `Type`                     | `Exception`                       |
|----------------------------|-----------------------------------|
| `Asynchronous/nonmaskable` | `Bus Error, Reset`                |
| `Asynchronous/maskable`    | `External Interrupt, Tick Timer`  |
| `Synchronous/precise`      | `Instruction-caused exceptions`   |
| `Synchronous/imprecise`    | `None`                            |

: Exception Classes

| `Exception Type`         | `Vector Offset`   | `Causal Conditions`                                                                                                                                                                                                                                                                              |
|--------------------------|-------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `Reset`                  | `0x100`           | `Caused by software or hardware reset`                                                                                                                                                                                                                                                           |
| `Bus Error`              | `0x200`           | `The causes are implementation-specific, but typically they are related to bus errors and attempts to access invalid physical address`                                                                                                                                                           |
| `Data Page Fault`        | `0x300`           | `No matching PTE found in page tables or page protection violation for load/store operations`                                                                                                                                                                                                    |
| `Instruction Page Fault` | `0x400`           | `No matching PTE found in page tables or page protection violation for instruction fetch`                                                                                                                                                                                                        |
| `Tick Timer`             | `0x500`           | `Tick timer interrupt asserted`                                                                                                                                                                                                                                                                  |
| `Alignment`              | `0x600`           | `Load/store access to naturally not aligned location`                                                                                                                                                                                                                                            |
| `Illegal Instruction`    | `0x700`           | `Illegal instruction in the instruction stream`                                                                                                                                                                                                                                                  |
| `External Interrupt`     | `0x800`           | `External interrupt asserted`                                                                                                                                                                                                                                                                    |
| `D-TLB Miss`             | `0x900`           | `No matching entry in DTLB (DTLB miss)`                                                                                                                                                                                                                                                          |
| `I-TLB Miss`             | `0xA00`           | `No matching entry in ITLB (ITLB miss)`                                                                                                                                                                                                                                                          |
| `Range`                  | `0xB00`           | `If programmed in the SR, the setting of certain flags, like SR[OV], causes a range exception. On OpenRISC implementations with less than 32 GPRs when accessing unimplemented architectural GPRs. On all implementations if SR[CID] had to go out of range in order to process next exception`  |
| `System Call`            | `0xC00`           | `System call initiated by software`                                                                                                                                                                                                                                                              |
| `Floating Point`         | `0xD00`           | `Caused by floating point instructions when FPCSR status flags are set by FPU and FPCSR[FPEE] is set`                                                                                                                                                                                            |
| `Trap`                   | `0xE00`           | `Caused by the l.trap instruction or by debug unit`                                                                                                                                                                                                                                              |
| `Reserved`               | `0xF00 - 0x1400`  | `Reserved for future use`                                                                                                                                                                                                                                                                        |
| `Reserved`               | `0x1500 - 0x1800` | `Reserved for implementation-specific exceptions`                                                                                                                                                                                                                                                |
| `Reserved`               | `0x1900 - 0x1F00` | `Reserved for custom exceptions`                                                                                                                                                                                                                                                                 |

: Exception Types and Causal Conditions

| `Exception`              | `Priority`          | `EPCR (no delay slot)`                         | `EPCR (delay slot)`                                                        | `EEAR`                         |
|--------------------------|---------------------|------------------------------------------------|----------------------------------------------------------------------------|--------------------------------|
| `Reset`                  | `1`                 | `-`                                            | `-`                                                                        | `-`                            |
| `Bus Error`              | `4 (insn) 9 (data)` | `Address of instruction that caused exception` | `Address of jump instruction before the instruction that caused exception` | `Load/store/fetch virtual EA`  |
| `Data Page Fault`        | `8`                 | `Address of instruction that caused exception` | `Address of jump instruction before the instruction that caused exception` | `Load/store virtual EA`        |
| `Instruction Page Fault` | `3`                 | `Address of instruction that caused exception` | `Address of jump instruction before the instruction that caused exception` | `Instruction fetch virtual EA` |
| `Tick Timer`             | `12`                | `Address of next not executed instruction`     | `Address of just executed jump instruction`                                | `-`                            |
| `Alignment`              | `6`                 | `Address of instruction that caused exception` | `Address of jump instruction before the instruction that caused exception` | `Load/store virtual EA`        |
| `Illegal Instruction`    | `5`                 | `Address of instruction that caused exception` | `Address of jump instruction before the instruction that caused exception` | `Instruction fetch virtual EA` |
| `External Interrupt`     | `12`                | `Address of next not executed instruction`     | `Address of just executed jump instruction`                                | `-`                            |
| `D-TLB Miss`             | `7`                 | `Address of instruction that caused exception` | `Address of jump instruction before the instruction that caused exception` | `Load/store virtual EA`        |
| `I-TLB Miss`             | `2`                 | `Address of instruction that caused exception` | `Address of jump instruction before the instruction that caused exception` | `Instruction fetch virtual EA` |
| `Range`                  | `10`                | `Address of instruction that caused exception` | `Address of jump instruction before the instruction that caused exception` | `-`                            |
| `System Call`            | `7`                 | `Address of next not executed instruction`     | `Address of just executed jump instruction`                                | `-`                            |
| `Floating Point`         | `11`                | `Address of next not executed instruction`     | `Address of just executed jump instruction`                                | `-`                            |
| `Trap`                   | `7`                 | `Address of instruction that caused exception` | `Address of jump instruction before the instruction that caused exception` | `-`                            |

: Values of EPCR and EEAR After Exception

| `Exception Type`         | `Vector Offset[11:0]` | `Signal`    | `Example`                                               |
|--------------------------|-----------------------|-------------|---------------------------------------------------------|
| `Reset`                  | `0x100`               | `None`      | `Reset`                                                 |
| `Bus Error`              | `0x200`               | `SIGBUS`    | `Unexisting physical location, bus parity error`        |
| `Data Page Fault`        | `0x300`               | `SIGSEGV`   | `Unmapped data location or protection violation`        |
| `Instruction Page Fault` | `0x400`               | `SIGSEGV`   | `Unmapped instruction location or protection violation` |
| `Tick Timer Interrupt`   | `0x500`               | `None`      | `Process scheduling`                                    |
| `Alignment`              | `0x600`               | `SIGBUS`    | `Unaligned data`                                        |
| `Illegal Instruction`    | `0x700`               | `SIGILL`    | `Illegal/unimplemented instruction`                     |
| `External Interrupt`     | `0x800`               | `None`      | `Device has asserted an interrupt`                      |
| `D-TLB Miss`             | `0x900`               | `None`      | `DTLB software reload needed`                           |
| `I-TLB Miss`             | `0xA00`               | `None`      | `ITLB software reload needed`                           |
| `Range`                  | `0xB00`               | `SIGSEGV`   | `Arithmetic overflow`                                   |
| `System Call`            | `0xC00`               | `None`      | `Instruction l.sys`                                     |
| `Trap`                   | `0xE00`               | `SIGTRAP`   | `Instruction l.trap or debug unit exception`            |

: Hardware Exceptions and Signals
