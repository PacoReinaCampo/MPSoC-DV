# FUNCTIONS

Functions are a fundamental building block in Go programming, offering various features to enhance code clarity, flexibility, and efficiency.

## MULTIPLE RETURN VALUES

In Go, functions can return multiple values, allowing you to return more than one result from a function call. This feature is particularly useful for functions that perform multiple calculations or operations.

```go
func swap(x, y int) (int, int) {
    return y, x
}

func main() {
    a, b := swap(10, 20)
    fmt.Println(a, b) // Output: 20 10
}
```

Here, the `swap` function takes two integers as input and returns them in reverse order.

## NAMED RESULT PARAMETERS

In Go, you can name the return values of a function. Named return parameters act as variables within the function body and are initialized to the zero values of their respective types. They can be explicitly assigned values, and the named return values are automatically returned at the end of the function.

```go
func divide(x, y float64) (result float64, err error) {
    if y == 0 {
        err = errors.New("division by zero")
        return
    }
    result = x / y
    return
}
```

In this example, the `divide` function returns both the result of the division and an error. The return parameters `result` and `err` are named.

## DEFER

The `defer` statement in Go is used to schedule a function call to be executed just before the enclosing function returns. Deferred functions are executed in Last In, First Out (LIFO) order. The `defer` statement is commonly used to perform cleanup tasks such as closing files or releasing resources.

```go
func readFile(filename string) (string, error) {
    file, err := os.Open(filename)
    if err != nil {
        return "", err
    }
    defer file.Close() // Close the file when the function returns
    // Read file contents
    content, err := ioutil.ReadAll(file)
    if err != nil {
        return "", err
    }
    return string(content), nil
}
```

In this example, the `defer` statement ensures that the file is closed before the `readFile` function returns, regardless of whether an error occurs or not.

These features of Go functions contribute to writing clean, expressive, and maintainable code by allowing you to handle multiple return values efficiently, name return parameters for clarity, and manage resource cleanup effectively using defer statements.
