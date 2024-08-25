# METHODS

In Go, methods are functions that operate on specific types. They allow you to associate behavior with the data of a particular type. When defining methods in Go, you have the option to use either pointers or values as receivers. Understanding the difference between using pointers and values as receivers is crucial for designing effective and efficient Go programs.

## POINTERS VS VALUES

1. **Value Receivers**:
   - When a method is defined with a value receiver, the method operates on a copy of the value. Changes made to the value inside the method are local to that method and do not affect the original value.
   - Value receivers are typically used when the method does not need to modify the original value or when the value is small and inexpensive to copy.

  ```go
  type Counter struct {
    count int
  }

  // Method with a value receiver
  func (c Counter) Increment() {
    c.count++
  }
  ```

2. **Pointer Receivers**:
   - When a method is defined with a pointer receiver, the method operates directly on the original value. Changes made to the value inside the method affect the original value.
   - Pointer receivers are typically used when the method needs to modify the original value or when the value is large and expensive to copy.

  ```go
  type Counter struct {
    count int
  }

  // Method with a pointer receiver
  func (c *Counter) Increment() {
    c.count++
  }
  ```

### Choosing Between Pointers and Values

- Use **value receivers**:
   - When the method does not need to modify the original value.
   - When the value is small and inexpensive to copy.
   - When you want to ensure that the method operates on a copy of the value, preserving the original.

- Use **pointer receivers**:
   - When the method needs to modify the original value.
   - When the value is large or complex, and copying it would be inefficient.
   - When you want changes made by the method to reflect in the original value.

### Example

```go
package main

import "fmt"

type Counter struct {
  count int
}

// Method with a value receiver
func (c Counter) IncrementValue() {
  c.count++
}

// Method with a pointer receiver
func (c *Counter) IncrementPointer() {
  c.count++
}

func main() {
  counter1 := Counter{count: 0}
  counter1.IncrementValue()
  fmt.Println("Value Receiver:", counter1.count) // Output: 0 (unchanged)

  counter2 := Counter{count: 0}
  counter2.IncrementPointer()
  fmt.Println("Pointer Receiver:", counter2.count) // Output: 1 (modified)
}
```

In this example, `IncrementValue` uses a value receiver, so it operates on a copy of `counter1`, leaving the original unchanged. `IncrementPointer`, on the other hand, uses a pointer receiver, so it operates directly on `counter2`, modifying the original value.
