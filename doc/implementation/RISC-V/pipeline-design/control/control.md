# CONTROL

| **Component**    |
|:-----------------|
| `pu_riscv_state` |
| `pu_riscv_bp`    |
| `pu_riscv_du`    |

:Implementation - Control

## PU RISCV STATE

* **User**

| **Name**  | **Value** |
|:----------|:----------|
| `USTATUS` | `'h000`   |
| `UIE`     | `'h004`   |
| `UTVEC`   | `'h005`   |

:User Trap Setup

```sv
// User Trap Setup
localparam [11:0] USTATUS       = 'h000,
localparam [11:0] UIE           = 'h004,
localparam [11:0] UTVEC         = 'h005,
```

| **Name**   | **Value** |
|:-----------|:----------|
| `USCRATCH` | `'h040`   |
| `UEPC`     | `'h041`   |
| `UCAUSE`   | `'h042`   |
| `UBADADDR` | `'h043`   |
| `UTVAL`    | `'h043`   |
| `UIP`      | `'h044`   |

:User Trap Handling

```sv
// User Trap Handling
localparam [11:0] USCRATCH      = 'h040,
localparam [11:0] UEPC          = 'h041,
localparam [11:0] UCAUSE        = 'h042,
localparam [11:0] UBADADDR      = 'h043,
localparam [11:0] UTVAL         = 'h043,
localparam [11:0] UIP           = 'h044,
```

| **Name** | **Value** |
|:---------|:----------|
| `FFLAGS` | `'h001`   |
| `FRM`    | `'h002`   |
| `FCSR`   | `'h003`   |

:User Floating-Point CSRs

```sv
// User Floating-Point CSRs
localparam [11:0] FFLAGS        = 'h001;
localparam [11:0] FRM           = 'h002;
localparam [11:0] FCSR          = 'h003;
```

| **Name**       | **Value** | **Observation**            |
|:---------------|:----------|:---------------------------|
| `CYCLE`        | `'hC00`   | `-`                        |
| `TIMEX`        | `'hC01`   | `-`                        |
| `INSTRET`      | `'hC02`   | `-`                        |
| `HPMCOUNTER3`  | `'hC03`   | `until HPMCOUNTER31='hC1F` |
| `CYCLEH`       | `'hC80`   | `-`                        |
| `TIMEH`        | `'hC81`   | `-`                        |
| `INSTRETH`     | `'hC82`   | `-`                        |
| `HPMCOUNTER3H` | `'hC83`   | `until HPMCONTER31='hC9F`  |

:User Counters/Timers

```sv
// User Counters/Timers
localparam [11:0] CYCLE         = 'hC00;
localparam [11:0] TIME          = 'hC01;
localparam [11:0] INSTRET       = 'hC02;
localparam [11:0] HPMCOUNTER3   = 'hC03; // until HPMCOUNTER31='hC1F
localparam [11:0] CYCLEH        = 'hC80;
localparam [11:0] TIMEH         = 'hC81;
localparam [11:0] INSTRETH      = 'hC82;
localparam [11:0] HPMCOUNTER3H  = 'hC83; // until HPMCONTER31='hC9F
```

* **Supervisor**

| **Name**     | **Value** |
|:-------------|:----------|
| `SSTATUS`    | `'h100`   |
| `SEDELEG`    | `'h102`   |
| `SIDELEG`    | `'h103`   |
| `SIE`        | `'h104`   |
| `STVEC`      | `'h105`   |
| `SCOUNTEREN` | `'h106`   |

:Supervisor Trap Setup

```sv
// Supervisor Trap Setup
localparam [11:0] SSTATUS       = 'h100;
localparam [11:0] SEDELEG       = 'h102;
localparam [11:0] SIDELEG       = 'h103;
localparam [11:0] SIE           = 'h104;
localparam [11:0] STVEC         = 'h105;
localparam [11:0] SCOUNTEREN    = 'h106;
```

| **Name**    | **Value** |
|:------------|:----------|
| `SSCRATCH`  | `'h140`   |
| `SEPC`      | `'h141`   |
| `SCAUSE`    | `'h142`   |
| `STVAL`     | `'h143`   |
| `SIP`       | `'h144`   |
| `SCOUNTOVF` | `'hDA0`   |

:Supervisor Trap Handling

```sv
// Supervisor Trap Handling
localparam [11:0] SSCRATCH      = 'h140;
localparam [11:0] SEPC          = 'h141;
localparam [11:0] SCAUSE        = 'h142;
localparam [11:0] STVAL         = 'h143;
localparam [11:0] SIP           = 'h144;
localparam [11:0] SCOUNTOVF     = 'hDA0;
```

| `Name` | **Value** |
|:-------|:----------|
| `SATP` | `'h180`   |

:Supervisor Protection and Translation

```sv
// Supervisor Protection and Translation
localparam [11:0] SATP          = 'h180;
```

```sv
// Supervisor Configuration
localparam [11:0] SENVCFG       = 'h10A;
```

```sv
// Supervisor Counter Setup
localparam [11:0] SCOUNTINHIBIT = 'h120;
```

```sv
// Debug/Trace
localparam [11:0] SCONTEXT      = 'h5A8;
```

```sv
// Supervisor State Enable Registers
localparam [11:0] SSTATEEN0     = 'h10C;
localparam [11:0] SSTATEEN1     = 'h10D;
localparam [11:0] SSTATEEN2     = 'h10E;
localparam [11:0] SSTATEEN3     = 'h10F;
```

* **Hypervisor**

| **Name**  | **Value** |
|:----------|:----------|
| `HSTATUS` | `'h200`   |
| `HEDELEG` | `'h202`   |
| `HIDELEG` | `'h203`   |
| `HIE`     | `'h204`   |
| `HTVEC`   | `'h205`   |

:Hypervisor Trap Setup

```sv
// Hypervisor Trap Setup
localparam [11:0] HSTATUS       = 'h600;
localparam [11:0] HEDELEG       = 'h602;
localparam [11:0] HIDELEG       = 'h603;
localparam [11:0] HIE           = 'h604;
localparam [11:0] HCOUNTEREN    = 'h606;
localparam [11:0] HGEIE         = 'h607;
localparam [11:0] HEDELEGH      = 'h612;
```

| **Name**   | **Value** |
|:-----------|:----------|
| `HSCRATCH` | `'h240`   |
| `HEPC`     | `'h241`   |
| `HCAUSE`   | `'h242`   |
| `HTVAL`    | `'h243`   |
| `HIP`      | `'h244`   |

:Hypervisor Trap Handling

```sv
// Hypervisor Trap Handling
localparam [11:0] HTVAL         = 'h643;
localparam [11:0] HIP           = 'h644;
localparam [11:0] HVIP          = 'h645;
localparam [11:0] HTINST        = 'h64A;
localparam [11:0] HGEIP         = 'hE12;
```

```sv
// Hypervisor Configuration
localparam [11:0] HENVCFG       = 'h60A;
localparam [11:0] HENVCFGH      = 'h61A;
```

```sv
// Hypervisor Protection and Translation
localparam [11:0] HGATP         = 'h680;

```sv
// Debug/Trace
localparam [11:0] HCONTEXT      = 'h6A8;
```

```sv
// Hypervisor Counter/Timer Virtualisation Registers
localparam [11:0] HTIMEDELTA    = 'h605;
localparam [11:0] HTIMEDELTAH   = 'h615;
```

```sv
// Hypervisor State Enable Registers
localparam [11:0] HSTATEEN0     = 'h60C;
localparam [11:0] HSTATEEN1     = 'h60D;
localparam [11:0] HSTATEEN2     = 'h60E;
localparam [11:0] HSTATEEN3     = 'h60F;
localparam [11:0] HSTATEEN0H    = 'h61C;
localparam [11:0] HSTATEEN1H    = 'h61D;
localparam [11:0] HSTATEEN2H    = 'h61E;
localparam [11:0] HSTATEEN3H    = 'h61F;
```

```sv
// Virtual Supervisor Registers
localparam [11:0] VSSTATUS      = 'h200;
localparam [11:0] VSIE          = 'h204;
localparam [11:0] VSTVEC        = 'h205;
localparam [11:0] VSSCRATCH     = 'h240;
localparam [11:0] VSEPC         = 'h241;
localparam [11:0] VSCAUSE       = 'h242;
localparam [11:0] VSTVAL        = 'h243;
localparam [11:0] VSIP          = 'h244;
localparam [11:0] VSATP         = 'h280;
```

* **Machine**

| **Name**    | **Value** |
|:------------|:----------|
| `MVENDORID` | `'hF11`   |
| `MARCHID`   | `'hF12`   |
| `MIMPID`    | `'hF13`   |
| `MHARTID`   | `'hF14`   |

:Machine Information

```sv
// Machine Information
localparam [11:0] MVENDORID     = 'hF11;
localparam [11:0] MARCHID       = 'hF12;
localparam [11:0] MIMPID        = 'hF13;
localparam [11:0] MHARTID       = 'hF14;
localparam [11:0] MCONFIGPTR    = 'hF15;
```

| **Name**     | **Value** | **Observation** |
|:-------------|:----------|:----------------|
| `MSTATUS`    | `'h300`   | `-`             |
| `MISA`       | `'h301`   | `-`             |
| `MEDELEG`    | `'h302`   | `-`             |
| `MIDELEG`    | `'h303`   | `-`             |
| `MIE`        | `'h304`   | `-`             |
| `MNMIVEC`    | `'h7C0`   | `NMI Vector`    |
| `MTVEC`      | `'h305`   | `-`             |
| `MCOUNTEREN` | `'h306`   | `-`             |
| `MSTATUSH`   | `'h310`   | `RV32 only`     |
| `MEDELEGH`   | `'h312`   | `RV32 only`     |

:Machine Trap Setup

```sv
// Machine Trap Setup
localparam [11:0] MSTATUS       = 'h300;
localparam [11:0] MISA          = 'h301;
localparam [11:0] MEDELEG       = 'h302;
localparam [11:0] MIDELEG       = 'h303;
localparam [11:0] MIE           = 'h304;
localparam [11:0] MNMIVEC       = 'h7C0; // NMI Vector
localparam [11:0] MTVEC         = 'h305;
localparam [11:0] MCOUNTEREN    = 'h306;
localparam [11:0] MSTATUSH      = 'h310; // RV32 only
localparam [11:0] MEDELEGH      = 'h312; // RV32 only
```

| **Name**   | **Value** |
|:-----------|:----------|
| `MSCRATCH` | `'h340`   |
| `MEPC`     | `'h341`   |
| `MCAUSE`   | `'h342`   |
| `MTVAL`    | `'h343`   |
| `MIP`      | `'h344`   |

:Machine Trap Handling

```sv
// Machine Trap Handling
localparam [11:0] MSCRATCH      = 'h340;
localparam [11:0] MEPC          = 'h341;
localparam [11:0] MCAUSE        = 'h342;
localparam [11:0] MTVAL         = 'h343;
localparam [11:0] MIP           = 'h344;
localparam [11:0] MTINST        = 'h34A;
localparam [11:0] MTVAL2        = 'h34B;
```

```sv
// Machine configuration
localparam [11:0] MENVCFG       = 'h30A;
localparam [11:0] MENVCFGH      = 'h31A; // RV32 only
localparam [11:0] MSECCFG       = 'h747;
localparam [11:0] MSECCFGH      = 'h757; // RV32 only
```

```sv
// Machine Protection
localparam [11:0] PMPCFG0       = 'h3A0;
localparam [11:0] PMPCFG1       = 'h3A1; // RV32 only
localparam [11:0] PMPCFG2       = 'h3A2;
localparam [11:0] PMPCFG3       = 'h3A3; // RV32 only
localparam [11:0] PMPCFG4       = 'h3A4;
localparam [11:0] PMPCFG5       = 'h3A5;
localparam [11:0] PMPCFG6       = 'h3A6;
localparam [11:0] PMPCFG7       = 'h3A7;
localparam [11:0] PMPCFG8       = 'h3A8;
localparam [11:0] PMPCFG9       = 'h3A9;
localparam [11:0] PMPCFG10      = 'h3AA;
localparam [11:0] PMPCFG11      = 'h3AB;
localparam [11:0] PMPCFG12      = 'h3AC;
localparam [11:0] PMPCFG13      = 'h3AD;
localparam [11:0] PMPCFG14      = 'h3AE;
localparam [11:0] PMPCFG15      = 'h3AF;
localparam [11:0] PMPADDR0      = 'h3B0;
localparam [11:0] PMPADDR1      = 'h3B1;
localparam [11:0] PMPADDR2      = 'h3B2;
localparam [11:0] PMPADDR3      = 'h3B3;
localparam [11:0] PMPADDR4      = 'h3B4;
localparam [11:0] PMPADDR5      = 'h3B5;
localparam [11:0] PMPADDR6      = 'h3B6;
localparam [11:0] PMPADDR7      = 'h3B7;
localparam [11:0] PMPADDR8      = 'h3B8;
localparam [11:0] PMPADDR9      = 'h3B9;
localparam [11:0] PMPADDR10     = 'h3BA;
localparam [11:0] PMPADDR11     = 'h3BB;
localparam [11:0] PMPADDR12     = 'h3BC;
localparam [11:0] PMPADDR13     = 'h3BD;
localparam [11:0] PMPADDR14     = 'h3BE;
localparam [11:0] PMPADDR15     = 'h3BF; // until pmpaddr63
```

```sv
// Machine State Enable Registers
localparam [11:0] MSTATEEN0     = 'h30C;
localparam [11:0] MSTATEEN1     = 'h30D;
localparam [11:0] MSTATEEN2     = 'h30E;
localparam [11:0] MSTATEEN3     = 'h30F;
localparam [11:0] MSTATEEN0H    = 'h31C;
localparam [11:0] MSTATEEN1H    = 'h31D;
localparam [11:0] MSTATEEN2H    = 'h31E;
localparam [11:0] MSTATEEN3H    = 'h31F;
```

```sv
// Machine Non-Maskable Interrupt Handling
localparam [11:0] MNSCRATCH     = 'h740;
localparam [11:0] MNEPC         = 'h741;
localparam [11:0] MNCAUSE       = 'h742;
localparam [11:0] MNSTATUS      = 'h744;
```

```sv
// Machine Counters/Timers
localparam [11:0] MCYCLE        = 'hB00;
localparam [11:0] MINSTRET      = 'hB02;
localparam [11:0] MHPMCOUNTER3  = 'hB03; // until MHPMCOUNTER31='hB1F
localparam [11:0] MCYCLEH       = 'hB80;
localparam [11:0] MINSTRETH     = 'hB82;
localparam [11:0] MHPMCOUNTER3H = 'hB83; // until MHPMCOUNTER31H='hB9F
```

```sv
// Machine Counter Setup
localparam [11:0] MCOUNTINHIBIT = 'h320;
localparam [11:0] MHPMEVENT3    = 'h323; // until MHPMEVENT31 = 'h33f
```

## PU RISCV BP
## PU RISCV DU
