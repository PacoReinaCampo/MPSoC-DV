## FORMATS

### Data Formats

| `Type of Data`                      | `Length in Bytes` | `Length in Bits` | `addr[3:0] if aligned` |
|-------------------------------------|-------------------|------------------|------------------------|
| `Byte`                              | `1`               | `8`              | `Xxxx`                 |
| `Halfword (or half)`                | `2`               | `16`             | `Xxx0`                 |
| `Singleword (or word)`              | `4`               | `32`             | `Xx00`                 |
| `Doubleword (or double)`            | `8`               | `64`             | `X000`                 |
| `Single precision float`            | `4`               | `32`             | `Xx00`                 |
| `Double precision float`            | `8`               | `64`             | `X000`                 |
| `Vector of bytes`                   | `8`               | `64`             | `X000`                 |
| `Vector of halfwords`               | `8`               | `64`             | `X000`                 |
| `Vector of singlewords`             | `8`               | `64`             | `X000`                 |
| `Vector of single precision floats` | `8`               | `64`             | `X000`                 |

: Memory Operands and their Sizes

| `Type`           | `C Type`                               | `Sizeof` | `Alignment (Bytes)` | `OpenRISC Equivalent`    |
|------------------|----------------------------------------|----------|---------------------|--------------------------|
| `Integral`       | `char signed char`                     | `1`      | `1`                 | `Signed byte`            |
|                  | `unsigned char`                        | `1`      | `1`                 | `Unsigned byte`          |
|                  | `short signed short`                   | `2`      | `2`                 | `Signed halfword`        |
|                  | `unsigned short`                       | `2`      | `2`                 | `Unsigned halfword`      |
|                  | `int signed int long signed long enum` | `4`      | `4`                 | `Signed singleword`      |
|                  | `unsigned int`                         | `4`      | `4`                 | `Unsigned singleword`    |
|                  | `long long signed long long`           | `8`      | `4`                 | `Signed doubleword`      |
|                  | `unsigned long long`                   | `8`      | `4`                 | `Unsigned doubleword`    |
| `Pointer`        | `Any-type * Any-type (*) ()`           | `4`      | `4`                 | `Unsigned singleword`    |
| `Floating-Point` | `float`                                | `4`      | `4`                 | `Single precision float` |
|                  | `double`                               | `8`      | `4`                 | `Double precision float` |

: Scalar Types

| `Vector Type`                                                 | `Sizeof` | `Alignment (Bytes)` | `OpenRISC Equivalent`            |
|---------------------------------------------------------------|----------|---------------------|----------------------------------|
| `Vector char Vector signed char`                              | `8`      | `8`                 | `Vector of signed bytes`         |
| `Vector unsigned char`                                        | `8`      | `8`                 | `Vector of unsigned bytes`       |
| `Vector short Vector signed short`                            | `8`      | `8`                 | `Vector of signed halfwords`     |
| `Vector unsigned short`                                       | `8`      | `8`                 | `Vector of unsigned halfwords`   |
| `Vector int Vector signed int Vector long Vector signed long` | `8`      | `8`                 | `Vector of signed singlewords`   |
| `Vector unsigned int`                                         | `8`      | `8`                 | `Vector of unsigned singlewords` |
| `Vector float`                                                | `8`      | `8`                 | `Vector of single-precisions`    |

: Vector Types

### Instruction Formats

| `OPC`  | `Instruction`                      | `Mnemonic`    | `Function`                                                                       | `Class` |
|--------|------------------------------------|---------------|----------------------------------------------------------------------------------|---------|
| `0x0A` | `001010------------------1100----` | `lv.cust1`    | `Reserved for Custom Vector Instructions`                                        | `II`    |
| `0x0A` | `001010------------------1101----` | `lv.cust2`    | `Reserved for Custom Vector Instructions`                                        | `II`    |
| `0x0A` | `001010------------------1110----` | `lv.cust3`    | `Reserved for Custom Vector Instructions`                                        | `II`    |
| `0x0A` | `001010------------------1111----` | `lv.cust4`    | `Reserved for Custom Vector Instructions`                                        | `II`    |
| `0x0A` | `001010DDDDDAAAAABBBBB---00010000` | `lv.all_eq.b` | `Vector Byte Elements All Equal`                                                 | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00010001` | `lv.all_eq.h` | `Vector Half-Word Elements All Equal`                                            | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00010010` | `lv.all_ge.b` | `Vector Byte Elements All Greater Than or Equal To`                              | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00010011` | `lv.all_ge.h` | `Vector Half-Word Elements All Greater Than or Equal To`                         | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00010100` | `lv.all_gt.b` | `Vector Byte Elements All Greater Than`                                          | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00010101` | `lv.all_gt.h` | `Vector Half-Word Elements All Greater Than`                                     | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00010110` | `lv.all_le.b` | `Vector Byte Elements All Less Than or Equal To`                                 | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00010111` | `lv.all_le.h` | `Vector Half-Word Elements All Less Than or Equal To`                            | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00011000` | `lv.all_lt.b` | `Vector Byte Elements All Less Than`                                             | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00011001` | `lv.all_lt.h` | `Vector Half-Word Elements All Less Than`                                        | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00011010` | `lv.all_ne.b` | `Vector Byte Elements All Not Equal`                                             | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00011011` | `lv.all_ne.h` | `Vector Half-Word Elements All Not Equal`                                        | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00100000` | `lv.any_eq.b` | `Vector Byte Elements Any Equal`                                                 | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00100001` | `lv.any_eq.h` | `Vector Half-Word Elements Any Equal`                                            | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00100010` | `lv.any_ge.b` | `Vector Byte Elements Any Greater Than or Equal To`                              | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00100011` | `lv.any_ge.h` | `Vector Half-Word Elements Any Greater Than or Equal To`                         | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00100100` | `lv.any_gt.b` | `Vector Byte Elements Any Greater Than`                                          | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00100101` | `lv.any_gt.h` | `Vector Half-Word Elements Any Greater Than`                                     | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00100110` | `lv.any_le.b` | `Vector Byte Elements Any Less Than or Equal To`                                 | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00100111` | `lv.any_le.h` | `Vector Half-Word Elements Any Less Than or Equal To`                            | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00101000` | `lv.any_lt.b` | `Vector Byte Elements Any Less Than`                                             | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00101001` | `lv.any_lt.h` | `Vector Half-Word Elements Any Less Than`                                        | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00101010` | `lv.any_ne.b` | `Vector Byte Elements Any Not Equal`                                             | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00101011` | `lv.any_ne.h` | `Vector Half-Word Elements Any Not Equal`                                        | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00110000` | `lv.add.b`    | `Vector Byte Elements Add Signed`                                                | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00110001` | `lv.add.h`    | `Vector Half-Word Elements Add Signed`                                           | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00110010` | `lv.adds.b`   | `Vector Byte Elements Add Signed Saturated`                                      | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00110011` | `lv.adds.h`   | `Vector Half-Word Elements Add Signed Saturated`                                 | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00110100` | `lv.addu.b`   | `Vector Byte Elements Add Unsigned`                                              | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00110101` | `lv.addu.h`   | `Vector Half-Word Elements Add Unsigned`                                         | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00110110` | `lv.addus.b`  | `Vector Byte Elements Add Unsigned Saturated`                                    | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00110111` | `lv.addus.h`  | `Vector Half-Word Elements Add Unsigned Saturated`                               | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00111000` | `lv.and`      | `Vector And`                                                                     | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00111001` | `lv.avg.b`    | `Vector Byte Elements Average`                                                   | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00111010` | `lv.avg.h`    | `Vector Half-Word Elements Average`                                              | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01000000` | `lv.cmp_eq.b` | `Vector Byte Elements Compare Equal`                                             | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01000001` | `lv.cmp_eq.h` | `Vector Half-Word Elements Compare Equal`                                        | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01000010` | `lv.cmp_ge.b` | `Vector Byte Elements Compare Greater Than or Equal To`                          | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01000011` | `lv.cmp_ge.h` | `Vector Half-Word Elements Compare Greater Than or Equal To`                     | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01000100` | `lv.cmp_gt.b` | `Vector Byte Elements Compare Greater Than`                                      | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01000101` | `lv.cmp_gt.h` | `Vector Half-Word Elements Compare Greater Than`                                 | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01000110` | `lv.cmp_le.b` | `Vector Byte Elements Compare Less Than or Equal To`                             | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01000111` | `lv.cmp_le.h` | `Vector Half-Word Elements Compare Less Than or Equal To`                        | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01001000` | `lv.cmp_lt.b` | `Vector Byte Elements Compare Less Than`                                         | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01001001` | `lv.cmp_lt.h` | `Vector Half-Word Elements Compare Less Than`                                    | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01001010` | `lv.cmp_ne.b` | `Vector Byte Elements Compare Not Equal`                                         | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01001011` | `lv.cmp_ne.h` | `Vector Half-Word Elements Compare Not Equal`                                    | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01010100` | `lv.madds.h`  | `Vector Half-Word Elements Multiply Add Signed Saturated`                        | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01010101` | `lv.max.b`    | `Vector Byte Elements Maximum`                                                   | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01010110` | `lv.max.h`    | `Vector Half-Word Elements Maximum`                                              | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01010111` | `lv.merge.b`  | `Vector Byte Elements Merge`                                                     | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01011000` | `lv.merge.h`  | `Vector Half-Word Elements Merge`                                                | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01011001` | `lv.min.b`    | `Vector Byte Elements Minimum`                                                   | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01011010` | `lv.min.h`    | `Vector Half-Word Elements Minimum`                                              | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01011011` | `lv.msubs.h`  | `Vector Half-Word Elements Multiply Subtract Signed Saturated`                   | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01011100` | `lv.muls.h`   | `Vector Half-Word Elements Multiply Signed Saturated`                            | `II`    |
| `0x0A` | `001010DDDDDAAAAABBBBB---01011101` | `lv.nand`     | `Vector Not And`                                                                 | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01011110` | `lv.nor`      | `Vector Not Or`                                                                  | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01011111` | `lv.or`       | `Vector Or`                                                                      | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01100000` | `lv.pack.b`   | `Vector Byte Elements Pack`                                                      | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01100001` | `lv.pack.h`   | `Vector Half-word Elements Pack`                                                 | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01100010` | `lv.packs.b`  | `Vector Byte Elements Pack Signed Saturated`                                     | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01100011` | `lv.packs.h`  | `Vector Half-word Elements Pack Signed Saturated`                                | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01100100` | `lv.packus.b` | `Vector Byte Elements Pack Unsigned Saturated`                                   | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01100101` | `lv.packus.h` | `Vector Half-word Elements Pack Unsigned Saturated`                              | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01100110` | `lv.perm.n`   | `Vector Nibble Elements Permute`                                                 | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01100111` | `lv.rl.b`     | `Vector Byte Elements Rotate Left`                                               | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01101000` | `lv.rl.h`     | `Vector Half-Word Elements Rotate Left`                                          | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01101001` | `lv.sll.b`    | `Vector Byte Elements Shift Left Logical`                                        | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01101010` | `lv.sll.h`    | `Vector Half-Word Elements Shift Left Logical`                                   | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01101011` | `lv.sll`      | `Vector Shift Left Logical`                                                      | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01101100` | `lv.srl.b`    | `Vector Byte Elements Shift Right Logical`                                       | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01101101` | `lv.srl.h`    | `Vector Half-Word Elements Shift Right Logical`                                  | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01101110` | `lv.sra.b`    | `Vector Byte Elements Shift Right Arithmetic`                                    | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01101111` | `lv.sra.h`    | `Vector Half-Word Elements Shift Right Arithmetic`                               | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01110000` | `lv.srl`      | `Vector Shift Right Logical`                                                     | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01110001` | `lv.sub.b`    | `Vector Byte Elements Subtract Signed`                                           | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01110010` | `lv.sub.h`    | `Vector Half-Word Elements Subtract Signed`                                      | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01110011` | `lv.subs.b`   | `Vector Byte Elements Subtract Signed Saturated`                                 | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01110100` | `lv.subs.h`   | `Vector Half-Word Elements Subtract Signed Saturated`                            | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01110101` | `lv.subu.b`   | `Vector Byte Elements Subtract Unsigned`                                         | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01110110` | `lv.subu.h`   | `Vector Half-Word Elements Subtract Unsigned`                                    | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01110111` | `lv.subus.b`  | `Vector Byte Elements Subtract Unsigned Saturated`                               | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01111000` | `lv.subus.h`  | `Vector Half-Word Elements Subtract Unsigned Saturated`                          | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01111001` | `lv.unpack.b` | `Vector Byte Elements Unpack`                                                    | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01111010` | `lv.unpack.h` | `Vector Half-Word Elements Unpack`                                               | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01111011` | `lv.xor`      | `Vector Exclusive Or`                                                            | `I`     |

: ORVDX32, ORVDX64 Instructions
