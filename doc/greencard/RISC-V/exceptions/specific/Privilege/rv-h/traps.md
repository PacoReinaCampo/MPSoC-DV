## TRAPS

Format of a line in the table:

`<csr number> <csr access> <csr name> "<csr description>" <version>`

`<access> is one of urw, uro, srw, sro, hrw, hro, mrw, mro`

`<version> is [introduced]-[deprecated]`

| **number** | **access** | **name**  | **description**                            | **version** |
|:-----------|:-----------|:----------|:-------------------------------------------|:------------|
| `0x200`    | `hrw`      | `hstatus` | `Hypervisor status register`               | `1.7-1.9.1` |
| `0x202`    | `mrw`      | `hedeleg` | `Hypervisor exception delegation register` | `1.9-1.9.1` |
| `0x203`    | `mrw`      | `hideleg` | `Hypervisor interrupt delegation register` | `1.9-1.9.1` |
| `0x204`    | `mrw`      | `hie`     | `Hypervisor interrupt-enable register`     | `1.7-1.9.1` |
| `0x205`    | `hrw`      | `htvec`   | `Hypervisor trap handler base address`     | `1.7-1.9.1` |

:Hypervisor Trap Setup

Configuration details for traps and exceptions in the context of hypervisor mode are detailed in this part of the RISC-V ISA documentation.

| **number** | **access** | **name**   | **description**                                 | **version** |
|:-----------|:-----------|:-----------|:------------------------------------------------|:------------|
| `0x240`    | `hrw`      | `hscratch` | `Scratch register for hypervisor trap handlers` | `1.7-1.9.1` |
| `0x241`    | `hrw`      | `hepc`     | `Hypervisor exception program counter`          | `1.7-1.9.1` |
| `0x242`    | `hrw`      | `hcause`   | `Hypervisor trap cause`                         | `1.7-1.9.1` |
| `0x243`    | `hrw`      | `hbadaddr` | `Hypervisor bad address`                        | `1.7-1.9.1` |
| `0x244`    | `hrw`      | `hip`      | `Hypervisor interrupt pending`                  | `1.7-1.9.1` |

:Hypervisor Trap Handling

The procedures and methods for handling traps and exceptions in hypervisor mode are outlined and explained in this section.200
