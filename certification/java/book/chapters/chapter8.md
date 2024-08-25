# PRIMITIVES AS TYPES

Java provides primitive data types as fundamental building blocks for storing and manipulating data efficiently. Each primitive type has specific characteristics, including size, range of values, and methods associated with wrapper classes for handling them as objects.

## COMMON FIELDS AND METHODS

### VOID

- **Type**: `void`
- **Description**: Represents the absence of a type. Used in method declarations to indicate that the method does not return any value.
- **Common Fields and Methods**: No specific fields or methods since `void` cannot be instantiated or used to store data.

```java
public void printMessage() {
    System.out.println("Hello, World!");
}
```

### BOOLEAN

- **Type**: `boolean`
- **Description**: Represents a boolean value (`true` or `false`).
- **Common Fields and Methods**:
   - `boolean`: Default value is `false`.
   - `TRUE` and `FALSE`: Constants in the `Boolean` class representing `true` and `false`.
   - `booleanValue()`: Method to convert `Boolean` objects to primitive `boolean`.

```java
boolean isJavaFun = true;
if (isJavaFun) {
    System.out.println("Java is fun!");
}
```

### NUMBER

#### Numeric Types:

- **Type**: `byte`, `short`, `int`, `long`, `float`, `double`
- **Description**: Represent integers and floating-point numbers of varying sizes.
- **Common Fields and Methods**:
   - `MIN_VALUE` and `MAX_VALUE`: Constants specifying the range of values for each type.
   - `parseXxx(String s)`: Static method to convert a string to a primitive type (`Xxx` represents the type).
   - `XxxValue()`: Method to convert wrapper objects to primitive types (`Xxx` represents the type).

```java
int num = 42;
double pi = 3.14;
```

### CHARACTER

- **Type**: `char`
- **Description**: Represents a single 16-bit Unicode character.
- **Common Fields and Methods**:
   - `MIN_VALUE` and `MAX_VALUE`: Constants specifying the range of Unicode values (`'\u0000'` to `'\uffff'`).
   - `isLetter()`, `isDigit()`, `isWhitespace()`: Methods to check character properties.
   - `toUpperCase()`, `toLowerCase()`: Methods to convert characters to uppercase or lowercase.

```java
char grade = 'A';
```

## BOXING CONVERSIONS

Java provides wrapper classes (`Boolean`, `Byte`, `Short`, `Integer`, `Long`, `Float`, `Double`, `Character`) to convert primitive types to objects and vice versa. This process is known as boxing (primitive to wrapper) and unboxing (wrapper to primitive).

### Example:

```java
// Boxing: converting int to Integer
int num = 10;
Integer numObj = Integer.valueOf(num); // or use autoboxing: Integer numObj = num;

// Unboxing: converting Integer to int
Integer numObj2 = Integer.valueOf(20);
int num2 = numObj2.intValue(); // or use autounboxing: int num2 = numObj2;
```

This manual provides a comprehensive overview of primitives as types in Java, covering `void`, `boolean`, numeric types (`byte`, `short`, `int`, `long`, `float`, `double`), `char`, and boxing conversions. For more detailed information, refer to the Java documentation and additional resources.
