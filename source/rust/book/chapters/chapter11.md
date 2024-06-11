# WRITING AUTOMATED TESTS

Here's an explanation of each topic:

## HOW TO WRITE TESTS

In Rust, tests are written using the built-in testing framework provided by the standard library (`std::test`). Tests are written as functions annotated with the `#[test]` attribute. You can write tests for functions, methods, or any other code that you want to verify behaves correctly.

```rust
// Test function to verify the behavior of add function
#[test]

fn test_add() {
    assert_eq!(add(2, 3), 5);
}

// Function to add two numbers
fn add(a: i32, b: i32) -> i32 {
    a + b
}
```

In this example, we define a test function `test_add` annotated with `#[test]`. Inside the test function, we use assertions like `assert_eq!` to verify the behavior of the `add` function.

## CONTROLLING HOW TESTS ARE RUN

Rust provides several command-line options to control how tests are run. You can use these options to filter tests, run tests in parallel, display additional information, and more. Some common options include:
- `--test`: Run tests.
- `--test-threads`: Number of threads used for running tests in parallel.
- `--ignored`: Run only ignored tests.
- `--show-output`: Display stdout from tests.
- `--nocapture`: Do not capture stdout/stderr from tests.

## TEST ORGANIZATION

In Rust, you can organize tests into different modules and files just like regular code. Each file containing tests should be placed in the `tests` directory of your project, and Rust's test runner will automatically discover and run these tests.

For example, you might have the following directory structure:

```
my_project/
    src/
        lib.rs
    tests/
        integration_tests.rs
        unit_tests.rs
```

In this structure, `unit_tests.rs` might contain unit tests for individual functions or modules, while `integration_tests.rs` might contain higher-level integration tests that test the interaction between different parts of your code.

When running tests with `cargo test`, Rust will compile and execute all test files in the `tests` directory along with any test functions annotated with `#[test]` in your source files.

By organizing tests into separate files and modules, you can keep your tests organized and maintainable, making it easier to write, understand, and maintain your test suite as your project grows.
