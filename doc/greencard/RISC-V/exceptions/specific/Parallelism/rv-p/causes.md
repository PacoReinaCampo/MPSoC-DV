## CAUSES

| **Interrupt** | **Exception Code** | **Description**                           |
|:--------------|:-------------------|:------------------------------------------|
| `1`           | `0`                | `Reserved`                                |
| `1`           | `1`                | `Supervisor software interrupt`           |
| `1`           | `2`                | `Virtual supervisor software interrupt`   |
| `1`           | `3`                | `Machine software interrupt`              |
| `1`           | `4`                | `Reserved`                                |
| `1`           | `5`                | `Supervisor timer interrupt`              |
| `1`           | `6`                | `Virtual supervisor timer interrupt`      |
| `1`           | `7`                | `Machine timer interrupt`                 |
| `1`           | `8`                | `Reserved`                                |
| `1`           | `9`                | `Supervisor external interrupt`           |
| `1`           | `10`               | `Virtual supervisor external interrupt`   |
| `1`           | `11`               | `Machine external interrupt`              |
| `1`           | `12`               | `Supervisor guest external interrupt`     |
| `1`           | `13`               | `Counter-overflow interrupt`              |
| `1`           | `14-15`            | `Reserved`                                |
| `1`           | `≥16`              | `Designated for platform use`             |
| `0`           | `0`                | `Instruction address misaligned`          |
| `0`           | `1`                | `Instruction access fault`                |
| `0`           | `2`                | `Illegal instruction`                     |
| `0`           | `3`                | `Breakpoint`                              |
| `0`           | `4`                | `Load address misaligned`                 |
| `0`           | `5`                | `Load access fault`                       |
| `0`           | `6`                | `Store/AMO address misaligned`            |
| `0`           | `7`                | `Store/AMO access fault`                  |
| `0`           | `8`                | `Environment call from U-mode or VU-mode` |
| `0`           | `9`                | `Environment call from HS-mode`           |
| `0`           | `10`               | `Environment call from VS-mode`           |
| `0`           | `11`               | `Environment call from M-mode`            |
| `0`           | `12`               | `Instruction page fault`                  |
| `0`           | `13`               | `Load page fault`                         |
| `0`           | `14`               | `Reserved`                                |
| `0`           | `15`               | `Store/AMO page fault`                    |
| `0`           | `16`               | `Double trap`                             |
| `0`           | `17`               | `Reserved`                                |
| `0`           | `18`               | `Software check`                          |
| `0`           | `19`               | `Hardware error`                          |
| `0`           | `20`               | `Instruction guest-page fault`            |
| `0`           | `21`               | `Load guest-page fault`                   |
| `0`           | `22`               | `Virtual instruction`                     |
| `0`           | `23`               | `Store/AMO guest-page fault`              |
| `0`           | `24-31`            | `Designated for custom use`               |
| `0`           | `32-47`            | `Reserved`                                |
| `0`           | `48-63`            | `Designated for custom use`               |
| `0`           | `≥64`              | `Reserved`                                |

: Trap Cause Code
