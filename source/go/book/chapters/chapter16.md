# ERRORS

Let's delve into errors, panic, and recover in Go:

## ERRORS

Errors in Go are values that represent abnormal conditions or situations that occur during the execution of a program. They are used to signal that something unexpected or undesired has happened, such as file I/O errors, network errors, or invalid input.

```go
// Example of a function that returns an error
func divide(x, y float64) (float64, error) {
    if y == 0 {
        return 0, errors.New("division by zero")
    }
    return x / y, nil
}
```

## PANIC

`panic` is a built-in function in Go that is used to terminate the program abruptly when an unrecoverable error occurs. It is typically called when something unexpected happens or when the program encounters a situation that it cannot recover from.

```go
func doSomething() {
    if err != nil {
        panic(err)
    }
}
```

When `panic` is called, the program stops execution immediately, unwinding the stack and executing any deferred functions. If no deferred function recovers from the panic, the program terminates with a runtime error.

## RECOVER

`recover` is another built-in function in Go that is used to handle panics and recover from them gracefully. It is only useful when called from within a deferred function.

```go
func recoverFromPanic() {
    if r := recover(); r != nil {
        fmt.Println("Recovered from panic:", r)
    }
}

func main() {
    defer recoverFromPanic()
    doSomething()
}
```

In this example, if `doSomething` panics, the `recoverFromPanic` function is called, and it prints a message indicating that the panic has been recovered from.

## WHEN TO USE PANIC AND RECOVER

- **Panic**: Use `panic` to signal that the program has encountered a critical error or unrecoverable situation. Examples include out-of-memory errors, unexpected runtime conditions, or violations of program invariants.

- **Recover**: Use `recover` to recover from panics in a controlled manner, allowing the program to gracefully handle exceptional situations and continue execution. It is typically used in combination with deferred function calls to clean up resources or handle errors.

It's important to use `panic` and `recover` judiciously, as overuse can lead to code that is difficult to understand and maintain. They should be reserved for exceptional circumstances where no other reasonable action can be taken.
