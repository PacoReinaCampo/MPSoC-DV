# STRINGS AND REGULAR EXPRESSIONS

Strings and regular expressions are fundamental in Java for manipulating text and performing pattern matching.

### CHARACTER SEQUENCES

Character sequences in Java are represented by the `String` class, which stores a sequence of characters.

```java
String message = "Hello, Java!";
```

### THE STRING CLASS

The `String` class in Java provides methods for manipulating and working with strings:

```java
String str = "Java Programming";

// Length of the string
int length = str.length(); // 17

// Concatenation
String newStr = str.concat(" Language"); // "Java Programming Language"

// Substring
String subStr = str.substring(5); // "Programming"

// Comparison
boolean isEqual = str.equals("Java Programming"); // true

// Searching
int index = str.indexOf("Programming"); // 5

// Conversion
char[] charArray = str.toCharArray(); // {'J', 'a', 'v', 'a', ...}

// Splitting
String[] words = str.split(" "); // {"Java", "Programming"}

// Formatting
String formattedStr = String.format("The language is %s", "Java"); // "The language is Java"
```

### REGULAR EXPRESSION MATCHING

Java supports regular expressions (`java.util.regex`) for pattern matching in strings:

```java
String text = "Hello, World!";
String pattern = "Hello.*";
boolean matches = text.matches(pattern); // true

Pattern regex = Pattern.compile("\\d+"); // matches one or more digits
Matcher matcher = regex.matcher("123 Java");
boolean found = matcher.find(); // true
```

### THE STRINGBUILDER CLASS

`StringBuilder` is used for mutable strings when concatenating or modifying strings frequently to avoid performance overhead:

```java
StringBuilder sb = new StringBuilder("Java");
sb.append(" is").append(" fun"); // "Java is fun"
String result = sb.toString();
```

### WORKING WITH UTF-8

Java uses Unicode (UTF-16) encoding for strings by default, supporting international characters seamlessly:

```java
String unicodeStr = "\u00E9"; // "é"
```

### OTHER STRING OPERATIONS

   * **Replacing**: Replace characters or substrings within a string.
   * **Case Conversion**: Convert string case (`toUpperCase()`, `toLowerCase()`).
   * **Trimming**: Remove leading and trailing whitespace (`trim()`).
   * **String Pool**: Java maintains a string pool for literal strings to optimize memory usage.

### STRING PERFORMANCE

   * **Immutable**: `String` objects are immutable (unchangeable), which ensures thread safety but can be inefficient for frequent modifications.
   * **StringBuilder**: Use `StringBuilder` for better performance when frequent string modifications are needed.

This manual provides a comprehensive overview of strings and regular expressions in Java, covering character sequences, the `String` class, regular expression matching, the `StringBuilder` class for mutable strings, working with UTF-8 characters, and other string operations. For more detailed information, refer to the Java documentation and additional resources.
