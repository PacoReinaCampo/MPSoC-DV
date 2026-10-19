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
| `0x32` | `110010-----AAAAABBBBB---00001000` | `lf.sfeq.s`   | `Set Flag if Equal Floating-Point Single-Precision`                              | `II`    |
| `0x32` | `110010-----AAAAABBBBB---00001001` | `lf.sfne.s`   | `Set Flag if Not Equal Floating-Point Single-Precision`                          | `II`    |
| `0x32` | `110010-----AAAAABBBBB---00001010` | `lf.sfgt.s`   | `Set Flag if Greater Than Floating-Point Single-Precision`                       | `II`    |
| `0x32` | `110010-----AAAAABBBBB---00001011` | `lf.sfge.s`   | `Set Flag if Greater or Equal Than Floating-Point Single-Precision`              | `II`    |
| `0x32` | `110010-----AAAAABBBBB---00001100` | `lf.sflt.s`   | `Set Flag if Less Than Floating-Point Single-Precision`                          | `I`     |
| `0x32` | `110010-----AAAAABBBBB---00001101` | `lf.sfle.s`   | `Set Flag if Less or Equal Than Floating-Point Single-Precision`                 | `I`     |
| `0x32` | `110010-----AAAAABBBBB-OO00011000` | `lf.sfeq.d`   | `Set Flag if Equal Floating-Point Double-Precision`                              | `I`     |
| `0x32` | `110010-----AAAAABBBBB-OO00011001` | `lf.sfne.d`   | `Set Flag if Not Equal Floating-Point Double-Precision`                          | `I`     |
| `0x32` | `110010-----AAAAABBBBB-OO00011010` | `lf.sfgt.d`   | `Set Flag if Greater Than Floating-Point Double-Precision`                       | `I`     |
| `0x32` | `110010-----AAAAABBBBB-OO00011011` | `lf.sfge.d`   | `Set Flag if Greater or Equal Than Floating-Point Double-Precision`              | `I`     |
| `0x32` | `110010-----AAAAABBBBB-OO00011100` | `lf.sflt.d`   | `Set Flag if Less Than Floating-Point Double-Precision`                          | `I`     |
| `0x32` | `110010-----AAAAABBBBB-OO00011101` | `lf.sfle.d`   | `Set Flag if Less or Equal Than Floating-Point Double-Precision`                 | `I`     |
| `0x32` | `110010-----AAAAABBBBB---00101000` | `lf.sfueq.s`  | `Set Flag if Unordered or Equal Floating-Point Single-Precision`                 | `II`    |
| `0x32` | `110010-----AAAAABBBBB---00101001` | `lf.sfune.s`  | `Set Flag if Unordered or Not Equal Floating-Point Single-Precision`             | `II`    |
| `0x32` | `110010-----AAAAABBBBB---00101010` | `lf.sfugt.s`  | `Set Flag if Unordered or Greater Than Floating-Point Single-Precision`          | `II`    |
| `0x32` | `110010-----AAAAABBBBB---00101011` | `lf.sfuge.s`  | `Set Flag if Unordered or Greater Than or Equal Floating-Point Single-Precision` | `II`    |
| `0x32` | `110010-----AAAAABBBBB---00101100` | `lf.sfult.s`  | `Set Flag if Unordered or Less Than Floating-Point Single-Precision`             | `II`    |
| `0x32` | `110010-----AAAAABBBBB---00101101` | `lf.sfule.s`  | `Set Flag if Unordered or Less Than or Equal Floating-Point Single-Precision`    | `II`    |
| `0x32` | `110010-----AAAAABBBBB---00101110` | `lf.sfun.s`   | `Set Flag if Unordered Floating-Point Single-Precision`                          | `II`    |
| `0x32` | `110010-----AAAAABBBBBO--00110100` | `lf.stod.d`   | `Convert Single-precision Floating-Point Number To Double-precision`             | `II`    |
| `0x32` | `110010-----AAAAABBBBB-O-00110101` | `lf.dtos.d`   | `Convert Double-precision Floating-Point Number to Single-precision`             | `II`    |
| `0x32` | `110010-----AAAAABBBBB-OO00111000` | `lf.sfueq.d`  | `Set Flag if Unordered or Equal Floating-Point Double-Precision`                 | `II`    |
| `0x32` | `110010-----AAAAABBBBB-OO00111001` | `lf.sfune.d`  | `Set Flag if Unordered or Not Equal Floating-Point Double-Precision`             | `II`    |
| `0x32` | `110010-----AAAAABBBBB-OO00111010` | `lf.sfugt.d`  | `Set Flag if Unordered or Greater Than Floating-Point Double-Precision`          | `II`    |
| `0x32` | `110010-----AAAAABBBBB-OO00111011` | `lf.sfuge.d`  | `Set Flag if Unordered or Greater Than or Equal Floating-Point Double-Precision` | `II`    |
| `0x32` | `110010-----AAAAABBBBB-OO00111100` | `lf.sfult.d`  | `Set Flag if Unordered or Less Than Floating-Point Double-Precision`             | `II`    |
| `0x32` | `110010-----AAAAABBBBB-OO00111101` | `lf.sfule.d`  | `Set Flag if Unordered or Less Than or Equal Floating-Point Double-Precision`    | `II`    |
| `0x32` | `110010-----AAAAABBBBB-OO00111110` | `lf.sfun.d`   | `Set Flag if Unordered Floating-Point Double-Precision`                          | `II`    |
| `0x32` | `110010-----AAAAABBBBBOOO1101----` | `lf.cust1.s`  | `Reserved for ORFPX32 Custom Instructions`                                       | `II`    |
| `0x32` | `110010-----AAAAABBBBBOOO1110----` | `lf.cust1.d`  | `Reserved for ORFPX64 Custom Instructions`                                       | `II`    |
| `0x32` | `110010DDDDDAAAAA00000---00000100` | `lf.itof.s`   | `Integer To Floating-Point Single-Precision`                                     | `I`     |
| `0x32` | `110010DDDDDAAAAA00000---00000101` | `lf.ftoi.s`   | `Floating-Point Single-Precision To Integer`                                     | `I`     |
| `0x32` | `110010DDDDDAAAAA00000OO-00010100` | `lf.itof.d`   | `Integer To Floating-Point Double-Precision`                                     | `I`     |
| `0x32` | `110010DDDDDAAAAA00000OO-00010101` | `lf.ftoi.d`   | `Floating-Point Double-Precision To Integer`                                     | `I`     |
| `0x32` | `110010DDDDDAAAAABBBBB---00000000` | `lf.add.s`    | `Add Floating-Point Single-Precision`                                            | `I`     |
| `0x32` | `110010DDDDDAAAAABBBBB---00000001` | `lf.sub.s`    | `Subtract Floating-Point Single-Precision`                                       | `I`     |
| `0x32` | `110010DDDDDAAAAABBBBB---00000010` | `lf.mul.s`    | `Multiply Floating-Point Single-Precision`                                       | `I`     |
| `0x32` | `110010DDDDDAAAAABBBBB---00000011` | `lf.div.s`    | `Divide Floating-Point Single-Precision`                                         | `II`    |
| `0x32` | `110010DDDDDAAAAABBBBB---00000111` | `lf.madd.s`   | `Multiply and Add Floating-Point Single-Precision`                               | `II`    |
| `0x32` | `110010DDDDDAAAAABBBBBOOO00010000` | `lf.add.d`    | `Add Floating-Point Double-Precision`                                            | `I`     |
| `0x32` | `110010DDDDDAAAAABBBBBOOO00010001` | `lf.sub.d`    | `Subtract Floating-Point Double-Precision`                                       | `I`     |
| `0x32` | `110010DDDDDAAAAABBBBBOOO00010010` | `lf.mul.d`    | `Multiply Floating-Point Double-Precision`                                       | `II`    |
| `0x32` | `110010DDDDDAAAAABBBBBOOO00010011` | `lf.div.d`    | `Divide Floating-Point Double-Precision`                                         | `II`    |
| `0x32` | `110010DDDDDAAAAABBBBBOOO00010111` | `lf.madd.d`   | `Multiply and Add Floating-Point Double-Precision`                               | `II`    |

: ORFPX16, ORFPX32, ORFPX64, ORFPX128 Instructions
