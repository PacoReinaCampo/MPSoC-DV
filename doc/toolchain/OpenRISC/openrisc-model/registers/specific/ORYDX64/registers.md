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

| `Group` | `Register`  | `Register Name`          | `User Mode` | `Supv Mode` | `Description`                                 |
|---------|-------------|--------------------------|-------------|-------------|-----------------------------------------------|
| `0`     | `0`         | `VR`                     | `-`         | `R`         | `Version register`                            |
| `0`     | `1`         | `UPR`                    | `-`         | `R`         | `Unit Present register`                       |
| `0`     | `2`         | `CPUCFGR`                | `-`         | `R`         | `CPU Configuration register`                  |
| `0`     | `3`         | `DMMUCFGR`               | `-`         | `R`         | `Data MMU Configuration register`             |
| `0`     | `4`         | `IMMUCFGR`               | `-`         | `R`         | `Instruction MMU Configuration register`      |
| `0`     | `5`         | `DCCFGR`                 | `-`         | `R`         | `Data Cache Configuration register`           |
| `0`     | `6`         | `ICCFGR`                 | `-`         | `R`         | `Instruction Cache Configuration register`    |
| `0`     | `7`         | `DCFGR`                  | `-`         | `R`         | `Debug Configuration register`                |
| `0`     | `8`         | `PCCFGR`                 | `--`        | `R`         | `Performance Counters Configuration register` |
| `0`     | `9`         | `VR2`                    | `-`         | `R`         | `Version register 2`                          |
| `0`     | `10`        | `AVR`                    | `-`         | `R`         | `Architecture version register`               |
| `0`     | `11`        | `EVBAR`                  | `-`         | `R/W`       | `Exception vector base address register`      |
| `0`     | `12`        | `AECR`                   | `-`         | `R/W`       | `Arithmetic Exception Control Register`       |
| `0`     | `13`        | `AESR`                   | `-`         | `R/W`       | `Arithmetic Exception Status Register`        |
| `0`     | `16`        | `NPC`                    | `-`         | `R/W`       | `PC mapped to SPR space (next PC)`            |
| `0`     | `17`        | `SR`                     | `-`         | `R/W`       | `Supervision register`                        |
| `0`     | `18`        | `PPC`                    | `-`         | `R`         | `PC mapped to SPR space (previous PC)`        |
| `0`     | `20`        | `FPCSR`                  | `R/W`       | `R/W`       | `FP Control Status register`                  |
| `0`     | `21-28`     | `ISR0-ISR7`              |             | `R`         | `Implementation-specific registers`           |
| `0`     | `32-47`     | `EPCR0-EPCR15`           | `-`         | `R/W`       | `Exception PC registers`                      |
| `0`     | `48-63`     | `EEAR0-EEAR15`           | `-`         | `R/W`       | `Exception EA registers`                      |
| `0`     | `64-79`     | `ESR0-ESR15`             | `-`         | `R/W`       | `Exception SR registers`                      |
| `0`     | `128`       | `COREID`                 | `-`         | `R`         | `Core Identifier Register`                    |
| `0`     | `129`       | `NUMCORES`               | `-`         | `R`         | `Number of Cores Register`                    |
| `0`     | `1024-1535` | `GPR0-GPR511`            | `-`         | `R/W`       | `GPRs mapped to SPR space`                    |
| `1`     | `0`         | `DMMUCR`                 | `-`         | `R/W`       | `Data MMU Control register`                   |
| `1`     | `1`         | `DMMUPR`                 | `-`         | `R/W`       | `Data MMU Protection Register`                |
| `1`     | `2`         | `DTLBEIR`                | `-`         | `W`         | `Data TLB Entry Invalidate register`          |
| `1`     | `4-7`       | `DATBMR0-DATBMR3`        | `-`         | `R/W`       | `Data ATB Match registers`                    |
| `1`     | `8-11`      | `DATBTR0-DATBTR3`        | `-`         | `R/W`       | `Data ATB Translate registers`                |
| `1`     | `512-639`   | `DTLBW0MR0-DTLBW0MR127`  | `-`         | `R/W`       | `Data TLB Match registers Way 0`              |
| `1`     | `640-767`   | `DTLBW0TR0-DTLBW0TR127`  | `-`         | `R/W`       | `Data TLB Translate registers Way 0`          |
| `1`     | `768-895`   | `DTLBW1MR0-DTLBW1MR127`  | `-`         | `R/W`       | `Data TLB Match registers Way 1`              |
| `1`     | `896-1023`  | `DTLBW1TR0-DTLBW1TR127`  | `-`         | `R/W`       | `Data TLB Translate registers Way 1`          |
| `1`     | `1024-1151` | `DTLBW2MR0-DTLBW2MR127`  | `-`         | `R/W`       | `Data TLB Match registers Way 2`              |
| `1`     | `1152-1279` | `DTLBW2TR0-DTLBW2TR127`  | `-`         | `R/W`       | `Data TLB Translate registers Way 2`          |
| `1`     | `1280-1407` | `DTLBW3MR0-DTLBW3MR127`  | `-`         | `R/W`       | `Data TLB Match registers Way 3`              |
| `1`     | `1408-1535` | `DTLBW3TR0-DTLBW3TR127`  | `-`         | `R/W`       | `Data TLB Translate registers Way 3`          |
| `2`     | `0`         | `IMMUCR`                 | `-`         | `R/W`       | `Instruction MMU Control register`            |
| `2`     | `1`         | `IMMUPR`                 | `-`         | `R/W`       | `Instruction MMU Protection Register`         |
| `2`     | `2`         | `ITLBEIR`                | `-`         | `W`         | `Instruction TLB Entry Invalidate register`   |
| `2`     | `4-7`       | `IATBMR0-IATBMR3`        | `-`         | `R/W`       | `Instruction ATB Match registers`             |
| `2`     | `8-11`      | `IATBTR0-IATBTR3`        | `-`         | `R/W`       | `Instruction ATB Translate registers`         |
| `2`     | `512-639`   | `ITLBW0MR0-ITLBW0MR127`  | `-`         | `R/W`       | `Instruction TLB Match registers Way 0`       |
| `2`     | `640-767`   | `ITLBW0TR0-ITLBW0TR127`  | `-`         | `R/W`       | `Instruction TLB Translate registers Way 0`   |
| `2`     | `768-895`   | `ITLBW1MR0-ITLBW1MR127`  | `-`         | `R/W`       | `Instruction TLB Match registers Way 1`       |
| `2`     | `896-1023`  | `ITLBW1TR0-ITLBW1TR127`  | `-`         | `R/W`       | `Instruction TLB Translate registers Way 1`   |
| `2`     | `1024-1151` | `ITLBW2MR0-ITLBW2MR127`  | `-`         | `R/W`       | `Instruction TLB Match registers Way 2`       |
| `2`     | `1152-1279` | `ITLBW2TR0-ITLBW2TR127`  | `-`         | `R/W`       | `Instruction TLB Translate registers Way 2`   |
| `2`     | `1280-1407` | `ITLBW3MR0-ITLBW3MR127`  | `-`         | `R/W`       | `Instruction TLB Match registers Way 3`       |
| `2`     | `1408-1535` | `ITLBW3TR0-ITLBW3TR127`  | `-`         | `R/W`       | `Instruction TLB Translate registers Way 3`   |
| `3`     | `0`         | `DCCR`                   | `-`         | `R/W`       | `DC Control register`                         |
| `3`     | `1`         | `DCBPR`                  | `W`         | `W`         | `DC Block Prefetch register`                  |
| `3`     | `2`         | `DCBFR`                  | `W`         | `W`         | `DC Block Flush register`                     |
| `3`     | `3`         | `DCBIR`                  | `-`         | `W`         | `DC Block Invalidate register`                |
| `3`     | `4`         | `DCBWR`                  | `W`         | `W`         | `DC Block Write-back register`                |
| `3`     | `5`         | `DCBLR`                  | `W`         | `W`         | `DC Block Lock register`                      |
| `4`     | `0`         | `ICCR`                   | `-`         | `R/W`       | `IC Control register`                         |
| `4`     | `1`         | `ICBPR`                  | `W`         | `W`         | `IC Block Prefetch register`                  |
| `4`     | `2`         | `ICBIR`                  | `-`         | `W`         | `IC Block Invalidate register`                |
| `4`     | `3`         | `ICBLR`                  | `W`         | `W`         | `IC Block Lock register`                      |
| `5`     | `1`         | `MACLO`                  | `R/W*`      | `R/W*`      | `MAC Low`                                     |
| `5`     | `2`         | `MACHI`                  | `R/W*`      | `R/W*`      | `MAC High`                                    |
| `5`     | `3`         | `FPMADDLO`               | `R/W*`      | `R/W*`      | `Floating Point MAC Low`                      |
| `5`     | `4`         | `FPMADDHI`               | `R/W*`      | `R/W*`      | `Floating Point MAC High`                     |
| `5`     | `5`         | `VMACLO`                 | `R/W*`      | `R/W*`      | `Vector MAC Low`                              |
| `5`     | `6`         | `VMACHI`                 | `R/W*`      | `R/W*`      | `Vector MAC High`                             |
| `6`     | `0-7`       | `DVR0-DVR7`              | `-`         | `R/W`       | `Debug Value registers`                       |
| `6`     | `8-15`      | `DCR0-DCR7`              | `-`         | `R/W`       | `Debug Control registers`                     |
| `6`     | `16`        | `DMR1`                   | `-`         | `R/W`       | `Debug Mode register 1`                       |
| `6`     | `17`        | `DMR2`                   | `-`         | `R/W`       | `Debug Mode register 2`                       |
| `6`     | `18-19`     | `DCWR0-DCWR1`            | `-`         | `R/W`       | `Debug Watchpoint Counter registers`          |
| `6`     | `20`        | `DSR`                    | `-`         | `R/W`       | `Debug Stop register`                         |
| `6`     | `21`        | `DRR`                    | `-`         | `R/W`       | `Debug Reason register`                       |
| `7`     | `0-7`       | `PCCR0-PCCR7`            | `R*`        | `R/W`       | `Performance Counters Count registers`        |
| `7`     | `8-15`      | `PCMR0-PCMR7`            | `-`         | `R/W`       | `Performance Counters Mode registers`         |
| `8`     | `0`         | `PMR`                    | `-`         | `R/W`       | `Power Management register`                   |
| `9`     | `0`         | `PICMR`                  | `-`         | `R/W`       | `PIC Mask register`                           |
| `9`     | `2`         | `PICSR`                  | `-`         | `R/W`       | `PIC Status register`                         |
| `10`    | `0`         | `TTMR`                   | `-`         | `R/W`       | `Tick Timer Mode register`                    |
| `10`    | `1`         | `TTCR`                   | `R*`        | `R/W`       | `Tick Timer Count register`                   |

: List of All Special-Purpose Registers

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
