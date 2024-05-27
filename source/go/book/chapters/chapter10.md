# Initialization

Here's an explanation of initialization concepts in Go, covering constants, variables, and the `init` function:

## Constants

Constants in Go are declared using the `const` keyword and have a fixed value that cannot be changed after declaration. They provide a way to define named values that remain constant throughout the execution of a program.

```go
const pi = 3.14
const (
  statusOK = 200
  notFound = 404
)
```

Constants can be of various types, including numeric, string, boolean, and more. They are typically used for values that are known at compile-time and won't change during the execution of the program.

## Variables

Variables in Go are declared using the `var` keyword and represent storage locations that hold values of a specific type. Unlike constants, variables can be reassigned to new values during the execution of the program.

```go
var x int
x = 42 // Assigning a value to the variable x
```

Variables can also be declared and initialized in a single line:

```go
var y int = 10
```

Or using type inference:

```go
z := 5 // Inferred type int
```

## The `init` Function

The `init` function in Go is a special function that is automatically called before the `main` function at program startup. It is commonly used for initialization tasks such as setting up global variables, initializing data structures, or performing configuration.

```go
package main

import "fmt"

func init() {
  fmt.Println("Initialization...")
}

func main() {
  fmt.Println("Main function...")
}
```

The `init` function can be declared in any package, and multiple `init` functions can exist within a single package. They are executed in the order in which they are declared.

```go
package main

import "fmt"

func init() {
  fmt.Println("First init")
}

func init() {
  fmt.Println("Second init")
}

func main() {
  fmt.Println("Main function...")
}
```

When a package is imported, its `init` functions are executed automatically, but you cannot call them explicitly.

Understanding initialization concepts in Go is essential for setting up the initial state of variables, constants, and packages, ensuring that your program starts and operates correctly.
