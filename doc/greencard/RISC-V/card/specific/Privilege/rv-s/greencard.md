# GREENCARD

| **extension**  | **name**          | **encoding**                       | **variable-fields** | **match**    | **mask**     |
|----------------|-------------------|------------------------------------|---------------------|--------------|--------------|
| `rv_sdext`     | `dret`            | `01111011001000000000000001110011` | `-`                 | `0x7b200073` | `0xffffffff` |
| `rv_smrnmi`    | `mnret`           | `01110000001000000000000001110011` | `-`                 | `0x70200073` | `0xffffffff` |
| `rv_ssctr`     | `sctrclr`         | `00010000010000000000000001110011` | `-`                 | `0x10400073` | `0xffffffff` |
| `rv_s`         | `sfence_vma`      | `0001001----------000000001110011` | `rs1, rs2`          | `0x12000073` | `0xfe007fff` |
| `rv_s`         | `sret`            | `00010000001000000000000001110011` | `-`                 | `0x10200073` | `0xffffffff` |
| `rv_svinval_h` | `hinval_gvma`     | `0110011----------000000001110011` | `rs1, rs2`          | `0x66000073` | `0xfe007fff` |
| `rv_svinval_h` | `hinval_vvma`     | `0010011----------000000001110011` | `rs1, rs2`          | `0x26000073` | `0xfe007fff` |
| `rv_svinval`   | `sfence_inval_ir` | `00011000000100000000000001110011` | `-`                 | `0x18100073` | `0xffffffff` |
| `rv_svinval`   | `sfence_w_inval`  | `00011000000000000000000001110011` | `-`                 | `0x18000073` | `0xffffffff` |
| `rv_svinval`   | `sinval_vma`      | `0001011----------000000001110011` | `rs1, rs2`          | `0x16000073` | `0xfe007fff` |
| `rv_system`    | `mret`            | `00110000001000000000000001110011` | `-`                 | `0x30200073` | `0xffffffff` |
| `rv_system`    | `wfi`             | `00010000010100000000000001110011` | `-`                 | `0x10500073` | `0xffffffff` |

:RVS - Specific Extension for Supervisor-level Instructions
