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
| `Matrix of bytes`                   | `8`               | `64`             | `X000`                 |
| `Matrix of halfwords`               | `8`               | `64`             | `X000`                 |
| `Matrix of singlewords`             | `8`               | `64`             | `X000`                 |
| `Matrix of single precision floats` | `8`               | `64`             | `X000`                 |

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

| `Matrix Type`                                                 | `Sizeof` | `Alignment (Bytes)` | `OpenRISC Equivalent`            |
|---------------------------------------------------------------|----------|---------------------|----------------------------------|
| `Matrix char Matrix signed char`                              | `8`      | `8`                 | `Matrix of signed bytes`         |
| `Matrix unsigned char`                                        | `8`      | `8`                 | `Matrix of unsigned bytes`       |
| `Matrix short Matrix signed short`                            | `8`      | `8`                 | `Matrix of signed halfwords`     |
| `Matrix unsigned short`                                       | `8`      | `8`                 | `Matrix of unsigned halfwords`   |
| `Matrix int Matrix signed int Matrix long Matrix signed long` | `8`      | `8`                 | `Matrix of signed singlewords`   |
| `Matrix unsigned int`                                         | `8`      | `8`                 | `Matrix of unsigned singlewords` |
| `Matrix float`                                                | `8`      | `8`                 | `Matrix of single-precisions`    |

: Matrix Types

### Instruction Formats

| `OPC`  | `Instruction`                      | `Mnemonic`    | `Function`                                                                       | `Class` |
|--------|------------------------------------|---------------|----------------------------------------------------------------------------------|---------|
| `0x0A` | `001010------------------1100----` | `lw.cust1`    | `Reserved for Custom Matrix Instructions`                                        | `II`    |
| `0x0A` | `001010------------------1101----` | `lw.cust2`    | `Reserved for Custom Matrix Instructions`                                        | `II`    |
| `0x0A` | `001010------------------1110----` | `lw.cust3`    | `Reserved for Custom Matrix Instructions`                                        | `II`    |
| `0x0A` | `001010------------------1111----` | `lw.cust4`    | `Reserved for Custom Matrix Instructions`                                        | `II`    |
| `0x0A` | `001010DDDDDAAAAABBBBB---00010000` | `lw.all_eq.b` | `Matrix Byte Elements All Equal`                                                 | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00010001` | `lw.all_eq.h` | `Matrix Half-Word Elements All Equal`                                            | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00010010` | `lw.all_ge.b` | `Matrix Byte Elements All Greater Than or Equal To`                              | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00010011` | `lw.all_ge.h` | `Matrix Half-Word Elements All Greater Than or Equal To`                         | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00010100` | `lw.all_gt.b` | `Matrix Byte Elements All Greater Than`                                          | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00010101` | `lw.all_gt.h` | `Matrix Half-Word Elements All Greater Than`                                     | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00010110` | `lw.all_le.b` | `Matrix Byte Elements All Less Than or Equal To`                                 | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00010111` | `lw.all_le.h` | `Matrix Half-Word Elements All Less Than or Equal To`                            | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00011000` | `lw.all_lt.b` | `Matrix Byte Elements All Less Than`                                             | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00011001` | `lw.all_lt.h` | `Matrix Half-Word Elements All Less Than`                                        | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00011010` | `lw.all_ne.b` | `Matrix Byte Elements All Not Equal`                                             | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00011011` | `lw.all_ne.h` | `Matrix Half-Word Elements All Not Equal`                                        | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00100000` | `lw.any_eq.b` | `Matrix Byte Elements Any Equal`                                                 | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00100001` | `lw.any_eq.h` | `Matrix Half-Word Elements Any Equal`                                            | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00100010` | `lw.any_ge.b` | `Matrix Byte Elements Any Greater Than or Equal To`                              | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00100011` | `lw.any_ge.h` | `Matrix Half-Word Elements Any Greater Than or Equal To`                         | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00100100` | `lw.any_gt.b` | `Matrix Byte Elements Any Greater Than`                                          | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00100101` | `lw.any_gt.h` | `Matrix Half-Word Elements Any Greater Than`                                     | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00100110` | `lw.any_le.b` | `Matrix Byte Elements Any Less Than or Equal To`                                 | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00100111` | `lw.any_le.h` | `Matrix Half-Word Elements Any Less Than or Equal To`                            | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00101000` | `lw.any_lt.b` | `Matrix Byte Elements Any Less Than`                                             | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00101001` | `lw.any_lt.h` | `Matrix Half-Word Elements Any Less Than`                                        | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00101010` | `lw.any_ne.b` | `Matrix Byte Elements Any Not Equal`                                             | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00101011` | `lw.any_ne.h` | `Matrix Half-Word Elements Any Not Equal`                                        | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00110000` | `lw.add.b`    | `Matrix Byte Elements Add Signed`                                                | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00110001` | `lw.add.h`    | `Matrix Half-Word Elements Add Signed`                                           | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00110010` | `lw.adds.b`   | `Matrix Byte Elements Add Signed Saturated`                                      | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00110011` | `lw.adds.h`   | `Matrix Half-Word Elements Add Signed Saturated`                                 | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00110100` | `lw.addu.b`   | `Matrix Byte Elements Add Unsigned`                                              | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00110101` | `lw.addu.h`   | `Matrix Half-Word Elements Add Unsigned`                                         | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00110110` | `lw.addus.b`  | `Matrix Byte Elements Add Unsigned Saturated`                                    | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00110111` | `lw.addus.h`  | `Matrix Half-Word Elements Add Unsigned Saturated`                               | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00111000` | `lw.and`      | `Matrix And`                                                                     | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00111001` | `lw.avg.b`    | `Matrix Byte Elements Average`                                                   | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00111010` | `lw.avg.h`    | `Matrix Half-Word Elements Average`                                              | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01000000` | `lw.cmp_eq.b` | `Matrix Byte Elements Compare Equal`                                             | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01000001` | `lw.cmp_eq.h` | `Matrix Half-Word Elements Compare Equal`                                        | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01000010` | `lw.cmp_ge.b` | `Matrix Byte Elements Compare Greater Than or Equal To`                          | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01000011` | `lw.cmp_ge.h` | `Matrix Half-Word Elements Compare Greater Than or Equal To`                     | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01000100` | `lw.cmp_gt.b` | `Matrix Byte Elements Compare Greater Than`                                      | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01000101` | `lw.cmp_gt.h` | `Matrix Half-Word Elements Compare Greater Than`                                 | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01000110` | `lw.cmp_le.b` | `Matrix Byte Elements Compare Less Than or Equal To`                             | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01000111` | `lw.cmp_le.h` | `Matrix Half-Word Elements Compare Less Than or Equal To`                        | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01001000` | `lw.cmp_lt.b` | `Matrix Byte Elements Compare Less Than`                                         | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01001001` | `lw.cmp_lt.h` | `Matrix Half-Word Elements Compare Less Than`                                    | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01001010` | `lw.cmp_ne.b` | `Matrix Byte Elements Compare Not Equal`                                         | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01001011` | `lw.cmp_ne.h` | `Matrix Half-Word Elements Compare Not Equal`                                    | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01010100` | `lw.madds.h`  | `Matrix Half-Word Elements Multiply Add Signed Saturated`                        | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01010101` | `lw.max.b`    | `Matrix Byte Elements Maximum`                                                   | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01010110` | `lw.max.h`    | `Matrix Half-Word Elements Maximum`                                              | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01010111` | `lw.merge.b`  | `Matrix Byte Elements Merge`                                                     | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01011000` | `lw.merge.h`  | `Matrix Half-Word Elements Merge`                                                | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01011001` | `lw.min.b`    | `Matrix Byte Elements Minimum`                                                   | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01011010` | `lw.min.h`    | `Matrix Half-Word Elements Minimum`                                              | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01011011` | `lw.msubs.h`  | `Matrix Half-Word Elements Multiply Subtract Signed Saturated`                   | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01011100` | `lw.muls.h`   | `Matrix Half-Word Elements Multiply Signed Saturated`                            | `II`    |
| `0x0A` | `001010DDDDDAAAAABBBBB---01011101` | `lw.nand`     | `Matrix Not And`                                                                 | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01011110` | `lw.nor`      | `Matrix Not Or`                                                                  | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01011111` | `lw.or`       | `Matrix Or`                                                                      | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01100000` | `lw.pack.b`   | `Matrix Byte Elements Pack`                                                      | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01100001` | `lw.pack.h`   | `Matrix Half-word Elements Pack`                                                 | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01100010` | `lw.packs.b`  | `Matrix Byte Elements Pack Signed Saturated`                                     | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01100011` | `lw.packs.h`  | `Matrix Half-word Elements Pack Signed Saturated`                                | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01100100` | `lw.packus.b` | `Matrix Byte Elements Pack Unsigned Saturated`                                   | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01100101` | `lw.packus.h` | `Matrix Half-word Elements Pack Unsigned Saturated`                              | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01100110` | `lw.perm.n`   | `Matrix Nibble Elements Permute`                                                 | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01100111` | `lw.rl.b`     | `Matrix Byte Elements Rotate Left`                                               | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01101000` | `lw.rl.h`     | `Matrix Half-Word Elements Rotate Left`                                          | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01101001` | `lw.sll.b`    | `Matrix Byte Elements Shift Left Logical`                                        | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01101010` | `lw.sll.h`    | `Matrix Half-Word Elements Shift Left Logical`                                   | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01101011` | `lw.sll`      | `Matrix Shift Left Logical`                                                      | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01101100` | `lw.srl.b`    | `Matrix Byte Elements Shift Right Logical`                                       | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01101101` | `lw.srl.h`    | `Matrix Half-Word Elements Shift Right Logical`                                  | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01101110` | `lw.sra.b`    | `Matrix Byte Elements Shift Right Arithmetic`                                    | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01101111` | `lw.sra.h`    | `Matrix Half-Word Elements Shift Right Arithmetic`                               | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01110000` | `lw.srl`      | `Matrix Shift Right Logical`                                                     | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01110001` | `lw.sub.b`    | `Matrix Byte Elements Subtract Signed`                                           | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01110010` | `lw.sub.h`    | `Matrix Half-Word Elements Subtract Signed`                                      | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01110011` | `lw.subs.b`   | `Matrix Byte Elements Subtract Signed Saturated`                                 | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01110100` | `lw.subs.h`   | `Matrix Half-Word Elements Subtract Signed Saturated`                            | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01110101` | `lw.subu.b`   | `Matrix Byte Elements Subtract Unsigned`                                         | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01110110` | `lw.subu.h`   | `Matrix Half-Word Elements Subtract Unsigned`                                    | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01110111` | `lw.subus.b`  | `Matrix Byte Elements Subtract Unsigned Saturated`                               | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01111000` | `lw.subus.h`  | `Matrix Half-Word Elements Subtract Unsigned Saturated`                          | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01111001` | `lw.unpack.b` | `Matrix Byte Elements Unpack`                                                    | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01111010` | `lw.unpack.h` | `Matrix Half-Word Elements Unpack`                                               | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01111011` | `lw.xor`      | `Matrix Exclusive Or`                                                            | `I`     |

: ORWDX32, ORWDX64 Instructions
