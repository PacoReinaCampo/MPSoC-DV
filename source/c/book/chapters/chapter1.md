# Lexical Elements

## Identifiers

Identifiers are names used to identify variables, functions, arrays, structures, and other user-defined items. An identifier in C must adhere to the following rules:
- Can include letters (both uppercase and lowercase), digits (0-9), and underscores (_).
- Must begin with a letter or an underscore. Digits cannot be the first character.
- Case-sensitive: `myVar` and `myvar` are different identifiers.
- Cannot be a keyword (e.g., `int`, `return`).

Examples:
```c
int count;
float total_sum;
char firstName[50];
```

## Keywords

Keywords are reserved words predefined by the C language. They have special meanings and cannot be used as identifiers. Some commonly used keywords include:
- Data types: `int`, `float`, `char`, `double`
- Control statements: `if`, `else`, `switch`, `case`, `for`, `while`, `do`, `break`, `continue`
- Others: `return`, `sizeof`, `void`, `static`, `struct`, `typedef`

Example:
```c
int main() {
    if (1) {
        return 0;
    }
}
```

## Constants

Constants are fixed values that do not change during the execution of a program. They are divided into several types:

### Integer Constants

Integer constants represent whole numbers without any fractional or decimal part. They can be written in different number systems:
- Decimal (base 10): `0`, `123`, `-456`
- Octal (base 8): prefixed with `0` (zero), e.g., `0123`
- Hexadecimal (base 16): prefixed with `0x` or `0X`, e.g., `0x1A3F`

Example:
```c
int dec = 100;
int oct = 0123;
int hex = 0x1A3F;
```

### Character Constants

Character constants represent single characters enclosed in single quotes. They can be any character from the C character set, including escape sequences.
- Example: `'a'`, `'1'`, `'\n'` (newline), `'\t'` (tab)

Example:
```c
char letter = 'A';
char newline = '\n';
```

### Real Number Constants

Real number constants (floating-point constants) represent numbers with a fractional part. They can be expressed in:
- Decimal notation: `3.14`, `-0.001`
- Exponential notation: `1.23e3` (1.23 × 10^3), `5.67E-2` (5.67 × 10^-2)

Example:
```c
float pi = 3.14;
double exp = 1.23e3;
```

### String Constants

String constants (string literals) are sequences of characters enclosed in double quotes. They are null-terminated, meaning they end with a special character `'\0'`.
- Example: `"Hello, World!"`, `"C programming"`

Example:
```c
char greeting[] = "Hello, World!";
```

## Operators

Operators are symbols that specify operations to be performed on operands. C has several categories of operators:
- Arithmetic: `+`, `-`, `*`, `/`, `%`
- Relational: `==`, `!=`, `<`, `>`, `<=`, `>=`
- Logical: `&&`, `||`, `!`
- Bitwise: `&`, `|`, `^`, `~`, `<<`, `>>`
- Assignment: `=`, `+=`, `-=`, `*=`, `/=`, `%=`
- Increment/Decrement: `++`, `--`
- Miscellaneous: `sizeof`, `&` (address), `*` (pointer), `? :` (ternary)

Example:
```c
int a = 10, b = 20;
int sum = a + b;      // Arithmetic
int isEqual = (a == b); // Relational
int andResult = a & b;  // Bitwise
```

## Separators

Separators (also called delimiters) are used to separate different elements in a program. In C, the following characters are used as separators:
- Comma `,`: separates items in a list
- Semicolon `;`: marks the end of a statement
- Parentheses `()`: used in function calls and declarations
- Braces `{}`: used to define blocks of code
- Brackets `[]`: used to define arrays and index arrays

Example:
```c
int numbers[5] = {1, 2, 3, 4, 5};
if (a < b) {
    printf("a is less than b\n");
}
```

## White Space

White space in C includes spaces, tabs, and newline characters. White space is generally ignored by the compiler but is essential for separating tokens and making the code readable. It is used to:
- Separate keywords, identifiers, constants, and operators
- Indent code for better readability

Example:
```c
int main() {
    int a = 10;
    int b = 20;
    if (a < b) {
        printf("a is less than b\n");
    }
    return 0;
}
```

White space is crucial for the readability and maintainability of the code but does not affect the execution of the program.

By understanding these lexical elements, you can effectively write and read C programs, ensuring they are syntactically correct and easy to understand.
