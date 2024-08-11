# EXPRESSIONS AND OPERATORS

## EXPRESSIONS

Expressions in C are combinations of variables, constants, operators, and function calls that are evaluated to produce a value.

Examples:
```c
int x = 5 + 3;
float y = sin(3.14);
```

## ASSIGNMENT OPERATORS

Assignment operators assign values to variables. The basic assignment operator is `=`, but there are compound assignment operators that combine an arithmetic operation with assignment.

Examples:
```c
int a = 10;
a += 5;  // Equivalent to a = a + 5;
a -= 3;  // Equivalent to a = a - 3;
a *= 2;  // Equivalent to a = a * 2;
a /= 2;  // Equivalent to a = a / 2;
a %= 3;  // Equivalent to a = a % 3;
```

## INCREMENTING AND DECREMENTING

The increment (`++`) and decrement (`--`) operators increase or decrease the value of a variable by one, respectively. They can be used in prefix or postfix form.

Examples:
```c
int a = 5;
int b = ++a;  // Prefix: b is 6, a is 6
int c = a--;  // Postfix: c is 6, a is 5
```

## ARITHMETIC OPERATORS

Arithmetic operators perform mathematical operations on numeric values.

Examples:
```c
int sum = 10 + 5;     // Addition
int diff = 10 - 5;    // Subtraction
int prod = 10 * 5;    // Multiplication
int quotient = 10 / 5; // Division
int remainder = 10 % 3; // Modulus (remainder of division)
```

## COMPLEX CONJUGATION

Complex conjugation is not directly supported in C. However, with `<complex.h>`, you can use the `conj` function.

Example:
```c
#include <complex.h>

double complex z = 1.0 + 2.0*I;
double complex z_conj = conj(z);  // Complex conjugate of z
```

## COMPARISON OPERATORS

Comparison operators compare two values and return either true (1) or false (0).

Examples:
```c
int a = 10, b = 20;
int result;

result = (a == b);  // Equal to
result = (a != b);  // Not equal to
result = (a > b);   // Greater than
result = (a < b);   // Less than
result = (a >= b);  // Greater than or equal to
result = (a <= b);  // Less than or equal to
```

## LOGICAL OPERATORS

Logical operators are used to combine multiple conditions.

Examples:
```c
int a = 1, b = 0;
int result;

result = (a && b);  // Logical AND
result = (a || b);  // Logical OR
result = (!a);      // Logical NOT
```

## BIT SHIFTING

Bit shifting operators shift the bits of a number to the left or right.

Examples:
```c
int a = 5;          // Binary: 0101
int b = a << 1;     // Left shift: 1010 (10 in decimal)
int c = a >> 1;     // Right shift: 0010 (2 in decimal)
```

## BITWISE LOGICAL OPERATORS

Bitwise operators perform operations on the individual bits of integer values.

Examples:
```c
int a = 5;    // Binary: 0101
int b = 3;    // Binary: 0011

int result;

result = a & b;   // AND: 0001 (1 in decimal)
result = a | b;   // OR: 0111 (7 in decimal)
result = a ^ b;   // XOR: 0110 (6 in decimal)
result = ~a;      // NOT: 1010 (Two's complement)
```

## POINTER OPERATORS

Pointer operators are used to work with pointers.

Examples:
```c
int var = 20;
int *ptr;

ptr = &var;  // Address-of operator
int value = *ptr; // Dereference operator
```

## THE SIZEOF OPERATOR

The `sizeof` operator returns the size, in bytes, of a data type or object.

Examples:
```c
int size;

size = sizeof(int);     // Size of int
size = sizeof(var);     // Size of var
size = sizeof(ptr);     // Size of pointer
```

## TYPE CASTS

Type casting allows you to convert a value from one data type to another.

Examples:
```c
int a = 10;
float b;

b = (float)a;  // Cast integer to float
```

## ARRAY SUBSCRIPTS

Array subscripts are used to access elements of an array.

Examples:
```c
int arr[5] = {10, 20, 30, 40, 50};
int value = arr[2];  // Access the third element
```

## FUNCTION CALLS AS EXPRESSIONS

Function calls can be used as expressions where the return value is used.

Examples:
```c
int sum(int x, int y) {
    return x + y;
}

int result = sum(10, 20);  // Function call as expression
```

## THE COMMA OPERATOR

The comma operator allows multiple expressions to be evaluated in a single statement, with the value of the last expression being the result.

Examples:
```c
int a = 1, b = 2, c;
c = (a += 2, b += 3, a + b);  // c is 8
```

## MEMBER ACCESS EXPRESSIONS

Member access expressions are used to access members of structures or unions.

Examples:
```c
struct Person {
    char name[50];
    int age;
};

struct Person person;
person.age = 30;  // Member access with dot operator

struct Person *p = &person;
p->age = 30;  // Member access with arrow operator
```

## CONDITIONAL EXPRESSIONS

The conditional (ternary) operator evaluates a condition and returns one of two values based on the condition.

Examples:
```c
int a = 10, b = 20;
int max;

max = (a > b) ? a : b;  // If a > b, max is a; otherwise, max is b
```

## STATEMENTS AND DECLARATIONS IN EXPRESSIONS

C allows statements and declarations within expressions using the comma operator.

Examples:
```c
int x, y;
y = (x = 3, x + 2);  // y is 5
```

## OPERATOR PRECEDENCE

Operator precedence determines the order in which operators are evaluated in expressions.

Examples:
```c
int result = 5 + 3 * 2;  // Multiplication has higher precedence than addition, so result is 11
```

## ORDER OF EVALUATION

The order of evaluation specifies the sequence in which the sub-expressions of an expression are evaluated.

### Side Effects

Side effects are changes in the state of the execution environment (e.g., modifying a variable).

Examples:
```c
int x = 0;
x = x + 1;  // The assignment has a side effect of changing x
```

### Sequence Points

Sequence points define points in the program where all side effects of previous evaluations are complete.

### Sequence Points Constrain Expressions

Certain operations must occur in a specific order due to sequence points.

Examples:
```c
int i = 0;
i = i++ + 1;  // Undefined behavior due to lack of sequence point between i++ and assignment
```

### Sequence Points and Signal Delivery

Sequence points are critical for determining the behavior of signal handling in C programs.

Examples:
```c
#include <signal.h>

void handler(int signum) {
    // Signal handling code
}

int main() {
    signal(SIGINT, handler);
    // Sequence points ensure signal handling occurs at defined points
    return 0;
}
```

Understanding these concepts is crucial for writing correct and efficient C programs.
