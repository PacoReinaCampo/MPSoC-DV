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
