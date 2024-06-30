# OPERATORS AND EXPRESSIONS

Operators in Java are symbols that perform operations on variables and values. Expressions are combinations of variables, constants, and operators that produce a single value.

### ARITHMETIC OPERATIONS

Java supports standard arithmetic operations:

- **Addition (`+`)**: Adds two operands.
- **Subtraction (`-`)**: Subtracts the second operand from the first.
- **Multiplication (`*`)**: Multiplies two operands.
- **Division (`/`)**: Divides the first operand by the second.
- **Modulus (`%`)**: Returns the remainder of the division of the first operand by the second.

```java
int a = 10;
int b = 3;

int sum = a + b;        // 13
int difference = a - b; // 7
int product = a * b;    // 30
int quotient = a / b;   // 3
int remainder = a % b;  // 1
```

### GENERAL OPERATORS

Java supports various types of operators:

- **Assignment (`=`)**: Assigns a value to a variable.
- **Comparison (`==`, `!=`, `>`, `<`, `>=`, `<=`)**: Compares two operands.
- **Logical (`&&`, `||`, `!`)**: Perform logical operations (`AND`, `OR`, `NOT`).
- **Bitwise (`&`, `|`, `^`, `~`, `<<`, `>>`, `>>>`)**: Perform bitwise operations.
- **Increment (`++`)** and **Decrement (`--`)**: Increase or decrease the value of a variable by one.
- **Conditional (`? :`)**: Ternary operator used for decision making.

```java
int x = 5;
int y = 3;

boolean isEqual = (x == y);     // false
boolean isGreaterThan = (x > y); // true

int result = (x > y) ? x : y;   // result will be 5
```

### EXPRESSIONS

Expressions are combinations of operators and operands that evaluate to a single value. They can be simple or complex, involving multiple operations and parentheses to enforce precedence.

```java
int a = 10;
int b = 5;
int c = 3;

int result = (a + b) * c; // result is 45
```

### TYPE CONVERSIONS

Java supports automatic and explicit type conversions:

- **Implicit Type Conversion**: Conversion performed by the compiler without programmer intervention (e.g., `int` to `long`).
- **Explicit Type Conversion (Casting)**: Programmer manually converts one type to another using casting operators (`(type)`).

```java
int intValue = 10;
double doubleValue = 3.14;

double result = intValue + doubleValue; // automatic conversion
int roundedResult = (int) (intValue + doubleValue); // explicit casting
```

### OPERATOR PRECEDENCE AND ASSOCIATIVITY

Operators in Java have precedence rules that determine the order in which operations are evaluated. Operators with higher precedence are evaluated first. Associativity determines the order of evaluation for operators of the same precedence level (left-to-right or right-to-left).

```java
int result = 10 + 5 * 2; // result will be 20, because multiplication has higher precedence than addition
```

### MEMBER ACCESS

Member access operators in Java allow access to class members:

- **`.`**: Accesses members of an object (instance variables and methods).
- **`this`**: Refers to the current object instance.
- **`super`**: Refers to the superclass of the current object.

```java
class MyClass {
    int myField;
    
    void myMethod() {
        System.out.println("Hello, World!");
    }
}

MyClass obj = new MyClass();
obj.myField = 10;   // Accessing instance variable
obj.myMethod();     // Calling instance method
```

This manual provides a comprehensive overview of operators and expressions in Java, covering arithmetic operations, general operators, expressions, type conversions, operator precedence and associativity, and member access. For more detailed information, refer to the Java documentation and additional resources.
