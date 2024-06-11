# ENUMS AND PATTERN MATCHING

Let's dive into each topic:

## DEFINING AN ENUM

Enums, short for "enumerations," allow you to define a type by enumerating its possible variants. Each variant can optionally hold data of its own type. Here's how you define an enum in Rust:

```rust
enum TrafficLight {
    Red,
    Green,
    Yellow,
}

// Enum variants can hold data
enum Coin {
    Penny,
    Nickel,
    Dime,
    Quarter(UsState),
}

// Enums can also have associated data
struct UsState {
    // state details
}
```

In this example:
- We define an enum named `TrafficLight` with three variants: `Red`, `Green`, and `Yellow`.
- We define another enum named `Coin` with four variants: `Penny`, `Nickel`, `Dime`, and `Quarter`, where `Quarter` variant can hold associated data of type `UsState`.
- We define a `UsState` struct, which can be used as associated data for the `Quarter` variant.

## THE MATCH CONTROL FLOW CONSTRUCT

`match` is a powerful control flow construct in Rust that allows you to compare a value against a series of patterns and execute code based on which pattern matches. Here's how `match` works:

```rust
enum Coin {
    Penny,
    Nickel,
    Dime,
    Quarter,
}

fn value_in_cents(coin: Coin) -> u32 {
    match coin {
        Coin::Penny => 1,
        Coin::Nickel => 5,
        Coin::Dime => 10,
        Coin::Quarter => 25,
    }
}
```

In this example:
- We define an enum `Coin` representing different types of coins.
- We define a function `value_in_cents` that takes a `Coin` enum as an argument.
- Inside the function, we use `match` to match the `coin` argument against different variants of `Coin` and return the corresponding value in cents.

## CONCISE CONTROL FLOW WITH IF LET

`if let` is a concise syntax for handling values that match one pattern and ignoring the rest. It's often used when you're interested in handling only one specific case and don't need to cover all possible variants like `match`. Here's how `if let` works:

```rust
let some_value = Some(5);

if let Some(value) = some_value {
    println!("Value: {}", value);
} else {
    println!("No value");
}
```

In this example:
- We have an `Option` enum with a `Some` variant containing a value.
- We use `if let` to check if `some_value` matches the `Some` variant and bind the inner value to `value`.
- If `some_value` is `Some`, it prints the value; otherwise, it prints "No value".
