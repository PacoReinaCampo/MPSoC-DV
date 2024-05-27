# Common Programming Concepts
Here's an explanation of each of these common programming concepts in Rust:

## Variables and Mutability
In Rust, variables are immutable by default, meaning their value cannot be changed once set. However, you can explicitly declare a variable as mutable using the `mut` keyword, allowing its value to be changed. For example:

```rust
// Immutable variable
let x = 5;

// Mutable variable
let mut y = 10;
y = 20; // Valid
```

## Data Types
Rust has several built-in primitive data types, including integers, floating-point numbers, booleans, characters, and compound types like tuples, arrays, and structs. Rust also supports user-defined data types through enums and structs. Here are a few examples:

```rust
// Integer types
let integer: i32 = 42;
let unsigned_integer: u32 = 42;
let byte: u8 = b'A'; // byte literal

// Floating-point types
let float: f64 = 3.14;

// Boolean type
let is_rust_cool: bool = true;

// Character type
let character: char = 'A';

// Compound types
let tuple: (i32, f64, char) = (42, 3.14, 'A');
let array: [i32; 3] = [1, 2, 3];
```

## Functions
Functions in Rust are declared using the `fn` keyword. They can have parameters and return values. Rust functions must declare the type of each parameter and the return type. Here's a simple function declaration:

```rust
fn add(a: i32, b: i32) -> i32 {
    a + b
}
```

## Comments
Rust supports both single-line (`//`) and multi-line (`/* */`) comments. Comments are ignored by the compiler and are used to document code or temporarily disable portions of code. For example:

```rust
// This is a single-line comment

/*
This is a
multi-line
comment
*/
```

## Control Flow
Rust provides various control flow constructs like `if`, `else`, `match`, `loop`, `while`, and `for`. Here's a basic example using `if`:

```rust
let number = 5;

if number < 0 {
    println!("Number is negative");
} else if number > 0 {
    println!("Number is positive");
} else {
    println!("Number is zero");
}
```

Rust's `match` expression is particularly powerful, allowing pattern matching and exhaustiveness checking. It's often used instead of `switch` or `if-else` chains. For instance:

```rust
match number {
    1 => println!("One"),
    2 => println!("Two"),
    _ => println!("Other"),
}
```

This code matches the value of `number` against different patterns and executes corresponding code blocks. The `_` is a placeholder for any value not explicitly matched.
