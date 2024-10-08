# AN I/O PROJECT: BUILDING A COMMAND LINE PROGRAM

Here's an explanation of each topic:

## ACCEPTING COMMAND LINE ARGUMENTS

In Rust, you can accept command-line arguments using the `std::env::args` function. This function returns an iterator over the command-line arguments passed to the program.

```rust
use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();
    println!("Arguments: {:?}", args);
}
```

In this example, `env::args()` returns an iterator over the command-line arguments. We collect the iterator into a vector of strings (`Vec<String>`) for easier handling.

## READING A FILE

To read a file in Rust, you can use the `std::fs::File` type to open the file, and then use `std::io::Read` or `std::io::BufRead` traits to read its contents.

```rust
use std::fs::File;
use std::io::{self, BufRead};

fn main() -> io::Result<()> {
    let file = File::open("example.txt")?;
    let reader = io::BufReader::new(file);

    for line in reader.lines() {
        println!("{}", line?);
    }

    Ok(())
}
```

In this example, we open the file named "example.txt" using `File::open`. We then wrap the file in a `BufReader` to efficiently read the file line by line. Finally, we iterate over each line and print it to the console.

## REFACTORING TO IMPROVE MODULARITY AND ERROR HANDLING

When building a command-line program, it's essential to structure your code in a modular and error-handling-friendly way. This often involves refactoring your code into smaller, more focused functions, handling errors gracefully using `Result`, and separating concerns into different modules.

```rust
// Example of refactoring code into smaller functions and using Result for error handling
```

## DEVELOPING THE LIBRARY'S FUNCTIONALITY WITH TEST DRIVEN DEVELOPMENT

Test-Driven Development (TDD) is an iterative development process where you write tests before writing the actual implementation code. In Rust, you can use the built-in testing framework to write tests for your functions, modules, and libraries.

```rust
// Example of writing tests for library functionality using TDD approach
```

## WORKING WITH ENVIRONMENT VARIABLES

Rust provides access to environment variables through the `std::env::var` function. This function returns a `Result<String, std::env::VarError>` representing the value of the environment variable.

```rust
use std::env;

fn main() {
    match env::var("HOME") {
        Ok(val) => println!("HOME: {}", val),
        Err(e) => println!("Error: {}", e),
    }
}
```

In this example, we use `env::var("HOME")` to retrieve the value of the "HOME" environment variable. We then match on the result to handle both success and error cases.

## WRITING ERROR MESSAGES TO STANDARD ERROR INSTEAD OF STANDARD OUTPUT

In Rust, you can write error messages to standard error (stderr) instead of standard output (stdout) using the `eprintln!` macro. This is useful for printing error messages, warnings, or other diagnostic information that should not be redirected or piped with normal program output.

```rust
use std::io::{self, Write};

fn main() -> io::Result<()> {
    if let Err(err) = do_something() {
        eprintln!("Error: {}", err);
    }

    Ok(())
}
```

In this example, `eprintln!` is used to print an error message to standard error. This ensures that the error message is displayed separately from the normal program output and can be easily distinguished by users and redirected or piped independently.
