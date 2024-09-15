# EXCEPTIONS AND ASSERTIONS

Exceptions and assertions in Java provide mechanisms to handle and validate exceptional conditions and errors that may occur during program execution.

### CREATING EXCEPTION TYPES

Custom exception types are created by extending `Exception` or `RuntimeException` (for unchecked exceptions) classes:

```java
public class CustomException extends Exception {
    public CustomException(String message) {
        super(message);
    }
}
```

### THROW

The `throw` statement explicitly throws an exception. It is used to indicate that a specific exception occurred during program execution:

```java
public void validateAge(int age) throws IllegalArgumentException {
    if (age < 0) {
        throw new IllegalArgumentException("Age cannot be negative");
    }
}
```

### THE THROWS CLAUSE

The `throws` clause is used in method declarations to specify that the method may throw certain exceptions. It informs callers of potential exceptions they need to handle or propagate:

```java
public void readFile(String fileName) throws IOException {
    // Code that may throw IOException
}
```

### TRY, CATCH, AND FINALLY

The `try-catch-finally` block is used to handle exceptions:
   * **`try`**: Encloses code that may throw exceptions.
   * **`catch`**: Handles specific exceptions thrown within the `try` block.
   * **`finally`**: Executes code after `try` block, regardless of whether an exception is thrown or not (optional).

```java
try {
    // Code that may throw exceptions
} catch (IOException e) {
    // Handle IOException
} finally {
    // Optional: cleanup code
}
```

### EXCEPTION CHAINING

Exceptions can be chained using constructors to maintain information about the root cause of an exception:

```java
public void methodA() throws CustomException {
    try {
        // Code that may throw IOException
    } catch (IOException e) {
        throw new CustomException("Error occurred in methodA", e);
    }
}
```

### STACK TRACES

Java provides stack traces when exceptions occur, showing the sequence of method calls leading up to the exception. Stack traces help in debugging and identifying the cause of exceptions.

### WHEN TO USE EXCEPTIONS

Use exceptions for:
   * Handling exceptional conditions (e.g., file not found, network errors).
   * Maintaining clean and readable code by separating normal and exceptional cases.

### ASSERTIONS

Assertions are used to test assumptions about program behavior. They are typically used for debugging and testing purposes:

```java
int num = -1;
assert num >= 0 : "Number must be non-negative";
```

### WHEN TO USE ASSERTIONS

Use assertions for:
   * Checking invariants and assumptions during development and debugging.
   * Testing conditions that should never occur under normal circumstances.

### TURNING ASSERTIONS ON AND OFF

Assertions can be enabled or disabled using JVM flags:
   * `-ea` enables assertions (`-enableassertions`).
   * `-da` disables assertions (`-disableassertions`).

```bash
java -ea MyApp
```

This manual provides a comprehensive overview of exceptions and assertions in Java, covering creating exception types, `throw` statement, `throws` clause, `try-catch-finally` blocks, exception chaining, stack traces, when to use exceptions, assertions, when to use assertions, and turning assertions on and off. For more detailed information, refer to the Java documentation and additional resources.
