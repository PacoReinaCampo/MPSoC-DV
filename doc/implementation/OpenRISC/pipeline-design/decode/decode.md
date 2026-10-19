# DECODE

| **Component**    |
|:-----------------|
| `pu_or1k_decode` |

:Implementation - Decode

## PU OR1K DECODE
## PU OR1K DECODE-EXECUTE

| **Name**            | **Value** | **Description**              |
|:--------------------|:----------|:-----------------------------|
| `OR1K_SPR_SR_SM`    | `0`       | `Supervisor mode`            |
| `OR1K_SPR_SR_TEE`   | `1`       | `Timer exception enable`     |
| `OR1K_SPR_SR_IEE`   | `2`       | `Interrupt exception enable` |
| `OR1K_SPR_SR_DCE`   | `3`       | `Data cache enable`          |
| `OR1K_SPR_SR_ICE`   | `4`       | `Instruction cache enable`   |
| `OR1K_SPR_SR_DME`   | `5`       | `Data MMU enable`            |
| `OR1K_SPR_SR_IME`   | `6`       | `Instruction MMU enable`     |
| `OR1K_SPR_SR_LEE`   | `7`       | `Little-endian enable`       |
| `OR1K_SPR_SR_CE`    | `8`       | `CID enable`                 |
| `OR1K_SPR_SR_F`     | `9`       | `Flag`                       |
| `OR1K_SPR_SR_CY`    | `10`      | `Carry flag`                 |
| `OR1K_SPR_SR_OV`    | `11`      | `Overflow flag`              |
| `OR1K_SPR_SR_OVE`   | `12`      | `Overflow exception enable`  |
| `OR1K_SPR_SR_DSX`   | `13`      | `Delay slot exception`       |
| `OR1K_SPR_SR_EPH`   | `14`      | `Exception prefix high`      |
| `OR1K_SPR_SR_FO`    | `15`      | `Fixed to one`               |
| `OR1K_SPR_SR_SUMRA` | `16`      | `SPR user read mode access`  |

:Supervision Register

| **Name**               | **Value** | **Description** |
|:-----------------------|:----------|:----------------|
| `OR1K_SPR_SR_RESERVED` | `27:17`   | `Reserved`      |
| `OR1K_SPR_SR_CID`      | `31:28`   | `Context ID`    |

| **Name**               | **Value** | **Description**                     |
|:-----------------------|:----------|:------------------------------------|
| `OR1K_SPR_VR_REV`      | `5:0`     | `Revision`                          |
| `OR1K_SPR_VR_UVRP`     | `6`       | `Updated Version Registers Present` |
| `OR1K_SPR_VR_RESERVED` | `15:7`    | `Reserved`                          |
| `OR1K_SPR_VR_CFG`      | `23:16`   | `Configuration Template`            |
| `OR1K_SPR_VR_VER`      | `31:24`   | `Version`                           |

:Version register - DEPRECATED

| **Name**                | **Value** |
|:------------------------|:----------|
| `OR1K_SPR_UPR_UP`       | `0`       |
| `OR1K_SPR_UPR_DCP`      | `1`       |
| `OR1K_SPR_UPR_ICP`      | `2`       |
| `OR1K_SPR_UPR_DMP`      | `3`       |
| `OR1K_SPR_UPR_IMP`      | `4`       |
| `OR1K_SPR_UPR_MP`       | `5`       |
| `OR1K_SPR_UPR_DUP`      | `6`       |
| `OR1K_SPR_UPR_PCUP`     | `7`       |
| `OR1K_SPR_UPR_PICP`     | `8`       |
| `OR1K_SPR_UPR_PMP`      | `9`       |
| `OR1K_SPR_UPR_TTP`      | `10`      |
| `OR1K_SPR_UPR_RESERVED` | `23:11`   |
| `OR1K_SPR_UPR_CUP`      | `31:24`   |

:Unit Present register

| **Name**                    | **Value** | **Description**                  |
|:----------------------------|:----------|:---------------------------------|
| `OR1K_SPR_CPUCFGR_NSGF`     | `3:0`     | `Number of shadow GPRs`          |
| `OR1K_SPR_CPUCFGR_CFG`      | `4`       |                                  |
| `OR1K_SPR_CPUCFGR_OB32S`    | `5`       |                                  |
| `OR1K_SPR_CPUCFGR_OB64S`    | `6`       |                                  |
| `OR1K_SPR_CPUCFGR_OF32S`    | `7`       |                                  |
| `OR1K_SPR_CPUCFGR_OF64S`    | `8`       |                                  |
| `OR1K_SPR_CPUCFGR_OV64S`    | `9`       |                                  |
| `OR1K_SPR_CPUCFGR_ND`       | `10`      | `No delay-slot implementation`   |
| `OR1K_SPR_CPUCFGR_AVRP`     | `11`      | `Architecture version registers` |
| `OR1K_SPR_CPUCFGR_EVBARP`   | `12`      | `Exception vector base addr reg` |
| `OR1K_SPR_CPUCFGR_ISRP`     | `13`      | `Implementation specific regs`   |
| `OR1K_SPR_CPUCFGR_AECSRP`   | `14`      | `Arithmetic exception regs`      |
| `OR1K_SPR_CPUCFGR_RESERVED` | `31:15`   |                                  |

:CPU Configuration register

| **Name**             | **Value** |
|:---------------------|:----------|
| `OR1K_SPR_VR2_VER`   | `23:0`    |
| `OR1K_SPR_VR2_CPUID` | `31:24`   |

:Version register 2 (new with OR1K 1.0)

| **Name**                | **Value** |
|:------------------------|:----------|
| `OR1K_SPR_AVR_RESERVED` | `7:0`     |
| `OR1K_SPR_AVR_REV`      | `15:8`    |
| `OR1K_SPR_AVR_MIN`      | `23:16`   |
| `OR1K_SPR_AVR_MAJ`      | `31:24`   |

:Architecture Version register

| **Name**                  | **Value** |
|:--------------------------|:----------|
| `OR1K_SPR_EVBAR_RESERVED` | `12:0`    |
| `OR1K_SPR_EVBAR_EVBA`     | `31:13`   |

:Exception Vector Base Address register

| **Name**                  | **Value** |
|:--------------------------|:----------|
| `OR1K_SPR_AECR_CYADDE`    | `0`       |
| `OR1K_SPR_AECR_OVADDE`    | `1`       |
| `OR1K_SPR_AECR_CYMULE`    | `2`       |
| `OR1K_SPR_AECR_OVMULE`    | `3`       |
| `OR1K_SPR_AECR_DBZE`      | `4`       |
| `OR1K_SPR_AECR_CYMACADDE` | `5`       |
| `OR1K_SPR_AECR_OVMACADDE` | `6`       |
| `OR1K_SPR_AECR_RESERVED`  | `31:7`    |

:Arithmetic Exception Control register

| **Name**                  | **Value** |
|:--------------------------|:----------|
| `OR1K_SPR_AESR_CYADDE`    | `0`       |
| `OR1K_SPR_AESR_OVADDE`    | `1`       |
| `OR1K_SPR_AESR_CYMULE`    | `2`       |
| `OR1K_SPR_AESR_OVMULE`    | `3`       |
| `OR1K_SPR_AESR_DBZE`      | `4`       |
| `OR1K_SPR_AESR_CYMACADDE` | `5`       |
| `OR1K_SPR_AESR_OVMACADDE` | `6`       |
| `OR1K_SPR_AESR_RESERVED`  | `31:7`    |

:Arithmetic Exception Status register

| **Name**           | **Value** | **Description**     |
|:-------------------|:----------|:--------------------|
| `OR1K_SPR_TTMR_TP` | `27:0`    | `Time period`       |
| `OR1K_SPR_TTMR_IP` | `28`      | `Interrupt pending` |
| `OR1K_SPR_TTMR_IE` | `29`      | `Interrupt enable`  |
| `OR1K_SPR_TTMR_M`  | `31:30`   | `Mode`              |

:Tick timer registers

| **Name**              | **Value** | **Description**          |
|:----------------------|:----------|:-------------------------|
| `OR1K_SPR_TTMR_M_DIS` | `2'b00`   | `Disabled`               |
| `OR1K_SPR_TTMR_M_RST` | `2'b01`   | `Restart-on-match mode`  |
| `OR1K_SPR_TTMR_M_STP` | `2'b10`   | `Stop-on-match mode`     |
| `OR1K_SPR_TTMR_M_CNT` | `2'b11`   | `Continue counting mode` |

:Tick timer mode values

| **Name**                 | **Value** | **Description**                               |
|:-------------------------|:----------|:----------------------------------------------|
| `OR1K_SPR_DCCFGR_NCW`    | `2:0`     | `Number of Cache Ways`                        |
| `OR1K_SPR_DCCFGR_NCS`    | `6:3`     | `Number of Cache Sets`                        |
| `OR1K_SPR_DCCFGR_CBS`    | `7`       | `Cache Block Size`                            |
| `OR1K_SPR_DCCFGR_CWS`    | `8`       | `Cache Write Strategy`                        |
| `OR1K_SPR_DCCFGR_CCRI`   | `9`       | `Cache Control Register Implemented`          |
| `OR1K_SPR_DCCFGR_CBIRI`  | `10`      | `Cache Block Invalidate Register Implemented` |
| `OR1K_SPR_DCCFGR_CBPRI`  | `11`      | `Cache Block Prefetch Register Implemented`   |
| `OR1K_SPR_DCCFGR_CBLRI`  | `12`      | `Cache Block Lock Register Implemented`       |
| `OR1K_SPR_DCCFGR_CBFRI`  | `13`      | `Cache Block Flush Register Implemented`      |
| `OR1K_SPR_DCCFGR_CBWBRI` | `14`      | `Cache Block Write-Back Register Implemented` |

:Data Cache Configuration register

| **Name**                | **Value** | **Description**                               |
|:------------------------|:----------|:----------------------------------------------|
| `OR1K_SPR_ICCFGR_NCW`   | `2:0`     | `Number of Cache Ways`                        |
| `OR1K_SPR_ICCFGR_NCS`   | `6:3`     | `Number of Cache Sets`                        |
| `OR1K_SPR_ICCFGR_CBS`   | `7`       | `Cache Block Size`                            |
| `OR1K_SPR_ICCFGR_CCRI`  | `9`       | `Cache Control Register Implemented`          |
| `OR1K_SPR_ICCFGR_CBIRI` | `10`      | `Cache Block Invalidate Register Implemented` |
| `OR1K_SPR_ICCFGR_CBPRI` | `11`      | `Cache Block Prefetch Register Implemented`   |
| `OR1K_SPR_ICCFGR_CBLRI` | `12`      | `Cache Block Lock Register Implemented`       |

:Instruction Cache Configuration register

| **Name**                 | **Value** | **Description**                             |
|:-------------------------|:----------|:--------------------------------------------|
| `OR1K_SPR_DMMUFGR_NTW`   | `1:0`     | `Number of TLB ways`                        |
| `OR1K_SPR_DMMUFGR_NTS`   | `4:2`     | `Number of TLB sets`                        |
| `OR1K_SPR_DMMUFGR_NAE`   | `7:5`     | `Number of ATB entries`                     |
| `OR1K_SPR_DMMUFGR_CRI`   | `8`       | `Control Register Implemented`              |
| `OR1K_SPR_DMMUFGR_PRI`   | `9`       | `Protection Register Implemented`           |
| `OR1K_SPR_DMMUFGR_TEIRI` | `10`      | `TLB Entry Invalidate Register Implemented` |
| `OR1K_SPR_DMMUFGR_HTR`   | `11`      | `Hardware TLB Reload`                       |

:Data MMU Configuration register

| **Name**                 | **Value** | **Description**                             |
|:-------------------------|:----------|:--------------------------------------------|
| `OR1K_SPR_IMMUFGR_NTW`   | `1:0`     | `Number of TLB ways`                        |
| `OR1K_SPR_IMMUFGR_NTS`   | `4:2`     | `Number of TLB sets`                        |
| `OR1K_SPR_IMMUFGR_NAE`   | `7:5`     | `Number of ATB entries`                     |
| `OR1K_SPR_IMMUFGR_CRI`   | `8`       | `Control Register Implemented`              |
| `OR1K_SPR_IMMUFGR_PRI`   | `9`       | `Protection Register Implemented`           |
| `OR1K_SPR_IMMUFGR_TEIRI` | `10`      | `TLB Entry Invalidate Register Implemented` |
| `OR1K_SPR_IMMUFGR_HTR`   | `11`      | `Hardware TLB Reload`                       |

:Instruction MMU Configuration register

| **Name**           | **Value** |
|:-------------------|:----------|
| `OR1K_SPR_DMR1_ST` | `22`      |
| `OR1K_SPR_DMR1_BT` | `23`      |

:Debug Mode Register 1

| **Name**             | **Value** |
|:---------------------|:----------|
| `OR1K_SPR_DSR_RSTE`  | `0`       |
| `OR1K_SPR_DSR_BUSEE` | `1`       |
| `OR1K_SPR_DSR_DPFE`  | `2`       |
| `OR1K_SPR_DSR_IPFE`  | `3`       |
| `OR1K_SPR_DSR_TTE`   | `4`       |
| `OR1K_SPR_DSR_AE`    | `5`       |
| `OR1K_SPR_DSR_IIE`   | `6`       |
| `OR1K_SPR_DSR_INTE`  | `7`       |
| `OR1K_SPR_DSR_DME`   | `8`       |
| `OR1K_SPR_DSR_IME`   | `9`       |
| `OR1K_SPR_DSR_RE`    | `10`      |
| `OR1K_SPR_DSR_SCE`   | `11`      |
| `OR1K_SPR_DSR_FPE`   | `12`      |
| `OR1K_SPR_DSR_TE`    | `13`      |

:Debug Stop Register

| **Name**             | **Value** |
|:---------------------|:----------|
| `OR1K_SPR_DRR_RSTE`  | `0`       |
| `OR1K_SPR_DRR_BUSEE` | `1`       |
| `OR1K_SPR_DRR_DPFE`  | `2`       |
| `OR1K_SPR_DRR_IPFE`  | `3`       |
| `OR1K_SPR_DRR_TTE`   | `4`       |
| `OR1K_SPR_DRR_AE`    | `5`       |
| `OR1K_SPR_DRR_IIE`   | `6`       |
| `OR1K_SPR_DRR_IE`    | `7`       |
| `OR1K_SPR_DRR_DME`   | `8`       |
| `OR1K_SPR_DRR_IME`   | `9`       |
| `OR1K_SPR_DRR_RE`    | `10`      |
| `OR1K_SPR_DRR_SCE`   | `11`      |
| `OR1K_SPR_DRR_FPE`   | `12`      |
| `OR1K_SPR_DRR_TE`    | `13`      |

| **Name**          | **Value** |
|:------------------|:----------|
| `OR1K_FPCSR_FPEE` | `0`       |
| `OR1K_FPCSR_RM`   | `2:1`     |
| `OR1K_FPCSR_OVF`  | `3`       |
| `OR1K_FPCSR_UNF`  | `4`       |
| `OR1K_FPCSR_SNF`  | `5`       |
| `OR1K_FPCSR_QNF`  | `6`       |
| `OR1K_FPCSR_ZF`   | `7`       |
| `OR1K_FPCSR_IXF`  | `8`       |
| `OR1K_FPCSR_IVF`  | `9`       |
| `OR1K_FPCSR_INF`  | `10`      |
| `OR1K_FPCSR_DZF`  | `11`      |

:FPCSR bits

| **Name**               | **Value** | **Observation** |
|:-----------------------|:----------|:----------------|
| `OR1K_FPCSR_WIDTH`     | `12`      | `[11:0]`        |
| `OR1K_FPCSR_RM_SIZE`   | `2`       |                 |
| `OR1K_FPCSR_ALLF_SIZE` | `9`       | `[11:3]`        |

:FPCSR sizes of fields

| **Name**          | **Value**                       |
|:------------------|:--------------------------------|
| `OR1K_FPCSR_ALLF` | `OR1K_FPCSR_DZF:OR1K_FPCSR_OVF` |

:FPCSR flags

| **Name**                 | **Value**             |
|:-------------------------|:----------------------|
| `OR1K_FPCSR_RESET_VALUE` | `OR1K_FPCSR_WIDTH'd0` |

:FPCSR reset value

| `OR1K_FPCSR_MASK_FLAGS` |

:FPCSR extention: maskable FPU flags

| **Name**              | **Value** |
|:----------------------|:----------|
| `OR1K_FPCSR_MASK_OVF` | `12`      |
| `OR1K_FPCSR_MASK_UNF` | `13`      |
| `OR1K_FPCSR_MASK_SNF` | `14`      |
| `OR1K_FPCSR_MASK_QNF` | `15`      |
| `OR1K_FPCSR_MASK_ZF`  | `16`      |
| `OR1K_FPCSR_MASK_IXF` | `17`      |
| `OR1K_FPCSR_MASK_IVF` | `18`      |
| `OR1K_FPCSR_MASK_INF` | `19`      |
| `OR1K_FPCSR_MASK_DZF` | `20`      |

| **Name**              | **Value**                                 |
|:----------------------|:------------------------------------------|
| `OR1K_FPCSR_MASK_ALL` | `OR1K_FPCSR_MASK_DZF:OR1K_FPCSR_MASK_OVF` |

:bus select

| **Name**                      | **Value**                 |
|:------------------------------|:--------------------------|
| `OR1K_FPCSR_MASK_RESET_VALUE` | `OR1K_FPCSR_ALLF_SIZE'd0` |

:reset value

| **Name**           | **Value** |
|:-------------------|:----------|
| `OR1K_PCMR_CP`     | `0`       |
| `OR1K_PCMR_RSVD_1` | `1`       |
| `OR1K_PCMR_CISM`   | `2`       |
| `OR1K_PCMR_CIUM`   | `3`       |
| `OR1K_PCMR_LA`     | `4`       |
| `OR1K_PCMR_SA`     | `5`       |
| `OR1K_PCMR_IF`     | `6`       |
| `OR1K_PCMR_DCM`    | `7`       |
| `OR1K_PCMR_ICM`    | `8`       |
| `OR1K_PCMR_IFS`    | `9`       |
| `OR1K_PCMR_LSUS`   | `10`      |
| `OR1K_PCMR_BS`     | `11`      |
| `OR1K_PCMR_DTLBM`  | `12`      |
| `OR1K_PCMR_ITLBM`  | `13`      |
| `OR1K_PCMR_DDS`    | `14`      |
| `OR1K_PCMR_WPE`    | `25:15`   |
| `OR1K_PCMR_RSVD_2` | `31:26`   |

:PCU PCMR bits

| **Name**                    | **Value**                   |
|:----------------------------|:----------------------------|
| `MOR1KX_SPR_SR_WIDTH`       | `16`                        |
| `MOR1KX_SPR_SR_RESET_VALUE` | `MOR1KX_SPR_SR_WIDTH'h8001` |

:Implementation-specific SPR defines

| **Name**              | **Value** |
|:----------------------|:----------|
| `OR1K_RESET_VECTOR`   | `5'h01`   |
| `OR1K_BERR_VECTOR`    | `5'h02`   |
| `OR1K_DPF_VECTOR`     | `5'h03`   |
| `OR1K_IPF_VECTOR`     | `5'h04`   |
| `OR1K_TT_VECTOR`      | `5'h05`   |
| `OR1K_ALIGN_VECTOR`   | `5'h06`   |
| `OR1K_ILLEGAL_VECTOR` | `5'h07`   |
| `OR1K_INT_VECTOR`     | `5'h08`   |
| `OR1K_DTLB_VECTOR`    | `5'h09`   |
| `OR1K_ITLB_VECTOR`    | `5'h0a`   |
| `OR1K_RANGE_VECTOR`   | `5'h0b`   |
| `OR1K_SYSCALL_VECTOR` | `5'h0c`   |
| `OR1K_FP_VECTOR`      | `5'h0d`   |
| `OR1K_TRAP_VECTOR`    | `5'h0e`   |

:Exception addresses

Whether we'll allow things using AYNC reset to have it

| **Name**                      |
|:------------------------------|
| `OR_ASYNC_RST or posedge rst` |
| `OR_ASYNC_RST`                |

| **Name**       | **Value** |
|:---------------|:----------|
| `MOR1KX_CPUID` | `8'h01`   |

:Implementation version defines

OR1K breaks up the VR2 version register to be 3 8-bit fields MSB is major version, middle byte is minor version number and final byte is the pipeline identifier

| **Name**               | **Value** |
|:-----------------------|:----------|
| `MOR1KX_VERSION_MAJOR` | `8'd5`    |
| `MOR1KX_VERSION_MINOR` | `8'd0`    |

| **Name**                       | **Value** |
|:-------------------------------|:----------|
| `MOR1KX_PIPEID_CAPPUCCINO`     | `8'd1`    |
| `MOR1KX_PIPEID_ESPRESSO`       | `8'd2`    |
| `MOR1KX_PIPEID_PRONTOESPRESSO` | `8'd3`    |

:or1k implementation-specific register definitions
