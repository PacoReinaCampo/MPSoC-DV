## INSTRUCTION PSEUDO-CODE

Format of a line in the table:

`<instruction name> "<instruction pseudo-code>"`

| instruction name       | instruction pseudo-code                                                                 |
|------------------------|:----------------------------------------------------------------------------------------|
| `lf.add.d rD,rA,rB`    | `N/A`                                                                                   |
| `lf.add.s rD,rA,rB`    | `rD[31:0] <- rA[31:0] + rB[31:0]`                                                       |
| `lf.cust1.d rA,rB`     | `N/A`                                                                                   |
| `lf.cust1.s rA,rB`     | `N/A`                                                                                   |
| `lf.div.d rD,rA,rB`    | `N/A`                                                                                   |
| `lf.div.s rD,rA,rB`    | `rD[31:0] <- rA[31:0] / rB[31:0]`                                                       |
| `lf.ftoi.d rD,rA`      | `N/A`                                                                                   |
| `lf.ftoi.s rD,rA`      | `rD[31:0] <- ftoi(rA[31:0])`                                                            |
| `lf.itof.d rD,rA`      | `N/A`                                                                                   |
| `lf.itof.s rD,rA`      | `rD[31:0] <- itof(rA[31:0])`                                                            |
| `lf.madd.d rD,rA,rB`   | `N/A`                                                                                   |
| `lf.madd.s rD,rA,rB`   | `FPMADDHI[31:0]FPMADDLO[31:0] <- rA[31:0] * rB[31:0] + FPMADDHI[31:0]FPMADDLO[31:0]`    |
| `lf.mul.d rD,rA,rB`    | `N/A`                                                                                   |
| `lf.mul.s rD,rA,rB`    | `rD[31:0] <- rA[31:0] * rB[31:0]`                                                       |
| `lf.rem.d rD,rA,rB`    | `N/A`                                                                                   |
| `lf.rem.s rD,rA,rB`    | `rD[31:0] <- rA[31:0] % rB[31:0]`                                                       |
| `lf.sfeq.d rA,rB`      | `N/A`                                                                                   |
| `lf.sfeq.s rA,rB`      | `SR[F] <- rA[31:0] == rB[31:0]`                                                         |
| `lf.sfge.d rA,rB`      | `N/A`                                                                                   |
| `lf.sfge.s rA,rB`      | `SR[F] <- rA[31:0] >= rB[31:0]`                                                         |
| `lf.sfgt.d rA,rB`      | `N/A`                                                                                   |
| `lf.sfgt.s rA,rB`      | `SR[F] <- rA[31:0] > rB[31:0]`                                                          |
| `lf.sfle.d rA,rB`      | `N/A`                                                                                   |
| `lf.sfle.s rA,rB`      | `SR[F] <- rA[31:0] <= rB[31:0]`                                                         |
| `lf.sflt.d rA,rB`      | `N/A`                                                                                   |
| `lf.sflt.s rA,rB`      | `SR[F] <- rA[31:0] < rB[31:0]`                                                          |
| `lf.sfne.d rA,rB`      | `N/A`                                                                                   |
| `lf.sfne.s rA,rB`      | `SR[F] <- rA[31:0] != rB[31:0]`                                                         |
| `lf.sub.d rD,rA,rB`    | `N/A`                                                                                   |
| `lf.sub.s rD,rA,rB`    | `rD[31:0] <- rA[31:0] - rB[31:0]`                                                       |

:OpenRISC 32-Bit - "OpenRISC 32-Bit Double Floating-Point Extension Instruction Set"
