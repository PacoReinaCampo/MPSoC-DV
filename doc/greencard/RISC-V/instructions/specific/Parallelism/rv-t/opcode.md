## OPCODE ENCODING INFORMATION

| **Extension** | **Name**  | **Encoding**                       | **Variable-Fields** | **Match**    | **Mask**     |
|:--------------|:----------|:-----------------------------------|:--------------------|:-------------|:-------------|
| `rv_t`        | `tbegin`  | `00000000000000000000-----0001011` | `rd`                | `0x0000000b` | `0xfffff07f` |
| `rv_t`        | `tcommit` | `00000000000000000001000000001011` | `-`                 | `0x0000100b` | `0xffffffff` |
| `rv_t`        | `tabort`  | `------------00000010000000001011` | `uimm12`            | `0x0000200b` | `0x000fffff` |
| `rv_t`        | `ttest`   | `00000000000000000011-----0001011` | `rd`                | `0x0000300b` | `0xfffff07f` |

:RVT - Specific Extension for Transactional Memory Instructions
