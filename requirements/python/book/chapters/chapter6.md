# EXPRESSIONS

Expressions in Python are constructs that can be evaluated to produce a value. They form the building blocks of any Python program.

## ARITHMETIC CONVERSIONS

Python performs implicit type conversions (also known as coercion) in arithmetic operations involving different numeric types (int, float, complex).

- **Integer and Float**: When an integer is combined with a float, the result is a float.
 
    ```python
    result = 5 + 3.0  # result is 8.0
    ```

- **Float and Complex**: When a float is combined with a complex number, the result is a complex number.
 
    ```python
    result = 2.0 + 3j  # result is (2+3j)
    ```

## ATOMS

Atoms are the most basic elements of expressions. They include identifiers, literals, parenthesized expressions, list displays, dictionary displays, set displays, and generator expressions.

- **Identifiers**: Names for variables, functions, etc.
 
    ```python
    variable = 42
    ```

- **Literals**: Fixed values like numbers, strings.
 
    ```python
    num = 10
    text = "Hello"
    ```

- **Parenthesized Expressions**: Expressions within parentheses.
 
    ```python
    value = (5 + 3) * 2  # value is 16
    ```

- **List, Dict, Set Displays**: 
    ```python
    list_example = [1, 2, 3]
    dict_example = {'key': 'value'}
    set_example = {1, 2, 3}
    ```

- **Generator Expressions**: 
    ```python
    gen = (x*x for x in range(5))
    ```

## PRIMARIES

Primaries are the most tightly bound operations in Python. They include attribute references, subscriptions, slicing, and function calls.

- **Attribute References**: Accessing an attribute of an object.
 
    ```python
    obj.attribute
    ```

- **Subscriptions**: Accessing elements of a sequence by index.
 
    ```python
    my_list[0]
    ```

- **Slicing**: Extracting a part of a sequence.
 
    ```python
    my_list[1:3]
    ```

- **Function Calls**: 
    ```python
    func(arg1, arg2)
    ```

## AWAIT EXPRESSION

Used with `async` functions, it pauses the execution until the awaited `awaitable` completes and returns the result.

```python
import asyncio

async def example():
    await asyncio.sleep(1)
    return "Done"

# Running the coroutine
asyncio.run(example())
```

## THE POWER OPERATOR

The power operator `**` raises the left-hand operand to the power of the right-hand operand.

```python
result = 2 ** 3  # result is 8
```

## UNARY ARITHMETIC AND BITWISE OPERATIONS

Unary operations apply to a single operand.

- **Unary Arithmetic**: `+`, `-`
    ```python
    positive = +5
    negative = -5
    ```

- **Unary Bitwise**: `~` (bitwise NOT)
    ```python
    bitwise_not = ~5  # result is -6
    ```

## BINARY ARITHMETIC OPERATIONS

Binary arithmetic operations involve two operands.

- **Addition**: `+`
    ```python
    result = 5 + 3  # result is 8
    ```

- **Subtraction**: `-`
    ```python
    result = 5 - 3  # result is 2
    ```

- **Multiplication**: `*`
    ```python
    result = 5 * 3  # result is 15
    ```

- **Division**: `/`
    ```python
    result = 5 / 2  # result is 2.5
    ```

- **Floor Division**: `//`
    ```python
    result = 5 // 2  # result is 2
    ```

- **Modulus**: `%`
    ```python
    result = 5 % 2  # result is 1
    ```

## SHIFTING OPERATIONS

Shifting operations move the bits of an integer left or right.

- **Left Shift**: `<<`
    ```python
    result = 5 << 1  # result is 10
    ```

- **Right Shift**: `>>`
    ```python
    result = 5 >> 1  # result is 2
    ```

## BINARY BITWISE OPERATIONS

Binary bitwise operations operate on the binary representations of integers.

- **AND**: `&`
    ```python
    result = 5 & 3  # result is 1
    ```

- **OR**: `|`
    ```python
    result = 5 | 3  # result is 7
    ```

- **XOR**: `^`
    ```python
    result = 5 ^ 3  # result is 6
    ```

## COMPARISONS

Comparison operators compare two values and return a boolean result.

- **Equal**: `==`
- **Not Equal**: `!=`
- **Greater Than**: `>`
- **Less Than**: `<`
- **Greater Than or Equal To**: `>=`
- **Less Than or Equal To**: `<=`
- **Identity**: `is`, `is not`
- **Membership**: `in`, `not in`

```python
result = 5 == 5  # result is True
result = 5 > 3   # result is True
```

## BOOLEAN OPERATIONS

Boolean operations `and`, `or`, and `not` are used to combine conditional expressions.

```python
result = (5 > 3) and (3 < 5)  # result is True
result = (5 > 3) or (3 > 5)   # result is True
result = not (5 > 3)          # result is False
```

## ASSIGNMENT EXPRESSIONS

Assignment expressions allow you to assign values to variables as part of an expression using the `:=` operator, also known as the "walrus operator".

```python
if (n := len(my_list)) > 5:
    print(f"List is too long ({n} elements, expected <= 5)")
```

## CONDITIONAL EXPRESSIONS

Conditional expressions (ternary operator) allow you to return a value based on a condition.

```python
x = 5
result = "Positive" if x > 0 else "Non-positive"
```

## LAMBDAS

Lambda expressions define anonymous functions using the `lambda` keyword.

```python
square = lambda x: x * x
result = square(5)  # result is 25
```

## EXPRESSION LISTS

Expression lists are used in various constructs, such as function arguments, tuple packing, and unpacking.

```python
# Function arguments
def func(a, b, c):
    return a + b + c

result = func(1, 2, 3)  # result is 6

# Tuple packing
my_tuple = 1, 2, 3

# Tuple unpacking
a, b, c = my_tuple
```

## EVALUATION ORDER

Python evaluates expressions from left to right, but certain operators have higher precedence than others, affecting the evaluation order.

## OPERATOR PRECEDENCE

Operator precedence determines the order in which operators are evaluated in expressions. Operators with higher precedence are evaluated first.

Precedence Table (highest to lowest)

1. **Parentheses**: `()`
2. **Exponentiation**: `**`
3. **Unary +, -**: `+x`, `-x`, `~x`
4. **Multiplication, Division, Floor Division, Modulus**: `*`, `/`, `//`, `%`
5. **Addition, Subtraction**: `+`, `-`
6. **Shifts**: `<<`, `>>`
7. **Bitwise AND**: `&`
8. **Bitwise XOR**: `^`
9. **Bitwise OR**: `|`
10. **Comparisons**: `==`, `!=`, `>`, `<`, `>=`, `<=`
11. **Identity, Membership**: `is`, `is not`, `in`, `not in`
12. **Boolean NOT**: `not`
13. **Boolean AND**: `and`
14. **Boolean OR**: `or`
15. **Assignment**: `=`, `+=`, `-=`, `*=`, `/=`, etc.
16. **Assignment Expression**: `:=`

Example:

```python
result = 3 + 4 * 2 ** 2 / (1 - 5) // 2
# Evaluates as:
# 3 + 4 * 4 / (-4) // 2
# 3 + 16 / -4 // 2
# 3 + -4 // 2
# 3 + -2
# 1
```

Understanding expressions and their evaluation in Python is crucial for writing correct and efficient code.
