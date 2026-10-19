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
