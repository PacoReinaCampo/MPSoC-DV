# DATA FORMATS

## OVERVIEW

The IEEE 1754-1994 standard specifies various data formats used within the architecture to ensure consistent and efficient data processing. These formats include signed and unsigned integers, tagged integers, and floating-point numbers with different precision levels. Each format has specific uses and characteristics that make it suitable for particular types of operations.

## SIGNED INTEGER BYTE

- **Size**: 8 bits (1 byte)
- **Range**: -128 to +127
- **Representation**: Uses two's complement representation. The most significant bit (MSB) is the sign bit, where 0 indicates a positive number and 1 indicates a negative number.

## SIGNED INTEGER HALFWORD

- **Size**: 16 bits (2 bytes)
- **Range**: -32,768 to +32,767
- **Representation**: Uses two's complement representation. The MSB is the sign bit.

## SIGNED INTEGER WORD

- **Size**: 32 bits (4 bytes)
- **Range**: -2,147,483,648 to +2,147,483,647
- **Representation**: Uses two's complement representation. The MSB is the sign bit.

## SIGNED INTEGER DOUBLE

- **Size**: 64 bits (8 bytes)
- **Range**: -9,223,372,036,854,775,808 to +9,223,372,036,854,775,807
- **Representation**: Uses two's complement representation. The MSB is the sign bit.

## UNSIGNED INTEGER BYTE

- **Size**: 8 bits (1 byte)
- **Range**: 0 to 255
- **Representation**: Uses binary representation without a sign bit.

## UNSIGNED INTEGER HALFWORD

- **Size**: 16 bits (2 bytes)
- **Range**: 0 to 65,535
- **Representation**: Uses binary representation without a sign bit.

## UNSIGNED INTEGER WORD

- **Size**: 32 bits (4 bytes)
- **Range**: 0 to 4,294,967,295
- **Representation**: Uses binary representation without a sign bit.

## UNSIGNED INTEGER DOUBLE

- **Size**: 64 bits (8 bytes)
- **Range**: 0 to 18,446,744,073,709,551,615
- **Representation**: Uses binary representation without a sign bit.

## UNSIGNED TAGGED WORD

- **Size**: 32 bits (4 bytes)
- **Structure**: Contains both data and tag bits.
- **Usage**: Typically used in systems that require metadata or type information to be stored alongside the data.
- **Representation**: Binary representation with specific bits allocated for the tag.

## SIGNED TAGGED WORD

- **Size**: 32 bits (4 bytes)
- **Structure**: Contains both data and tag bits.
- **Usage**: Similar to unsigned tagged words but includes a sign bit to indicate the sign of the integer.
- **Representation**: Two's complement representation for the data portion with specific bits allocated for the tag.

## FLOATING-POINT SINGLE PRECISION

- **Size**: 32 bits (4 bytes)
- **Structure**: Consists of three parts - 1 sign bit, 8 exponent bits, and 23 fraction (mantissa) bits.
- **Range**: Approximately ±1.18 × 10^-38 to ±3.4 × 10^38
- **Precision**: 7-8 decimal digits
- **Representation**: IEEE 754 single-precision format.

## FLOATING-POINT DOUBLE PRECISION

- **Size**: 64 bits (8 bytes)
- **Structure**: Consists of three parts - 1 sign bit, 11 exponent bits, and 52 fraction (mantissa) bits.
- **Range**: Approximately ±2.23 × 10^-308 to ±1.8 × 10^308
- **Precision**: 15-17 decimal digits
- **Representation**: IEEE 754 double-precision format.

## FLOATING-POINT QUAD PRECISION

- **Size**: 128 bits (16 bytes)
- **Structure**: Consists of three parts - 1 sign bit, 15 exponent bits, and 112 fraction (mantissa) bits.
- **Range**: Approximately ±3.36 × 10^-4932 to ±1.2 × 10^4932
- **Precision**: 33-34 decimal digits
- **Representation**: IEEE 754 quadruple-precision format.

Summary Table for Quick Reference:

| Data Type                         | Size (Bits) | Range (Signed)                                           | Range (Unsigned)                | Representation            |
|-----------------------------------|-------------|----------------------------------------------------------|---------------------------------|---------------------------|
| Byte                              | 8           | -128 to +127                                             | 0 to 255                        | Two's complement / Binary |
| Halfword                          | 16          | -32,768 to +32,767                                       | 0 to 65,535                     | Two's complement / Binary |
| Word                              | 32          | -2,147,483,648 to +2,147,483,647                         | 0 to 4,294,967,295              | Two's complement / Binary |
| Double                            | 64          | -9,223,372,036,854,775,808 to +9,223,372,036,854,775,807 | 0 to 18,446,744,073,709,551,615 | Two's complement / Binary |
| Tagged Word (Signed)              | 32          | Depends on tag                                           |                                 | Two's complement with tag |
| Tagged Word (Unsigned)            | 32          |                                                          | Depends on tag                  | Binary with tag           |

| Data Type                         | Size (Bits) | Range (Floating-Point)             | Precision (Floating-Point) | Representation            |
|-----------------------------------|-------------|------------------------------------|----------------------------|---------------------------|
| Single Precision (Floating-Point) | 32          | ±1.18 × 10^-38 to ±3.4 × 10^38     | 7-8 decimal digits         | IEEE 754 format           |
| Double Precision (Floating-Point) | 64          | ±2.23 × 10^-308 to ±1.8 × 10^308   | 15-17 decimal digits       | IEEE 754 format           |
| Quad Precision (Floating-Point)   | 128         | ±3.36 × 10^-4932 to ±1.2 × 10^4932 | 33-34 decimal digits       | IEEE 754 format           |

Understanding these data formats is crucial for developers and engineers working with systems based on the IEEE 1754-1994 standard, as it ensures proper handling of data and effective use of the processor's capabilities.
