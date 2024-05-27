# Control Structures

## If Statements

The `if` statement in Go is used for conditional execution. It allows you to execute a block of code if a specified condition is true. The basic syntax of the `if` statement is as follows:

```go
if condition {
   // code to execute if condition is true
} else {
   // code to execute if condition is false
}
```

In Go, you can also have an `if` statement without an `else` clause. Additionally, you can have multiple `else if` clauses to check multiple conditions.

```go
if condition1 {
   // code to execute if condition1 is true
} else if condition2 {
   // code to execute if condition2 is true
} else {
   // code to execute if all conditions are false
}
```

## Redeclaration and Reassignment

In Go, you cannot declare a variable with the same name in the same scope. However, you can reassign a value to an existing variable. Redeclaring a variable in the same scope will result in a compilation error.

```go
// Declaration and initialization
var x int = 10

// This will cause a compilation error because x is already declared
var x int = 20

// Reassignment
x = 20
```

## For Loops

The `for` loop in Go is used to execute a block of code repeatedly until a specified condition is false. There are several ways to use the `for` loop in Go:

1. **Basic For Loop**:

  ```go
  for i := 0; i < 5; i++ {
     // code to execute
  }
  ```

  This loop will execute the code block as long as `i` is less than 5.

2. **For Range Loop**:

  The `for range` loop is used to iterate over arrays, slices, strings, maps, and channels. It returns both the index and the value at that index.

  ```go
  numbers := []int{1, 2, 3, 4, 5}
  for index, value := range numbers {
     // code to execute
  }
  ```

3. **Infinite Loop**:

  You can create an infinite loop using the `for` keyword without any conditions.

  ```go
  for {
     // code to execute indefinitely
  }
  ```

4. **For Loop as While Loop**:

  Go doesn't have a `while` loop like some other languages, but you can achieve similar functionality using a `for` loop with just a condition.

  ```go
  for condition {
     // code to execute as long as condition is true
  }
  ```

These control structures in Go provide flexibility and power for writing expressive and efficient code. By mastering them, you can create programs that perform various tasks with precision and clarity.
