# EXCEPTIONS AND DEFAULT EXCEPTION HANDLING

## OVERVIEW: EXCEPTIONS AND FLAGS

Exceptions in IEEE 754 are conditions that arise when the result of a floating-point operation is not representable or is otherwise exceptional. The standard defines five exceptions:

1. **Invalid Operation**
2. **Division by Zero**
3. **Overflow**
4. **Underflow**
5. **Inexact**

For each of these exceptions, the IEEE 754 standard specifies default handling mechanisms, primarily through the use of flags. When an exception occurs, the corresponding flag is set, and a default result is produced. Programs can check these flags to detect exceptions and take appropriate action if necessary.

Flags:

The flags associated with the five exceptions are:

- **Invalid Operation Flag**: Set when an invalid operation is performed.
- **Division by Zero Flag**: Set when division by zero occurs.
- **Overflow Flag**: Set when the result of an operation is too large to be represented.
- **Underflow Flag**: Set when the result of an operation is too small to be represented.
- **Inexact Flag**: Set when the result of an operation cannot be represented exactly.

These flags are sticky, meaning they remain set until explicitly cleared by the program.

## INVALID OPERATION

The invalid operation exception occurs when an operation is performed that does not have a well-defined result. Examples include:

- Operations involving NaNs, such as $ \text{NaN} + x $ or $ \text{NaN} \times x $.
- Arithmetic operations that produce undefined results, such as $ \infty - \infty $, $ \infty \times 0 $, $ \frac{0}{0} $, or $ \frac{\infty}{\infty} $.
- Square root of a negative number, resulting in NaN (for real numbers).
- Other domain errors like log(-1) or asin(2).

Default Handling:

- **Result**: Typically, the result is NaN.
- **Flag**: The invalid operation flag is set.
- **Program Actions**: The program can check the invalid operation flag and take appropriate actions, such as error reporting or alternative computations.

## DIVISION BY ZERO

The division by zero exception occurs when a finite non-zero number is divided by zero. 

Examples:

- $ \frac{x}{0} $ where $ x \neq 0 $

Default Handling

- **Result**: The result is $ +\infty $ or $ -\infty $, depending on the sign of the numerator.
   - Positive divided by zero: $ +\infty $
   - Negative divided by zero: $ -\infty $
- **Flag**: The division by zero flag is set.
- **Program Actions**: The program can check the division by zero flag to handle or report the condition.

## OVERFLOW

The overflow exception occurs when the result of an operation is too large to be represented in the destination format.

Examples:

- Multiplying two very large numbers.
- Exponentiation that results in a very large number, such as $ 10^{1000} $.

Default Handling:

- **Result**: The result is $ +\infty $ or $ -\infty $, depending on the sign of the computed result.
- **Flag**: The overflow flag is set.
- **Program Actions**: The program can check the overflow flag to handle the condition, such as by using extended precision or scaling the operands.

## UNDERFLOW

The underflow exception occurs when the result of a very small magnitude operation is too close to zero to be represented normally (i.e., it is smaller than the smallest normalized number).

Examples:

- Multiplying two very small numbers.
- Subtracting two nearly equal numbers that result in a value close to zero.

Default Handling:

- **Result**: The result is either a denormalized number (if gradual underflow is supported) or zero.
- **Flag**: The underflow flag is set.
- **Program Actions**: The program can check the underflow flag to handle the condition, such as by using higher precision or special techniques to avoid loss of significance.

## INEXACT

The inexact exception occurs when the result of an operation cannot be represented exactly in the destination format. This is typical in most floating-point operations due to the limited precision of floating-point formats.

Examples:

- Most arithmetic operations, as floating-point arithmetic usually involves rounding.
- Adding numbers that require rounding to fit into the available precision.

Default Handling:

- **Result**: The result is the nearest representable value according to the current rounding mode.
- **Flag**: The inexact flag is set.
- **Program Actions**: The program can check the inexact flag to determine if rounding occurred, which is useful in numerical analysis and for ensuring accuracy requirements are met.

Rounding Modes:

IEEE 754 defines several rounding modes, which affect how inexact results are handled:

- **Round to Nearest, Ties to Even (default)**
- **Round Toward Zero**
- **Round Toward Positive Infinity**
- **Round Toward Negative Infinity**
- **Round to Nearest, Ties to Away**

In summary, IEEE 754 exceptions and default handling mechanisms provide a robust framework for managing exceptional conditions in floating-point arithmetic. These mechanisms ensure that programs can detect and respond to errors or special cases, maintaining the reliability and accuracy of numerical computations.

The IEEE 754 standard also provides for alternate exception handling attributes, which offer greater flexibility in managing floating-point exceptions beyond the default mechanisms. These attributes enable customized handling of exceptions, either immediately as they occur or after a delay, to better suit the needs of different applications.
