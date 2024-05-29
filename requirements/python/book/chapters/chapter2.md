# Lexical Analysis
Lexical analysis is the first phase of a compiler or interpreter, where the input code is transformed into a sequence of tokens. Each token is a syntactic unit that can be identified as keywords, identifiers, literals, operators, delimiters, etc. In Python, the lexical analysis is performed by the tokenizer, which converts the source code into tokens that the parser can understand.

## Line Structure
Python source code is organized into lines, each containing one or more statements. The line structure in Python is significant, particularly due to its use of indentation to define code blocks.

- **Logical Lines**: Python code is generally written in logical lines. Each logical line corresponds to a statement.
- **Physical Lines**: These are the actual lines in the file. A logical line can span multiple physical lines using backslashes (`\`) or parentheses, brackets, and braces.

```python
# Single logical line
print("Hello, World!")

# Logical line spanning multiple physical lines using parentheses
result = (1 + 2 + 3 +
          4 + 5 + 6)

# Logical line spanning multiple physical lines using backslash
total = 1 + 2 + 3 + \
        4 + 5 + 6
```

## Other Tokens
In Python, tokens are categorized into several types:

- **Keywords**: Reserved words with special meaning, such as `if`, `for`, `while`, `def`, etc.
- **Identifiers**: Names used for variables, functions, classes, etc.
- **Literals**: Fixed values like numbers, strings, booleans, etc.
- **Operators**: Symbols representing computations or operations.
- **Delimiters**: Characters used to separate tokens.

## Identifiers and Keywords
**Identifiers** are names given to variables, functions, classes, and other objects. Identifiers must follow these rules:

- Must start with a letter (a-z, A-Z) or an underscore (`_`).
- Followed by letters, digits (0-9), or underscores.
- Case-sensitive (e.g., `Variable` and `variable` are different).

```python
# Valid identifiers
my_variable = 10
_function = lambda x: x * 2
ClassName = "Example"

# Invalid identifier (starts with a digit)
# 1st_var = 5
```

**Keywords** are predefined, reserved words in Python that have special meanings and cannot be used as identifiers. Some keywords include:

```python
# Examples of Python keywords
if, else, elif, for, while, break, continue, return, def, class, import, from, as, pass, lambda, global, nonlocal, assert, try, except, finally, raise, with, yield, async, await, etc.
```

## Literals
Literals represent constant values in Python. There are several types of literals:

- **String Literals**: Enclosed in single quotes (`'`), double quotes (`"`), triple single quotes (`'''`), or triple double quotes (`"""`).

    ```python
    single_quote_str = 'Hello'
    double_quote_str = "World"
    triple_quote_str = '''This is a
    multiline string'''
    ```

- **Numeric Literals**: Include integers, floating-point numbers, and complex numbers.

    ```python
    int_literal = 42
    float_literal = 3.14
    complex_literal = 1 + 2j
    ```

- **Boolean Literals**: Represented by `True` and `False`.

    ```python
    bool_true = True
    bool_false = False
    ```

- **None Literal**: Represents the absence of a value.

    ```python
    none_value = None
    ```

## Operators
Operators are symbols that perform operations on variables and values. Python has several types of operators:

- **Arithmetic Operators**: `+`, `-`, `*`, `/`, `%`, `**`, `//`

    ```python
    add = 5 + 3
    subtract = 10 - 2
    multiply = 4 * 2
    divide = 16 / 4
    modulo = 10 % 3
    exponent = 2 ** 3
    floor_divide = 7 // 2
    ```

- **Comparison Operators**: `==`, `!=`, `>`, `<`, `>=`, `<=`

    ```python
    equal = 5 == 5
    not_equal = 5 != 3
    greater = 10 > 5
    less = 5 < 10
    greater_equal = 7 >= 7
    less_equal = 4 <= 9
    ```

- **Logical Operators**: `and`, `or`, `not`

    ```python
    logical_and = True and False
    logical_or = True or False
    logical_not = not True
    ```

- **Assignment Operators**: `=`, `+=`, `-=`, `*=`, `/=`, `%=`, `**=`, `//=`

    ```python
    x = 10
    x += 5  # x = x + 5
    x -= 3  # x = x - 3
    x *= 2  # x = x * 2
    x /= 2  # x = x / 2
    ```

- **Bitwise Operators**: `&`, `|`, `^`, `~`, `<<`, `>>`

    ```python
    bitwise_and = 5 & 3
    bitwise_or = 5 | 3
    bitwise_xor = 5 ^ 3
    bitwise_not = ~5
    left_shift = 5 << 1
    right_shift = 5 >> 1
    ```

## Delimiters
Delimiters are characters or sequences of characters that separate tokens. In Python, delimiters include:

- **Parentheses**: `(` and `)`
- **Brackets**: `[` and `]`
- **Braces**: `{` and `}`
- **Commas**: `,`
- **Colons**: `:`
- **Semicolons**: `;`
- **Periods**: `.`
- **At symbols**: `@`
- **Equal signs**: `=`
- **Arrow (for lambda expressions)**: `->`

```python
# Examples using delimiters
list_example = [1, 2, 3]
tuple_example = (4, 5, 6)
dict_example = {'key': 'value'}
lambda_example = lambda x: x * 2
```

Understanding these components of lexical analysis in Python helps in writing syntactically correct and readable code.
