# SWITCH

In Go, the `switch` statement provides a way to compare an expression against multiple values and execute different blocks of code based on the matching value. The `switch` statement can be more concise and readable than multiple `if-else` statements, especially when dealing with multiple conditions.

## BASIC SWITCH STATEMENT:

The basic syntax of the `switch` statement in Go is as follows:

```go
switch expression {
case value1:
  // code to execute if expression matches value1
case value2:
  // code to execute if expression matches value2
default:
  // code to execute if expression doesn't match any case
}
```

- The `expression` is evaluated once and compared against each `case` value.
- If a `case` value matches the `expression`, the corresponding block of code is executed.
- If no `case` value matches the `expression`, the `default` block (if present) is executed.
- The `default` case is optional.

Example:
```go
package main

import "fmt"

func main() {
  day := "Monday"

  switch day {
  case "Monday":
    fmt.Println("Today is Monday.")
  case "Tuesday":
    fmt.Println("Today is Tuesday.")
  default:
    fmt.Println("Today is neither Monday nor Tuesday.")
  }
}
```

## TYPE SWITCH

A type switch is a special form of switch statement that compares the type of an expression against a set of types. It allows you to perform different actions based on the type of the expression.

The syntax for a type switch in Go is as follows:

```go
switch expression.(type) {
case type1:
  // code to execute if expression is of type type1
case type2:
  // code to execute if expression is of type type2
default:
  // code to execute if expression is of a type other than type1 or type2
}
```

- `expression.(type)` asserts that the expression is of type `interface{}` and retrieves the dynamic type of the expression.
- Each `case` specifies a type that the expression is compared against.
- If the expression matches the type specified in a `case`, the corresponding block of code is executed.
- The `default` case is optional and is executed if the expression doesn't match any of the specified types.

Example:
```go
package main

import "fmt"

func main() {
  var value interface{} = 42

  switch value.(type) {
  case int:
    fmt.Println("Value is an integer.")
  case string:
    fmt.Println("Value is a string.")
  default:
    fmt.Println("Value is of a different type.")
  }
}
```

Type switches are particularly useful when dealing with interfaces and need to handle different concrete types that may implement the interface. They provide a concise and elegant way to perform type-based branching in Go.
