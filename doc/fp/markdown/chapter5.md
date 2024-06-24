# OPERATIONS

## OVERVIEW

The IEEE 754 standard specifies various types of operations on floating-point numbers, including:

- Basic arithmetic operations (addition, subtraction, multiplication, division, square root).
- Comparison operations.
- Conversion operations between floating-point and integer formats, as well as between floating-point formats and character sequences.
- Special operations for handling exceptions and rounding.
- Predicate functions for comparing floating-point numbers and determining their order.

## DECIMAL EXPONENT CALCULATION

Decimal exponent calculation involves determining the exponent in decimal floating-point formats. The standard defines how to handle the exponent in operations involving decimal numbers to maintain precision and accuracy. For example:

- **Addition/Subtraction**: Align the exponents of the operands before performing the operation.
- **Multiplication**: Add the exponents of the operands.
- **Division**: Subtract the exponent of the divisor from the exponent of the dividend.

## HOMOGENEOUS GENERAL-COMPUTATIONAL OPERATIONS

Homogeneous general-computational operations are those where all operands and results are of the same format. These include:

- **Addition**: $ z = x + y $
- **Subtraction**: $ z = x - y $
- **Multiplication**: $ z = x \times y $
- **Division**: $ z = \frac{x}{y} $
- **Square Root**: $ z = \sqrt{x} $
- **Fused Multiply-Add (FMA)**: $ z = (x \times y) + z $

FMA is particularly important for minimizing rounding errors in compound operations.

## FORMATOF GENERAL-COMPUTATIONAL OPERATIONS

The `formatOf` operations involve converting a value from one floating-point format to another while performing the operation. These include:

- **formatOf(x op y)**: Compute the result of `x op y` in the format of `x`.
- **formatOf(y op x)**: Compute the result of `y op x` in the format of `y`.
- This ensures that the operation result conforms to the specified format, which is critical for mixed-precision arithmetic.

## QUIET-COMPUTATIONAL OPERATIONS

Quiet-computational operations handle floating-point numbers without raising exceptions for invalid operations (e.g., operations involving NaNs). Examples include:

- **Quiet Add**: Adds two numbers and produces a quiet NaN if any operand is NaN.
- **Quiet Subtract**: Subtracts two numbers and produces a quiet NaN if any operand is NaN.
- **Quiet Multiply**: Multiplies two numbers and produces a quiet NaN if any operand is NaN.
- **Quiet Divide**: Divides two numbers and produces a quiet NaN if any operand is NaN.
- These operations ensure that the computation continues smoothly without interruption by exceptions.

## SIGNALING-COMPUTATIONAL OPERATIONS

Signaling-computational operations raise exceptions when invalid operations are encountered. Examples include:

- **Signaling Add**: Raises an exception if any operand is a signaling NaN.
- **Signaling Subtract**: Raises an exception if any operand is a signaling NaN.
- **Signaling Multiply**: Raises an exception if any operand is a signaling NaN.
- **Signaling Divide**: Raises an exception if any operand is a signaling NaN.
- These operations are useful in debugging and error-checking scenarios where it is important to catch and handle invalid operations.

## NON-COMPUTATIONAL OPERATIONS

Non-computational operations include:

- **Copy**: Copies the value of one floating-point number to another.
- **Absolute Value**: Returns the absolute value of a floating-point number.
- **Negate**: Negates the value of a floating-point number.
- **Sign Copy**: Copies the sign of one floating-point number to another without changing its magnitude.

## DETAILS OF CONVERSIONS FROM FLOATING-POINT TO INTEGER FORMATS

Conversions from floating-point to integer formats involve:

- **Truncation**: Removing the fractional part of the floating-point number.
- **Rounding**: Converting the floating-point number to the nearest integer value according to the specified rounding mode.
- **Overflow Handling**: Raising an exception if the floating-point number exceeds the range of the target integer format.
- **Conversion Example**:
   - `intVal = (int) floatVal` truncates `floatVal` to produce `intVal`.

## DETAILS OF OPERATIONS TO ROUND A FLOATING-POINT DATUM TO INTEGRAL VALUE

Rounding a floating-point number to an integral value can be done using different rounding modes specified in the standard:

- **Round to Nearest**: Rounds to the nearest integer. If the number is exactly halfway between two integers, it rounds to the even integer.
- **Round Toward Zero**: Rounds towards zero, truncating the fractional part.
- **Round Toward Positive Infinity**: Rounds towards positive infinity, increasing the number.
- **Round Toward Negative Infinity**: Rounds towards negative infinity, decreasing the number.
- **Operation Example**:
   - `roundedVal = round(floatVal)` rounds `floatVal` to the nearest integer.

## DETAILS OF TOTALORDER PREDICATE

The `totalOrder` predicate determines the order of two floating-point numbers, including special values like NaN and infinity. It provides a total ordering that is consistent and deterministic. The ordering is defined as follows:

- All negative numbers precede positive numbers.
- Negative zero precedes positive zero.
- NaNs are ordered based on the bit pattern of their significands.
- This predicate is useful for sorting and comparing floating-point numbers in a way that includes all special cases.

## DETAILS OF COMPARISON PREDICATES

Comparison predicates in IEEE 754 include:

- **Equal (==)**: True if both numbers are equal.
- **Not Equal (!=)**: True if the numbers are not equal.
- **Less Than (<)**: True if the first number is less than the second.
- **Less Than or Equal (<=)**: True if the first number is less than or equal to the second.
- **Greater Than (>)**: True if the first number is greater than the second.
- **Greater Than or Equal (>=)**: True if the first number is greater than or equal to the second.
- **Unordered**: True if either number is NaN.
- These predicates handle all floating-point values, including special cases like NaNs and infinities.

## DETAILS OF CONVERSION BETWEEN FLOATING-POINT DATA AND EXTERNAL CHARACTER SEQUENCES

Conversions between floating-point data and character sequences involve:

- **Formatting**: Converting a floating-point number to a string representation according to specified precision and format (e.g., scientific, fixed-point).
- **Parsing**: Converting a string representation of a number to a floating-point value, handling possible errors like invalid syntax or overflow.
- **Examples**:
   - `strVal = to_string(floatVal)` converts `floatVal` to a string.
   - `floatVal = parse_float(strVal)` converts `strVal` to a floating-point number.

These operations are essential for input/output operations and for ensuring that floating-point numbers can be accurately represented and manipulated as text.

In summary, IEEE 754 defines a rich set of operations and attributes that govern floating-point arithmetic, ensuring consistency, accuracy, and reliability across different computing systems and applications. Understanding these operations is crucial for developers working with numerical computations.

The IEEE 754 standard addresses the handling of special values like infinity and NaNs (Not-a-Number), as well as the significance of the sign bit in floating-point arithmetic. These aspects are crucial for ensuring consistent and predictable behavior in numerical computations, especially when dealing with exceptional or undefined conditions.
