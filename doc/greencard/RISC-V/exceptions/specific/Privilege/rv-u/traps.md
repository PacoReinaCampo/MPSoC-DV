## TRAPS

Format of a line in the table:

`<csr number> <csr access> <csr name> "<csr description>" <version>`

`<access> is one of urw, uro, srw, sro, hrw, hro, mrw, mro`

`<version> is [introduced]-[deprecated]`

| **number** | **access** | **name**  | **description**                  | **version** |
|:-----------|:-----------|:----------|:---------------------------------|:------------|
| `0x000`    | `urw`      | `ustatus` | `User status register`           | `1.9-`      |
| `0x004`    | `urw`      | `uie`     | `User interrupt-enable register` | `1.9-`      |
| `0x005`    | `urw`      | `utvec`   | `User trap handler base address` | `1.9-`      |

:User Trap Setup

The configuration and setup details for traps and exceptions at the user level in the RISC-V architecture.

| **number** | **access** | **name**   | **description**                          | **version** |
|:-----------|:-----------|:-----------|:-----------------------------------------|:------------|
| `0x040`    | `urw`      | `uscratch` | `Scratch handler for user trap handlers` | `1.9-`      |
| `0x041`    | `urw`      | `uepc`     | `User exception program counter`         | `1.9-`      |
| `0x042`    | `urw`      | `ucause`   | `User trap cause`                        | `1.9-`      |
| `0x043`    | `urw`      | `ubadaddr` | `User bad address`                       | `1.7-1.9.1` |
| `0x043`    | `urw`      | `utval`    | `User bad address or instruction`        | `1.10-`     |
| `0x044`    | `urw`      | `uip`      | `User interrupt pending`                 | `1.9-`      |

:User Trap Handling

Details in this table cover how traps and exceptions are handled specifically within the user privilege level of the RISC-V ISA.
