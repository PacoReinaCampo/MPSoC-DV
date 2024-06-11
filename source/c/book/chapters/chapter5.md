# FUNCTIONS

Functions in C are fundamental units of code that perform specific tasks. Let's explore the various aspects of functions in detail.

## FUNCTION DECLARATIONS

A function declaration, also known as a function prototype, specifies the function's name, return type, and parameters without providing the body.

Example:
```c
int add(int, int);
void printMessage(void);
```

## FUNCTION DEFINITIONS

A function definition includes the function header and the body, where the actual code resides.

Example:
```c
int add(int a, int b) {
    return a + b;
}

void printMessage(void) {
    printf("Hello, World!\n");
}
```

## CALLING FUNCTIONS

Functions are called by using their name followed by parentheses enclosing any arguments.

Example:
```c
int main() {
    int result = add(5, 3);
    printMessage();
    return 0;
}
```

## FUNCTION PARAMETERS

Function parameters are variables declared in the function declaration and definition to accept values passed during a function call.

Example:
```c
void display(int a) {
    printf("%d\n", a);
}

int main() {
    display(10);
    return 0;
}
```

## VARIABLE LENGTH PARAMETER LISTS

C allows functions to accept a variable number of arguments using the `stdarg.h` library.

Example:
```c
#include <stdarg.h>

#include <stdio.h>

void printNumbers(int count, ...) {
    va_list args;
    va_start(args, count);
    for (int i = 0; i < count; i++) {
        int num = va_arg(args, int);
        printf("%d ", num);
    }
    va_end(args);
    printf("\n");
}

int main() {
    printNumbers(3, 1, 2, 3);
    return 0;
}
```

## CALLING FUNCTIONS THROUGH FUNCTION POINTERS

Function pointers allow storing addresses of functions and calling them indirectly.

Example:
```c
#include <stdio.h>

int add(int a, int b) {
    return a + b;
}

int main() {
    int (*funcPtr)(int, int) = add;
    int result = funcPtr(5, 3);
    printf("%d\n", result);
    return 0;
}
```

## THE MAIN FUNCTION

The `main` function is the entry point of a C program. It can return an integer to the operating system and can take arguments.

Example:
```c
int main() {
    return 0;
}

// With command line arguments
int main(int argc, char *argv[]) {
    for (int i = 0; i < argc; i++) {
        printf("Argument %d: %s\n", i, argv[i]);
    }
    return 0;
}
```

## RECURSIVE FUNCTIONS

A recursive function calls itself to solve smaller instances of the same problem.

Example:
```c
int factorial(int n) {
    if (n == 0) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}

int main() {
    int result = factorial(5);
    printf("%d\n", result);
    return 0;
}
```

## STATIC FUNCTIONS

A static function in C has internal linkage, meaning it can only be called within the file it is defined in.

Example:
```c
static void printMessage(void) {
    printf("Hello, World!\n");
}

int main() {
    printMessage();
    return 0;
}
```

## NESTED FUNCTIONS

C does not support nested functions (functions defined within other functions) directly. However, some compilers, like GCC, provide this as an extension.

Example with GCC:
```c
#include <stdio.h>

void outerFunction(void) {
    void innerFunction(void) {
        printf("Inner function\n");
    }
    innerFunction();
}

int main() {
    outerFunction();
    return 0;
}
```

These are the core concepts related to functions in C, providing the foundation for organizing and structuring code effectively.
