# COMMON COLLECTIONS

Let's discuss each of these topics:

## STORING LISTS OF VALUES WITH VECTORS

In Rust, vectors are a dynamic array type provided by the standard library. They allow you to store a variable number of values of the same type in contiguous memory. Vectors are resizable and efficient for adding, removing, and accessing elements.

```rust
// Creating a vector
let mut v: Vec<i32> = Vec::new();

// Adding elements to a vector
v.push(1);
v.push(2);
v.push(3);

// Accessing elements of a vector
let third: &i32 = &v[2];
println!("The third element is {}", third);

// Iterating over elements of a vector
for i in &v {
    println!("{}", i);
}
```

## STORING UTF-8 ENCODED TEXT WITH STRINGS

In Rust, the `String` type represents a growable, mutable, UTF-8 encoded string. It is implemented as a vector of bytes (`Vec<u8>`) that represent a valid UTF-8 encoded string. Rust also has the `&str` type, which is an immutable reference to a string slice.

```rust
// Creating a String
let mut s = String::new();

// Appending to a String
s.push_str("hello");

// Concatenating Strings
let s2 = String::from(" world");
let s3 = s + &s2;

// Iterating over characters of a String
for c in s3.chars() {
    println!("{}", c);
}
```

## STORING KEYS WITH ASSOCIATED VALUES IN HASH MAPS

Hash maps in Rust are collections of key-value pairs, where each key must be unique. They are implemented using a hash table, providing fast insertion, deletion, and lookup operations. Rust's standard library provides the `HashMap` type for working with hash maps.

```rust
use std::collections::HashMap;

// Creating a HashMap
let mut scores = HashMap::new();

// Inserting key-value pairs into a HashMap
scores.insert(String::from("Alice"), 42);
scores.insert(String::from("Bob"), 34);

// Accessing values in a HashMap
if let Some(score) = scores.get("Alice") {
    println!("Alice's score is {}", score);
}

// Iterating over key-value pairs in a HashMap
for (key, value) in &scores {
    println!("{}: {}", key, value);
}
```

In this example, `scores` is a `HashMap` mapping `String` keys to `i32` values. We insert key-value pairs into the map using the `insert` method and access values using the `get` method. We can also iterate over key-value pairs using a `for` loop.
