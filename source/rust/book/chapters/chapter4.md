# Understanding Ownership

Let's delve into each concept:

## What is Ownership?

Ownership is one of Rust's most unique and powerful features for memory safety. In Rust, each value has a variable that's called its "owner". There can only be one owner at a time, and when the owner goes out of scope, the value is dropped. This means that Rust doesn't rely on garbage collection for memory management; it uses ownership to determine when to free memory.

Ownership rules:
1. Each value in Rust has a single owner.
2. Values are dropped (memory is freed) when their owner goes out of scope.
3. Values can be transferred or borrowed, but not both simultaneously.
   
## References and Borrowing

References in Rust allow you to "borrow" a value without taking ownership of it. This allows multiple parts of the code to read the value without issue. Borrowing can be either mutable or immutable. 

```rust
fn main() {
    let s = String::from("hello");

    // Immutable borrow
    let len = calculate_length(&s);

    // Mutable borrow
    let mut s_mut = String::from("hello");
    change_string(&mut s_mut);

    // Both values are still valid here
}

fn calculate_length(s: &String) -> usize {
    s.len()
}

fn change_string(s: &mut String) {
    s.push_str(", world!");
}
```

In the example above:
- `calculate_length` borrows `s` immutably.
- `change_string` borrows `s_mut` mutably.

## The Slice Type

Slices are a reference to a contiguous sequence of elements in a collection. They don't have ownership and allow you to reference a portion of a collection without copying. Slices are denoted using `[start..end]` syntax.

```rust
fn main() {
    let s = String::from("hello");

    let slice = &s[0..2]; // creates a slice of the first two characters

    println!("Slice: {}", slice); // prints "he"
}
```

In this example, `slice` is a reference to a portion of the string `s` containing the characters from index `0` to `1`. It's important to note that slices don't have ownership, so the original data remains valid as long as the slice is in scope.
