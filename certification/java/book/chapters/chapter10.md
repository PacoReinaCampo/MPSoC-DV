# CONTROL FLOW

Control flow in Java refers to the order in which statements are executed in a program. Java provides various control flow statements to dictate this order based on conditions, loops, and method calls.

### STATEMENTS AND BLOCKS

   * **Statements**: Individual instructions that Java executes (e.g., variable declarations, method calls).
   * **Blocks**: Groups of statements enclosed in curly braces `{}`. Used to define scope and combine multiple statements into a single unit.

```java
// Block example
{
    int x = 10;
    System.out.println("Value of x: " + x);
}
```

### IF-ELSE

The `if-else` statement executes a block of code if a specified condition is true. Optionally, an `else` block executes if the condition is false.

```java
int num = 10;
if (num > 0) {
    System.out.println("Positive number");
} else {
    System.out.println("Non-positive number");
}
```

### SWITCH

The `switch` statement evaluates an expression against multiple possible case values. It executes the block of code corresponding to the first matching case.

```java
int dayOfWeek = 3;
switch (dayOfWeek) {
    case 1:
        System.out.println("Monday");
        break;
    case 2:
        System.out.println("Tuesday");
        break;
    default:
        System.out.println("Unknown day");
}
```

### WHILE AND DO-WHILE

   * **`while`**: Executes a block of code as long as a specified condition is true.

```java
int count = 0;
while (count < 5) {
    System.out.println("Count: " + count);
    count++;
}
```

   * **`do-while`**: Similar to `while`, but guarantees at least one execution of the block before checking the condition.

```java
int num = 1;
do {
    System.out.println("Number: " + num);
    num++;
} while (num <= 5);
```

### FOR

The `for` statement provides a compact way to iterate over a range of values. It consists of initialization, condition, and update expressions within parentheses.

```java
for (int i = 1; i <= 5; i++) {
    System.out.println("Iteration: " + i);
}
```

### LABELS

Labels in Java are identifiers followed by a colon (`:`). They are used with break and continue statements to specify the target of the jump within nested loops.

```java
outerLoop:
for (int i = 1; i <= 3; i++) {
    innerLoop:
    for (int j = 1; j <= 3; j++) {
        if (i == 2 && j == 2) {
            break outerLoop; // Breaks out of outer loop
        }
        System.out.println(i + " " + j);
    }
}
```

### BREAK

The `break` statement terminates the current loop or switch statement and transfers control to the statement immediately following the terminated statement.

```java
for (int i = 1; i <= 10; i++) {
    if (i == 5) {
        break; // Exit loop when i equals 5
    }
    System.out.println("Value of i: " + i);
}
```

### CONTINUE

The `continue` statement skips the current iteration of a loop and proceeds to the next iteration.

```java
for (int i = 1; i <= 5; i++) {
    if (i % 2 == 0) {
        continue; // Skip even numbers
    }
    System.out.println("Odd number: " + i);
}
```

### RETURN

The `return` statement exits from the current method and optionally returns a value to the caller.

```java
public int add(int a, int b) {
    return a + b; // Returns the sum of a and b
}
```

### WHAT, NO GOTO?

Java does not support the `goto` statement to jump to a labeled statement elsewhere in the code. It was intentionally omitted to simplify program control flow and avoid potential misuse that can lead to unreadable code.

This manual provides a comprehensive overview of control flow statements in Java, covering statements and blocks, `if-else`, `switch`, `while` and `do-while` loops, `for` loop, labels, `break`, `continue`, `return`, and the absence of `goto`. For more detailed information, refer to the Java documentation and additional resources.
