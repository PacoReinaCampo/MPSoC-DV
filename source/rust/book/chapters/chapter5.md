# USING STRUCTS TO STRUCTURE RELATED DATA

Let's explore each of these topics:

## DEFINING AND INSTANTIATING STRUCTS

In Rust, structs are used to create custom data types to structure related data. Here's how you define and instantiate a struct:

```rust
// Define a struct named `Person`
struct Person {
    name: String,
    age: u32,
}

fn main() {
    // Instantiate a `Person` struct
    let person1 = Person {
        name: String::from("Alice"),
        age: 30,
    };

    // Access fields of the struct
    println!("Name: {}", person1.name);
    println!("Age: {}", person1.age);
}
```

In this example:
- We define a struct named `Person` with two fields: `name` of type `String` and `age` of type `u32`.
- We instantiate a `Person` struct named `person1` with values for its fields.
- We access the fields of the struct using dot notation.

## AN EXAMPLE PROGRAM USING STRUCTS

Here's an example program that demonstrates using structs to represent rectangles and calculating their area:

```rust
// Define a struct named `Rectangle`
struct Rectangle {
    width: u32,
    height: u32,
}

impl Rectangle {
    // Method to calculate the area of the rectangle
    fn area(&self) -> u32 {
        self.width * self.height
    }
}

fn main() {
    // Instantiate a `Rectangle` struct
    let rectangle1 = Rectangle {
        width: 30,
        height: 50,
    };

    // Calculate and print the area of the rectangle
    println!("Area of the rectangle: {}", rectangle1.area());
}
```

In this example:
- We define a struct named `Rectangle` with two fields: `width` and `height`.
- We implement a method named `area` for the `Rectangle` struct, which calculates the area of the rectangle.
- We instantiate a `Rectangle` struct named `rectangle1` with values for its fields.
- We call the `area` method on `rectangle1` to calculate and print its area.

## METHOD SYNTAX

In Rust, methods are functions associated with a particular struct or enum. They allow you to define behavior specific to a type. Here's the syntax for defining methods:

```rust
impl Rectangle {
    fn area(&self) -> u32 {
        self.width * self.height
    }
}
```

In this example:
- `impl Rectangle` introduces the implementation block for the `Rectangle` struct.
- `fn area(&self) -> u32 { ... }` defines a method named `area` for the `Rectangle` struct.
- `&self` is a reference to the instance of the struct on which the method is called.
- The method returns the calculated area of the rectangle as a `u32`.
