## INSTRUCTIONS

| `Class` | `Description`                                                                                                                                                              |
|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `I`     | `Instructions in class I must always be implemented`                                                                                                                       |
| `II`    | `Instructions from class II are optional and an implementation may choose to use some or all instructions from this class based on requirements of the target application` |

: OpenRISC 1000 Instruction Classes

| `OPC`  | `Instruction`                      | `Mnemonic`    | `Function`                                                                       | `Class` |
|--------|------------------------------------|---------------|----------------------------------------------------------------------------------|---------|
| `0x00` | `000000NNNNNNNNNNNNNNNNNNNNNNNNNN` | `l.j`         | `Jump`                                                                           | `I`     |
| `0x01` | `000001NNNNNNNNNNNNNNNNNNNNNNNNNN` | `l.jal`       | `Jump and Link`                                                                  | `I`     |
| `0x02` | `000010DDDDDNNNNNNNNNNNNNNNNNNNNN` | `l.adrp`      | `Compute Instruction Relative Address`                                           | `II`    |
| `0x03` | `000011NNNNNNNNNNNNNNNNNNNNNNNNNN` | `l.bnf`       | `Branch if No Flag`                                                              | `I`     |
| `0x04` | `000100NNNNNNNNNNNNNNNNNNNNNNNNNN` | `l.bf`        | `Branch if Flag`                                                                 | `I`     |
| `0x05` | `00010101--------KKKKKKKKKKKKKKKK` | `l.nop`       | `No Operation`                                                                   | `I`     |
| `0x06` | `000110DDDDD----0KKKKKKKKKKKKKKKK` | `l.movhi`     | `Move Immediate High`                                                            | `I`     |
| `0x06` | `000110DDDDD----10000000000000000` | `l.macrc`     | `MAC Read and Clear`                                                             | `II`    |
| `0x08` | `0010000000000000KKKKKKKKKKKKKKKK` | `l.sys`       | `System Call`                                                                    | `I`     |
| `0x08` | `0010000100000000KKKKKKKKKKKKKKKK` | `l.trap`      | `Trap`                                                                           | `II`    |
| `0x08` | `00100010000000000000000000000000` | `l.msync`     | `Memory Synchronization`                                                         | `II`    |
| `0x08` | `00100010100000000000000000000000` | `l.psync`     | `Pipeline Synchronization`                                                       | `II`    |
| `0x08` | `00100011000000000000000000000000` | `l.csync`     | `Context Synchronization`                                                        | `II`    |
| `0x09` | `001001--------------------------` | `l.rfe`       | `Return From Exception`                                                          | `I`     |
| `0x11` | `010001----------BBBBB-----------` | `l.jr`        | `Jump Register`                                                                  | `I`     |
| `0x12` | `010010----------BBBBB-----------` | `l.jalr`      | `Jump and Link Register`                                                         | `I`     |
| `0x13` | `010011-----AAAAAIIIIIIIIIIIIIIII` | `l.maci`      | `Multiply Immediate Signed and Accumulate`                                       | `I`     |
| `0x1A` | `011010DDDDDAAAAAIIIIIIIIIIIIIIII` | `l.lf`        | `Load Single Float Word with NaN Boxing`                                         | `I`     |
| `0x1B` | `011011DDDDDAAAAAIIIIIIIIIIIIIIII` | `l.lwa`       | `Load Single Word Atomic`                                                        | `I`     |
| `0x1C` | `011100--------------------------` | `l.cust1`     | `Reserved for ORBIS32/64 Custom Instructions`                                    | `I`     |
| `0x1D` | `011101--------------------------` | `l.cust2`     | `Reserved for ORBIS32/64 Custom Instructions`                                    | `I`     |
| `0x1E` | `011110--------------------------` | `l.cust3`     | `Reserved for ORBIS32/64 Custom Instructions`                                    | `I`     |
| `0x1F` | `011111--------------------------` | `l.cust4`     | `Reserved for ORBIS32/64 Custom Instructions`                                    | `I`     |
| `0x20` | `100000DDDDDAAAAAIIIIIIIIIIIIIIII` | `l.ld`        | `Load Double Word`                                                               | `I`     |
| `0x21` | `100001DDDDDAAAAAIIIIIIIIIIIIIIII` | `l.lwz`       | `Load Single Word and Extend with Zero`                                          | `I`     |
| `0x22` | `100010DDDDDAAAAAIIIIIIIIIIIIIIII` | `l.lws`       | `Load Single Word and Extend with Sign`                                          | `I`     |
| `0x23` | `100011DDDDDAAAAAIIIIIIIIIIIIIIII` | `l.lbz`       | `Load Byte and Extend with Zero`                                                 | `I`     |
| `0x24` | `100100DDDDDAAAAAIIIIIIIIIIIIIIII` | `l.lbs`       | `Load Byte and Extend with Sign`                                                 | `I`     |
| `0x25` | `100101DDDDDAAAAAIIIIIIIIIIIIIIII` | `l.lhz`       | `Load Half Word and Extend with Zero`                                            | `I`     |
| `0x26` | `100110DDDDDAAAAAIIIIIIIIIIIIIIII` | `l.lhs`       | `Load Half Word and Extend with Sign`                                            | `I`     |
| `0x27` | `100111DDDDDAAAAAIIIIIIIIIIIIIIII` | `l.addi`      | `Add Immediate Signed`                                                           | `I`     |
| `0x28` | `101000DDDDDAAAAAIIIIIIIIIIIIIIII` | `l.addic`     | `Add Immediate Signed and Carry`                                                 | `I`     |
| `0x29` | `101001DDDDDAAAAAKKKKKKKKKKKKKKKK` | `l.andi`      | `And with Immediate Half Word`                                                   | `I`     |
| `0x2A` | `101010DDDDDAAAAAKKKKKKKKKKKKKKKK` | `l.ori`       | `Or with Immediate Half Word`                                                    | `I`     |
| `0x2B` | `101011DDDDDAAAAAIIIIIIIIIIIIIIII` | `l.xori`      | `Exclusive Or with Immediate Half Word`                                          | `I`     |
| `0x2C` | `101100DDDDDAAAAAIIIIIIIIIIIIIIII` | `l.muli`      | `Multiply Immediate Signed`                                                      | `II`    |
| `0x2D` | `101101DDDDDAAAAAKKKKKKKKKKKKKKKK` | `l.mfspr`     | `Move From Special-Purpose Register`                                             | `I`     |
| `0x2E` | `101110DDDDDAAAAA--------00LLLLLL` | `l.slli`      | `Shift Left Logical with Immediate`                                              | `I`     |
| `0x2E` | `101110DDDDDAAAAA--------01LLLLLL` | `l.srli`      | `Shift Right Logical with Immediate`                                             | `I`     |
| `0x2E` | `101110DDDDDAAAAA--------10LLLLLL` | `l.srai`      | `Shift Right Arithmetic with Immediate`                                          | `I`     |
| `0x2E` | `101110DDDDDAAAAA--------11LLLLLL` | `l.rori`      | `Rotate Right with Immediate`                                                    | `II`    |
| `0x2F` | `10111100000AAAAAIIIIIIIIIIIIIIII` | `l.sfeqi`     | `Set Flag if Equal Immediate`                                                    | `I`     |
| `0x2F` | `10111100001AAAAAIIIIIIIIIIIIIIII` | `l.sfnei`     | `Set Flag if Not Equal Immediate`                                                | `I`     |
| `0x2F` | `10111100010AAAAAIIIIIIIIIIIIIIII` | `l.sfgtui`    | `Set Flag if Greater Than Immediate Unsigned`                                    | `I`     |
| `0x2F` | `10111100011AAAAAIIIIIIIIIIIIIIII` | `l.sfgeui`    | `Set Flag if Greater or Equal Than Immediate Unsigned`                           | `I`     |
| `0x2F` | `10111100100AAAAAIIIIIIIIIIIIIIII` | `l.sfltui`    | `Set Flag if Less Than Immediate Unsigned`                                       | `I`     |
| `0x2F` | `10111100101AAAAAIIIIIIIIIIIIIIII` | `l.sfleui`    | `Set Flag if Less or Equal Than Immediate Unsigned`                              | `I`     |
| `0x2F` | `10111101010AAAAAIIIIIIIIIIIIIIII` | `l.sfgtsi`    | `Set Flag if Greater Than Immediate Signed`                                      | `I`     |
| `0x2F` | `10111101011AAAAAIIIIIIIIIIIIIIII` | `l.sfgesi`    | `Set Flag if Greater or Equal Than Immediate Signed`                             | `I`     |
| `0x2F` | `10111101100AAAAAIIIIIIIIIIIIIIII` | `l.sfltsi`    | `Set Flag if Less Than Immediate Signed`                                         | `I`     |
| `0x2F` | `10111101101AAAAAIIIIIIIIIIIIIIII` | `l.sflesi`    | `Set Flag if Less or Equal Than Immediate Signed`                                | `I`     |
| `0x30` | `110000KKKKKAAAAABBBBBKKKKKKKKKKK` | `l.mtspr`     | `Move To Special-Purpose Register`                                               | `I`     |
| `0x31` | `110001-----AAAAABBBBB-------0001` | `l.mac`       | `Multiply Signed and Accumulate`                                                 | `II`    |
| `0x31` | `110001-----AAAAABBBBB-------0011` | `l.macu`      | `Multiply Unsigned and Accumulate`                                               | `II`    |
| `0x31` | `110001-----AAAAABBBBB-------0010` | `l.msb`       | `Multiply Signed and Subtract`                                                   | `II`    |
| `0x31` | `110001-----AAAAABBBBB-------0100` | `l.msbu`      | `Multiply Unsigned and Subtract`                                                 | `II`    |
| `0x33` | `110011IIIIIAAAAABBBBBIIIIIIIIIII` | `l.swa`       | `Store Single Word Atomic`                                                       | `II`    |
| `0x35` | `110101IIIIIAAAAABBBBBIIIIIIIIIII` | `l.sw`        | `Store Single Word`                                                              | `I`     |
| `0x36` | `110110IIIIIAAAAABBBBBIIIIIIIIIII` | `l.sb`        | `Store Byte`                                                                     | `I`     |
| `0x37` | `110111IIIIIAAAAABBBBBIIIIIIIIIII` | `l.sh`        | `Store Half Word`                                                                | `I`     |
| `0x38` | `111000DDDDDAAAAA------0000--1100` | `l.exths`     | `Extend Half Word with Sign`                                                     | `II`    |
| `0x38` | `111000DDDDDAAAAA------0000--1101` | `l.extws`     | `Extend Word with Sign`                                                          | `II`    |
| `0x38` | `111000DDDDDAAAAA------0001--1100` | `l.extbs`     | `Extend Byte with Sign`                                                          | `II`    |
| `0x38` | `111000DDDDDAAAAA------0001--1101` | `l.extwz`     | `Extend Word with Zero`                                                          | `II`    |
| `0x38` | `111000DDDDDAAAAA------0010--1100` | `l.exthz`     | `Extend Half Word with Zero`                                                     | `II`    |
| `0x38` | `111000DDDDDAAAAA------0011--1100` | `l.extbz`     | `Extend Byte with Zero`                                                          | `II`    |
| `0x38` | `111000DDDDDAAAAABBBBB-00----0000` | `l.add`       | `Add Signed`                                                                     | `I`     |
| `0x38` | `111000DDDDDAAAAABBBBB-00----0001` | `l.addc`      | `Add Signed and Carry`                                                           | `I`     |
| `0x38` | `111000DDDDDAAAAABBBBB-00----0010` | `l.sub`       | `Subtract Signed`                                                                | `I`     |
| `0x38` | `111000DDDDDAAAAABBBBB-00----0011` | `l.and`       | `And`                                                                            | `I`     |
| `0x38` | `111000DDDDDAAAAABBBBB-00----0100` | `l.or`        | `Or`                                                                             | `I`     |
| `0x38` | `111000DDDDDAAAAABBBBB-00----0101` | `l.xor`       | `Exclusive Or`                                                                   | `I`     |
| `0x38` | `111000DDDDDAAAAABBBBB-00----1110` | `l.cmov`      | `Conditional Move`                                                               | `II`    |
| `0x38` | `111000DDDDDAAAAA------00----1111` | `l.ff1`       | `Find First 1`                                                                   | `II`    |
| `0x38` | `111000DDDDDAAAAABBBBB-0000--1000` | `l.sll`       | `Shift Left Logical`                                                             | `I`     |
| `0x38` | `111000DDDDDAAAAABBBBB-0001--1000` | `l.srl`       | `Shift Right Logical`                                                            | `I`     |
| `0x38` | `111000DDDDDAAAAABBBBB-0010--1000` | `l.sra`       | `Shift Right Arithmetic`                                                         | `I`     |
| `0x38` | `111000DDDDDAAAAABBBBB-0011--1000` | `l.ror`       | `Rotate Right`                                                                   | `II`    |
| `0x38` | `111000DDDDDAAAAA------01----1111` | `l.fl1`       | `Find Last 1`                                                                    | `II`    |
| `0x38` | `111000DDDDDAAAAABBBBB-11----0110` | `l.mul`       | `Multiply Signed`                                                                | `II`    |
| `0x38` | `111000-----AAAAABBBBB-11----0111` | `l.muld`      | `Multiply Signed to Double`                                                      | `II`    |
| `0x38` | `111000DDDDDAAAAABBBBB-11----1001` | `l.div`       | `Divide Signed`                                                                  | `II`    |
| `0x38` | `111000DDDDDAAAAABBBBB-11----1010` | `l.divu`      | `Divide Unsigned`                                                                | `II`    |
| `0x38` | `111000DDDDDAAAAABBBBB-11----1011` | `l.mulu`      | `Multiply Unsigned`                                                              | `II`    |
| `0x38` | `111000-----AAAAABBBBB-11----1100` | `l.muldu`     | `Multiply Unsigned to Double`                                                    | `II`    |
| `0x39` | `11100100000AAAAABBBBB-----------` | `l.sfeq`      | `Set Flag if Equal`                                                              | `I`     |
| `0x39` | `11100100001AAAAABBBBB-----------` | `l.sfne`      | `Set Flag if Not Equal`                                                          | `I`     |
| `0x39` | `11100100010AAAAABBBBB-----------` | `l.sfgtu`     | `Set Flag if Greater Than Unsigned`                                              | `I`     |
| `0x39` | `11100100011AAAAABBBBB-----------` | `l.sfgeu`     | `Set Flag if Greater or Equal Than Unsigned`                                     | `I`     |
| `0x39` | `11100100100AAAAABBBBB-----------` | `l.sfltu`     | `Set Flag if Less Than Unsigned`                                                 | `I`     |
| `0x39` | `11100100101AAAAABBBBB-----------` | `l.sfleu`     | `Set Flag if Less or Equal Than Unsigned`                                        | `I`     |
| `0x39` | `11100101010AAAAABBBBB-----------` | `l.sfgts`     | `Set Flag if Greater Than Signed`                                                | `I`     |
| `0x39` | `11100101011AAAAABBBBB-----------` | `l.sfges`     | `Set Flag if Greater or Equal Than Signed`                                       | `I`     |
| `0x39` | `11100101100AAAAABBBBB-----------` | `l.sflts`     | `Set Flag if Less Than Signed`                                                   | `I`     |
| `0x39` | `11100101101AAAAABBBBB-----------` | `l.sfles`     | `Set Flag if Less or Equal Than Signed`                                          | `I`     |
| `0x3C` | `111100DDDDDAAAAABBBBBLLLLLLKKKKK` | `l.cust5`     | `Reserved for ORBIS32/64 Custom Instructions`                                    | `II`    |
| `0x3D` | `111101--------------------------` | `l.cust6`     | `Reserved for ORBIS32/64 Custom Instructions`                                    | `II`    |
| `0x3E` | `111110--------------------------` | `l.cust7`     | `Reserved for ORBIS32/64 Custom Instructions`                                    | `II`    |
| `0x3F` | `111111--------------------------` | `l.cust8`     | `Reserved for ORBIS32/64 Custom Instructions`                                    | `II`    |

: ORBIS32, ORBIS64 Instructions

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

| `OPC`  | `Instruction`                      | `Mnemonic`    | `Function`                                                                       | `Class` |
|--------|------------------------------------|---------------|----------------------------------------------------------------------------------|---------|
| `0x0C` | `001100------------------1100----` | `ly.cust1`    | `Reserved for Custom Tensor Instructions`                                        | `II`    |
| `0x0C` | `001100------------------1101----` | `ly.cust2`    | `Reserved for Custom Tensor Instructions`                                        | `II`    |
| `0x0C` | `001100------------------1110----` | `ly.cust3`    | `Reserved for Custom Tensor Instructions`                                        | `II`    |
| `0x0C` | `001100------------------1111----` | `ly.cust4`    | `Reserved for Custom Tensor Instructions`                                        | `II`    |
| `0x0C` | `001100DDDDDAAAAABBBBB---00010000` | `ly.all_eq.b` | `Tensor Byte Elements All Equal`                                                 | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00010001` | `ly.all_eq.h` | `Tensor Half-Word Elements All Equal`                                            | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00010010` | `ly.all_ge.b` | `Tensor Byte Elements All Greater Than or Equal To`                              | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00010011` | `ly.all_ge.h` | `Tensor Half-Word Elements All Greater Than or Equal To`                         | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00010100` | `ly.all_gt.b` | `Tensor Byte Elements All Greater Than`                                          | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00010101` | `ly.all_gt.h` | `Tensor Half-Word Elements All Greater Than`                                     | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00010110` | `ly.all_le.b` | `Tensor Byte Elements All Less Than or Equal To`                                 | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00010111` | `ly.all_le.h` | `Tensor Half-Word Elements All Less Than or Equal To`                            | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00011000` | `ly.all_lt.b` | `Tensor Byte Elements All Less Than`                                             | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00011001` | `ly.all_lt.h` | `Tensor Half-Word Elements All Less Than`                                        | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00011010` | `ly.all_ne.b` | `Tensor Byte Elements All Not Equal`                                             | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00011011` | `ly.all_ne.h` | `Tensor Half-Word Elements All Not Equal`                                        | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00100000` | `ly.any_eq.b` | `Tensor Byte Elements Any Equal`                                                 | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00100001` | `ly.any_eq.h` | `Tensor Half-Word Elements Any Equal`                                            | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00100010` | `ly.any_ge.b` | `Tensor Byte Elements Any Greater Than or Equal To`                              | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00100011` | `ly.any_ge.h` | `Tensor Half-Word Elements Any Greater Than or Equal To`                         | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00100100` | `ly.any_gt.b` | `Tensor Byte Elements Any Greater Than`                                          | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00100101` | `ly.any_gt.h` | `Tensor Half-Word Elements Any Greater Than`                                     | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00100110` | `ly.any_le.b` | `Tensor Byte Elements Any Less Than or Equal To`                                 | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00100111` | `ly.any_le.h` | `Tensor Half-Word Elements Any Less Than or Equal To`                            | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00101000` | `ly.any_lt.b` | `Tensor Byte Elements Any Less Than`                                             | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00101001` | `ly.any_lt.h` | `Tensor Half-Word Elements Any Less Than`                                        | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00101010` | `ly.any_ne.b` | `Tensor Byte Elements Any Not Equal`                                             | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00101011` | `ly.any_ne.h` | `Tensor Half-Word Elements Any Not Equal`                                        | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00110000` | `ly.add.b`    | `Tensor Byte Elements Add Signed`                                                | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00110001` | `ly.add.h`    | `Tensor Half-Word Elements Add Signed`                                           | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00110010` | `ly.adds.b`   | `Tensor Byte Elements Add Signed Saturated`                                      | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00110011` | `ly.adds.h`   | `Tensor Half-Word Elements Add Signed Saturated`                                 | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00110100` | `ly.addu.b`   | `Tensor Byte Elements Add Unsigned`                                              | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00110101` | `ly.addu.h`   | `Tensor Half-Word Elements Add Unsigned`                                         | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00110110` | `ly.addus.b`  | `Tensor Byte Elements Add Unsigned Saturated`                                    | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00110111` | `ly.addus.h`  | `Tensor Half-Word Elements Add Unsigned Saturated`                               | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00111000` | `ly.and`      | `Tensor And`                                                                     | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00111001` | `ly.avg.b`    | `Tensor Byte Elements Average`                                                   | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---00111010` | `ly.avg.h`    | `Tensor Half-Word Elements Average`                                              | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01000000` | `ly.cmp_eq.b` | `Tensor Byte Elements Compare Equal`                                             | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01000001` | `ly.cmp_eq.h` | `Tensor Half-Word Elements Compare Equal`                                        | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01000010` | `ly.cmp_ge.b` | `Tensor Byte Elements Compare Greater Than or Equal To`                          | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01000011` | `ly.cmp_ge.h` | `Tensor Half-Word Elements Compare Greater Than or Equal To`                     | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01000100` | `ly.cmp_gt.b` | `Tensor Byte Elements Compare Greater Than`                                      | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01000101` | `ly.cmp_gt.h` | `Tensor Half-Word Elements Compare Greater Than`                                 | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01000110` | `ly.cmp_le.b` | `Tensor Byte Elements Compare Less Than or Equal To`                             | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01000111` | `ly.cmp_le.h` | `Tensor Half-Word Elements Compare Less Than or Equal To`                        | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01001000` | `ly.cmp_lt.b` | `Tensor Byte Elements Compare Less Than`                                         | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01001001` | `ly.cmp_lt.h` | `Tensor Half-Word Elements Compare Less Than`                                    | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01001010` | `ly.cmp_ne.b` | `Tensor Byte Elements Compare Not Equal`                                         | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01001011` | `ly.cmp_ne.h` | `Tensor Half-Word Elements Compare Not Equal`                                    | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01010100` | `ly.madds.h`  | `Tensor Half-Word Elements Multiply Add Signed Saturated`                        | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01010101` | `ly.max.b`    | `Tensor Byte Elements Maximum`                                                   | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01010110` | `ly.max.h`    | `Tensor Half-Word Elements Maximum`                                              | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01010111` | `ly.merge.b`  | `Tensor Byte Elements Merge`                                                     | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01011000` | `ly.merge.h`  | `Tensor Half-Word Elements Merge`                                                | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01011001` | `ly.min.b`    | `Tensor Byte Elements Minimum`                                                   | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01011010` | `ly.min.h`    | `Tensor Half-Word Elements Minimum`                                              | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01011011` | `ly.msubs.h`  | `Tensor Half-Word Elements Multiply Subtract Signed Saturated`                   | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01011100` | `ly.muls.h`   | `Tensor Half-Word Elements Multiply Signed Saturated`                            | `II`    |
| `0x0C` | `001100DDDDDAAAAABBBBB---01011101` | `ly.nand`     | `Tensor Not And`                                                                 | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01011110` | `ly.nor`      | `Tensor Not Or`                                                                  | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01011111` | `ly.or`       | `Tensor Or`                                                                      | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01100000` | `ly.pack.b`   | `Tensor Byte Elements Pack`                                                      | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01100001` | `ly.pack.h`   | `Tensor Half-word Elements Pack`                                                 | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01100010` | `ly.packs.b`  | `Tensor Byte Elements Pack Signed Saturated`                                     | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01100011` | `ly.packs.h`  | `Tensor Half-word Elements Pack Signed Saturated`                                | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01100100` | `ly.packus.b` | `Tensor Byte Elements Pack Unsigned Saturated`                                   | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01100101` | `ly.packus.h` | `Tensor Half-word Elements Pack Unsigned Saturated`                              | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01100110` | `ly.perm.n`   | `Tensor Nibble Elements Permute`                                                 | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01100111` | `ly.rl.b`     | `Tensor Byte Elements Rotate Left`                                               | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01101000` | `ly.rl.h`     | `Tensor Half-Word Elements Rotate Left`                                          | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01101001` | `ly.sll.b`    | `Tensor Byte Elements Shift Left Logical`                                        | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01101010` | `ly.sll.h`    | `Tensor Half-Word Elements Shift Left Logical`                                   | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01101011` | `ly.sll`      | `Tensor Shift Left Logical`                                                      | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01101100` | `ly.srl.b`    | `Tensor Byte Elements Shift Right Logical`                                       | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01101101` | `ly.srl.h`    | `Tensor Half-Word Elements Shift Right Logical`                                  | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01101110` | `ly.sra.b`    | `Tensor Byte Elements Shift Right Arithmetic`                                    | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01101111` | `ly.sra.h`    | `Tensor Half-Word Elements Shift Right Arithmetic`                               | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01110000` | `ly.srl`      | `Tensor Shift Right Logical`                                                     | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01110001` | `ly.sub.b`    | `Tensor Byte Elements Subtract Signed`                                           | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01110010` | `ly.sub.h`    | `Tensor Half-Word Elements Subtract Signed`                                      | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01110011` | `ly.subs.b`   | `Tensor Byte Elements Subtract Signed Saturated`                                 | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01110100` | `ly.subs.h`   | `Tensor Half-Word Elements Subtract Signed Saturated`                            | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01110101` | `ly.subu.b`   | `Tensor Byte Elements Subtract Unsigned`                                         | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01110110` | `ly.subu.h`   | `Tensor Half-Word Elements Subtract Unsigned`                                    | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01110111` | `ly.subus.b`  | `Tensor Byte Elements Subtract Unsigned Saturated`                               | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01111000` | `ly.subus.h`  | `Tensor Half-Word Elements Subtract Unsigned Saturated`                          | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01111001` | `ly.unpack.b` | `Tensor Byte Elements Unpack`                                                    | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01111010` | `ly.unpack.h` | `Tensor Half-Word Elements Unpack`                                               | `I`     |
| `0x0C` | `001100DDDDDAAAAABBBBB---01111011` | `ly.xor`      | `Tensor Exclusive Or`                                                            | `I`     |

: ORYDX32, ORYDX64 Instructions
