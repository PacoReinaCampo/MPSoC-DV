## CONTROL AND STATUS REGISTER FIELDS

Control and Status Register Fields (CSRFs) define specific bit-fields within CSRs, encoding various control and status information. These fields are used to enable or disable features, set mode flags, and report processor status to software. CSRFs are carefully defined to provide fine-grained control over processor behavior while maintaining compatibility across different RISC-V implementations. They are essential for implementing features such as virtual memory management, interrupt handling, and power management within the processor architecture.

Format of a line in the table:

`<csr> <field> <bitspec> <modes> "<field description>" <version>`

| **csr**  | **field** | **bitspec** | **modes** | **field description**                    | **version** |
|:---------|:----------|:------------|:----------|:-----------------------------------------|:------------|
| `status` | `ie`      | `0`         | `m`       | `Interrupt Enable Stack 0`               | `1.7`       |
| `status` | `prv`     | `2:1`       | `m`       | `Privilege Mode Stack 0`                 | `1.7`       |
| `status` | `ie1`     | `3`         | `m`       | `Interrupt Enable Stack 1`               | `1.7`       |
| `status` | `prv1`    | `5:4`       | `m`       | `Privilege Mode Stack 1`                 | `1.7`       |
| `status` | `ie2`     | `6`         | `m`       | `Interrupt Enable Stack 2`               | `1.7`       |
| `status` | `prv2`    | `8:7`       | `m`       | `Privilege Mode Stack 2`                 | `1.7`       |
| `status` | `ie3`     | `9`         | `m`       | `Interrupt Enable Stack 3`               | `1.7`       |
| `status` | `prv3`    | `11:10`     | `m`       | `Privilege Mode Stack 3`                 | `1.7`       |
| `status` | `fs`      | `13:12`     | `mhs`     | `FPU register status`                    | `1.7`       |
| `status` | `xs`      | `15:14`     | `mhs`     | `Extension status`                       | `1.7`       |
| `status` | `mprv`    | `16`        | `m`       | `Data access at prv1 privilege level`    | `1.7`       |
| `status` | `vm`      | `21:17`     | `m`       | `Virtual Memory Mode`                    | `1.7`       |
| `status` | `uie`     | `0`         | `mhsu`    | `User mode Interrupt Enable`             | `1.9-`      |
| `status` | `sie`     | `1`         | `mhs`     | `Supervisor mode Interrupt Enable`       | `1.9-`      |
| `status` | `hie`     | `2`         | `mh`      | `Hypervisor mode Interrupt Enable`       | `1.9-`      |
| `status` | `mie`     | `3`         | `m`       | `Machine mode Interrupt Enable`          | `1.9-`      |
| `status` | `upie`    | `4`         | `mhsu`    | `Prior User mode Interrupt Enable`       | `1.9-`      |
| `status` | `spie`    | `5`         | `mhs`     | `Prior Supervisor mode Interrupt Enable` | `1.9-`      |
| `status` | `hpie`    | `6`         | `mh`      | `Prior Hypervisor mode Interrupt Enable` | `1.9-`      |
| `status` | `mpie`    | `7`         | `m`       | `Prior Machine mode Interrupt Enable`    | `1.9-`      |
| `status` | `spp`     | `8`         | `mhs`     | `SRET pop privilege`                     | `1.9-`      |
| `status` | `hpp`     | `10:9`      | `mh`      | `HRET pop privilege`                     | `1.9-`      |
| `status` | `mpp`     | `12:11`     | `m`       | `MRET pop privilege`                     | `1.9-`      |
| `status` | `fs`      | `14:13`     | `mhs`     | `FPU register status`                    | `1.9-`      |
| `status` | `xs`      | `16:15`     | `mhs`     | `Extension status`                       | `1.9-`      |
| `status` | `mprv`    | `17`        | `m`       | `Data access at mpp privilege level`     | `1.9-`      |
| `status` | `pum`     | `18`        | `mhs`     | `Protect User Memory`                    | `1.9-1.9.1` |
| `status` | `sum`     | `18`        | `mhs`     | `Supervisor User Memory`                 | `1.10-`     |
| `status` | `mxr`     | `19`        | `m`       | `Make eXecute Readable`                  | `1.9-`      |
| `status` | `tvm`     | `20`        | `mhs`     | `Trap Virtual Memory`                    | `1.10-`     |
| `status` | `tw`      | `21`        | `mhs`     | `Timeout Wait`                           | `1.10-`     |
| `status` | `tsr`     | `22`        | `mhs`     | `Trap SRET`                              | `1.10-`     |
| `status` | `vm`      | `28:24`     | `m`       | `Virtual Memory Mode`                    | `1.9-1.9.1` |

:Machine Status

The status registers available at the machine privilege level, including their configuration and usage details, are outlined in this part.
 
| **csr** | **field** | **bitspec** | **modes** | **field description**                 | **version**      |
|:--------|:----------|:------------|:----------|:--------------------------------------|:-----------------|
| `ptbr`  | `base`    | `31:12`     | `s`       | `Page Table Base Register`            | `1.7,rv32`       |
| `ptbr`  | `base`    | `63:12`     | `s`       | `Page Table Base Register`            | `1.7,rv64`       |
| `ptbr`  | `ppn`     | `21:0`      | `s`       | `Page Table Base Register (PPN)`      | `1.9-1.9.1,rv32` |
| `ptbr`  | `asid`    | `31:22`     | `s`       | `Page Table Base Register (ASID)`     | `1.9-1.9.1,rv32` |
| `ptbr`  | `ppn`     | `37:0`      | `s`       | `Page Table Base Register (PPN)`      | `1.9-1.9.1,rv64` |
| `ptbr`  | `asid`    | `63:38`     | `s`       | `Page Table Base Register (ASID)`     | `1.9-1.9.1,rv64` |
| `atp`   | `ppn`     | `21:0`      | `s`       | `Address Translation Register (PPN)`  | `1.10,rv32`      |
| `atp`   | `asid`    | `30:22`     | `s`       | `Address Translation Register (ASID)` | `1.10,rv32`      |
| `atp`   | `mode`    | `31`        | `s`       | `Address Translation Register (Mode)` | `1.10,rv32`      |
| `atp`   | `ppn`     | `43:0`      | `s`       | `Address Translation Register (PPN)`  | `1.10,rv64`      |
| `atp`   | `asid`    | `59:44`     | `s`       | `Address Translation Register (ASID)` | `1.10,rv64`      |
| `atp`   | `mode`    | `63:60`     | `s`       | `Address Translation Register (Mode)` | `1.10,rv64`      |

:Address Translation

 This section provides details on the address translation mechanisms supported by the RISC-V ISA across different privilege levels.
 
| **csr** | **field** | **bitspec** | **modes** | **field description**                   | **version** |
|:--------|:----------|:------------|:----------|:----------------------------------------|:------------|
| `ip`    | `usip`    | `0`         | `mhsu`    | `User Software Interrupt Pending`       | `1.9-`      |
| `ip`    | `ssip`    | `1`         | `mhs`     | `Supervisor Software Interrupt Pending` | `1.9-`      |
| `ip`    | `hsip`    | `2`         | `mh`      | `Hypervisor Software Interrupt Pending` | `1.9-`      |
| `ip`    | `msip`    | `3`         | `m`       | `Machine Software Interrupt Pending`    | `1.9-`      |
| `ip`    | `utip`    | `4`         | `mhsu`    | `User Timer Interrupt Pending`          | `1.9-`      |
| `ip`    | `stip`    | `5`         | `mhs`     | `Supervisor Timer Interrupt Pending`    | `1.9-`      |
| `ip`    | `htip`    | `6`         | `mh`      | `Hypervisor Timer Interrupt Pending`    | `1.9-`      |
| `ip`    | `mtip`    | `7`         | `m`       | `Machine Timer Interrupt Pending`       | `1.9-`      |
| `ip`    | `ueip`    | `8`         | `mhsu`    | `User External Interrupt Pending`       | `1.9-`      |
| `ip`    | `seip`    | `9`         | `mhs`     | `Supervisor External Interrupt Pending` | `1.9-`      |
| `ip`    | `heip`    | `10`        | `mh`      | `Hypervisor External Interrupt Pending` | `1.9-`      |
| `ip`    | `meip`    | `11`        | `m`       | `Machine External Interrupt Pending`    | `1.9-`      |

:Machine Interrupt Pending

 Registers indicating pending interrupts at the machine privilege level are listed and described in this table.
 
| **csr** | **field** | **bitspec** | **modes** | **field description**                  | **version** |
|:--------|:----------|:------------|:----------|:---------------------------------------|:------------|
| `ie`    | `usie`    | `0`         | `mhsu`    | `User Software Interrupt Enable`       | `1.9-`      |
| `ie`    | `ssie`    | `1`         | `mhs`     | `Supervisor Software Interrupt Enable` | `1.9-`      |
| `ie`    | `hsie`    | `2`         | `mh`      | `Hypervisor Software Interrupt Enable` | `1.9-`      |
| `ie`    | `msie`    | `3`         | `m`       | `Machine Software Interrupt Enable`    | `1.9-`      |
| `ie`    | `utie`    | `4`         | `mhsu`    | `User Timer Interrupt Enable`          | `1.9-`      |
| `ie`    | `stie`    | `5`         | `mhs`     | `Supervisor Timer Interrupt Enable`    | `1.9-`      |
| `ie`    | `htie`    | `6`         | `mh`      | `Hypervisor Timer Interrupt Enable`    | `1.9-`      |
| `ie`    | `mtie`    | `7`         | `m`       | `Machine Timer Interrupt Enable`       | `1.9-`      |
| `ie`    | `ueie`    | `8`         | `mhsu`    | `User External Interrupt Enable`       | `1.9-`      |
| `ie`    | `seie`    | `9`         | `mhs`     | `Supervisor External Interrupt Enable` | `1.9-`      |
| `ie`    | `heie`    | `10`        | `mh`      | `Hypervisor External Interrupt Enable` | `1.9-`      |
| `ie`    | `meie`    | `11`        | `m`       | `Machine External Interrupt Enable`    | `1.9-`      |

:Machine Interrupt Enable

 This section covers registers that control interrupt enablement and masking at the machine privilege level in the RISC-V ISA.
