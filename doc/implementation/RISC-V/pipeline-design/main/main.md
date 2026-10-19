# MAIN

| `Name` | **Value** |
|:-------|:----------|
| `XLEN` | `64`      |
| `PLEN` | `64`      |
| `FLEN` | `64`      |

| **Name**    | **Value**     | **Description**                          |
|:------------|:--------------|:-----------------------------------------|
| `PC_INIT`   | `'h8000_0000` | `Start here after reset`                 |
| `BASE`      | `PC_INIT`     | `offset where to load program in memory` |
| `INIT_FILE` | `"test.hex"`  |                                          |

| **Name**      | **Value** |
|:--------------|:----------|
| `MEM_LATENCY` | `1`       |
| `HAS_USER`    | `1`       |
| `HAS_SUPER`   | `1`       |
| `HAS_HYPER`   | `1`       |
| `HAS_BPU`     | `1`       |
| `HAS_FPU`     | `1`       |
| `HAS_MMU`     | `1`       |
| `HAS_RVM`     | `1`       |
| `HAS_RVA`     | `1`       |
| `HAS_RVC`     | `1`       |
| `HAS_RVN`     | `1`       |
| `HAS_RVB`     | `1`       |
| `HAS_RVT`     | `1`       |
| `HAS_RVP`     | `1`       |
| `HAS_EXT`     | `1`       |

:Core Parameters

| **Name**   | **Value** |
|:-----------|:----------|
| `IS_RV32E` | `1`       |

| **Name**       | **Value** |
|:---------------|:----------|
| `MULT_LATENCY` | `1`       |

| **Name**  | **Value**      | **Description**  |
|:----------|:---------------|:-----------------|
| `HTIF`    | `0`            | `Host-interface` |
| `TOHOST`  | `32'h80001000` |                  |
| `UART_TX` | `32'h80001080` |                  |

| **Name**      | **Value** | **Description**                  |
|:--------------|:----------|:---------------------------------|
| `BREAKPOINTS` | `8`       | `Number of hardware breakpoints` |

| **Name**  | **Value** | **Description**                                |
|:----------|:----------|:-----------------------------------------------|
| `PMA_CNT` | ` 4`      |                                                |
| `PMP_CNT` | `16`      | `Number of Physical Memory Protection entries` |

| **Name**            | **Value** |
|:--------------------|:----------|
| `BP_GLOBAL_BITS`    | ` 2`      |
| `BP_LOCAL_BITS`     | `10`      |
| `BP_LOCAL_BITS_LSB` | ` 2`      |

| **Name**     | **Value**   |
|:-------------|:------------|
| `TECHNOLOGY` | `"GENERIC"` |
| `AVOID_X`    | `0`         |

| **Name**          | **Value**         |
|:------------------|:------------------|
| `MNMIVEC_DEFAULT` | `PC_INIT - 'h004` |
| `MTVEC_DEFAULT`   | `PC_INIT - 'h040` |
| `HTVEC_DEFAULT`   | `PC_INIT - 'h080` |
| `STVEC_DEFAULT`   | `PC_INIT - 'h0C0` |
| `UTVEC_DEFAULT`   | `PC_INIT - 'h100` |

| **Name**                | **Value** |
|:------------------------|:----------|
| `JEDEC_BANK`            | `10`      |
| `JEDEC_MANUFACTURER_ID` | `'h6e`    |

| **Name** | **Value** |
|:---------|:----------|
| `HARTID` | `0`       |

| **Name**      | **Value** |
|:--------------|:----------|
| `PARCEL_SIZE` | `32`      |

| **Name**     | **Value** |
|:-------------|:----------|
| `SYNC_DEPTH` | `3`       |

| **Name**       | **Value** |
|:---------------|:----------|
| `BUFFER_DEPTH` | `4`       |

| **Name**  | **Value** |
|:----------|:----------|
| `RDPORTS` | `1`       |
| `WRPORTS` | `1`       |
| `AR_BITS` | `5`       |

:RF Access

| **Name**      | **Value** |
|:--------------|:----------|
| `PMPCFG_MASK` | `8'h9F`   |

| **Name**       | **Value** |
|:---------------|:----------|
| `ARCHID`       | `12`      |
| `REVPRV_MAJOR` | `1`       |
| `REVPRV_MINOR` | `10`      |
| `REVUSR_MAJOR` | `2`       |
| `REVUSR_MINOR` | `2`       |

:Definitions Package

## PU RISCV CORE

```sv
// Interrupts
typedef struct packed {
  logic [1:0] external,
              timer,
              software;
} interrupts_t;

// Exceptions
typedef struct packed {
  logic hardware_error,                // 19 (corrupted/uncorrectable data)
        software_check,                // 18
        reserved17,                    // 17
        reserved16,                    // 16
        store_page_fault,              // 15
        res14,                         // 14
        load_page_fault,               // 13
        instruction_page_fault,        // 12
        mmode_ecall,                   // 11
        reserved10,                    // 10
        smode_ecall,                   // 9
        umode_ecall,                   // 8
        store_access_fault,            // 7
        misaligned_store,              // 6
        load_access_fault,             // 5
        misaligned_load,               // 4
        breakpoint,                    // 3
        illegal_instruction,           // 2
        instruction_access_fault,      // 1
        misaligned_instruction;        // 0
} exceptions_t;

typedef struct packed {
  logic any;                 // OR of all interrupts and exceptions
  logic nmi;                 // Non-Maskable interrupt
  interrupts_t interrupts;   // Interrupts
  exceptions_t exceptions;   // Exceptions
} interrupts_exceptions_t;
```

```sv
localparam EXCEPTION_SIZE                 = $bits(exceptions_t);

localparam CAUSE_MISALIGNED_INSTRUCTION   = 0;
localparam CAUSE_INSTRUCTION_ACCESS_FAULT = 1;
localparam CAUSE_ILLEGAL_INSTRUCTION      = 2;
localparam CAUSE_BREAKPOINT               = 3;
localparam CAUSE_MISALIGNED_LOAD          = 4;
localparam CAUSE_LOAD_ACCESS_FAULT        = 5;
localparam CAUSE_MISALIGNED_STORE         = 6;
localparam CAUSE_STORE_ACCESS_FAULT       = 7;
localparam CAUSE_UMODE_ECALL              = 8;
localparam CAUSE_SMODE_ECALL              = 9;
localparam CAUSE_MMODE_ECALL              = 11;
localparam CAUSE_INSTRUCTION_PAGE_FAULT   = 12;
localparam CAUSE_LOAD_PAGE_FAULT          = 13;
localparam CAUSE_STORE_PAGE_FAULT         = 15;
localparam CAUSE_SOFTWARE_CHECK           = 18;
localparam CAUSE_HARDWARE_ERROR           = 19;

localparam CAUSE_SSINT                    = 1;
localparam CAUSE_MSINT                    = 3;
localparam CAUSE_STINT                    = 5;
localparam CAUSE_MTINT                    = 7;
localparam CAUSE_SEINT                    = 9;
localparam CAUSE_MEINT                    = 11;
localparam CAUSE_COUNTER_OVERFLOW         = 13;
```

| **Component**   |
|:----------------|
| `pu_riscv_core` |

:Implementation - Main

| **Name**       | **Value** | **Description**               |
|:---------------|:----------|:------------------------------|
| `DU_ADDR_SIZE` | `12`      | `12-bit internal address bus` |

:One Debug Unit per Hardware Thread (hart)

| **Name**          | **Value** |
|:------------------|:----------|
| `MAX_BREAKPOINTS` | `8`       |

| **Name** | **Value**             |
|:---------|:----------------------|
| `15-12`  | `Debug bank`          |
| `11- 0`  | `Address inside bank` |

:Debug Unit Memory Map

| **Name**   | **Value**          |
|:-----------|:-------------------|
| `Bank0`    | `Control & Status` |
| `Bank1`    | `GPRs`             |
| `Bank2`    | `CSRs`             |
| `Bank3-15` | `reserved`         |

| **Name**       | **Value** |
|:---------------|:----------|
| `DBG_INTERNAL` | `4'h0`    |
| `DBG_GPRS`     | `4'h1`    |
| `DBG_CSRS`     | `4'h2`    |

| `0` | `00` | `XX` | `Type`  |
|:----|:-----|:-----|:--------|
| `0` | `00` | `00` | `ctrl`  |
| `0` | `00` | `01` |         |
| `0` | `00` | `10` | `ie`    |
| `0` | `00` | `11` | `cause` |

:Control registers - Reserved

| `1` | `XXXX` | `BPX` | `Type` |
|:----|:-------|:------|:-------|
| `1` | `0000` | `BP0` | `Ctrl` |
| `1` | `0001` | `BP0` | `Data` |
| `1` | `0010` | `BP1` | `Ctrl` |
| `1` | `0011` | `BP1` | `Data` |
| `1` | `1110` | `BP7` | `Ctrl` |
| `1` | `1111` | `BP7` | `Data` |

| **Name**    | **Value** | **Description**                                           |
|:------------|:----------|:----------------------------------------------------------|
| `DBG_CTRL`  | `'h00`    | `debug control`                                           |
| `DBG_HIT`   | `'h01`    | `debug HIT register`                                      |
| `DBG_IE`    | `'h02`    | `debug interrupt enable (which exception halts the CPU?)` |
| `DBG_CAUSE` | `'h03`    | `debug cause (which exception halted the CPU?)`           |

| **Name**      | **Value** | **Description**                |
|:--------------|:----------|:-------------------------------|
| `DBG_BPCTRL0` | `'h10`    | `hardware breakpoint0 control` |
| `DBG_BPDATA0` | `'h11`    | `hardware breakpoint0 data`    |
| `DBG_BPCTRL1` | `'h12`    | `hardware breakpoint1 control` |
| `DBG_BPDATA1` | `'h13`    | `hardware breakpoint1 data`    |
| `DBG_BPCTRL2` | `'h14`    | `hardware breakpoint2 control` |
| `DBG_BPDATA2` | `'h15`    | `hardware breakpoint2 data`    |
| `DBG_BPCTRL3` | `'h16`    | `hardware breakpoint3 control` |
| `DBG_BPDATA3` | `'h17`    | `hardware breakpoint3 data`    |
| `DBG_BPCTRL4` | `'h18`    | `hardware breakpoint4 control` |
| `DBG_BPDATA4` | `'h19`    | `hardware breakpoint4 data`    |
| `DBG_BPCTRL5` | `'h1a`    | `hardware breakpoint5 control` |
| `DBG_BPDATA5` | `'h1b`    | `hardware breakpoint5 data`    |
| `DBG_BPCTRL6` | `'h1c`    | `hardware breakpoint6 control` |
| `DBG_BPDATA6` | `'h1d`    | `hardware breakpoint6 data`    |
| `DBG_BPCTRL7` | `'h1e`    | `hardware breakpoint7 control` |
| `DBG_BPDATA7` | `'h1f`    | `hardware breakpoint7 data`    |

| **Name**                  | **Value** |
|:--------------------------|:----------|
| `DEBUG_SINGLE_STEP_TRACE` | `0`       |
| `DEBUG_BRANCH_TRACE`      | `1`       |

:Debug Codes

| **Name**      | **Value** |
|:--------------|:----------|
| `BP_CTRL_IMP` | `0`       |
| `BP_CTRL_ENA` | `1`       |

| **Name**              | **Value** |
|:----------------------|:----------|
| `BP_CTRL_CC_FETCH`    | `3'h0`    |
| `BP_CTRL_CC_LD_ADR`   | `3'h1`    |
| `BP_CTRL_CC_ST_ADR`   | `3'h2`    |
| `BP_CTRL_CC_LDST_ADR` | `3'h3`    |

| `Address`     | `Key` | **Description**             |
|:--------------|:------|:----------------------------|
| `0x000-0x01f` | `GPR` | `General Purpose Registers` |
| `0x100-0x11f` | `FPR` | `Floating Point Registers`  |
| `0x200`       | `PC`  | `Program Counter`           |
| `0x201`       | `PPC` | `Previous Program Counter`  |

| **Name**  | **Value**            |
|:----------|:---------------------|
| `DBG_GPR` | `12'b0000_0000_0000` |
| `DBG_FPR` | `12'b0001_0000_0000` |
| `DBG_NPC` | `12'h0000_0000_0200` |
| `DBG_PPC` | `12'h0000_0000_0201` |

Bank2 - CSRs

Direct mapping to the 12-bit CSR address space
