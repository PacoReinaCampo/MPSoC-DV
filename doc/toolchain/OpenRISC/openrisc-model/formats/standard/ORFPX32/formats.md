## FORMATS

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
