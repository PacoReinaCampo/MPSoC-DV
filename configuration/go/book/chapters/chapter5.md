# SEMICOLONS

In Go language, semicolons are used as statement terminators, similar to many other languages like C, C++, and Java. However, Go has a unique feature called "implicit semicolons" where the compiler automatically inserts semicolons at the end of each line if the line break comes after certain tokens. This feature reduces the need for explicit semicolons in Go code, making the language cleaner and less cluttered.

## RULES FOR SEMICOLONS IN GO

1. **Implicit Semicolons**: The Go compiler automatically inserts semicolons at the end of a line if the line break occurs after one of the following tokens:

   * Keywords: `break`, `continue`, `fallthrough`, `return`, `goto`
   * Operators: `++`, `--`, `)`
   * Literals: Integer, floating-point, imaginary, rune, string, and others.
   * Identifiers: Variable names, function names, and others.

  ```go
  // Semicolons are implicitly inserted at the end of each line.
  x := 5
  y := 10
  if x > y {
    return
  }
  ```

2. **Explicit Semicolons**: You can use explicit semicolons to separate multiple statements on the same line. However, this is not common practice in Go and is typically avoided unless necessary for readability.

  ```go
  // Explicit semicolon to separate two statements on the same line.
  x := 5; y := 10
  ```

3. **Avoiding Semicolons**: In most cases, you can write Go code without using explicit semicolons, relying on the compiler's automatic insertion of semicolons. This makes the code cleaner and more idiomatic.

  ```go
  // Go code without explicit semicolons.
  x := 5
  y := 10
  if x > y {
    return
  }
  ```

## BEST PRACTICES FOR SEMICOLONS IN GO

- **Prefer Implicit Semicolons**: Follow the convention of letting the compiler insert semicolons automatically. Avoid using explicit semicolons unless necessary for clarity.

- **Consistency**: Be consistent in your use of semicolons. Choose a style and stick to it throughout your codebase.

- **Readability**: Prioritize code readability. Use line breaks and indentation to format your code in a clear and understandable manner.

By understanding the rules and conventions for semicolons in Go, you can write clean, idiomatic code that is easy to read and maintain.
