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
| `Tensor of bytes`                   | `8`               | `64`             | `X000`                 |
| `Tensor of halfwords`               | `8`               | `64`             | `X000`                 |
| `Tensor of singlewords`             | `8`               | `64`             | `X000`                 |
| `Tensor of single precision floats` | `8`               | `64`             | `X000`                 |

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

| `Tensor Type`                                                 | `Sizeof` | `Alignment (Bytes)` | `OpenRISC Equivalent`            |
|---------------------------------------------------------------|----------|---------------------|----------------------------------|
| `Tensor char Tensor signed char`                              | `8`      | `8`                 | `Tensor of signed bytes`         |
| `Tensor unsigned char`                                        | `8`      | `8`                 | `Tensor of unsigned bytes`       |
| `Tensor short Tensor signed short`                            | `8`      | `8`                 | `Tensor of signed halfwords`     |
| `Tensor unsigned short`                                       | `8`      | `8`                 | `Tensor of unsigned halfwords`   |
| `Tensor int Tensor signed int Tensor long Tensor signed long` | `8`      | `8`                 | `Tensor of signed singlewords`   |
| `Tensor unsigned int`                                         | `8`      | `8`                 | `Tensor of unsigned singlewords` |
| `Tensor float`                                                | `8`      | `8`                 | `Tensor of single-precisions`    |

: Tensor Types

### Instruction Formats

| `OPC`  | `Instruction`                      | `Mnemonic`    | `Function`                                                                       | `Class` |
|--------|------------------------------------|---------------|----------------------------------------------------------------------------------|---------|
| `0x0A` | `001010------------------1100----` | `ly.cust1`    | `Reserved for Custom Tensor Instructions`                                        | `II`    |
| `0x0A` | `001010------------------1101----` | `ly.cust2`    | `Reserved for Custom Tensor Instructions`                                        | `II`    |
| `0x0A` | `001010------------------1110----` | `ly.cust3`    | `Reserved for Custom Tensor Instructions`                                        | `II`    |
| `0x0A` | `001010------------------1111----` | `ly.cust4`    | `Reserved for Custom Tensor Instructions`                                        | `II`    |
| `0x0A` | `001010DDDDDAAAAABBBBB---00010000` | `ly.all_eq.b` | `Tensor Byte Elements All Equal`                                                 | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00010001` | `ly.all_eq.h` | `Tensor Half-Word Elements All Equal`                                            | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00010010` | `ly.all_ge.b` | `Tensor Byte Elements All Greater Than or Equal To`                              | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00010011` | `ly.all_ge.h` | `Tensor Half-Word Elements All Greater Than or Equal To`                         | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00010100` | `ly.all_gt.b` | `Tensor Byte Elements All Greater Than`                                          | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00010101` | `ly.all_gt.h` | `Tensor Half-Word Elements All Greater Than`                                     | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00010110` | `ly.all_le.b` | `Tensor Byte Elements All Less Than or Equal To`                                 | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00010111` | `ly.all_le.h` | `Tensor Half-Word Elements All Less Than or Equal To`                            | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00011000` | `ly.all_lt.b` | `Tensor Byte Elements All Less Than`                                             | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00011001` | `ly.all_lt.h` | `Tensor Half-Word Elements All Less Than`                                        | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00011010` | `ly.all_ne.b` | `Tensor Byte Elements All Not Equal`                                             | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00011011` | `ly.all_ne.h` | `Tensor Half-Word Elements All Not Equal`                                        | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00100000` | `ly.any_eq.b` | `Tensor Byte Elements Any Equal`                                                 | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00100001` | `ly.any_eq.h` | `Tensor Half-Word Elements Any Equal`                                            | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00100010` | `ly.any_ge.b` | `Tensor Byte Elements Any Greater Than or Equal To`                              | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00100011` | `ly.any_ge.h` | `Tensor Half-Word Elements Any Greater Than or Equal To`                         | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00100100` | `ly.any_gt.b` | `Tensor Byte Elements Any Greater Than`                                          | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00100101` | `ly.any_gt.h` | `Tensor Half-Word Elements Any Greater Than`                                     | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00100110` | `ly.any_le.b` | `Tensor Byte Elements Any Less Than or Equal To`                                 | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00100111` | `ly.any_le.h` | `Tensor Half-Word Elements Any Less Than or Equal To`                            | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00101000` | `ly.any_lt.b` | `Tensor Byte Elements Any Less Than`                                             | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00101001` | `ly.any_lt.h` | `Tensor Half-Word Elements Any Less Than`                                        | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00101010` | `ly.any_ne.b` | `Tensor Byte Elements Any Not Equal`                                             | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00101011` | `ly.any_ne.h` | `Tensor Half-Word Elements Any Not Equal`                                        | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00110000` | `ly.add.b`    | `Tensor Byte Elements Add Signed`                                                | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00110001` | `ly.add.h`    | `Tensor Half-Word Elements Add Signed`                                           | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00110010` | `ly.adds.b`   | `Tensor Byte Elements Add Signed Saturated`                                      | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00110011` | `ly.adds.h`   | `Tensor Half-Word Elements Add Signed Saturated`                                 | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00110100` | `ly.addu.b`   | `Tensor Byte Elements Add Unsigned`                                              | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00110101` | `ly.addu.h`   | `Tensor Half-Word Elements Add Unsigned`                                         | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00110110` | `ly.addus.b`  | `Tensor Byte Elements Add Unsigned Saturated`                                    | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00110111` | `ly.addus.h`  | `Tensor Half-Word Elements Add Unsigned Saturated`                               | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00111000` | `ly.and`      | `Tensor And`                                                                     | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00111001` | `ly.avg.b`    | `Tensor Byte Elements Average`                                                   | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---00111010` | `ly.avg.h`    | `Tensor Half-Word Elements Average`                                              | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01000000` | `ly.cmp_eq.b` | `Tensor Byte Elements Compare Equal`                                             | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01000001` | `ly.cmp_eq.h` | `Tensor Half-Word Elements Compare Equal`                                        | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01000010` | `ly.cmp_ge.b` | `Tensor Byte Elements Compare Greater Than or Equal To`                          | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01000011` | `ly.cmp_ge.h` | `Tensor Half-Word Elements Compare Greater Than or Equal To`                     | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01000100` | `ly.cmp_gt.b` | `Tensor Byte Elements Compare Greater Than`                                      | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01000101` | `ly.cmp_gt.h` | `Tensor Half-Word Elements Compare Greater Than`                                 | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01000110` | `ly.cmp_le.b` | `Tensor Byte Elements Compare Less Than or Equal To`                             | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01000111` | `ly.cmp_le.h` | `Tensor Half-Word Elements Compare Less Than or Equal To`                        | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01001000` | `ly.cmp_lt.b` | `Tensor Byte Elements Compare Less Than`                                         | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01001001` | `ly.cmp_lt.h` | `Tensor Half-Word Elements Compare Less Than`                                    | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01001010` | `ly.cmp_ne.b` | `Tensor Byte Elements Compare Not Equal`                                         | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01001011` | `ly.cmp_ne.h` | `Tensor Half-Word Elements Compare Not Equal`                                    | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01010100` | `ly.madds.h`  | `Tensor Half-Word Elements Multiply Add Signed Saturated`                        | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01010101` | `ly.max.b`    | `Tensor Byte Elements Maximum`                                                   | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01010110` | `ly.max.h`    | `Tensor Half-Word Elements Maximum`                                              | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01010111` | `ly.merge.b`  | `Tensor Byte Elements Merge`                                                     | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01011000` | `ly.merge.h`  | `Tensor Half-Word Elements Merge`                                                | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01011001` | `ly.min.b`    | `Tensor Byte Elements Minimum`                                                   | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01011010` | `ly.min.h`    | `Tensor Half-Word Elements Minimum`                                              | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01011011` | `ly.msubs.h`  | `Tensor Half-Word Elements Multiply Subtract Signed Saturated`                   | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01011100` | `ly.muls.h`   | `Tensor Half-Word Elements Multiply Signed Saturated`                            | `II`    |
| `0x0A` | `001010DDDDDAAAAABBBBB---01011101` | `ly.nand`     | `Tensor Not And`                                                                 | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01011110` | `ly.nor`      | `Tensor Not Or`                                                                  | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01011111` | `ly.or`       | `Tensor Or`                                                                      | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01100000` | `ly.pack.b`   | `Tensor Byte Elements Pack`                                                      | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01100001` | `ly.pack.h`   | `Tensor Half-word Elements Pack`                                                 | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01100010` | `ly.packs.b`  | `Tensor Byte Elements Pack Signed Saturated`                                     | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01100011` | `ly.packs.h`  | `Tensor Half-word Elements Pack Signed Saturated`                                | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01100100` | `ly.packus.b` | `Tensor Byte Elements Pack Unsigned Saturated`                                   | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01100101` | `ly.packus.h` | `Tensor Half-word Elements Pack Unsigned Saturated`                              | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01100110` | `ly.perm.n`   | `Tensor Nibble Elements Permute`                                                 | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01100111` | `ly.rl.b`     | `Tensor Byte Elements Rotate Left`                                               | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01101000` | `ly.rl.h`     | `Tensor Half-Word Elements Rotate Left`                                          | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01101001` | `ly.sll.b`    | `Tensor Byte Elements Shift Left Logical`                                        | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01101010` | `ly.sll.h`    | `Tensor Half-Word Elements Shift Left Logical`                                   | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01101011` | `ly.sll`      | `Tensor Shift Left Logical`                                                      | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01101100` | `ly.srl.b`    | `Tensor Byte Elements Shift Right Logical`                                       | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01101101` | `ly.srl.h`    | `Tensor Half-Word Elements Shift Right Logical`                                  | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01101110` | `ly.sra.b`    | `Tensor Byte Elements Shift Right Arithmetic`                                    | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01101111` | `ly.sra.h`    | `Tensor Half-Word Elements Shift Right Arithmetic`                               | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01110000` | `ly.srl`      | `Tensor Shift Right Logical`                                                     | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01110001` | `ly.sub.b`    | `Tensor Byte Elements Subtract Signed`                                           | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01110010` | `ly.sub.h`    | `Tensor Half-Word Elements Subtract Signed`                                      | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01110011` | `ly.subs.b`   | `Tensor Byte Elements Subtract Signed Saturated`                                 | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01110100` | `ly.subs.h`   | `Tensor Half-Word Elements Subtract Signed Saturated`                            | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01110101` | `ly.subu.b`   | `Tensor Byte Elements Subtract Unsigned`                                         | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01110110` | `ly.subu.h`   | `Tensor Half-Word Elements Subtract Unsigned`                                    | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01110111` | `ly.subus.b`  | `Tensor Byte Elements Subtract Unsigned Saturated`                               | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01111000` | `ly.subus.h`  | `Tensor Half-Word Elements Subtract Unsigned Saturated`                          | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01111001` | `ly.unpack.b` | `Tensor Byte Elements Unpack`                                                    | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01111010` | `ly.unpack.h` | `Tensor Half-Word Elements Unpack`                                               | `I`     |
| `0x0A` | `001010DDDDDAAAAABBBBB---01111011` | `ly.xor`      | `Tensor Exclusive Or`                                                            | `I`     |

: ORYDX32, ORYDX64 Instructions
