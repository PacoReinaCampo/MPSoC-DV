# LANGUAGE

## PREPROCESSOR

The preprocessor in C++ is responsible for handling directives that begin with a hash sign (#). These directives are processed before the actual compilation of the program begins. Common preprocessor directives include `#include` to include header files, `#define` to define macros, and `#ifdef`/`#ifndef` for conditional compilation.

## ASCII CHART

ASCII (American Standard Code for Information Interchange) is a character encoding standard that assigns numeric values to characters. In C++, characters are represented as integers according to the ASCII chart. For example, the ASCII value for 'A' is 65, 'B' is 66, and so on.

## BASIC CONCEPTS

### Comments

Comments in C++ are used to annotate code and are ignored by the compiler. There are two types of comments: single-line comments, which start with `//`, and multi-line comments, which are enclosed between `/*` and `*/`.

### Names (lookup)

In C++, names are used to identify variables, functions, classes, and other entities in the program. The process of finding the declaration of a name in the program is called name lookup.

### Types (fundamental types)

C++ has several fundamental data types, including `int`, `float`, `double`, `char`, `bool`, etc. These types represent basic data values that can be manipulated in the program.

### The main function

The `main()` function is the entry point of C++ programs. Execution of a C++ program starts from the `main()` function. It can have a return type of `int` and optionally take arguments from the command line.

## EXPRESSIONS

### Value categories

In C++, expressions can have different value categories, such as lvalues and rvalues. An lvalue refers to an object that has a persistent memory location, while an rvalue refers to a temporary value that does not necessarily have a persistent memory location.

### Evaluation order

The order in which subexpressions within an expression are evaluated is determined by the compiler. In some cases, the order of evaluation is unspecified, which can lead to undefined behavior if the expression relies on a specific order.

### Operators (precedence)

Operators in C++ have precedence rules that determine the order in which they are evaluated within an expression. For example, multiplication (`*`) has higher precedence than addition (`+`), so `a * b + c` is evaluated as `(a * b) + c`, not `a * (b + c)`.

### Conversions − Literals

C++ supports implicit and explicit type conversions, which allow literals of one type to be converted to another type. For example, an `int` literal can be implicitly converted to a `double` if necessary.

## STATEMENTS

### if − switch

The `if` statement is used for conditional branching in C++. It allows the execution of a block of code based on a condition. The `switch` statement provides another form of conditional branching based on the value of an expression.

### for − range-for (C++11)

The `for` loop in C++ is used for iterating over a range of values. The range-based `for` loop introduced in C++11 simplifies iterating over elements of a container, such as arrays or containers from the standard library.

### while − do-while

The `while` loop is used to repeatedly execute a block of code as long as a condition is true. The `do-while` loop is similar to the `while` loop but guarantees that the block of code is executed at least once before checking the condition.

## DECLARATIONS − INITIALIZATION

Declarations in C++ are used to introduce names into the program and specify their types. Initialization refers to the process of assigning an initial value to a variable at the time of declaration.

## FUNCTIONS − OVERLOADING

Function overloading in C++ allows multiple functions with the same name to be defined, as long as they have different parameter lists. The appropriate function to call is determined based on the number and types of arguments provided.

## CLASSES (UNIONS)

Classes in C++ are used to define user-defined data types with properties and behaviors. They can contain member variables and member functions. Unions are a special type of class where all members share the same memory location.

## TEMPLATES − EXCEPTIONS

Templates in C++ allow for generic programming by defining functions or classes with generic types. This enables writing code that works with any data type. Exceptions are used for handling runtime errors or exceptional conditions that may occur during program execution.

## FREESTANDING IMPLEMENTATIONS

Freestanding implementations refer to the ability to write C++ programs without relying on the full standard library provided by the implementation. This is particularly useful in embedded systems or other environments where the standard library may not be available or suitable.
