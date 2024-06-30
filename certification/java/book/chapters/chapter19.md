# DOCUMENTATION COMMENTS

Documentation comments in Java are used to generate API documentation with tools like Javadoc, providing information about classes, interfaces, methods, and fields.

### THE ANATOMY OF A DOC COMMENT

Documentation comments start with `/**` and end with `*/`. They can include:
- **Description**: Summary of the purpose and behavior of the documented element.
- **Tags**: Additional information such as parameters, return values, exceptions, and usage examples.

```java
/**
 * This is a documentation comment for MyClass.
 * It provides detailed information about the class.
 */
public class MyClass {
    // Class implementation
}
```

### TAGS

Javadoc supports various tags to document different aspects of a class or method:

- **`@param`**: Describes a method parameter.
- **`@return`**: Describes the return value of a method.
- **`@throws` or `@exception`**: Describes exceptions thrown by a method.
- **`@see`**: References other classes, methods, or documentation.
- **`@since`**: Specifies the version when an element was introduced.
- **`@deprecated`**: Marks an element as deprecated with an optional explanation.

```java
/**
 * Computes the sum of two integers.
 * 
 * @param a The first integer.
 * @param b The second integer.
 * @return The sum of a and b.
 * @throws IllegalArgumentException If either a or b is negative.
 */
public int sum(int a, int b) {
    if (a < 0 || b < 0) {
        throw new IllegalArgumentException("Arguments must be non-negative");
    }
    return a + b;
}
```

### INHERITING METHOD DOCUMENTATION COMMENTS

In Java, subclasses inherit method documentation comments from their superclass if not overridden:

```java
/**
 * Base class with a method.
 */
public class MyBaseClass {
    /**
     * Calculates the square of a number.
     *
     * @param num The number to square.
     * @return The square of num.
     */
    public int square(int num) {
        return num * num;
    }
}

/**
 * Subclass inheriting method documentation.
 */
public class MySubClass extends MyBaseClass {
    // No need to document square() again; documentation is inherited
}
```

### A SIMPLE EXAMPLE

Documentation comments are essential for creating clear, informative API documentation:

```java
/**
 * Represents a bank account with basic operations.
 */
public class BankAccount {
    // Class implementation
}
```

### EXTERNAL CONVENTIONS

Follow standard conventions and best practices for writing effective documentation comments:
- **Clarity and Conciseness**: Clearly describe the purpose, behavior, and usage of classes and methods.
- **Consistency**: Use consistent formatting and language across documentation comments.
- **Relevance**: Include only relevant and essential information to aid understanding.

### NOTES ON USAGE

- **Use of HTML**: Javadoc supports basic HTML tags (`<code>`, `<ul>`, `<li>`) for formatting documentation.
- **Private Members**: Documenting private members is optional but can be useful for internal documentation.
- **Generating Documentation**: Use tools like Javadoc to generate HTML documentation from source code.

This manual provides a comprehensive overview of documentation comments in Java, covering the anatomy of a doc comment, tags for documenting parameters, return values, exceptions, and other information, inheriting documentation comments, examples, external conventions for writing documentation, and usage notes. For more detailed information, refer to the Java documentation and additional resources on Javadoc.
