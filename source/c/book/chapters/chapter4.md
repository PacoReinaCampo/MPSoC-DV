# STATEMENTS IN C

## LABELS

Labels are identifiers followed by a colon (`:`) and are used to name a location in the code. They are primarily used with the `goto` statement.

Example:
```c
int main() {
    int x = 0;
    label:
    x++;
    if (x < 5) {
        goto label;
    }
    return 0;
}
```

## EXPRESSION STATEMENTS

An expression statement is an expression followed by a semicolon (`;`). It can include assignments, function calls, or other expressions.

Example:
```c
int main() {
    int a = 5;
    a = a + 1;  // Expression statement
    printf("%d\n", a);  // Expression statement
    return 0;
}
```

## THE IF STATEMENT

The `if` statement executes a block of code if a specified condition is true.

Example:
```c
int main() {
    int a = 5;
    if (a > 3) {
        printf("a is greater than 3\n");
    }
    return 0;
}
```

## THE SWITCH STATEMENT

The `switch` statement allows multi-way branching based on the value of an expression. Each `case` label represents a branch.

Example:
```c
int main() {
    int a = 2;
    switch (a) {
        case 1:
            printf("a is 1\n");
            break;
        case 2:
            printf("a is 2\n");
            break;
        default:
            printf("a is not 1 or 2\n");
            break;
    }
    return 0;
}
```

## THE WHILE STATEMENT

The `while` statement executes a block of code repeatedly as long as a condition is true.

Example:
```c
int main() {
    int a = 0;
    while (a < 5) {
        printf("%d\n", a);
        a++;
    }
    return 0;
}
```

## THE DO STATEMENT

The `do` statement is similar to the `while` statement, but the condition is checked after the loop body is executed.

Example:
```c
int main() {
    int a = 0;
    do {
        printf("%d\n", a);
        a++;
    } while (a < 5);
    return 0;
}
```

## THE FOR STATEMENT

The `for` statement is used for iterating over a range of values. It includes initialization, condition, and increment expressions.

Example:
```c
int main() {
    for (int a = 0; a < 5; a++) {
        printf("%d\n", a);
    }
    return 0;
}
```

## BLOCKS

A block is a set of statements enclosed in braces `{}`. Blocks are used to group multiple statements together.

Example:
```c
int main() {
    int a = 5;
    if (a > 3) {
        printf("a is greater than 3\n");
        a++;
    }
    return 0;
}
```

## THE NULL STATEMENT

A null statement is just a semicolon (`;`). It does nothing and is often used in loops where the body is empty.

Example:
```c
int main() {
    int a = 0;
    while (a++ < 5);  // Null statement
    printf("%d\n", a);
    return 0;
}
```

## THE GOTO STATEMENT

The `goto` statement transfers control to the labeled statement. It can make the code harder to understand and maintain.

Example:
```c
int main() {
    int a = 0;
    goto start;
    a = 5;
    start:
    printf("%d\n", a);  // Output is 0
    return 0;
}
```

## THE BREAK STATEMENT

The `break` statement terminates the nearest enclosing loop or `switch` statement.

Example:
```c
int main() {
    for (int a = 0; a < 10; a++) {
        if (a == 5) {
            break;
        }
        printf("%d\n", a);
    }
    return 0;
}
```

## THE CONTINUE STATEMENT

The `continue` statement skips the rest of the loop iteration and proceeds with the next iteration.

Example:
```c
int main() {
    for (int a = 0; a < 10; a++) {
        if (a % 2 == 0) {
            continue;
        }
        printf("%d\n", a);
    }
    return 0;
}
```

## THE RETURN STATEMENT

The `return` statement exits a function and optionally returns a value to the calling function.

Example:
```c
int add(int a, int b) {
    return a + b;
}

int main() {
    int result = add(5, 3);
    printf("%d\n", result);
    return 0;
}
```

## THE TYPEDEF STATEMENT

The `typedef` statement creates an alias for a data type, making the code easier to read and maintain.

Example:
```c
typedef unsigned long ulong;
int main() {
    ulong a = 1000000;
    printf("%lu\n", a);
    return 0;
}
```

These statements form the foundation of control flow and structure in C programs, allowing for complex operations and logic to be implemented.
