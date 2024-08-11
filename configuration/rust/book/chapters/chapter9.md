# ERROR HANDLING

Let's discuss each of these aspects of error handling in Rust:

## UNRECOVERABLE ERRORS WITH `PANIC!`

In Rust, `panic!` is a macro used to indicate that the program has reached an unrecoverable state and should terminate immediately. It can be used to handle situations such as index out of bounds, division by zero, or other critical errors.

```rust
fn main() {
    let v = vec![1, 2, 3];

    // Attempting to access an element beyond the vector's length
    let element = v[5]; // This will panic
}
```

When `panic!` is encountered, the program prints an error message and unwinds the stack, cleaning up memory and resources allocated by the program before terminating.

## RECOVERABLE ERRORS WITH `RESULT`

In situations where errors can be recovered from, Rust provides the `Result` enum to handle recoverable errors. `Result` has two variants: `Ok`, representing success and containing the result, and `Err`, representing an error and containing an error value.

```rust
use std::fs::File;

fn main() {
    let file_result = File::open("example.txt");

    match file_result {
        Ok(file) => println!("File opened successfully"),
        Err(error) => println!("Error opening file: {}", error),
    }
}
```

In this example, `File::open` returns a `Result` that may contain a `File` if successful or an error if unsuccessful. We use pattern matching (`match`) to handle both cases.

## TO `PANIC!` OR NOT TO `PANIC!`

Deciding whether to use `panic!` or `Result` depends on the nature of the error and the context of the code. Use `panic!` for unrecoverable errors that indicate bugs or critical failures, where the program cannot continue safely. Use `Result` for recoverable errors where the program can gracefully handle the error and continue execution.

In general:
- Use `panic!` for unexpected conditions that indicate programming errors or critical failures.
- Use `Result` for expected errors that can be handled gracefully by the program.
