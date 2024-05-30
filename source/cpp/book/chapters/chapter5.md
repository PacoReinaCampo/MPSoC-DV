# Language support library
## Program Utilities
The program utilities in the C++ language support library provide various functionalities that help in program execution and management. This includes utilities for program termination (`std::exit`, `std::abort`), environment access (`std::getenv`, `std::setenv`), program termination handlers (`std::atexit`, `std::at_quick_exit`), and more.

## source_location (C++20)
`std::source_location` is a new feature introduced in C++20. It provides information about the current source code location, including file name, line number, and column number. This can be useful for debugging, logging, and error reporting, allowing developers to easily identify the origin of code execution.

## Coroutine Support (C++20)
Coroutines are a new language feature introduced in C++20 that allows functions to be suspended and resumed at certain points without losing their state. This enables asynchronous programming paradigms, such as generators, cooperative multitasking, and asynchronous I/O operations, to be implemented more efficiently and elegantly.

## Three-Way Comparison (C++20)
Three-way comparison, also known as spaceship operator (`<=>`), is a new feature introduced in C++20 that provides a standardized way to perform three-way comparisons between objects. It returns a value that indicates whether the first object is less than, equal to, or greater than the second object. This simplifies code and improves readability, especially when working with user-defined types.

## Type Support
The type support features in the C++ language support library provide utilities for working with types at runtime. This includes functionalities such as querying type information (`std::type_info`), determining the characteristics of numeric types (`std::numeric_limits`), and more.

## numeric_limits - type_info
- `std::numeric_limits`: This template class provides information about the properties of arithmetic types, such as the minimum and maximum representable values, precision, and characteristics like whether the type is signed or floating-point.
- `std::type_info`: This class provides information about types at runtime. It is commonly used with features like dynamic casting and RTTI (Run-Time Type Information) to determine the types of objects dynamically.

## initializer_list (C++11)
`std::initializer_list` is a template class introduced in C++11 that provides a convenient way to initialize containers and other objects with a list of elements. It allows brace-enclosed lists of elements to be passed as arguments to constructors and functions, enabling uniform initialization syntax in C++. This is particularly useful for initializing standard library containers like `std::vector`, `std::array`, and `std::initializer_list`.

These language support library features enhance the capabilities of C++ by providing utilities for program management, debugging, asynchronous programming, type information, and more. They contribute to making C++ code more expressive, efficient, and maintainable.
