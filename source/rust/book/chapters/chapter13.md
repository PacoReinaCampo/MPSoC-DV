# Functional Language Features: Iterators and Closures
Let's dive into each topic:

## Closures: Anonymous Functions that Capture Their Environment
Closures in Rust are anonymous functions that can capture variables from their surrounding environment. They are similar to lambdas or anonymous functions in other languages. Closures can capture variables by reference (`&`), by mutable reference (`&mut`), or by value (`move`). They are defined using the `|args| { body }` syntax.

```rust
fn main() {
    let add = |a, b| a + b;
    println!("3 + 5 = {}", add(3, 5));
}
```

In this example, `add` is a closure that captures its environment and adds two numbers.

## Processing a Series of Items with Iterators
Iterators in Rust provide a way to iterate over collections of items. They are a fundamental part of Rust's functional programming capabilities. You can chain multiple iterator adaptors together to perform complex operations on collections.

```rust
fn main() {
    let numbers = vec![1, 2, 3, 4, 5];
    let squares: Vec<_> = numbers.iter().map(|x| x * x).collect();
    println!("{:?}", squares); // prints [1, 4, 9, 16, 25]
}
```

In this example, `iter()` creates an iterator over the vector, `map()` applies a closure to each element of the iterator, and `collect()` collects the results into a new vector.

## Improving Our I/O Project
You can improve an I/O project in Rust by using iterators and closures to make the code more concise, expressive, and efficient. For example, you can use iterator adaptors like `lines()` to read lines from a file, `map()` to transform each line, and `filter()` to select specific lines based on a predicate.

```rust
fn main() {
    let lines: Vec<_> = std::fs::read_to_string("input.txt")
        .expect("Error reading file")
        .lines()
        .filter(|line| !line.trim().is_empty())
        .map(|line| line.trim().to_string())
        .collect();

    println!("{:?}", lines);
}
```

In this example, `read_to_string()` reads the contents of a file into a string, `lines()` splits the string into lines, `filter()` removes empty lines, `map()` trims whitespace from each line, and `collect()` collects the results into a vector.

## Comparing Performance: Loops vs Iterators
In Rust, iterators are generally as efficient as traditional loops, and in many cases, they can even be more efficient due to optimizations performed by the compiler. However, there might be specific cases where loops are more suitable, such as when you need explicit control over iteration or when performance is critical.

```rust
fn main() {
    let numbers = vec![1, 2, 3, 4, 5];
    
    // Using a loop
    let mut squares_loop = Vec::new();
    for &num in &numbers {
        squares_loop.push(num * num);
    }
    
    // Using iterators
    let squares_iter: Vec<_> = numbers.iter().map(|&x| x * x).collect();

    assert_eq!(squares_loop, squares_iter);
}
```

In this example, both the loop and iterator versions produce the same result, but the iterator version is more concise. Depending on the context, you may choose to use iterators for their expressiveness and clarity, or loops for their explicit control and performance.
