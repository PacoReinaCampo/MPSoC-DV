# Program Structure and Scope
Understanding the structure and scope of a C program is crucial for writing clear, maintainable, and efficient code. Let's delve into these concepts in detail.

## Program Structure

A typical C program consists of the following parts:
1. **Preprocessor Directives**
2. **Global Declarations**
3. **Function Definitions**
4. **Main Function**

### Preprocessor Directives

Preprocessor directives are instructions processed by the preprocessor before the actual compilation of code begins. They are used for including files, defining constants, and macros.

Example:
```c
#include <stdio.h>
#define PI 3.14159
```

### Global Declarations

Global declarations are variables and functions that are declared outside of any function. They have global scope and can be accessed from any function within the program.

Example:
```c
int globalVar = 10;

void globalFunction() {
    printf("This is a global function\n");
}
```

### Function Definitions

Function definitions contain the actual code for the functions declared in the program. Each function performs a specific task.

Example:
```c
int add(int a, int b) {
    return a + b;
}

void printMessage() {
    printf("Hello, World!\n");
}
```

### Main Function

The `main` function is the entry point of every C program. Execution starts from this function.

Example:
```c
int main() {
    printMessage();
    int result = add(5, 3);
    printf("Result: %d\n", result);
    return 0;
}
```

## Scope

Scope in C refers to the visibility and lifetime of variables and functions within a program. There are several types of scope:

1. **Block Scope**
2. **Function Scope**
3. **File Scope**
4. **Function Prototype Scope**

### Block Scope

Variables declared within a block `{}` have block scope and are accessible only within that block.

Example:
```c
int main() {
    int x = 10;
    if (x > 5) {
        int y = 20;  // y has block scope
        printf("y = %d\n", y);
    }
    // y is not accessible here
    return 0;
}
```

### Function Scope

Labels in C have function scope. They are visible throughout the function in which they are defined.

Example:
```c
int main() {
    goto label;
    // Other code
    label:  // Label with function scope
    printf("Label reached\n");
    return 0;
}
```

### File Scope

Global variables and functions declared outside any function have file scope. They are visible from the point of declaration to the end of the file.

Example:
```c
int globalVar = 10;  // Global variable with file scope

void func() {
    printf("Global variable: %d\n", globalVar);
}
```

### Function Prototype Scope

In function prototypes, parameter names have function prototype scope and are ignored during function calls. They are used only for defining the function's interface.

Example:
```c
void func(int x, int y);  // x and y have function prototype scope

void func(int a, int b) {  // a and b have block scope within the function definition
    printf("a = %d, b = %d\n", a, b);
}

int main() {
    func(5, 10);
    return 0;
}
```

### Static Variables and Scope

Static variables have a lifetime equal to the program’s lifetime but a scope that is limited to the block or function they are defined in.

Example:
```c
#include <stdio.h>

void func() {
    static int count = 0;  // Static variable with block scope and program lifetime
    count++;
    printf("Count: %d\n", count);
}

int main() {
    func();
    func();
    return 0;
}
```

### External Variables

Variables declared with the `extern` keyword are accessible across multiple files.

Example (in multiple files):
File1.c:
```c
int globalVar = 10;  // Definition of globalVar

void func() {
    printf("Global variable: %d\n", globalVar);
}
```

File2.c:
```c
extern int globalVar;  // Declaration of globalVar

int main() {
    globalVar = 20;
    func();
    return 0;
}
```

Understanding the structure and scope in C is essential for organizing code effectively, avoiding naming conflicts, and ensuring variables and functions are used appropriately within their intended context.
